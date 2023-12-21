<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection con;
	ResultSet rs;
%>

<%
	String name = request.getParameter("name");
	System.out.println(name);
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
		
		PreparedStatement pst = con.prepareStatement("SELECT SUM(marks) FROM empmarks where name=?");
		
		pst.setString(1, name);
		rs =pst.executeQuery();
		while(rs.next()){
			int sum = rs.getInt(1);	
			System.out.println("Review: "+sum);
		}
		
	} catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>