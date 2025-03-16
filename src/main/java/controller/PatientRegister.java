package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.PatientRegistration;
import model.ReceptionistRegistration;


@WebServlet(name = "patient", urlPatterns = {"/patient"})
public class PatientRegister extends HttpServlet{
	protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");// type of the response sent to the client or browser
		PrintWriter out = response.getWriter();//throws IOException
        HttpSession session = request.getSession();
        PatientRegistration patReg=new PatientRegistration(session);
        try {
        	if (request.getParameter("patientRegister") != null) {
        		String patName=request.getParameter("patName");
        		String patAge=request.getParameter("patAge");
        		String patGender=request.getParameter("patGender");
        		String patPhone=request.getParameter("patPhone");
        		String patEmail=request.getParameter("patEmail");
        		String patPassword=request.getParameter("patPassword");
        		String patConfirmPass=request.getParameter("patConfirmPass");
        		
        		if(patPassword.equals(patConfirmPass)) {
        			String status=patReg.PatientRegistration(patName,patAge,patGender,patPhone,patEmail,patPassword);
        			if(status.equals("existed")) {
        				request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                        rd1.forward(request, response);
        			}else if(status.equals("success")) {
        				request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                        rd1.forward(request, response);
        			}else if(status.equals("failure")) {
        				request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                        rd1.forward(request, response);
        			}
        		}
        	}
        	else if(request.getParameter("patientLogin") != null) {
        		String patEmail=request.getParameter("patEmail");
        		String patPassword=request.getParameter("patPassword");
        		String status=patReg.PatientLogin(patEmail,patPassword);
        		
        		if (status.equals("success")) {
        			request.setAttribute("status", "Login successful");
                    RequestDispatcher rd1 = request.getRequestDispatcher("patientDashboard.jsp");
                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
        	} 
        	else if (request.getParameter("patientLogout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } 
        	else if (session.getAttribute("patName") != null && request.getParameter("submit") != null) {
        		String patName=request.getParameter("patName");
        		String patPhone=request.getParameter("patPhone");
        		String patEmail=request.getParameter("patEmail");
        		PatientRegistration patLog=new PatientRegistration(session);
        		String status=patLog.PatientUpdate(patName,patPhone,patEmail);
        		if (status.equals("success")) {
                    request.setAttribute("status", "Profile successfully Updated");
                    RequestDispatcher rd1 = request.getRequestDispatcher("patientDashboard.jsp");
                    rd1.forward(request, response);
                } else {
                    request.setAttribute("status", "Updation failure");
                    RequestDispatcher rd1 = request.getRequestDispatcher("patientDashboard.jsp");
                    rd1.forward(request, response);
                }
        	}
        	//Forgot Password
        	else if (request.getParameter("patientForgotPass") != null) {
				String patEmail = request.getParameter("patEmail");
				String patPassword = request.getParameter("patPassword");
				String patConfirmPass = request.getParameter("patConfirmPass");
				String status = patReg.PatientForgotPassword(patEmail, patPassword, patConfirmPass);
				if (status.equals("Success")) {
					request.setAttribute("status", "New Password Created");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Create New Password");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
			}else if(request.getParameter("deleteuser")!=null) {
        		int id = Integer.parseInt(request.getParameter("patID"));
    			ReceptionistRegistration reg = new ReceptionistRegistration(session);
    			String status = reg.delete(id);
    			if (status.equals("success")) {
    				request.setAttribute("status", "Successfully Deleted");
    				request.getRequestDispatcher("receptionistDashboard.jsp").forward(request, response);
    			}
    			if (status.equals("failure")) {
    				request.setAttribute("status", "Deletion failure");
    				request.getRequestDispatcher("receptionistDashboard.jsp").forward(request, response);
    				response.sendRedirect("receptionistDashboard.jsp");
    			}
        	}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 processRequest(request, response);
	 } 
	    
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 processRequest(request, response);
	 }

	 public String getServletInfo() {
		 return "Short description";
	 }// </editor-fold>
}
