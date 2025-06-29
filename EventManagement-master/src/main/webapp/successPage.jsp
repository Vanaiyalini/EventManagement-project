<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="indexStyle.css">

<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 20px;
        text-align: center;
    }

    h1 {
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    /* Button Styles */
    #btn2 {
        background-color: #e67e22; /* Green background */
        color: white; /* White text */
        border: none; /* No border */
        padding: 12px 20px; /* Padding */
        font-size: 18px; /* Font size */
        cursor: pointer; /* Pointer cursor */
        border-radius: 5px; /* Rounded corners */
        transition: background-color 0.3s ease; /* Transition effect */
    }

    #btn2:hover {
        background-color: #e67e22; /* Darker green on hover */
    }

   
    }
</style>

</head>
<body>

	<h1> 
	You have Created Your Account Successfully <br> Please Login with Your Login Credentials </h1>
	
	<a href="userLogin.jsp">
		<input type="button" name="btn" id="btn2" value="LOGIN TO YOUR ACCOUNT">
	</a>

</body>
</html>