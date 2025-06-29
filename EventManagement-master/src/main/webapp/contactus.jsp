<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
      
      body {
    font-family: 'Poppins', sans-serif;
    background: url('images/stephen-phillips-hostreviews-co-uk-3Mhgvrk4tjM-unsplash.jpg') no-repeat center center fixed; 
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
        .con {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 28px;
        }

        .contact-info {
            margin: 30px 0;
            text-align: center;
        }

        .contact-info p {
            font-size: 18px;
            color: #555;
        }

        .contact-info p span {
            font-weight: 500;
            color: #f39c12;
        }

        .form-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .form-wrapper form {
            width: 100%;
            max-width: 600px;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 150px;
        }

        .form-group input[type="submit"] {
            background-color: #f39c12;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
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

<div class="con">
        <h1>Contact Us</h1>

        <div class="contact-info">
            <p><span>Address:</span> 123 Fifth Avenue, Colombo, Sri Lanka</p>
            <p><span>Email:</span> planit@gmail.com</p>
            <p><span>Phone:</span> +94 11 467 8863</p>
        </div>

        <div class="form-wrapper">
            <form action="contactus" method="post">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" required></textarea>
                </div>

                <div class="form-group">
                    <input type="submit" value="Send Message">
                </div>
            </form>
        </div>
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
