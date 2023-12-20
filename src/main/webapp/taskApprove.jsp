<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- <meta http-equiv="refresh" content="5;url=thankyou.html"> Redirect to thankyou.html after 5 seconds -->
<title>Approval</title>
</head>
<body>
<%!
	Connection con;
	String task[] = new String[10];
%>

<%
	String type = (String)session.getAttribute("type");
	System.out.println(type);
	if(type.equals("EMPLOYEE")){
		response.sendRedirect("thankyou.jsp");
	}
	task = request.getParameterValues("task");
	System.out.println(task[0]);
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