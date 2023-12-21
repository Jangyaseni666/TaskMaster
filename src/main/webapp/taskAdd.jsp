<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection con;
	String task[] = new String[10];
%>

<%
try{
	task = request.getParameterValues("task");
	String tasks ="";
	for(String t:task){
		tasks+=t+",";
	}
	System.out.println(tasks);
	int id = (int)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	LocalDate day = LocalDate.parse(request.getParameter("day"));
	java.sql.Date date = java.sql.Date.valueOf(day);
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Database Connected ****");
	PreparedStatement pst=con.prepareStatement("insert into pending(id, name, tasks, day) values(?,?,?,?)");
	pst.setInt(1, id);
	pst.setString(2, name);
	pst.setString(3, tasks);
	pst.setDate(4, date);
	int i = pst.executeUpdate();
	if(i>0){
		response.sendRedirect("dailylog.jsp");
	}else{
		%>
		<script>window.alert("error");</script>
		<%
		response.sendRedirect("dailylog.jsp");
	}
}catch(Exception e){
	System.out.println(e);	
}
%>
</body>
</html>