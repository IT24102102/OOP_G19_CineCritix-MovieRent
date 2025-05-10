<%@ page import="java.io.*, models.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String email = loggedInUser.getEmail();
    String fullName = "";
    String phoneNumber = "";

    // Path to your text file
    String filePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Cusers.txt";

    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 5 && parts[0].equals(email)) {
                fullName = parts[3];
                phoneNumber = parts[4];
                break;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile - CineCritix</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/BG.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            color: white;
        }
        .overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 10px #000;
        }
        h2 {
            text-align: center;
            color: #f39c12;
            margin-bottom: 30px;
        }
        .info {
            font-size: 18px;
            margin: 15px 0;
            line-height: 1.6;
        }
        .info i {
            margin-right: 10px;
            color: #f39c12;
        }
        .btn-logout {
            display: block;
            width: 100%;
            margin-top: 30px;
            background-color: #f39c12;
            color: white;
            padding: 12px;
            text-align: center;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-logout:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<div class="container">
    <h2>Your Profile</h2>
    <div class="info"><i class="fas fa-user"></i> <strong>Username:</strong> <%= loggedInUser.getUsername() %></div>
    <div class="info"><i class="fas fa-envelope"></i> <strong>Email:</strong> <%= loggedInUser.getEmail() %></div>
    <div class="info"><i class="fas fa-id-badge"></i> <strong>Full Name:</strong> <%= fullName %></div>
    <div class="info"><i class="fas fa-phone"></i> <strong>Phone Number:</strong> <%= phoneNumber %></div>
    <button class="btn-logout" onclick="window.location.href='login.jsp'">Logout</button>
</div>
</body>
</html>
