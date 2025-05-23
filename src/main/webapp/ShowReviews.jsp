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
            width: 90%;
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
            max-width: 1100px;
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
        .sort-form {
            text-align: center;
            margin-bottom: 20px;
        }
        select, input[type=submit] {
            padding: 10px;
            font-size: 16px;
            margin-left: 10px;
        }
        .delete-btn {
            padding: 6px 12px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 style="text-align: center;">All Reviews</h2>

    <form method="get" class="sort-form">
        <label for="sortBy">Sort by:</label>
        <select name="sortBy" id="sortBy">
            <option value="default">Default (Latest)</option>
            <option value="rating">Rating (High to Low)</option>
        </select>
        <input type="submit" value="Sort">
    </form>

    <%
        ReviewService reviewService = new ReviewService();
        List<Review> reviews;

        String sortBy = request.getParameter("sortBy");
        if ("rating".equals(sortBy)) {
            reviews = reviewService.getSortedReviewsByRating();
        } else {
            reviews = reviewService.getAllReviews();
        }

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
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Review review : reviews) {
        %>
        <tr>
            <td><%= review.getUsername() %></td>
            <td><%= review.getMovieName() %></td>
            <td><%= review.getRating() %></td>
            <td>
                <form action="deleteReview" method="post">
                    <input type="hidden" name="username" value="<%= review.getUsername() %>">
                    <input type="hidden" name="movieName" value="<%= review.getMovieName() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>

            </td>
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
    <button class="button" onclick="window.location.href='index.jsp'">Go to Home</button>
</div>

</body>
</html>
