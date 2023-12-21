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
	ResultSet rs, rs1;
%>
<%
	String type = (String)session.getAttribute("type");
	if(!type.equals("ADMIN")){
		response.sendRedirect("login.jsp");
	}
	String name = (String)session.getAttribute("name");
%>
<h2>Welcome, <%=name%></h2>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Connected");
	PreparedStatement pst = con.prepareStatement("select * from employees");
	rs = pst.executeQuery();
	int i = 1;
	%>
	<table border="2" cellpadding="5">
		<tr>
			<th>Sl.No</th>
			<th>Name</th>
			<th>Type</th>
			<th>Total Points</th>
			<th>Performance Review</th>
		</tr>
	<%
	int sum=0;
	while(rs.next()){
		String nm = rs.getString(2);
		String kind = rs.getString(4);
		PreparedStatement ps = con.prepareStatement("select sum(marks) from empmarks where name=?");
		ps.setString(1,nm);
		rs1 = ps.executeQuery();
		while(rs1.next()){
			sum = rs1.getInt(1);
		}
		String rev="";
		if(sum>= 200) rev = "Excellent";
		double val = ((sum/280.0)*100);
		String str = String.format("%.2f", val);
		%>
		<tr>
			<td><%=i%></td>
			<td><%=nm%></td>
			<td><%=kind%></td>
			<!--  <td><button><a href="checkReview.jsp?<%=nm%>">Check</a></button></td>-->
			<td><%=sum%></td>
			<td><%=str%></td>
		</tr>
		<%
		i++;
	}
	%>
	</table>
	<%
	
}catch(Exception e){
	out.println(e);
}

%>

</body>
</html>