<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="AdmiAdd.DatabaseConnect" %>
<html>
<head>
    <title>Admin List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4c88d0;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #4c88d0;
        }

        .btn-create {
            display: block;
            width: 200px;
            text-align: center;
            margin: 20px auto;
            padding: 10px;
            background-color: #4c88d0;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .btn-create:hover {
            background-color: #07274d;
        }
    </style>
</head>
<body>
    <h1>Admin List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Username</th>
            <th>Actions</th>
        </tr>
        <%
            Connection con = DatabaseConnect.getConnection();
            String query = "SELECT * FROM admin";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("adminID") %></td>
            <td><%= rs.getString("adminName") %></td>
            <td><%= rs.getString("adminRole") %></td>
            <td><%= rs.getString("userName") %></td>
            <td>
                <a href="deleteAdmin?adminID=<%= rs.getInt("adminID") %>">Delete</a> |
                <a href="editAdmin.jsp?adminID=<%= rs.getInt("adminID") %>">Edit</a>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
    <a href="addAdmin.jsp" class="btn-create">Create New Admin</a>
</body>
</html>
    