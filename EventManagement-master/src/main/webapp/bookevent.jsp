<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book your event</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="bookevent.js"></script>
<style>

        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-rdne-7580915.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
        }

       
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .main {
            background-color: rgba(249, 249, 249, 0.9);
            padding: 20px;
            border-radius: 10px;
            width: 60%;
            margin: 100px auto; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 28px;
            color: #f39c12;
            margin-bottom: 20px;
        }

        h1 a {
            text-decoration: none;
            color: #f39c12;
            transition: color 0.3s ease;
        }

        h1 a:hover {
            color: #e67e22;
        }

        .lable {
            
            display: block;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
            margin-right: 20px;
            color: #333;
        }

        .contain {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #fff;
            color: #333;
            transition: border-color 0.3s ease;
        }

        .contain:focus {
            border-color: #f39c12;
            outline: none;
        }

        #book {
            background-color: #f39c12;
            color: #fff;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        #book:hover {
            background-color: #e67e22;
        }

        form {
            padding-right:20px
            max-width: 600px;
            margin: 50px auto;
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
<form name="bookForm" action="MyServlet" method="post"  onsubmit="return validateForm()">
    <br> <br>
    <h1>KEEP CALM AND BOOK YOUR EVENT WITH US</h1>
    <h1>
      <a href="bookeventlist.jsp">List of Booked Events</a>
    </h1>
    <br><br>
    <div class="main">
      <label class="lable">Event Type(Wedding/Birthday Party/Musical Show/Magic Show)</label>
        <input type="text" name="ename" class="contain" required>
     <br><br>
       <label class="lable"> Date </label>
        <input type="date" name="edate" class="contain" required>
    <br><br>
        <label class="lable"> Venue(Shangri-la/Galadari/Cinnamon Grand/Kingsbury)</label>
        <input type="text" name="venue" class="contain" required>
     <br><br>
        <label class="lable"> No of Guests</label>
        <input type="text" name="guests" class="contain" required>
      <br><br>
        <label class="lable"> Food Type(Veg/Non-Veg)</label>
        <input type="text" name="efood" class="contain" required>
      <br><br>
        <label class="lable"> Meal Type(Breakfast,Lunch,Tea & Snacks,Dinner)</label>
        <input type="text" name="emeal"  class="contain" required>
      <br><br>
        <label class="lable"> Equipment(DJ/Stage/Mic & Speaker)</label>
        <input type="text" name="equp" class="contain" required>
      <br><br>
        <input type="submit" name="Action" value="Add Event" id="book">
      
 </div>
  </form>
  <br> <br>
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