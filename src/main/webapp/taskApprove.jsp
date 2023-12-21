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

String type = (String)session.getAttribute("type");
if(type.equals("EMPLOYEE")){
	response.sendRedirect("login.jsp");
}

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Database Connected ****");
	PreparedStatement pst=con.prepareStatement("select * from pending");
	
	ResultSet rs = pst.executeQuery();
	out.println("<h2>Approve the following tasks</h2>");
	if(rs == null) out.println("No pending tasks");
	while(rs.next()){
		int i = rs.getInt(2);
		String n = rs.getString(3);
		String task = rs.getString(4);
		String tasks[] = task.split(",");
		java.sql.Date date = rs.getDate(5);
		%>
		<form action="dailylogprocess.jsp" method="post">
			<input type="hidden" name="name" value="<%=n%>">
			<input type="hidden" name="id" value="<%=i%>">
			Day: <input type="date" name="day" value="<%=date%>"><br>
		<% 
	for(String t: tasks){
		%>
			<input type="checkbox" name="task" value="<%=t%>">
			<label><%= t%></label><br>
		<%
	}
	%>
		<input type="submit" value="Submit">
		</form>
	<%
	}
	
} catch(Exception e){
	
}
%>
</body>
</html>