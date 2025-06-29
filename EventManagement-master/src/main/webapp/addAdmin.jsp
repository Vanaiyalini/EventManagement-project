<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Admin</title>
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
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    #details {
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

    input[type="submit"] {
        background-color: #4c88d0;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        width: 90%;
    }

    input[type="submit"]:hover {
        background-color: #07274d;
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
    <h1>Add Admin</h1>
    <form action="addAdmin" method="post">
    <label>Name:</label>
    <input type="text" name="aName" required><br>

    <label>Role:</label>
    <input type="text" name="aRole" required><br>

    <label>Username:</label>
    <input type="text" name="aUserName" required><br>

    <label>Password:</label>
    <input type="password" name="aPassword" required><br>

    <input type="submit" value="Submit">
</form>
    
</div> 
</body>
</html>
