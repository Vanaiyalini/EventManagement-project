<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="AdminUserPage.DBConnection" %>
<html>
<head>
    <title>Update User</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        /* Form container */
        form {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            width: 50%;
            margin: 0 auto;
            border-radius: 8px;
        }

        /* Heading styling */
        h2 {
            text-align: center;
            color: #07274d;
        }

        /* Style for input fields */
        input[type="text"], input[type="email"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Style for the submit button */
        input[type="submit"] {
            background-color: #07274d;
            color: white;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            width: 100%;
        }

        /* Hover effect for the submit button */
        input[type="submit"]:hover {
            background-color: #4c88d0;
        }

        /* Style for labels */
        label {
            display: block;
            margin-top: 10px;
            color: #333;
        }
    </style>
</head>
<body>
    <%
        int userID = Integer.parseInt(request.getParameter("userID"));
        try (Connection conn = DBConnection.getConn()) {
            String query = "SELECT * FROM user WHERE userID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
    %>
                <h2>Update User</h2>
                <form action="UpdateUserServlet" method="post">
                    <input type="hidden" name="userID" value="<%= userID %>" />
                    <label for="userName">Name:</label>
                    <input type="text" name="userName" value="<%= rs.getString("userName") %>" required/>

                    <label for="userEmail">Email:</label>
                    <input type="email" name="userEmail" value="<%= rs.getString("userEmail") %>" required/>

                    <label for="userPhone">Phone:</label>
                    <input type="text" name="userPhone" value="<%= rs.getString("userPhone") %>" required/>

                    <label for="userLoginName">Login Name:</label>
                    <input type="text" name="userLoginName" value="<%= rs.getString("userLoginName") %>" required/>

                    <label for="userLoginPassword">Password:</label>
                    <input type="password" name="userLoginPassword" value="<%= rs.getString("userLoginPassword") %>" required/>

                    <input type="submit" value="Update User" />
                </form>
    <%
            } else {
                out.println("User not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
