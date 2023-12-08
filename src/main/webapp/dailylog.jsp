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
<form action="tasksubmit.jsp" method="post">
    <label><input type="checkbox" name="Code Review" value="8"> Code Review</label><br>
    <label><input type="checkbox" name="Feature Development" value="12"> Feature Development</label><br>
    <label><input type="checkbox" name="task" value="10"> Bug Fixing</label><br>
    <label><input type="checkbox" name="task" value="6"> Sprint Planning</label><br>
    <label><input type="checkbox" name="task" value="6"> Daily Standup</label><br>
    <label><input type="checkbox" name="task" value="10"> Testing</label><br>
    <label><input type="checkbox" name="task" value="6"> Documentation</label><br>
    <label><input type="checkbox" name="task" value="6"> Meetings</label><br>
    <label><input type="checkbox" name="task" value="6"> Code Refactoring</label><br>
    <label><input type="checkbox" name="task" value="6"> Research and Learning</label><br>

    <br>
    <input type="submit" value="Submit">
</form>
</body>
</html>