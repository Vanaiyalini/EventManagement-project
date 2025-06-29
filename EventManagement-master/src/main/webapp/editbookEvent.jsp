<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%> 
 <%@page import="bookevent.DBconnection"%>
<%Class.forName("com.mysql.jdbc.Driver");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit your booked event</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
   body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-designecologist-2526105.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
    h1 {
        color: #333;
        font-size: 28px;
        text-align: center;
        margin-top: 20px;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-size: 18px;
        color: #3498db;
        text-decoration: none;
    }

    .main {
        width: 60%;
        margin: 20px auto;
        background-color: #fff;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .lable {
        font-size: 18px;
        color: #555;
        margin-bottom: 10px;
        display: block;
    }

    .contain {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    #book {
        background-color: #f39c12;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 18px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        width: 100%;
        text-align: center;
    }

    #book:hover {
        background-color: #e67e22;
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

<form action="MyServlet" method="post">
<%  
        String eid = request.getParameter("id");
        int id = Integer.parseInt(eid);
		Connection con = DBconnection.getConn();
		Statement statement = con.createStatement();
		String sql = "Select * from eventbooking where id='"+id+"'"; 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
	%>
    <h1 align="center">Edit Event</h1>
    <h1>
      <a href="bookeventlist.jsp">List of Booked Events</a>
    </h1>
     <div class="main">
    <br>
    <label class="lable">Booked Event ID</label>
        <input type="hidden" name="id" class="contain" value="<%= id %>" >
        <br><br>
      <label class="lable">Event Type(Wedding/Birthday Party/Musical Show/Magic Show)</label>
        <input type="text" name="ename" class="contain" value="<%= rs.getString(2)%>" required>
     <br><br>
       <label class="lable"> Date </label>
        <input type="date" name="edate" class="contain"  value="<%= rs.getString(3)%>" required>
    <br><br>
        <label class="lable"> Venue(Shangri-la/Galadari/Cinnamon Grand/Kingsbury)</label>
        <input type="text" name="venue" class="contain"  value="<%= rs.getString(4)%>" required>
     <br><br>
        <label class="lable"> No of Guests</label>
        <input type="text" name="guests" class="contain"  value="<%= rs.getString(5)%>" required>
      <br><br>
        <label class="lable"> Food Type(Veg/Non-Veg)</label>
        <input type="text" name="efood" class="contain"  value="<%= rs.getString(6)%>" required>
      <br><br>
        <label class="lable"> Meal Type(Breakfast,Lunch,Tea & Snacks,Dinner)</label>
        <input type="text" name="emeal"  class="contain"  value="<%= rs.getString(7)%>" required>
      <br><br>
        <label class="lable"> Equipment(DJ/Stage/Mike & Speaker)</label>
        <input type="text" name="equp" class="contain"  value="<%= rs.getString(8)%>" required>
      <br><br>
        
        <input type="submit" name="Action" value="Edit" id="book">
  </form>
   </div>
   <%}
	%>
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