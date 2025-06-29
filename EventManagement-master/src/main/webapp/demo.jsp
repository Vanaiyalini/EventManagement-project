<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<style>
     body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-timmossholder-3643925.jpg') no-repeat center center fixed; 
            background-size: cover; 
            color: #333;
            margin: 0;
            padding: 0;
        }
    h1, h2 {
        color: blue;
    }

    table {
        width: 100%;
        margin: 30px 0;
        border-collapse: collapse;
        text-align: left;
    }

    td {
        padding: 20px;
        vertical-align: middle;
    }

    h1 {
        font-size: 36px;
        font-weight: bold;
    }
    h2.secondrow {
        font-size: 24px;
        color: #white;
    }

    button {
        background-color: #f39c12;
        color: white;
        border: none;
        padding: 15px 25px;
        font-size: 18px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #e67e22;
    }

    button h3 {
        margin: 0;
        font-size: 18px;
        color: white;
    }

    #imgMain {
        width: 100%;
        max-width: 300px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    a.eBook {
        text-decoration: none;
    }
    }
</style>
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
    <table>
    	<tr>
    		<td > <h1 style="colour:black;"> ARE YOU LOOKING <br>FOR A EVENT MANAGER </h1> <br> 
    		
    			  <h2 class="secondrow"> THEN YOU ARE IN THE RIGHT PLACE <br> BOOK YOUR EVENT NOW </h2>
				  <br> <br>
				  
			<%
				if(session.getAttribute("userLoginName")== null){%> 
					<a href="userLogin.jsp" class="eBook"> <button id="btn1"><h3> LOGIN/SIGN-IN </h3> </button> </a>
					<br> <br>
					<a href="loginAdmin.jsp" class="eBook"> <button id="btn5"><h3> ADMIN LOGIN/SIGN-IN </h3> </button> </a>
    			  	<br> <br>
    			  	<a href="userRegister.jsp" class="eBook"> <button id="btn2"><h3> CREATE ACCOUNT </h3></button></a>
    			  
    			  	
    		 	<%}
			%>
			
			<%
				if(session.getAttribute("userLoginName")!= null){%> 
					<a href="AvailableEvent.jsp" class="eBook"> <button id="btn2"><h3> BOOK AN EVENT OF YOUR CHOICE </h3> </button> </a>
    			  <br> <br>
    		</td> <%}
			%>
				  
				  
    		
			<td>
      			<!-- <img alt="#" src="#" id="#">  -->
			</td>
			
    	</tr>
    </table>    
	    <table> </table>
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
</body>
</html>