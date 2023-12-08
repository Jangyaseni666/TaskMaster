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
	String uname, pass, type;
	
%>

<%
uname = request.getParameter("username");
pass = request.getParameter("pass");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Database Connected ****");
	PreparedStatement pst=con.prepareStatement("select * from employees");
	rs = pst.executeQuery();
	while(rs.next()){
		String n = rs.getString(2);
		String p = rs.getString(3);
		if(n.equals(uname) && p.equals(pass)){
			type = rs.getString(4);
			session.setAttribute("type",type);
			session.setAttribute("name", n);
			response.sendRedirect("./index.jsp");
		}else{
			session.setAttribute("msg","Wrong Credentials! Login Again!!"+uname+pass);
			response.sendRedirect("./index.jsp");
		}
	}
} catch(Exception e){
	out.print(e);
}
%>

</body>
</html>