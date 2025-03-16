package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class DoctorRegistration {
	private Connection con;
	HttpSession se;
	
	public DoctorRegistration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicare", "root", "ns200");// connection with data base
            se=session; //assigning local session to global session
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String DoctorRegistration(String docName,String docAge,String docGender,String docCategory,String docPhone,String docEmail,String docPassword) {
		PreparedStatement ps;
		String status="";
		try {
			Statement st=null;
			ResultSet rs=null;
			st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM doctor WHERE docPhone='"+docPhone+"' or docEmail='"+docEmail+"'; ");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
            	ps = (PreparedStatement) con.prepareStatement(" INSERT INTO doctor VALUES(0,?,?,?,?,?,?,?,'available')");
            	ps.setString(1,docName);
            	ps.setString(2,docAge);
            	ps.setString(3,docGender);
            	ps.setString(4,docCategory);
            	ps.setString(5,docPhone);
            	ps.setString(6,docEmail);
            	ps.setString(7,docPassword);
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
	public String DoctorLogin(String docEmail,String docPassword) {
		String status = "", docID = "",docName = "", docEmail1 = "";
		try {
			Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM doctor WHERE docEmail='"+docEmail+"' or docPassword='"+docPassword+"';");
            boolean b = rs.next();
            if (b == true) {
            	docID=rs.getString("docID");
            	docName = rs.getString("docName");
                docEmail1 = rs.getString("docEmail");
                se.setAttribute("docName", docName);
                se.setAttribute("docEmail", docEmail1);
                se.setAttribute("docID", docID);
                status="success";
            }else {
            	status="failure";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String DoctorUpdate(String docName,String docPhone,String docEmail,String docStatus) {
		String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("UPDATE doctor SET DOCNAME='"+docName+"',DOCEMAIL='"+docEmail+"',DOCPHONE='"+docPhone+"',DOCSTATUS=' "+docStatus+ "' WHERE docID='"+se.getAttribute("docID")+"'; ");
            se.setAttribute("docName", docName);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }
        return status;
	}
	public String DoctorForgotPassword(String docEmail, String docPassword,String docConfirmPass) {
		PreparedStatement ps;
		String status = "";
		if (docPassword.equals(docConfirmPass)) {
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				ps = (PreparedStatement) con.prepareStatement("update doctor set docPassword=? where docEmail=?");
				ps.setString(1, docPassword);
				ps.setString(2, docEmail);
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
	public ArrayList<Doctor> getdoctors() {
		ArrayList<Doctor> al = new ArrayList<>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from doctor;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Doctor d = new Doctor(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setDocID(rs.getString("docID"));
				d.setDocName (rs.getString("docName"));
				d.setDocAge(rs.getString("docAge"));
				d.setDocGender(rs.getString("docGender"));
				d.setDocPhone(rs.getString("docPhone"));
				d.setDocCategory(rs.getString("docCategory"));
				d.setDocStatus(rs.getString("docStatus"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}
