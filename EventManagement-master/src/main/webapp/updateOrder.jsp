<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="AdminPayment.DatabaseConnection" %>
<html>
<head>
    <title>Edit Payment</title>
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
            margin-top: 10px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], input[type="datetime-local"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
    <h1>Edit Payment</h1>
    <%
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Connection con = DatabaseConnection.initializeDatabase();
        String query = "SELECT * FROM orders WHERE orderId=?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, orderId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
    %>
    <form action="updateOrder" method="post">
        <input type="hidden" name="orderId" value="<%= rs.getInt("orderId") %>">

        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= rs.getString("fullName") %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required>
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= rs.getString("address") %>" required>
        </div>

        <div class="form-group">
            <label for="cardName">Card Name:</label>
            <input type="text" id="cardName" name="cardName" value="<%= rs.getString("cardName") %>" required>
        </div>

        <div class="form-group">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" value="<%= rs.getString("cardNumber") %>" required>
        </div>

        <div class="form-group">
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" value="<%= rs.getString("cvv") %>" required>
        </div>

        <div class="form-group">
            <label for="orderDate">Order Date:</label>
            <input type="datetime-local" id="orderDate" name="orderDate" value="<%= rs.getString("orderDate") %>" required>
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
