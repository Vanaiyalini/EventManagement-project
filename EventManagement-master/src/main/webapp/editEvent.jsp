<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="addEventPackage.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f9;
        }

        h2 {
            text-align: center;
            color: #4c88d0;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4c88d0;
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #07274d;
        }

        .form-container {
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>
<%
    int id = 0;
    String eventType = "", venue = "", hallCapacity = "", cateringType = "", mealType = "", eventFacilities = "";

    try {
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        if (id > 0) {
            Connection conn = DBConnection.getConn();
            String query = "SELECT * FROM eventform WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                eventType = rs.getString("eventType");
                venue = rs.getString("venue");
                hallCapacity = rs.getString("hallCapacity");
                cateringType = rs.getString("cateringType");
                mealType = rs.getString("mealType");
                eventFacilities = rs.getString("eventFacilities");
            }

            rs.close();
            ps.close();
            conn.close();
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }
%>

<h2>Edit Event</h2>
<div class="form-container">
    <form action="EditEventServlet" method="post">
        <input type="hidden" name="eventID" value="<%= id %>">
        
        <label>Event Type:</label>
        <input type="text" name="eventType" value="<%= eventType %>" required>
        
        <label>Venue:</label>
        <input type="text" name="venue" value="<%= venue %>" required>
        
        <label>Hall Capacity:</label>
        <input type="text" name="hallCapacity" value="<%= hallCapacity %>" required>
        
        <label>Catering Type:</label>
        <input type="text" name="cateringType" value="<%= cateringType %>" required>
        
        <label>Meal Type:</label>
        <input type="text" name="mealType" value="<%= mealType %>" required>
        
        <label>Event Facilities:</label>
        <input type="text" name="eventFacilities" value="<%= eventFacilities %>" required>

        <input type="submit" value="Update Event">
    </form>
</div>

</body>
</html>
