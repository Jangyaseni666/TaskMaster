<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Daily Log</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .log-container {
            max-width: 600px;
            margin: auto;
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #d1d1d1;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .log-container h2 {
            text-align: center;
            border-bottom: 3px solid black;
        }

        .welcome-container {
            text-align: center;
            padding: 10px;
            background-color: #000;
            color: #fff;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-group {
            margin-bottom: 15px;
            font-size: large;
        }

        #total-points {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
<%
String type = (String)session.getAttribute("type");
String name = (String)session.getAttribute("name");
if(name!=null){
%>
<div class="welcome-container">
   <h3 class="welcome-text">WELCOME! <%=name %></h3>
</div>
<!-- <%
	}else{
		out.println(session.getAttribute("msg"));
	}
%> -->
    
    <div class="log-container">
        <h2>Daily Log</h2>
        <form id="dailyLogForm" class="pt-3" action="taskApprove.jsp" method="post">
        <input type="hidden" name="type" value="<%=type%>">
        <!-- <input type="hidden" value="check" name="check"> -->
        	<div class="form-group">
                <label>Day: <input type="date" name="day" required></label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Code Review"> Code Review</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Feature Development"> Feature Development</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Bug Fixing"> Bug Fixing</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Sprint Planning"> Sprint Planning</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Daily Standup"> Daily Standup</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Testing"> Testing</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Documentation"> Documentation</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Meetings"> Meetings</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Code Refactoring"> Code Refactoring</label>
            </div>
            <div class="form-group">
                <label><input type="checkbox" class="task" name="task" value="Research and Learning"> Research and Learning</label>
            </div>
            <!-- <div class="form-group">
                <label>Total Points: <span id="total-points">0</span></label>
            </div> -->
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- <script>
    function thanks(){
        window.location.href = "thankyou.html"
        return false;
    }
</script> -->

</body>
</html>
