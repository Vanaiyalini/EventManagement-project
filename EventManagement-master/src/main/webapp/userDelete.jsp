<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="headerfoot.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
      body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-mikhail-nilov-8284731.jpg') no-repeat center center fixed; 
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
        #details {
            max-width: 600px;
            margin: auto; 
            background-color: #ffffff;
            border-radius: 10px; 
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px; 
        }

        h1 {
            text-align: center; 
            color: #2c3e50; 
            margin-bottom: 20px; 
            text-decoration: underline; 
        }

        label {
            font-weight: bold;
            color: #34495e;
            display: block;
            margin-top: 10px;
        }

        input[type="text"] {
            width: calc(100% - 20px); 
            padding: 10px; 
            border: 1px solid #bdc3c7; 
            border-radius: 5px;
            background-color: #f9f9f9; 
            margin-top: 5px; 
            font-size: 16px; 
            cursor: not-allowed; 
        }

        input[type="checkbox"] {
            margin-top: 15px;
        }

        input[type="submit"] {
            background-color: #e74c3c;
            color: white;
            border: none; 
            padding: 12px 20px; 
            font-size: 16px;
            cursor: pointer; 
            border-radius: 5px; 
            transition: background-color 0.3s ease; 
            display: block; 
            margin: 20px auto; 
        }

        input[type="submit"]:hover {
            background-color: #c0392b; 
        }

      
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
	<div id="details">
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
	%>
	
<h1 style="text-decoration:underline;"> DELETE USER PROFILE DETAILS </h1> <br> <br>

<form action = "delete" method="post">
	
	<label for="ID">													<!-- For add Java to code to JSP -->
		UserID &nbsp;&nbsp;: <input type="text" name="uid" value = "<%= id %>" readonly> 
	</label> <br><br>
	
	<label for="Name">													
		Name &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="uname" value = "<%= name %>" readonly> 
	</label> <br><br>
	
	<label for="Email">
		Email  &nbsp;&nbsp;&nbsp;: <input type="text" name="uEmail" value = "<%= email %>" readonly> 
	</label> <br><br>
	
	<label for="Phone">
		Phone  &nbsp;&nbsp;&nbsp;: <input type="text" name="uPhone" value = "<%= phone %>" readonly> 
	</label> <br><br>
	
	<label for="Username">
		Username : <input type="text" name="uName" value = "<%= username %>" readonly> 
	</label> <br><br>

	<input type="checkbox" required> Do You Need to Delete Your Account	<br> <br> 

	<label for="Submit">
		<input type="submit" name="submit" value="CONFIRM DELETE">
	</label> <br> <br> <br> <br> <br> <br> 

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