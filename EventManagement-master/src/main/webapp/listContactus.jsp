<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="AdminPayment.DatabaseConnection" %>
<html>
<head>
    <title>List of Contacts</title>
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
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            background-color: #e0e0e0;
        }

        a {
            text-decoration: none;
            color: #4c88d0;
            font-weight: bold;
        }

        a:hover {
            color: #07274d;
        }

        .btn-create {
            display: block;
            width: 200px;
            text-align: center;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #4c88d0;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }

        .btn-create:hover {
            background-color: #07274d;
        }
    </style>
</head>
<body>
    <h1>Contact Us List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
            <th>Created At</th>
            <th>Actions</th>
        </tr>
        <%
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "SELECT * FROM contactus";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("message") %></td>
            <td><%= rs.getString("created_at") %></td>
            <td>
                <a href="deleteContact?id=<%= rs.getInt("id") %>">Delete</a> |
                <a href="editContact.jsp?id=<%= rs.getInt("id") %>">Edit</a>
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
    <a href="createContact.jsp" class="btn-create">Create New Contact</a>
</body>
</html>
