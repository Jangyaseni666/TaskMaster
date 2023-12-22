<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supervisor Dashboard</title>
    
    <!-- Bootstrap CSS CDN -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Additional custom styles can be added here if needed */
        .completed-task {
            background-color: #e6f7ff; /* light blue background for completed tasks */
        }

        .accordion-card {
            border: none;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }

        .accordion-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .accordion-header {
            background-color: #8875f1;
            color: #fff;
            padding: 15px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .accordion-content {
            padding: 15px;
            background-color: #fff;
            display: none;
        }

        .accordion-footer {
            padding: 15px;
            background-color: #f9f9f9;
            border-top: 1px solid #ddd;
        }
        .cat{
		  margin: 4px;
		  background-color: #fd816b;
		  border-radius: 4px;
		  border: 1px solid #fff;
		  overflow: hidden;
		  width: 17%;
		  padding: 9px 0;
		}
		
		.cat label{
			width: 20em; 
		}
		.cat label input{
			display: none;
			color: #fff !important;
		}
		.cat label span {
  text-align: center;
  padding: 10px;
  width: 20em; 
  height: 4.0em;
}
.cat label input {
  display: none;
  color: #fff !important;
}
		.cat label input + span{color: #fff;}
		.cat input:checked +  {
		    color: #ffffff;
		    text-shadow: 0 0  6px rgba(0, 0, 0, 0.8);
		}
		.task input:checked + span{
            /* width: 50%; */
            background-color: #8cfdae;}
    </style>
</head>

<body class="bg-light">
<%@include file="navbar.jsp" %>
    <%!
	Connection con;
	String task[] = new String[10];
    %>

    <%
    String type = (String)session.getAttribute("type");
if(type.equals("EMPLOYEE")){
	response.sendRedirect("thankyou.jsp");
}

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "");
	System.out.println("Database Connected ****");
	PreparedStatement pst=con.prepareStatement("select * from pending");
	
	ResultSet rs = pst.executeQuery();

    %>

    <div class="container mt-5">
        <h1 class="text-center mb-4 border-bottom border-secondary">Supervisor Dashboard</h1>
        
        <!-- <div class="d-flex justify-content-between align-items-center mb-4 border-bottom border-secondary">
            <h1 class="text-center mb-0">Supervisor Dashboard</h1>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
            
        </div> -->

        <% if(rs == null) out.println("No pending tasks");

       while(rs.next()){
    	int i = rs.getInt(1);
		int empid = rs.getInt(2);
		String n = rs.getString(3);
		String task = rs.getString(4);
		String tasks[] = task.split(",");
		java.sql.Date date = rs.getDate(5);

		%>


        
        <div class="card accordion-card">
            <div class="accordion-header">
                <span><%=n%></span>
                <button class="btn btn-dark" onclick="toggleAccordion('task<%=i%>', 'foot<%=i%>')">View Tasks</button>
            </div>
            <form action="dailylogprocess.jsp" method="post">
            	<input type="hidden" name="name" value="<%=n%>">
				<input type="hidden" name="id" value="<%=empid%>">
		        <div class="text-center m-2">
		            <h5>Day: <input type="date" name="day" value="<%=date%>"></h5> <!-- Display the current date from the backend -->
		        </div>
            <div class="accordion-content" id="task<%=i%>" style="display: none;">
		        <h5 class="text-center">Check the tasks you want to approve</h5>  <%      
	for(String t: tasks){
		%>
                        <div class="cat task">
                        	<label style="font-weight:bold">
                        	<input type="checkbox" name="task" value="<%=t%>">
                        	<span><%=t%></span>
                        	</label>
                        </div>
            <%
        }
        %>
            </div>
            <div class="accordion-footer" id="foot<%=i%>" style="display: none;"> <!-- set initial display to none -->
                <input type="submit" class="btn btn-success" value="Submit">
            </div>
    	</form>
        </div>

    <%
}
%>

    </div>

    <%
}catch(Exception e){
	
}
%>

    <!-- Bootstrap JS and Popper.js CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function toggleAccordion(id,id1) {
            const accordionContent = document.getElementById(id);
            const accordionFooter = document.getElementById(id1);
            /* console.log(id); */

            if (accordionContent.style.display === 'none') {
                accordionContent.style.display = 'block';
                accordionFooter.style.display = 'block';
                document.querySelector('.btn-dark').textContent = 'Hide Tasks';
            } else {
                accordionContent.style.display = 'none';
                accordionFooter.style.display = 'none';
               document.querySelector('.btn-dark').textContent = 'View Tasks';
            }
        }

        function verifyTask(taskId) {
            const taskElement = document.getElementById(taskId);
            const listItem = taskElement.closest('.list-group-item');
            
            if (taskElement.checked) {
                listItem.classList.add('completed-task');
            } else {
                listItem.classList.remove('completed-task');
            }
        }

        function submitTasks() {
            // Logic to submit tasks to the backend or perform other actions after verification
            alert('Tasks submitted!');
        }
    </script>
</body>

</html>
