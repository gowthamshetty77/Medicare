<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicare - Book Appointment</title>
    <link rel="stylesheet" href="bookAppointment.css" />
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
      </ul>
      <div class="patient-info">
        <% if (session.getAttribute("patName") != null) {%>
						<i class="fa fa-user-circle" aria-hidden="true"></i><a href="" class="patient-name"><%=session.getAttribute("patName")%></a>
						<%}%>
      </div>
    </nav>

    <!-- ------------------------------- Book Appointment ---------------------------- -->

    <section class="appointment-section">
      <div class="form-container">
        <h2>Book an Appointment</h2>

        <form action="appointment" method="post">
          <div class="form-group">
            <label for="name">Name:</label>
            <input
              type="text"
              id="name"
              name="aptName"
              placeholder="Enter your name"
              required
            />
          </div>
          <div class="form-group">
            <label for="phone">Phone:</label>
            <input
              type="text"
              id="phone"
              name="aptPhone"
              placeholder="Enter your number"
              required
            />
          </div>
          <div class="form-group">
            <label for="phone">Doctor:</label>
            <input
              type="text"
              id="phone"
              name="aptDoctor"
              placeholder="Enter doctor name"
              required
            />
          </div>
          <div class="form-group">
            <label for="phone">Specialization:</label>
            <input
              type="text"
              id="phone"
              name="aptCategory"
              placeholder="Enter specialization"
              required
            />
          </div>
          <div class="form-group">
            <label for="appointmentDate">Appointment Date:</label>
            <input
              type="date"
              id="appointmentDate"
              name="aptDate"
              required
            />
          </div>

          <button type="submit" name="appointmentRegister" class="submit-btn">Submit</button>
        </form>
      </div>
    </section>

    <!-- ------------- Footer ----------------------------- -->
    
    <%@ include file="footer.jsp" %>
    
  </body>
</html>
