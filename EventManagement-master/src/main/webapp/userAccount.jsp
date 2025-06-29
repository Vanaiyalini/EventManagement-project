<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-rdne-7648020.jpg') no-repeat center center fixed; 
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

        .showTable {
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
            margin: 0;
        }

        label {
            font-weight: bold; 
            display: block; 
            margin-bottom: 5px; 
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: calc(100% - 10px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px; 
        }

        input[type="button1"],
        input[type="button2"] {
            background-color: #f39c12; 
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
            margin-top: 10px; 
        }

        input[type="button1"]:hover,
        input[type="button2"]:hover {
            background-color: #e67e22; 
        }
    </style>
</head>
<body>
<%

	if(session.getAttribute("userLoginName")== null){
		response.sendRedirect("demo.jsp");
	}
%>
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
<table class="showTable">
<tr>
	<td> <img src="images/rez.png"> </td>
	
	<td>
		<div id ="details">

	<h1 style="text-decoration:underline;"> 
	<%
	String userLoginName = (String) session.getAttribute("userLoginName");
	out.println("WELCOME : " + userLoginName);
	%>	
	</h1>  
	
	<br> <br>
	
	
	<c:forEach var = "user" items="${userDetails}">
	
	<%--System internally calls the getID methods here--%> 
	<%--Assigning values into variables--%>

	<c:set var="id" value="${user.userID}"/>
	<c:set var="name" value="${user.userName}"/>
	<c:set var="email" value="${user.userEmail}"/>
	<c:set var="phone" value="${user.userPhone}"/>
	<c:set var="username" value="${user.userLoginName}"/>
	<c:set var="password" value="${user.userLoginPassword}"/>


	<label for="Id">
		UserID &nbsp;&nbsp;: <input type="text" name="rId" value="${user.userID}" readonly> 
	</label> <br><br>

	<label for="Name">
		Name &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="rName" value="${user.userName}" readonly> 
	</label> <br><br>
	
	<label for="Email">
		Email  &nbsp;&nbsp;&nbsp;: <input type="text" name="rEmail" value="${user.userEmail}" readonly> 
	</label> <br><br>
	
	<label for="Phone">
		Phone  &nbsp;&nbsp;&nbsp;: <input type="text" name="rPhone" value="${user.userPhone}" readonly> 
	</label> <br><br>
	
	<label for="Username">
		Username : <input type="text" name="rUserName" value="${user.userLoginName}" readonly> 
	</label> <br><br>
	
	<label for="Password">
		Password : <input type="text" name="rPassword" value="${user.userLoginPassword}" readonly> 
	</label> <br><br>

	</c:forEach>
	
	<%--To which page it should Go--%>
	<c:url value="userUpdate.jsp" var="userUpdate">
	
		<%--What values should be taken to the Directed Page--%>
		<c:param name="id" value="${id}"></c:param>
		<c:param name="name" value="${name}"></c:param>
		<c:param name="email" value="${email}"></c:param>
		<c:param name="phone" value="${phone}"></c:param>
		<c:param name="username" value="${username}"></c:param>
		<c:param name="password" value="${password}"></c:param>
		
	</c:url>
	
	<a href="${userUpdate}">
	<input type="button1" name="update" value="UPDATE PROFILE">
	</a> <br> <br>
	
	
	<c:url value="userDelete.jsp" var="userDelete">
		<c:param name="id" value="${id}"></c:param>
		<c:param name="name" value="${name}"></c:param>
		<c:param name="email" value="${email}"></c:param>
		<c:param name="phone" value="${phone}"></c:param>
		<c:param name="username" value="${username}"></c:param>
		<c:param name="password" value="${password}"></c:param>
	</c:url>
	
	<a href="${userDelete}">
	<input type="button2" name="delete" value="DELETE PROFILE">
	</a>
	</div>
	</td>
	

	
</tr>


</table>
<!-- Page Body -->

	
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