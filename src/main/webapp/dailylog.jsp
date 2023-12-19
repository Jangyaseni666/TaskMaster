<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Daily Log</title>
</head>
<body>
<%
	String name = session.getAttribute("name")+"";
	if(session.getAttribute("name")==null){
		System.out.println("hellp");
		%>
		
		<script>
			window.alert("Login!!!");
		</script>
		<%
		response.sendRedirect("login.jsp");
	}
	
%>
<form action="taskApprove.jsp" method="post">
	<label>Day: </label><input type="date" name="day">
    <label><input type="checkbox" name="task" value="Code Review"> Code Review</label><br>
    <label><input type="checkbox" name="task" value="Feature Development"> Feature Development</label><br>
    <label><input type="checkbox" name="task" value="Bug Fixing"> Bug Fixing</label><br>
    <label><input type="checkbox" name="task" value="Sprint Planning"> Sprint Planning</label><br>
    <label><input type="checkbox" name="task" value="Daily Standup"> Daily Standup</label><br>
    <label><input type="checkbox" name="task" value="Testing"> Testing</label><br>
    <label><input type="checkbox" name="task" value="Documentation"> Documentation</label><br>
    <label><input type="checkbox" name="task" value="Meetings"> Meetings</label><br>
    <label><input type="checkbox" name="task" value="Code Refactoring"> Code Refactoring</label><br>
    <label><input type="checkbox" name="task" value="Research and Learning"> Research and Learning</label><br>
    <br>
    <input type="submit" value="Submit">
</form>
</body>
</html>