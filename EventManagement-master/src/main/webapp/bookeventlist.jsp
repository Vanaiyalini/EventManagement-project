<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="bookevent.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-rdne-8581014.jpg') no-repeat center center fixed;
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

   

    h1 {
        text-align: center;
        color: #333;
        font-size: 26px;
        margin-bottom: 20px;
    }

    h1 a {
        text-decoration: none;
        font-size: 18px;
        color: #f39c12;
        transition: color 0.3s ease;
    }

    h1 a:hover {
        color: #e67e22;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f39c12;
        color: white;
        font-size: 18px;
    }

    td {
        font-size: 16px;
        color: #333;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td a {
        color: #f39c12;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    td a:hover {
        color: #e67e22;
    }

    td form {
        display: inline-block;
    }

    td a, td input[type="submit"] {
        margin-right: 15px;
    }

    input[type="submit"], a.button {
        background-color: #f39c12;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover, a.button:hover {
        background-color: #e67e22;
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
<form action="">
    <h1>Booked Event Management</h1>
    <h1>
      <a href="bookevent.jsp">Book new Event</a><br>
    </h1>
    <!--  All DOctor shows-->
    <h1 align="center">List of Booked Events</h1>
    <table id="event">
      <tr>
        <th>ID</th>
        <th>Event Type</th>
        <th>Date</th>
        <th>Venue</th>
        <th>No of guests</th>
        <th>Food Type</th>
        <th>Meal Plan</th>
        <th>Equipments</th>
      </tr>
      <%
        Connection con = DBconnection.getConn();
        Statement statement = con.createStatement();
        ResultSet resultSet = statement.executeQuery("Select * from eventbooking");
        while (resultSet.next()) {
      %>
      <tr>
        <td>
          <%
            out.print(resultSet.getInt(1));
          %>
        </td>
        <td>
          <%
            out.print(resultSet.getString(2));
          %>
        </td>
        <td>
          <%
            out.print(resultSet.getString(3));
          %>
        </td>
        <td>
          <%
            out.print(resultSet.getString(4));
          %>
        </td>
        <td>
          <%
            out.print(resultSet.getString(5));
          %>
        </td>
        <td>
          <%
            out.print(resultSet.getString(6));
          %>
        </td>
         <td>
          <%
            out.print(resultSet.getString(7));
          %>
        </td>
         <td>
          <%
            out.print(resultSet.getString(8));
          %>
        </td>
        <form action="MyServlet" method="post">
          <td><a value="Edit" name="Action"
            href="editbookEvent.jsp?id=<%=resultSet.getInt(1)%> ">Edit</a> <input
            type="hidden" name="j" value="<%= resultSet.getInt(1) %>">&nbsp;&nbsp;&nbsp;
            <a href="deletebookevent.jsp">Delete</a>&nbsp;&nbsp;&nbsp;</td>
      </tr>
      </form>
      <%
}
%>
    </table>
  </form>
  <br> <br> <br> 
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
                <li><a href="faq.jsp">FAQ</a></li>
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