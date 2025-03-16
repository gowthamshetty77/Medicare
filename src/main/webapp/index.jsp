<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Medicare</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Oswald:wght@200..700&family=Poppins:wght@300&display=swap"
    rel="stylesheet" />
</head>

<body>
  <!-- ********************** Medicare -> Logins ************************ -->
  <div id="loginModal" class="modal">
    <div class="modal-content">
      <span class="close-button">&times;</span>
      <h1 id="logins-title">Medicare - Logins</h1>
      <p id="role">Please select your role to log in:</p>
      <div class="login-card-container">
        <!------------------- Patient Login -------------------------->
        <div class="login-card">
          <h2>Patient Login</h2>
          <form action="patient" method="post" id="loginForm">
            <div class="input-group">
              <label for="d_id">Patient Email:</label>
              <input type="email" id="d_id" name="patEmail" placeholder="Enter Patient Email" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Patient Password:</label>
              <input type="password" id="d_pin" name="patPassword" placeholder="Enter Patient Password" required />
              <a href="patientForgotPassword.jsp" class="forgot-password">Forgot Password?</a>
            </div>
            <button type="submit" name="patientLogin" class="login-button">Login</button>
          </form>
          <!-- <div class="options">
            <p>
              Don't have an account?
              <a href="#signupModal" class="signup">Sign Up</a>
            </p>
          </div> -->
        </div>
	
        <!------------------------------- Receptionist Login -------------------->
        <div class="login-card">
          <h2>Receptionist Login</h2>
          <form action="receptionistRegister" method="post" id="loginForm">
            <div class="input-group">
              <label for="d_id">Receptionist Email:</label>
              <input type="email" id="d_id" name="recepEmail" placeholder="Enter Receptionist Email" required />
            </div>

            <div class="input-group">
              <label for="d_pin">Receptionist Password:</label>
              <input type="password" id="d_pin" name="recepPassword" placeholder="Enter Receptionist Password" required />
              <a href="receptionistForgotPassword.jsp" class="forgot-password">Forgot Password?</a>
            </div>
            <button type="submit" name="receptionistLogin" class="login-button">Login</button>
          </form>
          <!-- <div class="options">
            <p>
              Don't have an account?
              <a href="DoctorSignUp.jsp" class="signup">Sign Up</a>
            </p>
          </div> -->
        </div>

        <!--------------------- Doctor Login ---------------------------->
        <div class="login-card">
          <h2>Doctor Login</h2>
          <form action="doctor" method="post" id="loginForm">
            <div class="input-group">
              <label for="d_id">Doctor Email:</label>
              <input type="email" id="d_id" name="docEmail" placeholder="Enter Doctor Email" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Doctor Password:</label>
              <input type="password" id="d_pin" name="docPassword" placeholder="Enter Doctor Password" required />
              <a href="doctorForgotPassword.jsp" class="forgot-password">Forgot Password?</a>
            </div>
            <button type="submit" name="doctorLogin" class="login-button">Login</button>
          </form>
          <!-- <div class="options">
            <p>
              Don't have an account?
              <a href="DoctorSignUp.jsp" class="signup">Sign Up</a>
            </p>
          </div> -->
        </div>

        <!-- card end -->
      </div>
    </div>
  </div>
  <!-- ********************************************************************************************************************** -->

  <!-- ********************* Medicare -> SignUps ***************************** -->

  <!--------- Modal for SignUp -------->
  <div id="signupModal" class="modal">
    <div class="modal-content">
      <span class="close-button" id="signUp-close-button">&times;</span>
      <h1 id="logins-title">Medicare - SignUps</h1>
      <p id="role">Please select your role to SignUp:</p>
      <div class="login-card-container">
        <!------------------- Patient SignUp -------------------------->
        <div class="login-card" id="patientRegister">
          <h2>Patient SignUp</h2>
          <form action="patient" method="post" id="loginForm">
            <div class="input-group">
              <label for="d_id">Patient Name:</label>
              <input type="text" id="d_id" name="patName" placeholder="Enter Patient Name" required />
            </div>
            <div class="input-group">
              <label for="d_id">Patient Age:</label>
              <input type="text" id="d_id" name="patAge" placeholder="Enter Patient Age" required />
            </div>

            <div class="input-group">
              <label for="d_id">Patient Gender:</label>
              <input type="text" id="d_id" name="patGender" placeholder="Enter Patient Gender" required />
            </div>

            <div class="input-group">
              <label for="d_id">Patient Phone:</label>
              <input type="tel" id="d_id" minlength="10" maxlength="10" name="patPhone" placeholder="Enter Patient Phone" required />
            </div>

            <div class="input-group">
              <label for="d_id">Patient Email:</label>
              <input type="email" id="d_id" name="patEmail" placeholder="Enter Patient Email" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Patient Password:</label>
              <input type="password" id="d_pin" name="patPassword" placeholder="Enter Patient Password" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Confirm Patient Password:</label>
              <input type="password" id="d_pin" name="patConfirmPass" placeholder="Confirm Patient Password" required />
            </div>
            <button type="submit" name="patientRegister" class="login-button">SignUp</button>
          </form>
          <!-- <div class="options">
            <p>
              Already have an account?
              <a href="DoctorSignUp.jsp" class="signup">Login</a>
            </p>
          </div> -->
        </div>

        <!------------------------------- Receptionist SignUp -------------------->
        <div class="login-card">
          <h2>Receptionist SignUp</h2>
          <form action="receptionist" method="post" id="loginForm">
            <div class="input-group">
              <label for="d_id">Receptionist Name:</label>
              <input type="text" id="d_id" name="recepName" placeholder="Enter Receptionist Name" required />
            </div>
            <div class="input-group">
              <label for="d_id">Receptionist Age:</label>
              <input type="text" id="d_id" name="recepAge" placeholder="Enter Receptionist Age" required />
            </div>

            <div class="input-group">
              <label for="d_id">Receptionist Gender:</label>
              <input type="text" id="d_id" name="recepGender" placeholder="Enter Receptionist Gender" required />
            </div>

            <div class="input-group">
              <label for="d_id">Receptionist Phone:</label>
              <input type="tel" id="d_id" minlength="10" maxlength="10" name="recepPhone" placeholder="Enter Receptionist Phone" required />
            </div>

            <div class="input-group">
              <label for="d_id">Receptionist Email:</label>
              <input type="email" id="d_id" name="recepEmail" placeholder="Enter Receptionist Email" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Receptionist Password:</label>
              <input type="password" id="d_pin" name="recepPassword" placeholder="Enter Receptionist Password" required />
            </div>
            <div class="input-group">
              <label for="d_pin">Confirm Receptionist Password:</label>
              <input type="password" id="d_pin" name="recepConfirmPass" placeholder="Confirm Receptionist Password" required />
            </div>
            <button type="submit" name="receptionistRegister" class="login-button">SignUp</button>
          </form>
          <!-- <div class="options">
            <p>
              Already have an account?
              <a href="DoctorSignUp.jsp" class="signup">Login</a>
            </p>
          </div> -->
        </div>

        <!-- card end -->
      </div>
    </div>
  </div>

  <!-- ###################################################################################################### -->

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
  <!-- <nav class="navbar">
      <ul class="nav-list">
        <li class="nav-item"><a href="#home">Home</a></li>
        <li class="nav-item"><a href="#medicare-section">About</a></li>
        <li class="nav-item"><a href="#department">Department</a></li>
        <li class="nav-item"><a href="#blog">Blog</a></li>
        <li class="nav-item"><a href="#footer-contact">Contact</a></li>
      </ul>
      <div class="auth-buttons">
        <a href="#signup" id="signUpBtn" class="btn">Signup</a>
        <a href="#login" id="loginBtn" class="btn">Login</a>
      </div>
    </nav> -->

  <!---------------------------- NavaBar --------------------->
  <nav class="navbar">
    <input type="checkbox" id="menu-toggle" class="menu-toggle" />
    <label for="menu-toggle" class="hamburger">
      <span class="bar"></span>
      <span class="bar"></span>
      <span class="bar"></span>
    </label>
    <ul class="nav-list">
      <li class="nav-item"><a href="#home">Home</a></li>
      <li class="nav-item"><a href="#medicare-section">About</a></li>
      <li class="nav-item"><a href="#department">Department</a></li>
      <li class="nav-item"><a href="#blog">Blog</a></li>
      <li class="nav-item"><a href="#footer-contact">Contact</a></li>
    </ul>
    <div class="auth-buttons">
      <a href="#signup" id="signUpBtn" class="btn">Signup</a>
      <a href="#login" id="loginBtn" class="btn">Login</a>
    </div>
  </nav>

  <!-- ____________________________________________________________________________________________ -->

  <!-- Hero banner -->
  <section class="hero-banner">
    <div class="hero-content">
      <h1>Your<br />Health is<br />Our Focus</h1>
      <p>Your health is our priority. Schedule an appointment today!</p>
      <div class="button-group">
        <a href="#medicare-section" class="btn appointment">Appointment</a>
        <a href="#learn-more" class="btn learn-more">Learn More</a>
      </div>
    </div>
  </section>

  <!------------------- Medicare section  -------------------------->
  <section class="medicare-section" id="medicare-section">
    <div class="column appointment-form">
      <h2>Schedule an Appointment</h2>
      <form>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your Name" required />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required />

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="2025-01-21" required />

        <label for="time">Time:</label>
        <input type="time" id="time" name="time" value="16:00" required />

        <button type="submit">Book Appointment</button>
      </form>
    </div>

    <div class="column hospital-info">
      <h1>Welcome to <span>Medicare</span></h1>
      <h4>Trusted Hospital since 1992</h4>
      <p>
        At Our Medicare Hospital, we prioritize your health and well-being.
        Our dedicated team of healthcare professionals is here to provide you
        with the best medical care possible. We offer a wide range of services
        to meet your healthcare needs.
      </p>
    </div>

    <div class="column doctor-image">
      <!-- The image will be set as a background in CSS -->
    </div>
  </section>

  <!-- ----------------- DEPARTMENTS --------------------- -->

  <section id="department" class="department-section">
    <h2>Our Departments</h2>
    <p id="deptPara">
      At Our Medicare Hospital, we offer specialized care across various
      departments to ensure comprehensive health services for our patients.
      Explore our departments below:
    </p>
    <div class="department-list">
      <div class="department-card">
        <img src="imgs/heart.jpg" alt="Heart Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Cardiology</h3>
        <p>
          Providing comprehensive care and treatment for heart conditions.
        </p>
      </div>

      <div class="department-card">
        <img src="imgs/lungs.jpg" alt="Lungs Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Pulmonology</h3>
        <p>Expert care for respiratory issues and lung diseases.</p>
      </div>
      <div class="department-card">
        <img src="imgs/kidney.jpg" alt="Teeth Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Nephrology</h3>
        <p>Expert care for kidney diseases, dialysis and transplantation</p>
      </div>

      <div class="department-card">
        <img src="imgs/teeth.jpg" alt="Teeth Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Dental Medicine</h3>
        <p>Offering dental care and oral health services.</p>
      </div>

      <div class="department-card">
        <img src="imgs/pregnancy.jpg" alt="Skin Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Gynecology</h3>
        <p>Personalized prenatal care for a healthy pregnancy journey</p>
      </div>

      <div class="department-card">
        <img src="imgs/bones.jpg" alt="Teeth Department" class="department-image" />
        <!-- Replace with your image URL -->
        <h3>Orthopedics</h3>
        <p>
          Comprehensive treatment for fractures and musculoskeletal injuries
        </p>
      </div>
    </div>
  </section>

  <!--------- Ambulance Section ---------- -->

  <section class="ambulance-section">
    <div class="ambulance-content">
      <h2>Need Immediate Help?</h2>
      <p class="phone-number">Call Us: <span>+1 234 567 890</span></p>
      <p class="description">
        Our ambulance service is available 24/7 to ensure you receive prompt
        medical assistance whenever you need it.
      </p>
    </div>
  </section>

  <!--  ------------- STATISTICS SECTION --------- -->

  <section class="statistics-section" id="learn-more">
    <h1 id="#achievements">Our Achievements</h1>
    <p>
      We take pride in our accomplishments and the quality of care we provide.
      Here are some key statistics:
    </p>
    <div class="statistics">
      <div class="statistic-item">
        <h1 class="number">21</h1>
        <h3>Years of Experience</h3>
      </div>
      <div class="statistic-item">
        <h1 class="number">810</h1>
        <h3>Health Centre Visits</h3>
      </div>
      <div class="statistic-item">
        <h1 class="number">539</h1>
        <h3>Doctors and Staff</h3>
      </div>
      <div class="statistic-item">
        <h1 class="number">250</h1>
        <h3>Academic Papers</h3>
      </div>
    </div>
  </section>

  <!-- ------------------ News Section ----------------------------- -->

  <section class="news-section" id="blog">
    <h2>Recent Stories</h2>
    <p>
      Stay updated with the latest happenings at our hospital. Here’s what’s
      new:
    </p>
    <div class="news-card-container">
      <div class="news-card">
        <img src="imgs/heart-surgery.jpg" alt="News Image 1" class="news-image" />
        <h3>New Heart Surgery Technique Introduced</h3>
        <p>
          We are excited to announce the introduction of a new minimally
          invasive heart surgery technique that promises faster recovery times
          and less discomfort for patients.
        </p>
      </div>
      <div class="news-card">
        <img src="imgs/community-health.jpg" alt="News Image 2" class="news-image" />
        <h3>Community Health Fair Scheduled</h3>
        <p>
          Join us for our annual Community Health Fair, offering free
          screenings and health education resources for all attendees.
        </p>
      </div>
      <div class="news-card">
        <img src="imgs/pediatric.jpg" alt="News Image 3" class="news-image" />
        <h3>New Pediatric Wing Opened</h3>
        <p>
          We are proud to announce the opening of our new pediatric wing,
          designed to provide specialized care for our youngest patients.
        </p>
      </div>
    </div>
  </section>

  <!-- -------------- Footer ------------------- -->

  <%@ include file="footer.jsp" %>

  <!-- ================================================================================================= -->

  <script>
    // ---------------- Medicare Logins ----------------
    const loginModal = document.getElementById("loginModal");
    const loginBtn = document.getElementById("loginBtn");

    //  ---------------- Medicare SignUps ---------------
    const signupModal = document.getElementById("signupModal");
    const signupBtn = document.getElementById("signUpBtn");

    const loginCloseButton = document.querySelector(".close-button");
    const signUpCloseButton = document.querySelector("#signUp-close-button");

    loginBtn.addEventListener("click", openLoginModal);
    loginCloseButton.addEventListener("click", closeLoginModal);
    window.addEventListener("click", outsideClick);

    signupBtn.addEventListener("click", openSignupModal);
    signUpCloseButton.addEventListener("click", closeSignUpModal);
    window.addEventListener("click", outsideClick);
    function openLoginModal() {
      loginModal.style.display = "block";
    }
    function openSignupModal() {
      signupModal.style.display = "block";
    }
    function closeLoginModal() {
      loginModal.style.display = "none";
    }
    function closeSignUpModal() {
      signupModal.style.display = "none";
    }
    function outsideClick(e) {
      if (e.target == loginModal) {
        loginModal.style.display = "none";
      }
      if (e.target == signupModal) {
        signupModal.style.display = "none";
      }
    }
  </script>
</body>

</html>