<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="utils.FileHandler, models.Clients" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>User Profile</title>
    <style>
        .profile-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
        }
        .profile-container h2 {
            text-align: center;
        }
        .profile-container p {
            font-size: 18px;
        }
    </style>
</head>
<body>

<%

    String userEmail = (String) session.getAttribute("userEmail");
    out.println("User email from session: " + userEmail);  // Debugging line

    if (userEmail != null) {
        Clients user = FileHandler.getUserDetailsByEmail(userEmail);
        out.println("User found: " + (user != null ? "Yes" : "No"));  // Debugging line

        if (user != null) {
%>
<!-- Display user details -->
<div class="profile-container">
    <h2>User Profile</h2>
    <p><strong>Name:</strong> <%= user.getFullName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Phone Number:</strong> <%= user.getPhoneNumber() %></p>
</div>
<%
        } else {
            out.println("<p>User not found in file.</p>");  // Debugging line
        }
    } else {
        out.println("<p>Please log in to view your profile.</p>");
    }
%>


</body>
</html>
