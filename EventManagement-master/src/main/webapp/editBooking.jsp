<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Adminbooking.DBConnection" %>
<html>
<head>
    <title>Edit Event</title>
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

        input[type="text"], input[type="date"], input[type="number"] {
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
        <h1>Edit Event</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Connection con = DBConnection.getConn();
            String query = "SELECT * FROM eventbooking WHERE id=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
        %>
        <form action="updateBooking" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

            <div class="form-group">
                <label for="ename">Event Name:</label>
                <input type="text" id="ename" name="ename" value="<%= rs.getString("ename") %>" required>
            </div>

            <div class="form-group">
                <label for="edate">Event Date:</label>
                <input type="date" id="edate" name="edate" value="<%= rs.getString("edate") %>" required>
            </div>

            <div class="form-group">
                <label for="venue">Venue:</label>
                <input type="text" id="venue" name="venue" value="<%= rs.getString("venue") %>" required>
            </div>

            <div class="form-group">
                <label for="guests">Number of Guests:</label>
                <input type="number" id="guests" name="guests" value="<%= rs.getInt("guests") %>" required>
            </div>

            <div class="form-group">
                <label for="efood">Food Type:</label>
                <input type="text" id="efood" name="efood" value="<%= rs.getString("efood") %>" required>
            </div>

            <div class="form-group">
                <label for="emeal">Meal Type:</label>
                <input type="text" id="emeal" name="emeal" value="<%= rs.getString("emeal") %>" required>
            </div>

            <div class="form-group">
                <label for="equip">Equipment:</label>
                <input type="text" id="equp" name="equp" value="<%= rs.getString("equp") %>" required>
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
