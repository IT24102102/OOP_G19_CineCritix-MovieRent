<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to CSS -->
    <title>CineCritix</title>
    <style>
        /* General Styling for Navbar and Header */
        .site-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #222;
            padding: 20px 40px;  /* Adjusted padding */
            width: 100%;  /* Makes the header span full width */
            color: white;
            font-size: 14px;  /* Slightly larger font size */
            box-sizing: border-box;  /* Ensure padding doesn't cause overflow */
        }

        /* Logo Styles */
        .site-header .logo img {
            height: 60px;  /* Adjust logo size */
        }

        /* Search Bar Styles */
        .site-header .search-bar input {
            padding: 10px 20px;  /* Increased padding for search bar */
            font-size: 16px;  /* Larger font size */
            border-radius: 5px;
            border: none;
            width: 300px;  /* Increased width for search bar */
        }

        /* Navigation Links Styles */
        .site-header .nav-links a {
            color: white;
            text-decoration: none;
            margin: 0 15px;  /* Increased margin between links */
            font-size: 16px;  /* Larger font size */
        }

        .site-header .nav-links a:hover {
            background-color: #444;
            border-radius: 5px;
            padding: 5px 10px;
        }

        /* Buttons Styles */
        .site-header .buttons button {
            padding: 10px 25px;  /* Increased padding for buttons */
            background-color: #444;
            border: none;
            color: white;
            cursor: pointer;
            margin-left: 15px;  /* Increased margin between buttons */
            font-size: 16px;  /* Larger font size */
            border-radius: 5px;
        }

        .site-header .buttons button:hover {
            background-color: #555;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .site-header {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;  /* Adjust padding for smaller screens */
            }
            .site-header .search-bar {
                margin-top: 10px;
                width: 100%;  /* Full-width search bar on smaller screens */
            }
            .site-header .nav-links {
                display: flex;
                flex-direction: column;
                margin-top: 10px;
                width: 100%;
                align-items: flex-start;
            }
            .site-header .buttons {
                width: 100%;  /* Make buttons full-width on small screens */
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="site-header">
    <div class="logo">
        <a href="index.jsp">
            <img src="images/logo.jpg" alt="CineCritix Logo"> <!-- Change path if needed -->
        </a>
    </div>

    <!-- Search Bar -->
    <div class="search-bar">
        <input type="text" placeholder="Search movies...">
    </div>

    <!-- Navigation Links and Buttons -->
    <div class="nav-links">
        <a href="#">Welcome To CineCritix</a>
        <a href="#">Home</a>
        <a href="#">Movies</a>

        <a href="#">Watchlist</a>
    </div>

    <div class="buttons">
        <button class="login-btn" onclick="window.location.href='profile.jsp'">Profile</button>

    </div>
</div>

</body>
</html>
