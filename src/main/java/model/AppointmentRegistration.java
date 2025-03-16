package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class AppointmentRegistration {
	private Connection con;
	HttpSession se;
	
	public AppointmentRegistration(HttpSession session) {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "ns200");// connection with data base
            se=session; //assigning local session to global session
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String addAppointment(String aptName,String aptPhone,String aptDoctor,String aptCategory,String aptDate) {
		PreparedStatement ps=null; 
		String status="";
		Statement st=null;
		ResultSet rs=null;
		 try {
		        // Step 1: Check if the appointment already exists for the doctor at the specified time and date
		        String checkQuery = "SELECT aptID FROM appointment WHERE aptDoctor = ? AND aptDate = ?";
		        ps = con.prepareStatement(checkQuery);
		        ps.setString(1, aptDoctor);  // Set doctor name or ID
		        ps.setString(2, aptDate);    // Set appointment date  
		        rs = ps.executeQuery();
		        
		        // If an appointment already exists, return "existed"
		        if (rs.next()) {
		            status = "existed";  // Appointment already exists
		        } else {
		            // Step 2: Insert the new appointment
		            String insertQuery = "INSERT INTO appointment VALUES (0,?,?,?,?,?,'pending')";
		            ps = con.prepareStatement(insertQuery);
		            ps.setString(1, aptName);
		            ps.setString(2, aptPhone);
		            ps.setString(3, aptDoctor);
		            ps.setString(4, aptCategory);
		            ps.setString(5, aptDate);
		            
		            int rowsAffected = ps.executeUpdate();
		            
		            // Check if the insert was successful
		            if (rowsAffected > 0) {
		                status = "success";  // Appointment successfully added
		            } else {
		                status = "failure";  // Failed to add appointment
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        status = "error";  // Return error if any exception occurs
		    } finally {
		        try {
		            if (rs != null) rs.close();  // Close result set
		            if (ps != null) ps.close();  // Close prepared statement
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		    }
		    
		    return status;
	}
	
	public String Booknow(HttpServletRequest request) {
		String status = "";
		ResultSet rs = null;
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery(
					"select aptID from appointment where aptDate= '" + request.getParameter("appointmentDate") + "'");
			boolean b = rs.next();
			if (b == true) {
				status = "existed";
			} else {
				String qry = "insert into appointment select 0,'" +request.getParameter("name")+"','"+ request.getParameter("phone")
						+ "', '" + se.getAttribute("docName") + "','"+ se.getAttribute("docCategory") + "',"
						+ request.getParameter("appointmentDate") + "','"+request.getParameter("appointmentTime") +"','pending',now(),'" + request.getParameter("edate")
						+ "' from events where event_id=" + request.getParameter("event_id") + ";";
				int a = st.executeUpdate(qry);
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public ArrayList<Appointment> getappointments() {
		ArrayList<Appointment> al = new ArrayList<Appointment>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from appointment;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Appointment d = new Appointment(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setAptID(rs.getString("aptID"));
				d.setAptName(rs.getString("aptName"));
				d.setAptPhone(rs.getString("aptPhone"));
				d.setAptDoctor(rs.getString("aptDoctor"));
				d.setAptCategory(rs.getString("aptCategory"));
				d.setAptDate(rs.getString("aptDate"));
				d.setAptStatus(rs.getString("aptStatus"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public int deleteAppointment(int aptID) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update appointment set aptStatus='cancelled' where aptID=' " + aptID + "'; ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int acceptAppointment(int aptID) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update appointment set aptStatus='booked' where aptID=' " + aptID + "' ;";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public int getUserId(String username) {
	    int userId = -1;
	    try {
	      String query = "SELECT recepID FROM receptionist WHERE recepName = ?";
	      PreparedStatement stmt = con.prepareStatement(query);
	      stmt.setString(1, username);
	      ResultSet rs = stmt.executeQuery();
	      if (rs.next()) {
	        userId = rs.getInt("recepID");
	      }
	      
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    return userId;
	  }
	public ArrayList<Appointment> getAppointmentStatus(String patName) {
	    ArrayList<Appointment> al = new ArrayList<>();
	    
	    if (patName == null || patName.trim().isEmpty()) {
	        System.out.println("Patient name is invalid.");
	        return al;  // Return empty list if patient name is invalid
	    }

	    try {
	        String qry = "SELECT * FROM appointment WHERE aptName = ?";
	        try (PreparedStatement pst = con.prepareStatement(qry)) {
	            pst.setString(1, patName); // Set the patient name dynamically
	            try (ResultSet rs = pst.executeQuery()) {
	                while (rs.next()) {
	                    Appointment d = new Appointment();
	                    d.setAptID(rs.getString("aptID"));
	                    d.setAptName(rs.getString("aptName"));
	                    d.setAptPhone(rs.getString("aptPhone"));
	                    d.setAptDoctor(rs.getString("aptDoctor"));
	                    d.setAptCategory(rs.getString("aptCategory"));
	                    d.setAptDate(rs.getString("aptDate"));
	                    d.setAptStatus(rs.getString("aptStatus"));
	                    
	                    al.add(d); // Add appointment to list
	                }
	            }
	        }
	    } catch (SQLException e) {
	        System.err.println("Error fetching appointment data: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) {
	                // Optionally close connection if necessary (connection pooling should ideally handle this)
	                con.close(); 
	            }
	        } catch (SQLException e) {
	            System.err.println("Error closing connection: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	    
	    return al; // Return the list of appointments
	}
	
	public ArrayList<Appointment> getAppointmentsDoc(String docName) {
	    ArrayList<Appointment> al = new ArrayList<>();
	    
	    if (docName == null || docName.trim().isEmpty()) {
	        return al;  // Return empty list if patient name is invalid
	    }

	    try {
	    	String qry = "SELECT * FROM appointment WHERE aptDoctor = ? OR aptDate = ?";
	    	 LocalDate currentDate = LocalDate.now();  // Get the current date (e.g., "2025-02-09")
	         
	         try (PreparedStatement pst = con.prepareStatement(qry)) {
	             // Set the doctor and current date parameters
	             pst.setString(1, docName);  // Set the doctor name dynamically
	             pst.setDate(2, java.sql.Date.valueOf(currentDate));  // Set the current date dynamically
	             
	             try (ResultSet rs = pst.executeQuery()) {
	                 // Iterate through the results and create Appointment objects
	                 while (rs.next()) {
	                     Appointment d = new Appointment();
	                     d.setAptID(rs.getString("aptID"));
	                     d.setAptName(rs.getString("aptName"));
	                     d.setAptPhone(rs.getString("aptPhone"));
	                     d.setAptDoctor(rs.getString("aptDoctor"));
	                     d.setAptCategory(rs.getString("aptCategory"));
	                     d.setAptDate(rs.getString("aptDate"));
	                     d.setAptStatus(rs.getString("aptStatus"));
	                     
	                     al.add(d); // Add appointment to list
	                 }
	             }
	         }
	    } catch (SQLException e) {
	        System.err.println("Error fetching appointment data: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) {
	                // Optionally close connection if necessary (connection pooling should ideally handle this)
	                con.close(); 
	            }
	        } catch (SQLException e) {
	            System.err.println("Error closing connection: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	    
	    return al; // Return the list of appointments
	}
}
