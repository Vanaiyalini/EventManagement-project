<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Contact</title>
</head>
<body>
    <h1>Create New Contact</h1>
    <form action="createContact" method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        Message: <textarea name="message" required></textarea><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
