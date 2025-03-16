<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medicare - Footer</title>
	<style type="text/css">
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
		  .footer-ph-email {
		  		display: inline-block;
		  		align-content: flex-start;
		  }
		  #newsletter-para {
		  	text-align: left;
		  }
		
	</style>
</head>
<body>
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
        <p class="footer-ph-email"><i class="fa-solid fa-phone"></i> 080-45678765</p>
        <p class="footer-ph-email">
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
        <p id="newsletter-para">
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