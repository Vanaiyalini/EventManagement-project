<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="feedback.FeedbackDBConnect" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 30px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4c88d0;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: inline-block;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }

        button:hover {
            background-color: #218838;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Edit Feedback</h2>

<%
    String feedbackId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String name = "", email = "", review = "";

    try {
        conn = FeedbackDBConnect.getConnection();
        
        String query = "SELECT * FROM feedback WHERE ID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, feedbackId);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("Name");
            email = rs.getString("Email");
            review = rs.getString("Review");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

    <form action="EditFeedback" method="post">
        <input type="hidden" name="id" value="<%= feedbackId %>">

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
        </div>

        <div class="form-group">
            <label for="review">Review</label>
            <textarea class="form-control" id="review" name="review" rows="4" required><%= review %></textarea>
        </div>

        <button type="submit" class="btn btn-success">Update Feedback</button>
        <a href="Adminfeedback.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
