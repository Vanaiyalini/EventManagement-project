<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="Adminbooking.DBConnection" %>
<html>
<head>
    <title>Event Booking List</title>
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
    </style>
</head>
<body>
    <h1>Event Booking List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Event Name</th>
            <th>Date</th>
            <th>Venue</th>
            <th>Guests</th>
            <th>Food Type</th>
            <th>Meal</th>
            <th>Equipment</th>
            <th>Actions</th>
        </tr>
        <%
            Connection con = DBConnection.getConn();
            String query = "SELECT * FROM eventbooking";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("ename") %></td>
            <td><%= rs.getString("edate") %></td>
            <td><%= rs.getString("venue") %></td>
            <td><%= rs.getInt("guests") %></td>
            <td><%= rs.getString("efood") %></td>
            <td><%= rs.getString("emeal") %></td>
            <td><%= rs.getString("equp") %></td>
            <td>
                <a href="deleteBooking?id=<%= rs.getInt("id") %>">Delete</a> |
                <a href="editBooking.jsp?id=<%= rs.getInt("id") %>">Edit</a>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
    <a href="createBooking.jsp">Create New Event</a>
</body>
</html>
    