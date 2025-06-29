<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Admin</title>
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
            <li<%if(request.getRequestURI().endsWith("ProfileAdmin.jsp")){%> class="active-link"<%}%>>
                <a href="ProfileAdmin.jsp"> ADMIN DETAILS  </a>
            </li>
           
            <% if(session.getAttribute("userLoginName")!= null){%> 
                <li> <a href="logout"> LOGOUT </a> </li> 
            <%}%>
        </ul>
    </nav>
</header>
<div id="details">
    <h1>Update Admin Details</h1>
    <form action="adminUpdate" method="post">
        ID: <input type="text" name="aID" value="<%= request.getParameter("id") %>" readonly> <br><br>
        Name: <input type="text" name="aName" value="<%= request.getParameter("name") %>" required> <br><br>
        Role: <input type="text" name="aRole" value="<%= request.getParameter("role") %>" required> <br><br>
        Username: <input type="text" name="aUserName" value="<%= request.getParameter("username") %>" required> <br><br>
        Password: <input type="password" name="aPassword" value="<%= request.getParameter("password") %>" required> <br><br>
        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
