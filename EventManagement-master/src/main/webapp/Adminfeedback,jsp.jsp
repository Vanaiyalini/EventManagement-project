<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="feedback.FeedbackDBConnect" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Feedback Management</title> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #4c88d0;
            text-align: center;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 8px 12px;
            color: white;
            background-color: #4c88d0;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 15px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #07274d;
        }

        .btn-warning {
            background-color: #f0ad4e;
        }

        .btn-warning:hover {
            background-color: #ec971f;
        }

        .btn-danger {
            background-color: #d9534f;
        }

        .btn-danger:hover {
            background-color: #c9302c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        .thead-light th {
            background-color: #e9ecef;
        }

    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Feedback Management</h2>
    
    <div class="text-right mb-3">
        <a href="feedback.jsp" class="btn">Create Feedback</a>
    </div>
    
    <table class="table table-bordered table-striped">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Review</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        conn = FeedbackDBConnect.getConnection();
        String query = "SELECT * FROM feedback";
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            int id = rs.getInt("ID");
            String name = rs.getString("Name");
            String email = rs.getString("Email");
            String review = rs.getString("Review");
%>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= review %></td>
                <td>
                    <a href="editFeedback.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="deleteFeedback.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this feedback?')">Delete</a>
                </td>
            </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
        </tbody>
    </table>
</div>

</body>
</html>
