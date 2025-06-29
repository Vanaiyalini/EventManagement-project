<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="headerfoot.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
  <style>
      

        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-pixabay-48148.jpg') no-repeat center center fixed; 
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

        .loginTable {
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

        #loginSubmit {
            background-color: #f39c12; 
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
        }

        #loginSubmit:hover {
            background-color: #e67e22;
        }
    </style>

    </style>
<body>
<div id="details">
<!-- Page Header -->
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
<!-- Page Body -->
<table class="loginTable">
	<tr>
		<td> <img src="images/image12.png" height="450px" width="450px"> </td>
		<td> <h1 style="text-decoration:underline;"> USER LOGIN INTERFACE </h1> 
		<br> <br> 
		<!-- User Login Form -->
			<form action = "login" method = "post">	
				<div id="details">	
				
					<label for="Username">
					Username : <input type="text" name="uID" placeholder="Enter your Username">
					</label> <br><br>
					
					<label for="Password">
					Password : <input type="password" name="uPassword" placeholder="Enter your Password"> 
					</label> <br><br>
					
					<label for="Submit">
					<input id="loginSubmit" type="submit" name="submit" value="LOGIN" > 
					</label> <br> <br>
					
				</div>
			</form>
		</td>
	</tr>
</table>

<br> <br> <br>

<!-- Page Footer -->
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
            <!-- FontAwesome Icons for Social Media -->
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
    <p class="footer-copyright">&copy; 2024 PlanIt. All rights reserved.</p>
</footer>
</div>
</body>
</html>