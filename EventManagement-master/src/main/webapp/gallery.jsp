<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.gallery-section {
    padding: 40px 20px;
    background-color: #f4f4f4;
}

.gallery-header {
    text-align: center;
    margin-bottom: 40px;
}

.gallery-banner {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.gallery-title {
    font-size: 36px;
    margin-top: 20px;
    color: #343a40;
}

.gallery-grid {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
}

.gallery-item {
    flex: 1;
    margin: 0 10px;
    position: relative;
    overflow: hidden;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.gallery-item img {
    width: 100%;
    height: auto;
    display: block;
    transition: transform 0.3s ease;
}

.gallery-item:hover img {
    transform: scale(1.05);
}
</style>
</head>
<body>
<header>
    <a class="logo" href="home.jsp">Plan It</a>
    <nav>
        <ul class="nav__links">
            <li<%if(request.getRequestURI().endsWith("home.jsp")){%> 
            class="active-link"<%}%>><a href="home.jsp"> HOME </a> </li>

            <li<%if(request.getRequestURI().endsWith("AvailableEvent.jsp")){%> 
            class="active-link"<%}%>><a href="AvailableEvent.jsp"> EVENTS </a> </li>

            <li<%if(request.getRequestURI().endsWith("gallery.jsp")){%> 
            class="active-link"<%}%>><a href="gallery.jsp"> GALLERY </a> </li>

            <li<%if(request.getRequestURI().endsWith("payment.jsp")){%> 
            class="active-link"<%}%>><a href="payment.jsp"> PAYMENT PORTAL </a> </li>

            <%
                if(session.getAttribute("userLoginName") != null){ %>
                    <li> 
                        <a href="logout"> LOG OUT </a> 
                    </li>
                <% } else { %>
                    <li<%if(request.getRequestURI().endsWith("demo.jsp")){%> 
                    class="active-link"<%}%>><a href="demo.jsp"> SIGN IN </a> </li>
                <% }
            %>
        </ul>
    </nav>
</header> 
      <div class="gallery-section">
            <div class="gallery-header">
                <img src="./images/wed2.jpg" alt="Wedding Ceremony" class="gallery-banner">
                <h1 class="gallery-title">gallery</h1>
            </div>
    
            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="images/wedding1.jpg" alt="Wedding 1">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding2.jpg" alt="Wedding 2">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding6.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding10.jpg" alt="Wedding 3">
                </div>
            </div>

            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="images/wedding4.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding5.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding3.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding11.jpg" alt="Wedding 3">
                </div>
            </div>

            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="images/wedding7.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding8.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding9.jpg" alt="Wedding 3">
                </div>
                <div class="gallery-item">
                    <img src="images/wedding12.jpg" alt="Wedding 3">
                </div>
            </div>
        </div>
<footer>
    <div class="container footer-content">
        <div class="footer-info">
            <h3>Contact Us</h3>
            <p>123 Fifth Avenue, Colombo, Sri Lanka</p>
            <p>Email: planit@gmail.com | Phone: +94 11 467 8863</p>
        </div>
        <div class="footer-links">
            <ul>
                <li><a href="contactus.jsp">Contact Us</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="feedback.jsp">FAQ</a></li>
            </ul>
        </div>
        <div class="footer-social">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
    <p class="footer-copyright">&copy; 2024 PlanIt. All rights reserved.</p>
</footer>
</body>
</body>
</html>