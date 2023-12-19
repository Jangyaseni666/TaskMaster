<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>
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
	String type = (String)session.getAttribute("type");
	if(!type.equals("ADMIN")){
		response.redirect("login.jsp");
	}
	String name = (String)session.getAttribute("name");
%>
<h2>Welcome, <%=name%></h2>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	
	PreparedStatement pst = con.prepareStatement("select * from employee");
	rs = pst.executeQuery();
	int i = 1;
	System.out.println("Sl.No\tName\tType");
	while(rs.next()){
		String nm = rs.getString(2);
		String kind = rs.getString(4);
		System.out.println(i+"\t"+nm+"\t"+kind);
	}
	
}catch(Exception e){
	
}

%>

</body>
</html>