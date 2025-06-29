<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="AdminPayment.DatabaseConnection" %>
<html>
<head>
    <title>Edit Contact</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4c88d0;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4c88d0;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #07274d;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <h1>Edit Contact</h1>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Connection con = DatabaseConnection.initializeDatabase();
        String query = "SELECT * FROM contactus WHERE id=?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
    %>
    <form action="updateContact" method="post">
        <div class="form-group">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required>
        </div>

        <div class="form-group">
            <label for="message">Message:</label>
            <textarea id="message" name="message" required><%= rs.getString("message") %></textarea>
        </div>

        <input type="submit" value="Update">
    </form>
    <%
        }
        rs.close();
        stmt.close();
        con.close();
    %>
</body>
</html>
