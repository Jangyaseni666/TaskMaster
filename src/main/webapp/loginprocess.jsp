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
	int flag=0;
	while(rs.next()){
		int id = rs.getInt(1);
		String n = rs.getString(2).trim();
		String p = rs.getString(3).trim();
		System.out.println(n+" "+p+" "+uname+" "+pass);
		if(n.equals(uname) && p.equals(pass)){
			type = rs.getString(4);
			flag=1;
			//	System.out.println(n.equals(uname) && p.equals(pass));
			session.setAttribute("type",type);
			session.setAttribute("name", n);
			session.setAttribute("id",id);
			if(type.equals("EMPLOYEE")){
				//System.out.println("here");
				response.sendRedirect("dailylog.jsp");
			}
			else if(type.equals("SUPERVISOR")){
				//System.out.println("here");
				response.sendRedirect("./supervisor_dashboard.jsp");
			}
			else{
				response.sendRedirect("./admin_dashboard.jsp");
			}
		}
		//response.sendRedirect("dailylog.jsp");
	}
	
	if(flag == 0) response.sendRedirect("login.jsp?error=true");
} catch(Exception e){
	out.print(e);
}
%>

</body>
</html>