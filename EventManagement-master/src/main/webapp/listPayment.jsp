<%@ page import="java.sql.*" %>
<%@page import="AdminPayment.DatabaseConnection" %>
<html>
<head>
    <title>List of Payment</title>
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

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4c88d0;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: #07274d;
        }

        a:hover {
            color: #4c88d0;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 10px;
            background-color: #4c88d0;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #07274d;
        }
    </style>
</head>
<body>
    <h1>Payment Details List</h1>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Card Name</th>
            <th>Card Number</th>
            <th>CVV</th>
            <th>Order Date</th>
            <th>Actions</th>
        </tr>
        <%
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "SELECT * FROM orders";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("orderId") %></td>
            <td><%= rs.getString("fullName") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("cardName") %></td>
            <td><%= rs.getString("cardNumber") %></td>
            <td><%= rs.getString("cvv") %></td>
            <td><%= rs.getString("orderDate") %></td>
            <td>
                <a href="deleteOrder?orderId=<%= rs.getInt("orderId") %>">Delete</a>
                <a href="updateOrder.jsp?orderId=<%= rs.getInt("orderId") %>">Edit</a>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
    <br>
    <div style="text-align: center;">
        <a href="createOrder.jsp" class="btn">Create New Payment</a>
    </div>
</body>
</html>
