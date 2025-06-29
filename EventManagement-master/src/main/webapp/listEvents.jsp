<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="addEventPackage.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }

        h2 {
            color: #4c88d0;
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #07274d;
            font-weight: bold;
            margin-bottom: 15px;
            display: inline-block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4c88d0;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #007bff;
            padding: 6px 12px;
            background-color: #f4f4f9;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
        }

        td a:hover {
            background-color: #007bff;
            color: white;
        }

        td a:active {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>Event List</h2>
<a href="createEvent.jsp">Create New Event</a>
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Event Type</th>
        <th>Venue</th>
        <th>Hall Capacity</th>
        <th>Catering Type</th>
        <th>Meal Type</th>
        <th>Facilities</th>
        <th>Actions</th>
    </tr>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DBConnection.getConn();
        String query = "SELECT * FROM eventform";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        if (!rs.isBeforeFirst()) {  
            out.println("<tr><td colspan='8'>No events found</td></tr>");
        } else {
            while (rs.next()) {
                int id = rs.getInt("id");
                String eventType = rs.getString("eventType");
                String venue = rs.getString("venue");
                String hallCapacity = rs.getString("hallCapacity");
                String cateringType = rs.getString("cateringType");
                String mealType = rs.getString("mealType");
                String eventFacilities = rs.getString("eventFacilities");
%>
    <tr>
        <td><%= id %></td>
        <td><%= eventType %></td>
        <td><%= venue %></td>
        <td><%= hallCapacity %></td>
        <td><%= cateringType %></td>
        <td><%= mealType %></td>
        <td><%= eventFacilities %></td>
        <td>
            <a href="editEvent.jsp?id=<%= id %>">Edit</a> |
            <a href="deleteEvent.jsp?id=<%= id %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
<%
            }
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
</table>
</body>
</html>
