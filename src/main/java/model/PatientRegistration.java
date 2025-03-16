package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class PatientRegistration {
	private Connection con;
	HttpSession se;
	
	public PatientRegistration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "ns200");// connection with data base
            se=session; //assigning local session to global session
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String PatientRegistration(String patName,String patAge,String patGender,String patPhone,String patEmail,String patPassword) {
		PreparedStatement ps;
		String status="";
		try {
			Statement st=null;
			ResultSet rs=null;
			st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM patient WHERE patPhone='"+patPhone+"' or patEmail='"+patEmail+"';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
            	ps = (PreparedStatement) con.prepareStatement("INSERT INTO patient VALUES(0,?,?,?,?,?,?)");
            	ps.setString(1,patName);
            	ps.setString(2,patAge);
            	ps.setString(3,patGender);
            	ps.setString(4,patPhone);
            	ps.setString(5,patEmail);
            	ps.setString(6,patPassword);
            	int a = ps.executeUpdate();
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
	public String PatientLogin(String patEmail,String patPassword) {
		String status = "", patID = "",patName = "", patEmail1 = "";
		try {
			Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM patient WHERE patEmail='"+patEmail+"' or patPassword='"+patPassword+"';");
            boolean b = rs.next();
            if (b == true) {
            	patID=rs.getString("patID");
            	patName = rs.getString("patName");
                patEmail1 = rs.getString("patEmail");
                se.setAttribute("patName", patName);
                se.setAttribute("patEmail", patEmail1);
                se.setAttribute("patID", patID);
                status="success";
            }else {
            	status="failure";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String PatientUpdate(String patName,String patPhone,String patEmail) {
		String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate(" ");
            se.setAttribute("patName", patName);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }
        return status;
	}
	public String PatientForgotPassword(String patEmail, String patPassword,String patConfirmPass) {
		PreparedStatement ps;
		String status = "";
		if (patPassword.equals(patConfirmPass)) {
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				ps = (PreparedStatement) con.prepareStatement("update patient set patPassword=? where patEmail=?");
				ps.setString(1, patPassword);
				ps.setString(2, patEmail);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Success";
				else
					status = "Failed";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		} else {
			status = "Failed";
			return status;
		}
    }
	public ArrayList<Patient> getpatients() {
		ArrayList<Patient> al = new ArrayList<>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from patient;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Patient d = new Patient(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setPatID(rs.getString("patID"));
				d.setPatName (rs.getString("patName"));
				d.setPatAge(rs.getString("patAge"));
				d.setPatGender(rs.getString("patGender"));
				d.setPatPhone(rs.getString("patPhone"));
				d.setPatEmail(rs.getString("patEmail"));
				d.setPatPassword(rs.getString("patPassword"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public int getUserId(String username) {
	    int userId = -1;
	    try {
	      String query = "SELECT patID FROM patient WHERE patName = ?";
	      PreparedStatement stmt = con.prepareStatement(query);
	      stmt.setString(1, username);
	      ResultSet rs = stmt.executeQuery();
	      if (rs.next()) {
	        userId = rs.getInt("patID");
	      }
	      
	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    return userId;
	  }
}
