<%@page import="model.Doctor"%>
<%@page import="model.DoctorRegistration"%>
<%@page import="model.Patient"%>
<%@page import="model.PatientRegistration"%>
<%@page import="model.ReceptionistRegistration"%>
<%@page import="model.Receptionist"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AppointmentRegistration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicare - Receptionist</title>
    <link rel="stylesheet" href="receptionistDashboard.css" />
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
      <input type="checkbox" id="menu-toggle" class="menu-toggle" />
      <label for="menu-toggle" class="hamburger">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </label>
      <ul class="nav-list">
        <li class="nav-item"><a href="receptionistDashboard.jsp">Home</a></li>
        <li class="nav-item">
          <a href="#appointments" id="appointmentsLink">Appointments</a>
        </li>
        <li class="nav-item">
          <a href="#patients" id="patientsLink">Patient Details</a>
        </li>
        <li class="nav-item">
          <a href="#doctors" id="doctorsLink">Doctors Details</a>
        </li>
      </ul>
      <div class="patient-info">
      	<form action="receptionistRegister" method="post">
         <a href="index.jsp" class="patient-logout-btn" name="receptionistLogout" value="Logout">Logout</a>
        </form>
       <% if (session.getAttribute("recepName") != null) {%>
						<i class="fa fa-user-circle" aria-hidden="true"></i><a href="" class="patient-name"><%=session.getAttribute("recepName")%></a>
						<%}%>
      </div>
    </nav>

    <!-- Header Section -->
    <div class="header-container">
      <div class="header">
        <h1>Welcome<% if (session.getAttribute("recepName") != null) {%><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("recepName")%>
						,</h1><%} %>
        <h1>Welcome to Medicare - Your Trusted Healthcare Portal</h1>
        <p>Find the various functionalities below</p>
      </div>
    </div>

    <!-- ------------------ Appointment List ----------->
	
    <!-- Appointments Section -->
    <div class="container" id="appointments">
      <h2>Appointments</h2>
      <div class="search-bar">
        <input
          type="text"
          id="searchInput"
          placeholder="Search by patient name or appointment date"
          onkeyup="searchAppointments()"
        />
        <button onclick="searchAppointments()">Search</button>
      </div>
      <table>
        <thead>
          <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Appointment Time</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="appointments-list">
        <%
          AppointmentRegistration a1=new AppointmentRegistration(session);
          ArrayList<Appointment> ar= a1.getappointments();
          Iterator<Appointment> itr=ar.iterator();
          while(itr.hasNext()){
        	  Appointment a=itr.next();
          
          %>
          <tr>
          		<td><%=a.getAptID()%></td>
				<td><%=a.getAptName()%></td>
				<td><%=a.getAptDate()%></td>
				<td><%=a.getAptStatus() %></td>
				<%
					if (a.getAptStatus().equals("pending")) {
				%>
				<td style="color: blue">
					<form action="appointment" method="post">
						<input type="hidden" name="aptID" value="<%=a.getAptID()%>" />
							<button type="submit" class="btn btn-success button"
									name="acceptappointment">Accept</button>
							<button type="submit" class="btn btn-danger button cancel"
										style="margin-top: 6px;" name="admincancelappointment">Cancel</button>
					</form>
				</td>
				<%
					} else if (a.getAptStatus().equals("booked")) {
				%>
				<td style="color: green"><%=a.getAptStatus()%></td>
				<%
				} else if (a.getAptStatus().equals("cancelled")) {
				%>
				<td style="color: red"><%=a.getAptStatus()%></td>
				<%
				}
				%>
			</tr>
				<%
				}
				%>
        
        </tbody>
      </table>
   </div>
   

    <!-- Patient Details Section -->
    <div class="container" id="patients" style="display: none">
      <h2>Patient Details</h2> 
      <div class="search-bar">
        <input
          type="text"
          id="patientSearchInput"
          placeholder="Search by patient name"
          onkeyup="searchPatients()"
        />
        <button onclick="searchPatients()">Search</button>
      </div>
      <table>
        <thead>
          <tr>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Patient Gender</th>
            <th>Contact</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="patients-list">
        	<%
          PatientRegistration p1=new PatientRegistration(session);
          ArrayList<Patient> ar1= p1.getpatients();
          
          Iterator<Patient> itr1=ar1.iterator();
          while(itr1.hasNext()){
        	  Patient p=itr1.next();
          
          %>
          <tr>
          		<td><%=p.getPatID()%></td>
				<td><%=p.getPatName()%></td>
				<td><%=p.getPatGender()%></td>
				<td><%=p.getPatPhone()%></td>
				
				<td style="color: blue">
					<form action="receptionistRegister" method="post">
						<input type="hidden" name="patID" value="<%=p.getPatID()%>" />
							<button type="submit" class="btn btn-success button cancel"
									name="deletepatient">Delete</button>
					</form>
				</td>
				<%} %>
			</tr>
				
        
        </tbody>
      </table>
    </div>

    <!-- Doctors Details Section -->
    <div class="container" id="doctors" style="display: none">
      <h2>Doctors Details</h2>
      <div class="search-bar">
        <input
          type="text"
          id="doctorSearchInput"
          placeholder="Search by doctor name"
          onkeyup="searchDoctors()"
        />
        <button onclick="searchDoctors()" id="search-doc-btn">Search</button>
        <button class="button" id="add-doc-btn">
          <a href="addDoctor.jsp" >Add New Doctor</a>
        </button>
      </div>
      <table>
        <thead>
          <tr>
            <th>Doctor ID</th>
            <th>Doctor Name</th>
            <th>Doctor Gender</th>
            <th>Specialization</th>
            <th>Contact</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="doctors-list">
        <%
          DoctorRegistration d1=new DoctorRegistration(session);
          ArrayList<Doctor> dr= d1.getdoctors();
          
          Iterator<Doctor> itr2=dr.iterator();
          while(itr2.hasNext()){
        	  Doctor d=itr2.next();
          
          %>
          <tr>
          		<td><%=d.getDocID()%></td>
				<td><%=d.getDocName()%></td>
				<td><%=d.getDocGender()%></td>
				<td><%=d.getDocCategory()%></td>
				<td><%=d.getDocPhone()%></td>
				<td><%=d.getDocStatus() %>
				
				<td style="color: blue">
					<form action="receptionistRegister" method="post">
						<input type="hidden" name="docID" value="<%=d.getDocID()%>" />
							<button type="submit" class="btn btn-success button cancel"
									name="deletedoctor">Delete</button>
					</form>
				</td>
				<%} %>
			</tr>
        
        </tbody>
      </table>
    </div>

    <!------------------ Update Receptionist --------------------->
    <div id="update-doctor">
      <h2>Update Receptionist</h2>
      <div id="update-doc-container">
        <form action="receptionist" method="post" id="loginForm">
          <div class="input-group">
            <label for="d_id">Receptionist Name:</label>
            <input
              type="text"
              id="d_id"
              name="recepName"
              placeholder="Enter Receptionist Name"
              required
            />
          </div>

          <div class="input-group">
            <label for="d_id">Receptionist Phone:</label>
            <input
              type="tel"
              minlength="10"
              maxlength="10"
              id="d_id"
              name="recepPhone"
              placeholder="Enter Receptionist Phone"
              required
            />
          </div>

          <div class="input-group">
            <label for="d_id">Receptionist Email:</label>
            <input
              type="email"
              id="d_id"
              name="recepEmail"
              placeholder="Enter Receptionist Email"
              required
            />
          </div>
          <button type="submit" name="receptionistUpdate" class="login-button">Update</button>
        </form>
      </div>
    </div>

    <!-- -------------- Footer ------------------- -->
    
    <%@ include file="footer.jsp" %>

    
    <!-- ___________________________________________________________________________________________________ -->
	<script>
  // Function to show the "Patients" section and hide others
  document.getElementById("patientsLink").addEventListener("click", function(e) {
    e.preventDefault(); // Prevent the default anchor link behavior
    
    // Hide all sections
    document.getElementById("appointments").style.display = "none";
    document.getElementById("patients").style.display = "block";
    document.getElementById("doctors").style.display = "none";
    
    // Highlight the current active link (optional)
    document.querySelectorAll(".nav-item").forEach(function(item) {
      item.classList.remove("active");
    });
    this.classList.add("active");
  });

  // Similarly, handle "Appointments" and "Doctors" sections if needed:
  document.getElementById("appointmentsLink").addEventListener("click", function(e) {
    e.preventDefault();
    document.getElementById("appointments").style.display = "block";
    document.getElementById("patients").style.display = "none";
    document.getElementById("doctors").style.display = "none";
    // Optional: Highlight active link
    document.querySelectorAll(".nav-item").forEach(function(item) {
      item.classList.remove("active");
    });
    this.classList.add("active");
  });

  document.getElementById("doctorsLink").addEventListener("click", function(e) {
    e.preventDefault();
    document.getElementById("appointments").style.display = "none";
    document.getElementById("patients").style.display = "none";
    document.getElementById("doctors").style.display = "block";
    // Optional: Highlight active link
    document.querySelectorAll(".nav-item").forEach(function(item) {
      item.classList.remove("active");
    });
    this.classList.add("active");
  });
  
  function searchAppointments() {
	    let searchInput = document.getElementById("searchInput").value.toLowerCase();
	    let tableRows = document.querySelectorAll("#appointments-list tr");

	    tableRows.forEach(row => {
	      let patientName = row.cells[1].textContent.toLowerCase();
	      let appointmentDate = row.cells[2].textContent.toLowerCase();

	      if (patientName.includes(searchInput) || appointmentDate.includes(searchInput)) {
	        row.style.display = "";
	      } else {
	        row.style.display = "none";
	      }
	    });
	  }
  function searchDoctors() {
	    let searchInput = document.getElementById("doctorSearchInput").value.toLowerCase();
	    let tableRows = document.querySelectorAll("#doctors-list tr");

	    tableRows.forEach(row => {
	      let doctorName = row.cells[1].textContent.toLowerCase(); // Get doctor name from column 2 (index 1)

	      // Check if the doctor's name includes the search input
	      if (doctorName.includes(searchInput)) {
	        row.style.display = "";  // Show the row if it matches
	      } else {
	        row.style.display = "none";  // Hide the row if it doesn't match
	      }
	    });
	  }
   function searchPatient() {
	    let searchInput = document.getElementById("patientSearchInput").value.toLowerCase();
	    let tableRows = document.querySelectorAll("#patients-list tr");

	    tableRows.forEach(row => {
	      let doctorName = row.cells[1].textContent.toLowerCase(); // Get doctor name from column 2 (index 1)

	      // Check if the doctor's name includes the search input
	      if (doctorName.includes(searchInput)) {
	        row.style.display = "";  // Show the row if it matches
	      } else {
	        row.style.display = "none";  // Hide the row if it doesn't match
	      }
	    });
	  }
</script>
	
    <!-- ################################################################################################### -->

     </body>
</html>
