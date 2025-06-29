<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Profile</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="adminheader.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f7f9fc;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    header {
        background-color: black;
        color: white;
        padding: 15px;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }

    footer {
        background-color: black;
        color: white;
        text-align: center;
        padding: 15px 0;
        width: 100%;
        position: fixed;
        bottom: 0;
        left: 0;
        z-index: 1000;
    }

    /* Ensure content isn't overlapped by header and footer */
    #details {
        margin-top: 120px; /* Ensure it's below the header */
        margin-bottom: 50px; /* Ensure there's space above the footer */
        background-color: #f2f2f2;
        padding: 40px;
        border: 2px solid #4c88d0;
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
        text-align: center;
    }

    h1 {
        color: #07274d;
        font-weight: 600;
        margin-bottom: 30px;
        font-size: 24px;
    }

    input[type="text"], input[type="password"] {
        width: 90%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #cedbfd;
        border-radius: 5px;
        background-color: #ffffff;
        font-size: 16px;
    }

    button {
        background-color: #4c88d0;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        width: 90%;
        margin-bottom: 15px;
    }

    button:hover {
        background-color: #07274d;
    }

    #deleteButton {
        background-color: #d9534f;
    }

    #deleteButton:hover {
        background-color: #c9302c;
    }
</style>
</head>
<body>
<header>
    <div class="logo">
        <a href="adminHome.jsp">Plan It</a>
    </div>
    <nav>
        <ul class="nav__links">
            <li<%if(request.getRequestURI().endsWith("adminHome.jsp")){%> class="active-link"<%}%>>
                <a href="adminHome.jsp"> HOME </a>
            </li>
            <% if(session.getAttribute("userLoginName")!= null){%> 
                <li> <a href="logout"> LOGOUT </a> </li> 
            <%}%>
        </ul>
    </nav>
</header>

<div id="details">
    <h1>Admin Profile</h1>
    <c:forEach var="admin" items="${adminDetails}">
        ID: <input type="text" name="aID" value="${admin.adminID}" readonly> <br><br>
        Name: <input type="text" name="aName" value="${admin.adminName}" readonly> <br><br>
        Role: <input type="text" name="aRole" value="${admin.adminRole}" readonly> <br><br>
        Username: <input type="text" name="aUserName" value="${admin.userName}" readonly> <br><br>
        Password: <input type="password" name="aPassword" value="${admin.password}" readonly> <br><br>

        <a href="adminUpdate.jsp?id=${admin.adminID}&name=${admin.adminName}&role=${admin.adminRole}&username=${admin.userName}&password=${admin.password}">
            <button>Update Admin</button>
        </a>
        <a href="deleteAdmin.jsp?id=${admin.adminID}&name=${admin.adminName}&role=${admin.adminRole}&username=${admin.userName}&password=${admin.password}">
            <button id="deleteButton">Delete Admin</button>
        </a>
    </c:forEach>
</div>
</body>
</html>
