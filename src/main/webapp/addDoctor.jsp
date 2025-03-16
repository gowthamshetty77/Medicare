<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicare - Add Doctor</title>
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

    <!-- **************************** Add Doctor ********************************** -->

    <style>
      body {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
      }

      .poppins-light {
        font-family: "Poppins", serif;
        font-weight: 300;
        font-style: normal;
      }

      /* Logo row */
      .logo-row {
        width: 100%;
        height: 80px;
        display: flex;
        align-items: center;
        /* background-color: aquamarine; */
      }
      .logo {
        width: 300px;
        height: 80px;
        /* background-color: antiquewhite; */
        display: flex;
      }
      .logo-img {
        width: 85px;
        height: 85px;
        /* background-color: blue; */
      }
      .logo-img:hover,
      .logo-img img:hover {
        scale: 1;
      }
      .logo-img img {
        width: 100%;
        height: 100%;
      }
      .logo-text {
        width: 70%;
        font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        /* background-color: blueviolet; */
      }
      .logo-text h1 {
        font-size: large;
        margin: 20px 0 0 0;
        color: rgb(14, 14, 194);
        float: left;
      }
      .logo-text p {
        font-size: medium;
        margin: 0;
        color: rgb(14, 14, 194);
        float: left;
      }

      /* logo-bar-side- */

      .logo-bar-side {
        width: 400px;
        height: 50px;
        position: relative;
        display: flex;
        justify-content: space-around;
        align-items: center;
        left: 500px;
        /* background-color: aqua; */
      }
      .logo-call {
        width: 150px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
        /* background-color: azure; */
      }
      .call-icon {
        background-color: #007bff;
        width: 35px;
        height: 35px;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .call-text {
        /* padding: 2px; */
        margin-left: 3px;
      }

      /* ________________________________________________________________________________________________________________ */

      /*------------------- navbar -------------------------*/

      .navbar {
        font-family: Arial, sans-serif;
        background-color: #007bff; /* Hospital blue color */
        overflow: hidden;
        padding: 10px 20px; /* Padding for space at the edges */
      }

      .nav-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
        float: left; /* Aligns the main nav items to the left */
      }

      .nav-item {
        float: left;
      }

      .nav-item a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
      }

      .nav-item a:hover {
        background-color: #0056b3; /* Darker shade on hover */
      }

      .patient-info {
        width: 120px;
        float: right; /* Aligns Login and Signup buttons to the right */
        /* background-color: aqua; */
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        /* gap: 5; */
        margin: 10px auto;
      }
      /* .patient-info i {
            font-size: large;
            color: white;
        } */
      #patient-icon {
        font-size: large;
        color: white;
      }
      .patient-name {
        color: white;
        font-family: Arial, Helvetica, sans-serif;
        font-size: large;
        font-weight: bold;
        text-decoration: none;
      }
      .patient-name:hover {
        color: rgb(218, 234, 248);
      }
      /* --------------------------------------------------------------------------------------- */

      .appointment-section {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .form-container {
        width: 400px;
        background: #fff;
        padding: 40px;
        margin: 25px 0;
        border-radius: 15px;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      }

      .form-container:hover {
        scale: 1.01;
        transition: 0.1s linear;
      }

      .form-container h2 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 28px;
        color: #007bff;
        position: relative;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-group label {
        font-weight: bold;
        color: #555;
        margin-bottom: 5px;
        display: inline-block;
      }

      .form-group input {
        width: 90%;
        padding: 12px 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        font-size: 16px;
      }

      .submit-btn {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        color: #333;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
        background-color: #007bff;
        color: white;
      }

      .submit-btn:hover {
        scale: 1.01;
        transition: 0.1s linear;
      }

      /* ------------------ FOOTER -------------------------------------- */

      footer {
        width: 100%;
        background-color: #003366;
        color: white;
        padding: 55px 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
      }

      .footer-column {
        flex: 1;
        margin: 20px;
        min-width: 200px;
      }
      .footer-logo {
        background-color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 5px;
      }
      .footer-logo img:hover {
        transition: 0.5s linear;
      }

      .footer-column h3 {
        font-size: 18px;
        margin-bottom: 20px;
        color: #f4d03f;
        position: relative;
      }

      .footer-column h3::after {
        content: "";
        display: block;
        width: 50px;
        height: 3px;
        background-color: #f4d03f;
        margin-top: 5px;
      }

      .footer-column ul {
        list-style: none;
        padding: 0;
        margin: 0;
      }

      .footer-column ul li {
        margin-bottom: 10px;
      }

      .footer-column ul li a {
        color: white;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s ease;
      }

      .footer-column ul li a:hover {
        color: #f4d03f;
      }

      .footer-column p {
        font-size: 14px;
        line-height: 1.8;
      }

      .newsletter input[type="email"] {
        padding: 12px;
        border: none;
        border-radius: 4px;
        width: 75%;
        margin-right: 10px;
        font-size: 14px;
      }

      .newsletter button {
        padding: 12px 15px;
        background-color: #f4d03f;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
      }

      .newsletter button:hover {
        background-color: #e2b20e;
      }

      .newsletter {
        margin-top: 30px;
      }

      .footer-bottom {
        background-color: #003366;
        padding: 20px;
        text-align: center;
        color: #aaa;
        font-size: 14px;
        border-top: 1px solid #a09a9a;
      }

      .footer-bottom a {
        color: #f4d03f;
        text-decoration: none;
      }

      .footer-bottom a:hover {
        text-decoration: underline;
      }

      .footer-column img {
        width: 150px;
        margin-top: 20px;
      }

      i {
        font-size: 20px;
        color: white;
      }

      .popular-searches a,
      a {
        color: #fff;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.2s ease;
      }

      .popular-searches a:hover {
        color: #f1cb33;
        text-decoration: underline;
      }

      img:hover,
      i:hover {
        scale: 1;
      }

      .popular-searches {
        margin-left: 60px;
        margin-right: 60px;
        font-size: 18px;
        font-weight: 500;
      }
    </style>

    <!-- ******************************************************************************** -->
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
        <li class="nav-item"><a href="receptionistDashboard.jsp">Home</a></li>
        <li class="nav-item"><a href="#footer-contact">About</a></li>
      </ul>
      <div class="patient-info">
       <% if (session.getAttribute("recepName") != null) {%>
						<i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("recepName")%>
						<%}%>
      </div>
    </nav>

    <!-- ------------------------------- Add Doctor ---------------------------- -->

    <section class="appointment-section">
      <div class="form-container">
        <h2>Add Doctor</h2>

        <form action="doctor" method="post">
          <div class="form-group">
            <label for="name">Doctor Name:</label>
            <input
              type="text"
              id="name"
              name="docName"
              placeholder="Enter doctor name"
              required
            />
          </div>
          <div class="form-group">
            <label for="name">Doctor Age:</label>
            <input
              type="text"
              id="name"
              name="docAge"
              placeholder="Enter doctor Age"
              required
            />
          </div>
          <div class="form-group">
            <label for="name">Doctor Gender:</label>
            <input
              type="text"
              id="name"
              name="docGender"
              placeholder="Enter doctor Gender"
              required
            />
          </div>

          <div class="form-group">
            <label for="phone">Doctor Specialization:</label>
            <input
              type="text"
              id="phone"
              name="docCategory"
              placeholder="Enter doctor Specialization"
              required
            />
          </div>

          <div class="form-group">
            <label for="phone">Doctor Phone:</label>
            <input
              type="text"
              id="phone"
              name="docPhone"
              placeholder="Enter Doctor number"
              required
            />
          </div>
          <div class="form-group">
            <label for="phone">Doctor Email:</label>
            <input
              type="email"
              id="phone"
              name="docEmail"
              placeholder="Enter Doctor Email"
              required
            />
          </div>

          <div class="form-group">
            <label for="phone">Doctor Password:</label>
            <input
              type="password"
              id="phone"
              name="docPassword"
              placeholder="Enter doctor Password"
              required
            />
          </div>

          <div class="form-group">
            <label for="phone">Confirm Doctor Password:</label>
            <input
              type="password"
              id="phone"
              name="docConfirmPass"
              placeholder="Enter Confirm Doctor Password"
              required
            />
          </div>

          <button type="submit" name="doctorRegister" class="submit-btn">Submit</button>
        </form>
      </div>
    </section>

    <!-- ------------- Footer ----------------------------- -->
    <footer id="footer-contact">
      <div class="footer-column">
        <div class="footer-logo">
          <img src="imgs/medicare-logo.png" alt="Medicare Logo" />
        </div>
        <p>
          Your trusted partner in health and wellness, offering a wide range of
          medical supplies and services for your well-being.
        </p>
      </div>

      <div class="footer-column">
        <h3>Shop by Category</h3>
        <ul>
          <li><a href="medications.html">Medications</a></li>
          <li><a href="health-supplements.html">Health Supplements</a></li>
          <li><a href="medical-equipment.html">Medical Equipment</a></li>
          <li><a href="personal-care.html">Personal Care</a></li>
          <li><a href="wellness-products.html">Wellness Products</a></li>
          <li>
            <a href="health-monitoring.html">Health Monitoring Devices</a>
          </li>
        </ul>
      </div>

      <div class="footer-column">
        <h3>Customer Service</h3>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">FAQs</a></li>
          <li><a href="#">Appointment</a></li>
          <li><a href="#">Returns & Exchanges</a></li>
          <li><a href="#">Track Your Status</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3>Get in Touch</h3>
        <p><i class="fa-solid fa-phone"></i> 080-45678765</p>
        <p>
          <i class="fa-solid fa-envelope"></i>
          <a href="mailto:support@medease.com">support@medicare.com</a>
        </p>
        <h3>Follow Us</h3>
        <div class="social-icons">
          <a href="https://x.com/" target="_blank"
            ><i class="fa-brands fa-twitter"></i
          ></a>
          <a href="https://www.instagram.com/" target="_blank"
            ><i class="fa-brands fa-instagram"></i
          ></a>
          <a href="https://www.facebook.com/" target="_blank"
            ><i class="fa-brands fa-facebook"></i
          ></a>
          <a href="https://www.youtube.com/" target="_blank"
            ><i class="fa-brands fa-youtube"></i
          ></a>
        </div>
      </div>

      <div class="footer-column">
        <h3>Newsletter</h3>
        <p>
          Subscribe for health tips, special offers, and the latest medical
          news.
        </p>
      </div>

      <section class="footer-bottom">
        <p>
          &copy; 2024 MedEase Pvt Ltd. All rights reserved. |
          <a href="#">Privacy Policy</a> | <a href="#">Terms & Conditions</a>
        </p>
      </section>
    </footer>
  </body>
</html>
