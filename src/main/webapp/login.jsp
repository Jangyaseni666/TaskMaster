<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form action="loginprocess.jsp" method='POST'>
		<label for="username">UserName: </label>
		<input type="text" name="username"> <br>
		<label for="pass">Password: </label>
		<input type="password" name="pass"> <br>
		<input type="submit" value="Log In">
	</form>
</body>
</html>