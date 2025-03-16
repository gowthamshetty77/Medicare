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
import model.ReceptionistRegistration;


@WebServlet(name = "receptionistRegister", urlPatterns = {"/receptionistRegister"})
public class receptionistRegister extends HttpServlet{

		protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws IOException {
			response.setContentType("text/html;charset=UTF-8");// type of the response sent to the client or browser
			PrintWriter out = response.getWriter();//throws IOException
	        HttpSession session = request.getSession();
	        ReceptionistRegistration recepReg=new ReceptionistRegistration(session);
	        try {
	        	if (request.getParameter("receptionistRegister") != null) {
	        		String recepName=request.getParameter("recepName");
	        		String recepAge=request.getParameter("recepAge");
	        		String recepGender=request.getParameter("recepGender");
	        		String recepPhone=request.getParameter("recepPhone");
	        		String recepEmail=request.getParameter("recepEmail");
	        		String recepPassword=request.getParameter("recepPassword");
	        		String recepConfirmPass=request.getParameter("recepConfirmPass");
	        		
	        		if(recepPassword.equals(recepConfirmPass)) {
	        			String status=recepReg.ReceptionistRegistration(recepName,recepAge,recepGender,recepPhone,recepEmail,recepPassword);
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
	        	else if(request.getParameter("receptionistLogin") != null) {
	        		String recepEmail=request.getParameter("recepEmail");
	        		String recepPassword=request.getParameter("recepPassword");
	        		String status=recepReg.ReceptionistLogin(recepEmail,recepPassword);
	        		if (status.equals("success")) {
	        			request.setAttribute("status", "Login successful");
	                    RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
	                    rd1.forward(request, response);

	                } else if (status.equals("failure")) {
	                    request.setAttribute("status", "Login failed");
	                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
	                    rd1.forward(request, response);
	                }
	        	} 
	        	else if (request.getParameter("receptionistLogout") != null) {
	                session.invalidate();
	                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
	                rd1.forward(request, response);
	            } 
	        	else if (session.getAttribute("recepName") != null && request.getParameter("receptionistUpdate") != null) {
	        		String recepName=request.getParameter("recepName");
	        		String recepPhone=request.getParameter("recepPhone");
	        		String recepEmail=request.getParameter("recepEmail");
	        		ReceptionistRegistration recepLog=new ReceptionistRegistration(session);
	        		String status=recepLog.ReceptionistUpdate(recepName,recepPhone,recepEmail);
	        		if (status.equals("success")) {
	                    request.setAttribute("status", "Profile successfully Updated");
	                    RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
	                    rd1.forward(request, response);
	                } else {
	                    request.setAttribute("status", "Updation failure");
	                    RequestDispatcher rd1 = request.getRequestDispatcher("receptionistDashboard.jsp");
	                    rd1.forward(request, response);
	                }
	        	}
	        	//Forgot Password
	        	else if (request.getParameter("receptionistForgotPass") != null) {
					String recepEmail = request.getParameter("recepEmail");
					String recepPassword = request.getParameter("recepPassword");
					String recepConfirmPass = request.getParameter("recepConfirmPass");
					String status = recepReg.ReceptionistForgotPassword(recepEmail, recepPassword, recepConfirmPass);
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
	        
	        	else if(request.getParameter("deletedoctor")!=null) {
	        		int id = Integer.parseInt(request.getParameter("docID"));
	    			ReceptionistRegistration reg = new ReceptionistRegistration(session);
	    			String status = reg.deleteDoctor(id);
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
	        	else if(request.getParameter("deletepatient")!=null) {
	        		int id = Integer.parseInt(request.getParameter("patID"));
	    			ReceptionistRegistration reg = new ReceptionistRegistration(session);
	    			String status = reg.deletePatient(id);
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
