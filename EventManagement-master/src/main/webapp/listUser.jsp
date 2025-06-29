<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="AdminUserPage.DBConnection" %>
<html>
<head>
    <title>User List</title>
    <style>
        /* Style for the body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        /* Style for the table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }

        /* Style for the table headers */
        th {
            background-color: #4c88d0;
            color: white;
            padding: 10px;
        }

        /* Style for table data cells */
        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        /* Alternate row colors */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Style for action buttons */
        input[type="submit"] {
            background-color: #07274d;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        /* Hover effect for action buttons */
        input[type="submit"]:hover {
            background-color: #4c88d0;
        }

        /* Create new user button */
        .create-btn {
            display: inline-block;
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Hover effect for create button */
        .create-btn:hover {
            background-color: #45a049;
        }

        /* Header style */
        h2 {
            color: #07274d;
        }
    </style>
</head>
<body>
    <h2>User List</h2>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Login Name</th>
            <th>Actions</th>
        </tr>
        <%
            try (Connection conn = DBConnection.getConn()) {
                String query = "SELECT * FROM user";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("userID") %></td>
                        <td><%= rs.getString("userName") %></td>
                        <td><%= rs.getString("userEmail") %></td>
                        <td><%= rs.getString("userPhone") %></td>
                        <td><%= rs.getString("userLoginName") %></td>
                        <td>
                            <form action="updateUser.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="userID" value="<%= rs.getInt("userID") %>" />
                                <input type="submit" value="Edit" />
                            </form>
                            <form action="DeleteUserServlet" method="post" style="display:inline;">
                                <input type="hidden" name="userID" value="<%= rs.getInt("userID") %>" />
                                <input type="submit" value="Delete" />
                            </form>
                        </td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
    <br>
    <form action="createUser.jsp" method="get">
        <input type="submit" value="Create New User" class="create-btn" />
    </form>
</body>
</html>
