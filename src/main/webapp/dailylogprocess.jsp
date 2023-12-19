<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Daily Log Process</title>
</head>
<body>
<%!
	Connection con;
	ResultSet rs;
	String task[] = new String[10];
%>

<%
task = request.getParameterValues("task");
LocalDate day = LocalDate.parse(request.getParameter("day"));
java.sql.Date date = java.sql.Date.valueOf(day);
int point = 0;
for(String t: task){
	System.out.println(t);
	switch(t){
	case "Code Review":
		point+=8;
		break;
	case "Feature Development":
		point+=12;
		break;
	case "Bug Fixing":
		point+=10;
		break;
	case "Sprint Planning":
		point+=6;
		break;
	case "Daily Standup":
		point+=6;
		break;
	case "Testing":
		point+=10;
		break;
	case "Documentation":
		point+=6;
		break;
	case "Meetings":
		point+=6;
		break;
	case "Code Refactoring":
		point+=6;
		break;
	case "Research and Learning":
		point+=6;
		break;
	default:
		break;
	}
	
}

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");

	int id = (int)session.getAttribute("id");
	String name = (String)session.getAttribute("name");

	PreparedStatement pst=con.prepareStatement("replace into empmarks(id,name,marks,day) values(?,?,?,?)");
	pst.setInt(1,id);
	pst.setString(2,name);
	pst.setInt(3, point);
	pst.setDate(4, date);

	int i = pst.executeUpdate();
	if(i>0){
		out.println("Entered");
	}else{
		out.println("NOt entered");
	}
	
}catch (Exception e){
	out.println(e);
	
}

%>

</body>
</html>