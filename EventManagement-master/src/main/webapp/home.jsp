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
.hero {
    background-image: url('images/bg1.jpg');
    background-size: cover;
    background-position: center;
    height: 100vh;
    color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 0 20px;
}

.hero-content h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.hero-content p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
}

.hero .cta {
    background: #fc036b;
    padding: 0.7rem 2rem;
    border-radius: 30px;
    color: #fff;
    transition: background 0.3s;
}

.hero .cta:hover {
    background: #fff;
    color: #fc036b;
}


.event-showcase {
    padding: 5rem 0;
    background: #f9f9f9;
    text-align: center;
}

.events-grid {
    display: flex;
    justify-content: space-between;
    gap: 2rem;
}

.event-card {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
    padding: 1.5rem;
    text-align: left;
}

.event-card img {
    width: 100%;
    border-radius: 10px;
    margin-bottom: 1rem;
}

.event-card h3 {
    font-size: 1.8rem;
    margin-bottom: 1rem;
}

.event-card p {
    margin-bottom: 1.5rem;
}

.event-card .btn {
    background: #fc036b;
    padding: 0.5rem 1.5rem;
    border-radius: 20px;
    color: #fff;
    transition: background 0.3s;
}

.event-card .btn:hover {
    background: #fff;
    color: #fc036b;
}


.services {
    display: flex;
    align-items: center;
    padding: 5rem 0;
}

.service-content {
    flex: 1;
    padding-right: 2rem;
}

.service-content h2 {
    margin-bottom: 1rem;
}

.service-content p {
    margin-bottom: 2rem;
}

.service-image {
    flex: 1;
}

.service-image img {
    width: 100%;
    border-radius: 10px;
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
    <div class="hero">
        <div class="hero-content">
            <h1>Plan Your Dream Event with Us</h1>
            <p>Your one-stop solution for unforgettable events, from weddings to corporate gatherings.</p>
            <a href="demo.jsp" class="cta">Get Started</a>
        </div>
    </div>
    <section class="event-showcase">
        <div class="container">
            <h2>Explore Our Event Services</h2>
            <div class="events-grid">
                <div class="event-card">
                    <img src="images/img1.jpg" alt="Weddings">
                    <h3>Weddings</h3>
                    <p>Make your big day magical with our all-inclusive wedding planning services.</p>
                    <a href="AvailableEvent.jsp" class="btn">Learn More</a>
                </div>
                <div class="event-card">
                    <img src="images/img2.jpg" alt="Private Parties">
                    <h3>Private Parties</h3>
                    <p>Host an unforgettable party with personalized themes and top-notch vendors.</p>
                    <a href="AvailableEvent.jsp" class="btn">Learn More</a>
                </div>
                <div class="event-card">
                    <img src="images/img7.jpg" alt="Corporate Events">
                    <h3>Corporate Events</h3>
                    <p>Professional event planning for seminars, conferences, and office celebrations.</p>
                    <a href="AvailableEvent.jsp" class="btn">Learn More</a>
                </div>
            </div>
        </div>
    </section>    
    <section class="services">
        <div class="container">
            <div class="service-content">
                <h2>Why Choose PlanIt?</h2>
                <p>From venue selection to event execution, we offer end-to-end planning services that are tailored to your vision and budget.</p>
                <a href="gallery.jsp" class="cta">Discover Our Services</a>
            </div>
            <div class="service-image">
                <img src="images/bg2.jpg" alt="Services">
            </div>
        </div>
    </section>
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