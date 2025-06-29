<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Create New Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4c88d0;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="datetime-local"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
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
    </style>
</head>
<body>
    <h1>Create New Payment</h1>
    <form action="createOrder" method="post">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br>

        <label for="cardName">Card Name:</label>
        <input type="text" id="cardName" name="cardName" required><br>

        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required><br>

        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" required><br>

        <label for="orderDate">Order Date:</label>
        <input type="datetime-local" id="orderDate" name="orderDate" required><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
