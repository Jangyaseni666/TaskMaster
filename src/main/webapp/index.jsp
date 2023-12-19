<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
</head>
<body>
<%
	String type = (String)session.getAttribute("type");
	if(type!=null){
		out.println("Welcome, "+type);
	}else{
		out.println(session.getAttribute("msg"));
	}
%>
</body>
</html>