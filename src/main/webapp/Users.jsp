<%@ page import="service.UserService" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <style>
        body {
            background-color: #121212;
            color: #fff;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #1f1f1f;
            color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #f39c12;
        }

        h2 {
            text-align: center;
            color: #f39c12;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<h2>All Registered Users</h2>
<table>
    <tr>
        <th>Username</th>
        <th>Email</th>
    </tr>
    <%
        UserService userService = new UserService();
        List<User> users = userService.getAllUsers();
        for (User user : users) {
    %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getEmail() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
