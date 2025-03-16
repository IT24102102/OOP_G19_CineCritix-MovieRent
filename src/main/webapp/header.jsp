<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to CSS -->
    <title>CineCritix</title>
    <style>
        /* Navbar Styles */
        .navbar {
            background-color: #222;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .navbar .logo img {
            height: 50px; /* Adjust size as needed */
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 18px;
        }
        .navbar a:hover {
            background-color: #444;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <div class="logo">
        <a href="index.jsp">
            <img src="images/logo.jpg" alt="CineCritix Logo"> <!-- Change path if needed -->
        </a>
    </div>
    <div>
        <a href="profile.jsp">Profile</a>
        <a href="watchlist.jsp">Watchlist</a>
        <a href="rented.jsp">Rented Movies</a>
        <a href="reviews.jsp">Reviews</a>
    </div>
</div>

</body>
</html>
