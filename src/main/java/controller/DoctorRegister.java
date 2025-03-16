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
import model.DoctorRegistration;

@WebServlet(name = "doctor", urlPatterns = {"/doctor"})
public class DoctorRegister extends HttpServlet{
	protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");// type of the response sent to the client or browser
		PrintWriter out = response.getWriter();//throws IOException
        HttpSession session = request.getSession();
        DoctorRegistration docReg=new DoctorRegistration(session);
        try {
        	if (request.getParameter("doctorRegister") != null) {
        		String docName=request.getParameter("docName");
        		String docAge=request.getParameter("docAge");
        		String docGender=request.getParameter("docGender");
        		String docCategory=request.getParameter("docCategory");
        		String docPhone=request.getParameter("docPhone");
        		String docEmail=request.getParameter("docEmail");
        		String docPassword=request.getParameter("docPassword");
        		String docConfirmPass=request.getParameter("docConfirmPass");
        		
        		if(docPassword.equals(docConfirmPass)) {
        			String status=docReg.DoctorRegistration(docName,docAge,docGender,docCategory,docPhone,docEmail,docPassword);
        			
        			if(status.equals("existed")) {
        				request.setAttribute("status", "Existed record");
                        RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
                        rd1.forward(request, response);
        			}else if(status.equals("success")) {
        				request.setAttribute("status", "Successfully Registered");
                        RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
                        rd1.forward(request, response);
        			}else if(status.equals("failure")) {
        				request.setAttribute("status", "Registration failed");
                        RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
                        rd1.forward(request, response);
        			}
        		}
        	}
        	else if(request.getParameter("doctorLogin") != null) {
        		String docEmail=request.getParameter("docEmail");
        		String docPassword=request.getParameter("docPassword");
        		String status=docReg.DoctorLogin(docEmail,docPassword);
        		if (status.equals("success")) {
        			request.setAttribute("status", "Login successful");
                    RequestDispatcher rd1 = request.getRequestDispatcher("doctorDashboard.jsp");
                    rd1.forward(request, response);

                } else if (status.equals("failure")) {
                    request.setAttribute("status", "Login failed");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
        	} 
        	else if (request.getParameter("doctorLogout") != null) {
                session.invalidate();
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } 
        	else if (session.getAttribute("docName") != null && request.getParameter("doctorUpdate") != null) {
        		String docName=request.getParameter("docName");
        		String docPhone=request.getParameter("docPhone");
        		String docEmail=request.getParameter("docEmail");
        		String docStatus=request.getParameter("docStatus");
        		DoctorRegistration docLog=new DoctorRegistration(session);
        		String status=docLog.DoctorUpdate(docName,docPhone,docEmail,docStatus);
        		if (status.equals("success")) {
                    request.setAttribute("status", "Profile successfully Updated");
                    RequestDispatcher rd1 = request.getRequestDispatcher("doctorDashboard.jsp");
                    rd1.forward(request, response);
                } else {
                    request.setAttribute("status", "Updation failure");
                    RequestDispatcher rd1 = request.getRequestDispatcher("doctorDashboard.jsp");
                    rd1.forward(request, response);
                }
        	}
        	//Forgot Password
        	else if (request.getParameter("doctorForgotPass") != null) {
				String docEmail = request.getParameter("docEmail");
				String docPassword = request.getParameter("docPassword");
				String docConfirmPass = request.getParameter("docConfirmPass");
				String status = docReg.DoctorForgotPassword(docEmail, docPassword, docConfirmPass);
				if (status.equals("Success")) {
					request.setAttribute("status", "New Password Created");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Create New Password");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
			}
        	
		} catch (Exception e) {
			e.printStackTrace();
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
