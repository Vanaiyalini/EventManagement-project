<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-nicola-barts-7927011.jpg') no-repeat center center fixed;
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
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

        h3.title {
            margin-bottom: 20px;
            color: white;
            font-size: 22px;
        }

        .row {
            display: flex;
            justify-content: space-between;
        }

        .col {
            width: 48%;
        }

        .inputBox {
            margin-bottom: 15px;
        }

        .inputBox label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: white;
        }

        .inputBox input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .submit-btn {
            display: block;
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #333;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }

        .submit-btn:hover {
            background-color: #555;
        }
    </style>

    <script src="payment.js"></script>

</head>
<body>

   <header>
    <a class="logo" href="home.jsp">Plan It</a>
    <nav>
        <ul class="nav__links">
            <li<%if(request.getRequestURI().endsWith("home.jsp")){%> 
            class="active-link"<%}%>><a href="home.jsp"> HOME </a> </li>

            <li<%if(request.getRequestURI().endsWith("events.jsp")){%> 
            class="active-link"<%}%>><a href="AvailableEvent.jsp"> EVENTS </a> </li>

            <li<%if(request.getRequestURI().endsWith("gallery.jsp")){%> 
            class="active-link"<%}%>><a href="#"> GALLERY </a> </li>

            <li<%if(request.getRequestURI().endsWith("payment.jsp")){%> 
            class="active-link"<%}%>><a href="payment.jsp"> PAYMENT PROTAL </a> </li>

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

    <div class="container">

        <form action="OrderServlet" method="POST">

            <div class="row">
                <div class="col">
                    <h3 class="title">DELIVERY ADDRESS</h3>

                    <div class="inputBox">
                        <label for="full_name">Full Name:</label>
                        <input type="text" id="full_name" placeholder="Enter the name" name="full_name" required>
                    </div>
                    <div class="inputBox">
                        <label for="email">Email:</label>
                        <input type="email" id="email" placeholder="example@example.com" name="email" required>
                    </div>
                    <div class="inputBox">
                        <label for="address">Address:</label>
                        <input type="text" id="address" placeholder="Room - Street - Locality" name="address" required>
                    </div>
                </div>

                <div class="col">
                    <h3 class="title">PAYMENT METHOD</h3>

                    <div class="inputBox">
                        <label for="card_name">Name on Card:</label>
                        <input type="text" id="card_name" placeholder="Full name" name="card_name" required>
                    </div>
                    <div class="inputBox">
                        <label for="card_number">Credit Card Number:</label>
                        <input type="text" id="card_number" placeholder="1111-2222-3333-4444" name="card_number" maxlength="16" required>
                    </div>
                    <div class="inputBox">
                        <label for="cvv">CVV:</label>
                        <input type="number" id="cvv" placeholder="CVV number" name="cvv" max="999" required>
                    </div>

                    <input type="submit" id="submit-btn" value="Proceed to Checkout" class="submit-btn">
                </div>
            </div>
        </form>

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
