<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unsuccess Page</title>
<link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
<link rel="stylesheet" href="indexStyle.css">

<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8d7da; /* Light red background */
        margin: 0;
        padding: 20px;
        text-align: center;
    }

    h1 {
        color: #721c24; /* Dark red text */
        font-size: 24px;
        margin-bottom: 20px;
    }

    /* Button Styles */
    #btn2 {
        background-color: #dc3545; /* Red background */
        color: white; /* White text */
        border: none; /* No border */
        padding: 12px 20px; /* Padding */
        font-size: 18px; /* Font size */
        cursor: pointer; /* Pointer cursor */
        border-radius: 5px; /* Rounded corners */
        transition: background-color 0.3s ease; /* Transition effect */
    }

    #btn2:hover {
        background-color: #c82333; /* Darker red on hover */
    }

</style>

</head>
<body>

	<h1> 
	Your Account Creation Unsuccessfull <br> Please Enter Your Details and Register Again </h1>
	
	<a href="userRegister.jsp">
		<input type="button" name="btn" id="btn2" value="REGISTER AGAIN">
	</a>

</body>
</html>