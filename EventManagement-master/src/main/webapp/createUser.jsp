<!DOCTYPE html>
<html>
<head>
    <title>Create New User</title>
</head>
<body>
    <h2>Create New User</h2>
    <form action="CreateUserServlet" method="post">
        Name: <input type="text" name="userName" /><br />
        Email: <input type="email" name="userEmail" /><br />
        Phone: <input type="text" name="userPhone" /><br />
        Login Name: <input type="text" name="userLoginName" /><br />
        Password: <input type="password" name="userLoginPassword" /><br />
        <input type="submit" value="Create User" />
    </form>
</body>
</html>
