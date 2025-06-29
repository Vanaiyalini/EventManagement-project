<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Event</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
       body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background: url('images/pexels-wendywei-1190297.jpg') no-repeat center center fixed; /* Path to your background image */
            background-size: cover;
            background-attachment: fixed;
        }

       
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); 
            z-index: -1; 
        }

        h1 {
            text-align: center;
            margin: 40px 0;
            font-size: 36px;
            color: white;
            z-index: 1; 
        }

        .seperator {
            width: 60px;
            height: 4px;
            background-color: #00BF63;
            margin: 0 auto 40px;
        }

        .Event {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin: 20px auto;
            max-width: 1000px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
        }

        .Etitle {
            flex: 1 1 100%;
            margin-bottom: 10px;
        }

        .Etitle h2 {
            font-size: 28px;
            color: #00BF63;
        }

        .Etitle p {
            font-size: 16px;
            color: #6c757d;
        }

        .Econtent {
            flex: 1 1 60%;
            margin-right: 20px;
            padding-right: 10px;
        }

        .Econtent h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #343a40;
        }

        .Econtent p {
            font-size: 16px;
            line-height: 1.6;
            color: #6c757d;
        }

        .Epics {
            flex: 1 1 200px;
            max-width: 200px;
        }

        .Epics img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .button {
            margin-left: 20px;
            margin-top: 20px;
            text-align: left;
        }

        .button a button {
            background-color: #00BF63;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button a button:hover {
            background-color: #009652;
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
            class="active-link"<%}%>><a href="payment.jsp">  PAYMENT PORTAL </a> </li>

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
    <br>
<h1>Find Some of Our Available Events</h1>
<div class="seperator"></div>     
            <div class="Event">
                <div class="Etitle">
                    <h2>1.Wedding</h2>
                    <p>Venue: Cinnamon Grand</p>
                </div>

                <div class="Econtent">
                    <br><br>
                    <h3>Oak Room</h3>
                    <p>This elegant space has brought a diverse array of events to life. A separate entrance and the flexibility to be partitioned into four sections makes the Oak Room even more special.
                    Capacity - 500. You can book your catering and stage arrangements</p><br>
                </div>
                <div class="Epics">
                	<br>
                    <img src="images/wedcin.jpg" alt="cinnamon-wed">
                </div>

                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
                </div>
            </div>
            
             <div class="Event">
                <div class="Etitle">
                    <h2>2.Birthday Party</h2>
                    <p>Venue: Galadari </p>
                </div>
                <div class="Econtent">
                    <br><br>
                    <h3>Anthurium</h3>
                    <p>As people today are opting for more private and smaller Birthday Parties, this will be the ideal venue.
                    The spacious ballroom offers a seating capacity of 150. you can also book your catering, stage arrangements and needed Equipments with us. </p>
                </div>
                <div class="Epics">
                    <img src="images/bdaygal.jpg" alt="bday-Gal">
                </div>
                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
                </div>
            </div>
            
            <div class="Event">
                <div class="Etitle">
                    <h2>3.Magic Show</h2>
                    <p>Venue: Shangri-la</p>
                </div>
                <div class="Econtent">
                    <br><br>
                    <h3>Lotus</h3>
                    <p>This is a very popular Show venue. It has the capacity of 500 seats. 
                    You can book more required equipments with us. We have the parking facilities as well.</p>
                </div>
                <div class="Epics">
                    <img src="images/magic.jpeg" alt="magic">
                </div>
                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
                </div>
            </div>
            
            <div class="Event">
                <div class="Etitle">
                    <h2>4.Musical Show</h2>
                    <p>Venue: Kingsbury</p>
                </div>
                <div class="Econtent">
                    <br><br>
                    <h3>Cedar</h3>
                    <p>
                    The cedar hall's easily customisable space allows it to host a variety of events with up to 750 attendees.
                    Elegantly finished, ideal venue for events with elegance.
                    You can book more required equipments with us. We have the parking facilities as well.</p>
                </div>
                <div class="Epics">
                    <img src="images/musical.jpg" alt="musical">
                </div>
                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
                </div>
            </div>
            
            <div class="Event">
                <div class="Etitle">
                    <h2>5.Wedding</h2>
                    <p>Venue: Galadari</p>
                </div>
                <div class="Econtent">
                    <br><br>
                    <h3>Bougainvillea</h3>
                    <p>Another very popular wedding venue is the Bougainvillea Ballroom.
                    The spacious ballroom offers a seating capacity of 300 and is ideal for those who wish to celebrate a private wedding reception.</p>
                </div>
                <div class="Epics">
                    <img src="images/galwed.jpeg" alt="wedgal">
                </div>
                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
                </div>
            </div>
            
            <div class="Event">
                <div class="Etitle">
                    <h2>6.Birthday Party</h2>
                    <p>Venue: Cinnamon Grand</p>
                </div>
                <div class="Econtent">
                    <br><br>
                    <h3>Ivy</h3>
                    <p>The Ivy is a subtle, elegant space that is ideally suited for Wedding and Birthday Party. 
                    Capacity - 100. This wonderful venue offers the added delight of a private garden that adds charm to every event hosted here.</p>
                </div>
                <div class="Epics">
                    <img src="images/bdaycin.jpeg" alt="cinnamon-bday">
                </div>
                <div class="button">
                    <a href="bookevent.jsp"><button id="btn1">Book</button></a>
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
</html>