<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <!-- <link rel="stylesheet" href="styles.css"> -->
    <!-- <script src="script.js" defer></script> -->

    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        color: #007BFF;
    }

    #message {
        font-size: 18px;
        margin-bottom: 20px;
    }
    
    </style>
</head>
<body>
    <div class="container">
        <h2>Thank You!</h2>
        <p id="message">Your tasks have been submitted for approval.</p>
        <p>Login tomorrow to check the status of your tasks.</p>

        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout" style="background-color: #007BFF; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
    const messages = [
        "Your tasks have been submitted for approval.",
        "Check back tomorrow for updates on your tasks.",
        "We've received your tasks! See you tomorrow."
    ];

    // Randomly select a message from the array
    const randomMessage = messages[Math.floor(Math.random() * messages.length)];

    // Update the message element with the random message
    document.getElementById('message').textContent = randomMessage;
});

    </script>
</body>
</html>
