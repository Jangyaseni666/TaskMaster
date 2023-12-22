<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Lavender theme */
        body {
            background-color: #e6e6fa; /* Lavender background */
        }

        .card-header {
            background-color: #d8bfd8; /* Lavender header */
            display: flex;
            justify-content: space-between; /* Space between items */
            align-items: center; /* Center vertically */
        }

        .table {
            background-color: #f5e1ff; /* Lavender table background */
        }

        .table-hover tbody tr:hover {
            background-color: #e0c0ff; /* Lighter lavender on hover */
        }
    </style>
</head>
<body>

<%@include file="navbar.jsp" %>

    <%!
	Connection con;
	ResultSet rs, rs1;
%>
<%
	String type = (String)session.getAttribute("type");
	if(!type.equals("ADMIN")){
		response.sendRedirect("login.jsp");
	}
	//String name = (String)session.getAttribute("name");
%>

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Connected");
	PreparedStatement pst = con.prepareStatement("select * from employees");
	rs = pst.executeQuery();
	int i = 1;
	%>

<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Admin Dashboard</h2>
            <!-- <a href="logout.jsp" class="btn btn-danger">Logout</a> -->
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Sl. No</th>
                        <th>Employee Name</th>
                        <th>Total Points</th>
                        <th>Performance</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    int sum=0;
                    while(rs.next()){
                        String nm = rs.getString(2);
                        String kind = rs.getString(4);
                        PreparedStatement ps = con.prepareStatement("select sum(marks) from empmarks where name=?");
                        //PreparedStatement ps = con.prepareStatement("select sum(marks) from empmarks NATURAL JOIN employees where name=? and type='EMPLOYEE'");
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
                    <!-- Mocked data for demonstration purposes -->

                    <tr>
                        <td><%=i%></td>
                        <td><%=nm%></td>
                        <td><%=sum%></td>
                        <td><%=str%></td>
                    </tr>

                    <%
		                i++;
                        }
                    %>
                </tbody>
            </table>
            <%
                }catch(Exception e){
                    out.println(e);
                }
            %>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
