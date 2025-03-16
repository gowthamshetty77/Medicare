package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Appointment;
import model.AppointmentRegistration;

@WebServlet(name = "appointment", urlPatterns = {"/appointment"})
public class appointmentRegister extends HttpServlet{
	protected void processreq(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");// type of the resp sent to the client or browser
		PrintWriter out = resp.getWriter();//throws IOException
        HttpSession session = req.getSession();
        AppointmentRegistration apt = new AppointmentRegistration(session);
        try {
        	if (req.getParameter("appointmentRegister") != null) {
        		String aptName=req.getParameter("aptName");
        		String aptPhone=req.getParameter("aptPhone");
        		String aptDoctor=req.getParameter("aptDoctor");
        		String aptCategory=req.getParameter("aptCategory");
        		String aptDate=req.getParameter("aptDate");
     
     
        		String status = apt.addAppointment(aptName,aptPhone,aptDoctor,aptCategory,aptDate);
        		if(status.equals("existed")) {
        			req.setAttribute("status", "Existed Record");
        			RequestDispatcher rd1=req.getRequestDispatcher("patientDashboard.jsp?aptID="+req.getParameter("aptID"));
        			rd1.forward(req, resp);
        		}
        		else if(status.equals("success")) {
        			req.setAttribute("status", "Appointment Booked");
        			RequestDispatcher rd=req.getRequestDispatcher("patientDashboard.jsp?aptID="+req.getParameter("aptID"));
        			rd.forward(req, resp);
        		}
        		else if(status.equals("failure")) {
        			req.setAttribute("status", "Booking failed");
        			RequestDispatcher rd=req.getRequestDispatcher("patientDashboard.jsp?aptID="+req.getParameter("aptID"));
        			rd.forward(req, resp);
        		}
        	}
        	else if (session.getAttribute("aptName") != null && req.getParameter("cancelAppointment") != null) {
        		int event_id = Integer.parseInt(req.getParameter("aptID"));
        		int status = apt.deleteAppointment(event_id);
        		if (status > 0) {
        			RequestDispatcher rd = req.getRequestDispatcher("eventStatus.jsp");
        			rd.forward(req, resp);
        		}
        	} else if (session.getAttribute("recepName") != null && req.getParameter("admincancelappointment") != null) {
        		int event_id = Integer.parseInt(req.getParameter("aptID"));
        		int status = apt.deleteAppointment(event_id);
        		if (status > 0) {
        			RequestDispatcher rd = req.getRequestDispatcher("receptionistDashboard.jsp");
        			rd.forward(req, resp);
        		}
        	} else if (session.getAttribute("recepName") != null && session.getAttribute("recepID").equals("7701")
				&& req.getParameter("acceptappointment") != null) {
        		int aptID = Integer.parseInt(req.getParameter("aptID"));
        		int status = apt.acceptAppointment(aptID);
        		if (status > 0) {
        			RequestDispatcher rd = req.getRequestDispatcher("receptionistDashboard.jsp");
        			rd.forward(req, resp);
        		}
        	} else if (session.getAttribute("patName") != null && req.getParameter("cancelevent") != null) {
        		int apt_id = Integer.parseInt(req.getParameter("aptID"));
        		int status = apt.deleteAppointment(apt_id);
        		if (status > 0) {
        			RequestDispatcher rd = req.getRequestDispatcher("patientDashboard.jsp");
        			rd.forward(req, resp);
        		}
        	}
        }catch (Exception e) {
        	e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		 processreq(req, resp);
	 } 
	    
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		 processreq(req, resp);
	 }

	 public String getServletInfo() {
		 return "Short description";
	 }
}
