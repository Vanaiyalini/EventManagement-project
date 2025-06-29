<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="AdmiAdd.DatabaseConnect" %>
<html>
<head>
    <title>Edit Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 50%;
            margin: 30px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4c88d0;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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
    <div class="container">
        <h1>Edit Admin</h1>
        <%
            int adminID = Integer.parseInt(request.getParameter("adminID"));
            Connection con = DatabaseConnect.getConnection();
            String query = "SELECT * FROM admin WHERE adminID=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, adminID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
        %>
        <form action="updateAdmin" method="post">
            <input type="hidden" name="adminID" value="<%= rs.getInt("adminID") %>">

            <div class="form-group">
                <label for="adminName">Admin Name:</label>
                <input type="text" id="adminName" name="adminName" value="<%= rs.getString("adminName") %>" required>
            </div>

            <div class="form-group">
                <label for="adminRole">Admin Role:</label>
                <input type="text" id="adminRole" name="adminRole" value="<%= rs.getString("adminRole") %>" required>
            </div>

            <div class="form-group">
                <label for="userName">Username:</label>
                <input type="text" id="userName" name="userName" value="<%= rs.getString("userName") %>" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= rs.getString("password") %>" required>
            </div>

            <input type="submit" value="Update">
        </form>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </div>
</body>
</html>
