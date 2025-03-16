<%@page import="java.util.ArrayList"%>
<%@page import="model.AppointmentRegistration"%>
<%@page import="model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicare - Doctor</title>
    <link rel="stylesheet" href="doctorDashboard.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
      integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Oswald:wght@200..700&family=Poppins:wght@300&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
  		<% 
    	// Set no-cache headers to prevent the user from going back to this page after logging out or password update
    	response.setHeader("Cache-Control", "no-store");
    	response.setHeader("Pragma", "no-cache");
    	response.setDateHeader("Expires", 0);
		%>
    <!---------------------------------------- LOGO ROW ----------------------------->
    <div class="logo-row">
      <!-- logo -->
      <div class="logo">
        <div class="logo-img">
          <a href="index.jsp"><img src="imgs/medicare-logo.png" alt="" /></a>
        </div>
        <div class="logo-text">
          <h1>MEDICARE</h1>
          <p>Care for Better Health</p>
        </div>
      </div>

      <!-- icons -->
      <!-- Call -->
      <div class="logo-bar-side">
        <!-- phone -->
        <div class="logo-call">
          <div class="call-icon">
            <i class="fa-solid fa-phone"></i>
          </div>
          <div class="call-text">Call us Today<br />080-45678765</div>
        </div>

        <!-- Timings -->
        <div class="logo-call">
          <div class="call-icon">
            <i class="fa-regular fa-clock"></i>
          </div>
          <div class="call-text">Opening Hours<br />8.00 to 17.00</div>
        </div>
      </div>
    </div>
    <!-- ____________________________________________________________________________________________________________________ -->

    <!---------------------------- NavaBar --------------------->
    <nav class="navbar">
      <ul class="nav-list">
        <li class="nav-item"><a href="doctorDashboard.jsp">Home</a></li>
        <li class="nav-item"><a href="#footer-contact">About</a></li>
        <li class="nav-item">
          <a href="#appointments-container">Appointment List</a>
        </li>
        <li class="nav-item"><a href="#update-doctor">Update</a></li>
        <!-- <li class="nav-item">
          <a href="#" id="patient-logout-btn">Logout</a>
        </li> -->
      </ul>
      <div class="patient-info">
      <form action="doctor" method="post">
        <a href="index.jsp" class="patient-logout-btn" name="doctorLogout" value="Logout">Logout</a>
       </form>
       <% if (session.getAttribute("docName") != null) {%>
						<i class="fa fa-user-circle" aria-hidden="true"></i><a href="" class="patient-name"><%=session.getAttribute("docName")%></a>
						<%}%>
      </div>
    </nav>

    <!-- Header Section -->
    <div class="container">
    <div class="header">
        <h1>Welcome
            <% if (session.getAttribute("docName") != null) { %>
                <i class="fa fa-user-circle" aria-hidden="true"></i><%= session.getAttribute("docName") %>
            <% } %>,
        </h1>
        <h1>Welcome to Medicare - Your Trusted Healthcare Portal</h1>
        <p>Find the Scheduled Appointments below</p>
    </div>
</div>

<!-- ------------------ Appointment List ----------->

<div id="appointments-container">
    <h2>Scheduled Appointments</h2>
    <% 
        // Get doctor name from session and cast to String
        String docName = (String) session.getAttribute("docName");

        if (docName != null) {
            // Fetch appointments for the doctor
            AppointmentRegistration p1 = new AppointmentRegistration(session);
            ArrayList<Appointment> ar = p1.getAppointmentsDoc(docName);

            // Check if appointments are found
            if (ar != null && !ar.isEmpty()) {
    %>
        <table id="scheduled-table">
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>Appointment Time</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="appointments-list">
                <!-- Appointment rows will be populated here -->
                <% 
                    // Iterate through the appointment list
                    for (Appointment a : ar) {
                %>
                    <tr>
                        <td><%= a.getAptID() %></td>
                        <td><%= a.getAptName() %></td>
                        <td><%= a.getAptDate() %></td> <!-- Assuming AptDate exists -->
                    	<td><%=a.getAptStatus() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% 
        } else { // If no appointments are found
    %>
        <p>No scheduled appointments found.</p>
    <% 
        }
    } else { // If doctor name is not found in session
    %>
        <p>You are not logged in as a doctor.</p>
    <% 
    }
    %>
</div>

    <!------------------ Update Doctor --------------------->
    <div id="update-doctor">
      <h2>Update Doctor</h2>
      <div id="update-doc-container">
        <form action="doctor" method="post" id="loginForm">
          <div class="input-group">
            <label for="d_id">Doctor Name:</label>
            <input
              type="text"
              id="d_id"
              name="docName"
              placeholder="Enter Doctor Name"
              required
            />
          </div>

          <div class="input-group">
            <label for="d_id">Doctor availablity:</label>
            <input
              type="text"
              id="d_id"
              name="docStatus"
              placeholder="Enter Status"
              required
            />
          </div>

          <div class="input-group">
            <label for="d_id">Doctor Phone:</label>
            <input
              type="tel"
              id="d_id"
              name="docPhone"
              placeholder="Enter Doctor Phone"
              required
            />
          </div>

          <div class="input-group">
            <label for="d_id">Doctor Email:</label>
            <input
              type="email"
              id="d_id"
              name="docEmail"
              placeholder="Enter Doctor Email"
              required
            />
          </div>
          <div class="input-group">
            <label for="d_pin">Doctor Password:</label>
            <input
              type="password"
              id="d_pin"
              name="docPassword"
              placeholder="Enter Doctor Password"
              required
            />
          </div>
          <div class="input-group">
            <label for="d_pin">Confirm Doctor Password:</label>
            <input
              type="password"
              id="d_pin"
              name="docConfirmPass"
              placeholder="Confirm Doctor Password"
              required
            />
          </div>
          <button type="submit" name="doctorUpdate" class="login-button">Update</button>
        </form>
      </div>
    </div>

    <!-- -------------- Footer ------------------- -->

    <%@ include file="footer.jsp" %>

    <!-- ################################################################################################### -->

    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
  </body>
</html>
