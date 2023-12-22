<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>navbar</title>
    <link rel="stylesheet" href="navbar_style.css">
</head>
<body>
    <nav>
        <div class="navbar-container">
            <span class="brand-name">TASKMASTER</span>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
                <% String name = (String)session.getAttribute("name");
                if(name != null){
                %>
                    <li><a href="logout.jsp">Logout</a></li>
                <%
                }
                else{
                %>
                    <li><a href="login.jsp">Login</a></li>
                <%
                }
                %>
            </ul>
        </div>
    </nav>
</body>
</html>

