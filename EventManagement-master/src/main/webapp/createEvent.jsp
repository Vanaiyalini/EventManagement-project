<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 40px;
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
    </style>
</head>
<body>

<h2>Create New Event</h2>
<form action="CreateEventServlet" method="post">
    <label>Event Type:</label>
    <input type="text" name="eventType" required><br>

    <label>Venue:</label>
    <input type="text" name="venue" required><br>

    <label>Hall Capacity:</label>
    <input type="text" name="hallCapacity" required><br>

    <label>Catering Type:</label>
    <input type="text" name="cateringType" required><br>

    <label>Meal Type:</label>
    <input type="text" name="mealType" required><br>

    <label>Event Facilities:</label>
    <input type="text" name="eventFacilities" required><br>

    <input type="submit" value="Create Event">
</form>

</body>
</html>
