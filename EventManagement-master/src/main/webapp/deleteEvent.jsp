<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="addEventPackage.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f9;
            text-align: center;
        }

        h2 {
            color: #d9534f;
        }

        p {
            font-size: 18px;
            color: #5a5a5a;
        }

        a {
            text-decoration: none;
            color: white;
            background-color: #4c88d0;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
            margin-top: 20px;
        }

        a:hover {
            background-color: #07274d;
        }

        .message {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="message">
<%
    int eventID = Integer.parseInt(request.getParameter("id"));
    
    try {
        Connection conn = DBConnection.getConn();
        String query = "DELETE FROM eventform WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, eventID);
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            out.println("<h2>Event Deleted</h2>");
            out.println("<p>The event has been successfully deleted.</p>");
        } else {
            out.println("<h2>Error</h2>");
            out.println("<p>No event found with the provided ID.</p>");
        }

        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error</h2>");
        out.println("<p>An error occurred while trying to delete the event.</p>");
    }
%>

<a href="listEvents.jsp">Back to Events List</a>
</div>

</body>
</html>
