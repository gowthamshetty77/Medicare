package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

public class ReceptionistRegistration {
	private Connection con;
	HttpSession se;
	
	public ReceptionistRegistration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "ns200");// connection with data base
            se=session; //assigning local session to global session
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String ReceptionistRegistration(String recepName,String recepAge,String recepGender,String recepPhone,String recepEmail,String recepPassword) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM RECEPTIONIST WHERE recepPhone=' "+recepPhone+"' or recepEmail='"+recepEmail+"';";
		try {
			Statement st=null;
		 	ResultSet rs=null;
			st = con.createStatement();
            rs = st.executeQuery(query);
            
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
            	ps = con.prepareStatement("insert into  RECEPTIONIST values(0,?,?,?,?,?,?)  ");
            	ps.setString(1,recepName);
            	ps.setString(2,recepAge);
            	ps.setString(3,recepGender);
            	ps.setString(4,recepPhone);
            	ps.setString(5,recepEmail);
            	ps.setString(6,recepPassword);
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
	public String ReceptionistLogin(String recepEmail,String recepPassword) {
		String status = "", recepID = "",recepName = "", recepEmail1 = "";
		String query="SELECT * FROM RECEPTIONIST WHERE recepEmail='"+recepEmail+"' or recepPassword='"+recepPassword+"';";
		try {
			Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery(query);
            boolean b = rs.next();
            if (b == true) {
            	recepID=rs.getString("recepID");
            	recepName = rs.getString("recepName");
                recepEmail1 = rs.getString("recepEmail");
                se.setAttribute("recepName", recepName);
                se.setAttribute("recepEmail", recepEmail1);
                se.setAttribute("recepID", recepID);
                status="success";
            }else {
            	status="failure";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String ReceptionistUpdate(String recepName,String recepPhone,String recepEmail) {
		String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("UPDATE RECEPTIONIST SET RECEPNAME='"+recepName+"',RECEPEMAIL='"+recepEmail+"',RECEPPHONE='"+recepPhone+"'WHERE recepID='"+se.getAttribute("recepID")+"'; ");
            se.setAttribute("recepName", recepName);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }
        return status;
	}
	public String ReceptionistForgotPassword(String recepEmail, String recepPassword,String recepConfirmPass) {
		PreparedStatement ps;
		String status = "";
		if (recepPassword.equals(recepConfirmPass)) {
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				ps = (PreparedStatement) con.prepareStatement("update receptionist set recepPassword=? where recepEmail=?");
				ps.setString(1, recepPassword);
				ps.setString(2, recepEmail);
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
	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from patient where " + "patID='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String deleteDoctor(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from doctor where " + "docID='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String deletePatient(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from patient where " + "patID='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
