<%@ page import="com.example.model.Rental" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rental Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin: 80px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .success-message {
            font-size: 36px;
            color: #28a745;
            margin-bottom: 30px;
        }
        .detail {
            font-size: 18px;
            margin: 10px 0;
        }
        .button-group {
            margin-top: 30px;
        }
        .button-group a {
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            font-size: 16px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .button-group a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="success-message">✅ Rental Successful!</div>
    <%
        Rental rental = (Rental) session.getAttribute("lastRental");
        if (rental != null) {
    %>
    <p class="detail"><strong>Rental ID:</strong> <%= rental.getRentalId() %></p>
    <p class="detail"><strong>User ID:</strong> <%= rental.getUserId() %></p>
    <p class="detail"><strong>Movie ID:</strong> <%= rental.getMovieId() %></p>
    <p class="detail"><strong>Rental Date:</strong> <%= rental.getRentalDate() %></p>
    <% } else { %>
    <p class="detail">No rental data found.</p>
    <% } %>

    <div class="button-group">
        <a href="rentMovie.jsp">🎬 Rent Another Movie</a>
        <a href="RentalServlet">📋 View Rentals</a>
    </div>
</div>
</body>
</html>
