<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="adminheader.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding-top: 100px; 
            padding-bottom: 100px; 
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            flex-grow: 1;
        }

        .content {
            width: 100%;
            text-align: center;
        }

        .content h1 {
            font-size: 36px;
            margin-bottom: 40px;
            color: #07274d;
        }

        .admin-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            justify-items: center;
            width: 100%;
            max-width: 1100px;
        }

        .admin-card {
            background-color: #333;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 250px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .admin-card:hover {
            transform: scale(1.05);
        }

        .admin-card h3 {
            color: #4c88d0;
            margin-bottom: 20px;
        }

        .admin-card a {
            text-decoration: none;
        }

        .admin-card button {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4c88d0;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .admin-card button:hover {
            background-color: #07274d;
        }

        /* Footer fixed at the bottom */
        footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 15px 0;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
        }

        /* Ensure header stays fixed */
        header {
            background-color: black;
            color: white;
            padding: 15px 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .logo a {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: flex-end;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 30px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            padding: 8px 12px;
        }

        nav ul li a:hover,
        .active-link a {
            background-color: #4c88d0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
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

<div class="container">
    <div class="content">
        <h1>ADMIN PAGE</h1>
        <div class="admin-section">
            <div class="admin-card">
                <h3>ADD EVENTS</h3>
                <a href="listEvents.jsp"><button>CLICK TO ADD</button></a>
            </div>
            <div class="admin-card">
                <h3>ADD ADMIN</h3>
                <a href="listAdmin.jsp"><button>CLICK TO ADD</button></a>
            </div>
            <div class="admin-card">
                <h3>USER MANAGEMENT</h3>
                <a href="listUser.jsp"><button>MANAGE USERS</button></a>
            </div>
            <div class="admin-card">
                <h3>PAYMENT MANAGEMENT</h3>
                <a href="listPayment.jsp"><button>VIEW PAYMENTS</button></a>
            </div>
            <div class="admin-card">
                <h3>CONTACT US</h3>
                <a href="listContactus.jsp"><button>VIEW DETAILS</button></a>
            </div>
            <div class="admin-card">
                <h3>REVIEW MANAGEMENT</h3>
                <a href="Adminfeedback,jsp.jsp"><button>VIEW REVIEWS</button></a>
            </div>
            <div class="admin-card">
                <h3>BOOKING DETAILS</h3>
                <a href="listBooking.jsp"><button>VIEW BOOKINGS</button></a>
            </div>
        </div>
    </div>
</div> 
</body>
</html>
