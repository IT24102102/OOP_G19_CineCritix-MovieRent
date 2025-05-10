<%@ page import="service.ReviewService" %>
<%@ page import="models.Review" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef1f4;
            padding: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .button {
            margin: 20px auto;
            display: block;
            width: 200px;
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 style="text-align: center;">All Reviews</h2>

    <%
        ReviewService reviewService = new ReviewService();
        List<Review> reviews = reviewService.getAllReviews();

        if (reviews.isEmpty()) {
    %>
    <p style="text-align: center;">No reviews available yet.</p>
    <%
    } else {
    %>

    <table>
        <thead>
        <tr>
            <th>Username</th>
            <th>Movie Name</th>
            <th>Rating</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Loop through the reviews and display each one
            for (Review review : reviews) {
        %>
        <tr>
            <td><%= review.getUsername() %></td>
            <td><%= review.getMovieName() %></td>
            <td><%= review.getRating() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
        }
    %>

    <button class="button" onclick="window.location.href='SubmitReview.jsp'">Submit a Review</button>
</div>

</body>
</html>
