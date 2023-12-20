<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
    <!-- Include Bootstrap CSS and Font Awesome CSS directly from CDNs -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            background-color: #333;
        }

        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #d1d1d1;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
        }

        .password-toggle {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            top: 73%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }
        #error{
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="login-container">
        <h2>Login</h2>
        <form action="loginprocess.jsp" method='POST'>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group password-toggle">
                <label for="password">Password:</label>
                <input type="password" class="form-control" name="pass" id="password" placeholder="Enter your password" required>
                <span class="toggle-password" onclick="togglePasswordVisibility()">
                    <i class="fas fa-eye"></i>
                </span>
            </div>
            <button type="submit" class="btn btn-secondary btn-block">Login</button>

            <% if (request.getParameter("error") != null) {
            	System.out.println(request.getParameter("error"));
            %>
                <p id="error" class="text-danger text-center mt-3">Wrong credentials. Try Again !!</p>
            <% } %>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");
        var icon = document.querySelector(".toggle-password i");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.classList.remove("fas", "fa-eye");
            icon.classList.add("fas", "fa-eye-slash");
        } else {
            passwordField.type = "password";
            icon.classList.remove("fas", "fa-eye-slash");
            icon.classList.add("fas", "fa-eye");
        }
    }
</script>

</body>
</html>
