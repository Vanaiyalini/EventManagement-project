<%@ page import="java.sql.*" %>
<%@ page import="feedback.FeedbackDBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Delete Feedback Confirmation</title>
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
            color: #d9534f;
            text-align: center;
            margin-bottom: 30px;
        }

        .alert {
            padding: 15px;
            background-color: #f8d7da;
            color: #721c24;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .alert strong {
            font-weight: bold;
        }

        button {
            background-color: #d9534f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }

        button:hover {
            background-color: #c9302c;
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
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Are you sure you want to delete this feedback?</h2>

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

    <div class="alert alert-danger" role="alert">
        <strong>Feedback ID:</strong> <%= feedbackId %><br>
        <strong>Name:</strong> <%= name %><br>
        <strong>Email:</strong> <%= email %><br>
        <strong>Review:</strong> <%= review %>
    </div>

    <form action="DeleteFeedback" method="post">
        <input type="hidden" name="id" value="<%= feedbackId %>">
        <button type="submit" class="btn btn-danger">Yes, Delete Feedback</button>
        <a href="Adminfeedback,jsp.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
