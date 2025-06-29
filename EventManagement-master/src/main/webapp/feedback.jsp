<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="header.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('images/pexels-introspectivedsgn-4249027.jpg') no-repeat center center fixed;
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

        .review-container {
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #f39c12;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px; 
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease; 
        }

        .form-control:focus {
            border-color: #f39c12; 
            outline: none;
        }

        .invalid-feedback {
            display: none;
            color: red;
            font-size: 12px;
        }

        .form-control:invalid + .invalid-feedback {
            display: block;
        }

        .char-counter {
            font-size: 12px;
            color: #6c757d; 
            margin-top: 5px;
        }

        
        .btn {
            background-color: #f39c12;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; 
            width: 48%; 
        }

        .btn:hover {
            background-color: #e67e22; 

        .d-flex {
            display: flex;
            justify-content: space-between;
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
    <div class="review-container">
        <h2>Write a Review</h2>
        <form id="reviewForm" method="post" action="feedback" novalidate>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                <div class="invalid-feedback">Please enter your name.</div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>
            <div class="form-group">
                <label for="Comments">Review</label>
                <textarea class="form-control" id="Comments" name="Comments" rows="4" placeholder="Write your review" maxlength="300" required></textarea>
                <div class="char-counter"><span id="charCount">0</span>/300 characters</div>
                <div class="invalid-feedback">Please write a review (max 300 characters).</div>
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn" onclick="validateForm()">Submit Review</button>
                <button type="button" class="btn" onclick="clearForm()">Clear Form</button>
            </div>
        </form>
    </div>
    <script>
        function validateForm() {
            var form = document.getElementById('reviewForm');
            var name = document.getElementById('name');
            var email = document.getElementById('email');
            var comments = document.getElementById('Comments');
            
            if (!name.value) {
                name.classList.add('is-invalid');
            } else {
                name.classList.remove('is-invalid');
            }

            if (!email.value || !validateEmail(email.value)) {
                email.classList.add('is-invalid');
            } else {
                email.classList.remove('is-invalid');
            }

            if (!comments.value) {
                comments.classList.add('is-invalid');
            } else {
                comments.classList.remove('is-invalid');
            }

            if (!form.checkValidity()) {
                event.preventDefault();
            }
        }

        function clearForm() {
            document.getElementById('reviewForm').reset();
            document.getElementById('charCount').textContent = "0";
        }

        function validateEmail(email) {
            var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(String(email).toLowerCase());
        }

        var commentBox = document.getElementById('Comments');
        commentBox.addEventListener('input', function() {
            document.getElementById('charCount').textContent = commentBox.value.length;
        });
    </script>
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
