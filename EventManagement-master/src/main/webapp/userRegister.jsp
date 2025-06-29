<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="text/javascript" src="script.js"></script>
 <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-cottonbro-8382609.jpg') no-repeat center center fixed; 
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

        .registerTable {
            width: 80%;
            margin: 100px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.9); 
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 20px; 
            text-align: left; 
        }

        h1 {
            font-size: 28px;
            color: #f39c12; 
            text-align: center; 
            margin: 0;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 10px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px; 
        }

        input[type="submit"] {
            background-color: #f39c12; 
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
        }

        input[type="submit"]:hover {
            background-color: #e67e22; 
        }

        input[type="checkbox"] {
            margin-top: 15px; 
        }
    </style>

</head>

<body>

<%
	if(session.getAttribute("userLoginName")!= null){
		response.sendRedirect("userAccount.jsp");
	}
%>
<header>
    <a class="logo" href="home.jsp">Plan It</a>
    <nav>
        <ul class="nav__links">
            <li<%if(request.getRequestURI().endsWith("home.jsp")){%> 
            class="active-link"<%}%>><a href="home.jsp"> HOME </a> </li>

            <li<%if(request.getRequestURI().endsWith("events.jsp")){%> 
            class="active-link"<%}%>><a href="AvailableEvent.jsp"> EVENTS </a> </li>

            <li<%if(request.getRequestURI().endsWith("gallery.jsp")){%> 
            class="active-link"<%}%>><a href="gallery.jsp"> GALLERY </a> </li>

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
<!-- Validating Using Javascript -->
<form name="myForm" action = "register" method="post" onsubmit="return validateForm()">
<!-- User Register Form -->
<div id="details">
<table class="registerTable">
<tr>
	<td>
		<h1 style="text-decoration:underline;">USER REGISTRATION</h1> <br> <br>
	
	<label for="Name">
		Name &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="rName" required> 
	</label> <br><br>
	
	<label for="Email">
		Email  &nbsp;&nbsp;&nbsp;: <input type="text" name="rEmail"required> 
	</label> <br><br>

	<label for="Phone">
		Phone  &nbsp;&nbsp;&nbsp;: <input type="text" name="rPhone"required> 
	</label> <br><br>
	
	<label for="Username">
		Username : <input type="text" name="rUserName"required> 
	</label> <br><br>
	
	<label for="Password">
		Password : <input type="password" name="rPassword"required> 
	</label> <br><br>
	
	<input type="checkbox" required> Agree for Terms and Conditons <br> <br>
	
	<label for="Submit">
		<input type="submit" name="submit" value="SUBMIT">
	</label> <br>
	
	</td>
	
	<td> <img src="images/register.png"> </td>

</tr>
	
</table>
</div>
</form>	
<br><br>
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