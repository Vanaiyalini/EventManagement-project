<html>
<head>
    <title>Create New Event</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }
        form input[type="text"],
        form input[type="date"],
        form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form input[type="submit"] {
            background-color: #1e90ff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        form input[type="submit"]:hover {
            background-color: #4682b4;
        }
        form label {
            font-weight: bold;
        }
        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            var eventName = document.getElementById("ename").value;
            var eventDate = document.getElementById("edate").value;
            var venue = document.getElementById("venue").value;
            var guests = document.getElementById("guests").value;
            var foodType = document.getElementById("efood").value;
            var mealType = document.getElementById("emeal").value;
            var equipment = document.getElementById("equp").value;
            var errorMsg = "";
            var today = new Date().toISOString().split('T')[0];

            if (eventName.trim() === "") {
                errorMsg += "Event Name is required.\n";
            }
            if (eventDate === "" || eventDate < today) {
                errorMsg += "Event Date is required and must be today or later.\n";
            }
            if (venue.trim() === "") {
                errorMsg += "Venue is required.\n";
            }
            if (guests <= 0) {
                errorMsg += "Number of Guests must be greater than 0.\n";
            }
            if (foodType.trim() === "") {
                errorMsg += "Food Type is required.\n";
            }
            if (mealType.trim() === "") {
                errorMsg += "Meal Type is required.\n";
            }
            if (equipment.trim() === "") {
                errorMsg += "Equipment is required.\n";
            }

            if (errorMsg) {
                alert(errorMsg);
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div>
        <h1>Create New Event</h1>
        <form action="createBook" method="post" onsubmit="return validateForm()">
            <label for="ename">Event Name:</label>
            <input type="text" id="ename" name="ename" required><br>

            <label for="edate">Event Date:</label>
            <input type="date" id="edate" name="edate" required><br>

            <label for="venue">Venue:</label>
            <input type="text" id="venue" name="venue" required><br>

            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" required min="1"><br>

            <label for="efood">Food Type:</label>
            <input type="text" id="efood" name="efood" required><br>

            <label for="emeal">Meal Type:</label>
            <input type="text" id="emeal" name="emeal" required><br>

            <label for="equp">Equipment:</label>
            <input type="text" id="equp" name="equp" required><br>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
