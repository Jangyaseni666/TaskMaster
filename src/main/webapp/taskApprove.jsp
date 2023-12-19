<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approval</title>
</head>
<body>
<%!
	Connection con;
	String task[] = new String[10];
%>

<%
	task = request.getParameterValues("task");
	LocalDate day = LocalDate.parse(request.getParameter("day"));
		%>
		<h2>Approve the following tasks</h2>
		<form action="dailylogprocess.jsp" method="post">
			Day: <input type="date" name="day" value="<%=day%>"><br>
		<% 
	for(String t: task){
		%>
			<input type="checkbox" name="task" value="<%=t%>">
			<label><%= t%></label><br>
		<%
	}
	%>
		<input type="submit" value="Submit">
		</form>
	<%
%>
</body>
</html>