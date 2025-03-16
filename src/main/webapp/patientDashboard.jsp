<%@page import="model.AppointmentRegistration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.PatientRegistration"%>
<%@page import="model.Appointment"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicare - Patient</title>
    <link rel="stylesheet" href="patientDashboard.css" />
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
          <a href="index.html"><img src="imgs/medicare-logo.png" alt="" /></a>
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
        <li class="nav-item"><a href="patientDashboard.jsp">Home</a></li>
        <li class="nav-item"><a href="#footer-contact">About</a></li>
        <li class="nav-item"><a href="#allDepartments">Book Appointment</a></li>
        <li class="nav-item"><a href="#status" id="statusBtn">Status</a></li>
        <!-- <li class="nav-item">
          <a href="#" id="patient-logout-btn">Logout</a>
        </li> -->
      </ul>
      <div class="patient-info">
      	<form action="patient" method="post">
        	<a href="index.jsp" class="patient-logout-btn" name="patientLogout" value="Logout">Logout</a>
        </form>
        <% if (session.getAttribute("patName") != null) {%>
						<i class="fa fa-user-circle" aria-hidden="true"></i><a href="" class="patient-name"><%=session.getAttribute("patName")%></a>
						<%}%>
      </div>
    </nav>

    <!-- ------------------ Appointment ----------->

    <!-- Header Section -->
    <div class="container">
      <div class="header">
        <h1>Welcome to Medicare - Your Trusted Healthcare Portal</h1>
        <p>Find the best doctors and book appointments online.</p>
      </div>
    </div>

    <div class="allDepartments" id="allDepartments">
      <!-------------- Cardiology -------------------->

      <div class="department-container">
        <h1>Cardiology</h1>
        <!-- Doctors List Section -->
        <div class="card-container">
          <!-- Doctor 1 -->
          <div class="card">
            <img
              src="imgs/image1.jpg"
              alt="Doctor 1"
              height="240"
              width="240"
            />
            <h3>Dr. John Smith</h3>
            <p>Experienced Cardiologist</p>
            <p class="specialization">Cardiology</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=1'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 2 -->
          <div class="card">
            <img
              src="imgs/image2.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=2'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 3 -->
          <div class="card">
            <img
              src="imgs/image3.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=2'"
            >
              Book Appointment
            </button>
          </div>
        </div>
      </div>

      <!-- Department - 2 -->

      <div class="department-container">
        <h1>Orthopedics</h1>
        <!-- Doctors List Section -->
        <div class="card-container">
          <!-- Doctor 1 -->
          <div class="card">
            <img
              src="imgs/image1.jpg"
              alt="Doctor 1"
              height="240"
              width="240"
            />
            <h3>Dr. John Smith</h3>
            <p>Experienced Cardiologist</p>
            <p class="specialization">Cardiology</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=1'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 2 -->
          <div class="card">
            <img
              src="imgs/image2.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=2'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 3 -->
          <div class="card">
            <img
              src="imgs/image3.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=3'"
            >
              Book Appointment
            </button>
          </div>
        </div>
      </div>

      <!-------------- Cardiology -------------------->

      <div class="department-container">
        <h1>Pulmonology</h1>
        <!-- Doctors List Section -->
        <div class="card-container">
          <!-- Doctor 1 -->
          <div class="card">
            <img
              src="imgs/image1.jpg"
              alt="Doctor 1"
              height="240"
              width="240"
            />
            <h3>Dr. John Smith</h3>
            <p>Experienced Cardiologist</p>
            <p class="specialization">Cardiology</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=1'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 2 -->
          <div class="card">
            <img
              src="imgs/image2.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=2'"
            >
              Book Appointment
            </button>
          </div>

          <!-- Doctor 3 -->
          <div class="card">
            <img
              src="imgs/image3.jpg"
              alt="Doctor 2"
              height="240"
              width="240"
            />
            <h3>Dr. Emily Williams</h3>
            <p>Expert Pediatrician</p>
            <p class="specialization">Pediatrics</p>
            <button
              class="contact-btn"
              onclick="window.location.href='bookAppointment.jsp?doctorId=3'"
            >
              Book Appointment
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- -------------- Footer ------------------- -->

    <%@ include file="footer.jsp" %>

    <!-- ##################################Patient Status######################################### -->
<div id="statusModal" class="statusModal">
  <div class="modal-content">
    <span class="close-button" id="status-close-button">&times;</span>
    <h1 id="logins-title">Medicare - Patient Status</h1>
    <p id="role">Your booked appointments are shown below</p>
    <div class="login-card-container">
      <!-- Patient Appointment Info -->
      <div class="login-card">
        <h2>Appointments</h2>
        <table id="appointment-table">
          <%
            // Get patient name from session and cast to String
            String patName = (String) session.getAttribute("patName");

            if (patName != null) {
                // Fetch appointments for the patient
                AppointmentRegistration p1 = new AppointmentRegistration(session);
                ArrayList<Appointment> ar = p1.getAppointmentStatus(patName);

                // Check if appointments are found
                if (ar != null && !ar.isEmpty()) {
          %>
            <thead>
              <tr>
                <th>Sl No.</th>
                <th>Doctor Booked</th>
                <th>Specialization</th>
                <th>Appointment Date</th>
                <th>Appointment Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <%
                // Iterate through the appointment list
                for (Appointment a : ar) {
              %>
                <tr>
                  <td><%= a.getAptID() %></td>
                  <td><%= a.getAptDoctor() %></td>
                  <td><%= a.getAptCategory() %></td>
                  <td><%= a.getAptDate() %></td>
                  <td style="color: 
                    <%= 
                        a.getAptStatus().equals("pending") ? "orange" : 
                        a.getAptStatus().equals("booked") ? "green" : 
                        a.getAptStatus().equals("cancelled") ? "red" : "black"
                    %>">
                    <%= a.getAptStatus().substring(0, 1).toUpperCase() + a.getAptStatus().substring(1) %>
                  </td>
                  <td>
                    <form action="appointment" method="post">
                      <input type="hidden" name="aptID" value="<%= a.getAptID() %>" />
                      <button type="submit" class="btn btn-danger pat-appointment-cancel" name="cancelevent">Cancel</button>
                    </form>
                  </td>
                </tr>
              <%
                }
              %>
            </tbody>
          <%
                } else {
          %>
            <tr>
              <td colspan="6">No appointments found.</td>
            </tr>
          <%
                }
            } else {
          %>
            <tr>
              <td colspan="6">Please log in to view your appointments.</td>
            </tr>
          <%
            }
          %>
        </table>
      </div>
    </div>
  </div>
</div>


          <!------------------------------- Receptionist Login -------------------->

          <!-- card end -->
      
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

    <script>
      const statusModal = document.getElementById("statusModal");
      const statusBtn = document.getElementById("statusBtn");
      const statusCloseButton = document.querySelector("#status-close-button");

      statusBtn.addEventListener("click", openLoginModal);
      statusCloseButton.addEventListener("click", closeLoginModal);
      window.addEventListener("click", outsideClick);

      function openLoginModal() {
        statusModal.style.display = "block";
      }

      function closeLoginModal() {
        statusModal.style.display = "none";
      }

      function outsideClick(e) {
        if (e.target == statusModal) {
          statusModal.style.display = "none";
        }
      }
    </script>
  </body>
</html>
    