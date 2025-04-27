<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            background-image: url('images/AdBG.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            text-align: center;
            color: white;
            background: rgba(0, 0, 0, 0.6);
            padding: 30px 0;
            font-size: 36px;
            font-weight: bold;
            text-shadow: 2px 2px 8px black;
        }

        .dashboard {
            display: flex;
            justify-content: center;  /* Centering the cards horizontally */
            gap: 40px;  /* Space between the cards */
            padding: 60px 30px;
            flex-wrap: wrap;  /* Wrap cards if screen size is small */
        }

        .card {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(255, 255, 255, 0.85); /* Slight transparency for readability */
            border-radius: 20px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
            width: 280px;
            padding: 30px 20px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
            color: white;
        }

        .card:hover {
            transform: scale(1.07);  /* Card scaling effect */
        }

        .card h2 {
            font-size: 22px;
            margin-bottom: 15px;
            color: #2c3e50;  /* Dark color for text */
        }

        .card button {
            padding: 12px 25px;
            border: none;
            border-radius: 10px;
            background-color: #2c3e50;
            color: white;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }

        .card button:hover {
            background-color: #34495e; /* Hover effect */
        }

        /* Additional styling for better spacing on mobile */
        @media (max-width: 768px) {
            .dashboard {
                flex-direction: column;  /* Stack cards vertically on small screens */
                align-items: center;
            }
        }
    </style>
</head>
<body>

<div class="header">
    Manage Movies
</div>

<div class="dashboard">
    <!-- Create Movies Card -->
    <div class="card">
        <h2>Add New Movies</h2>
        <a href="addNewMovies.jsp">
            <button>Add New Movies</button>
        </a>
    </div>

    <!-- Other Cards (Example) -->
    <div class="card">
        <h2>Update Movies</h2>
        <a href="UpdateMovies.jsp">
            <button>Update Movies</button>
        </a>
    </div>

    <div class="card">
        <h2>Delete Movies</h2>
        <a href="DeleteMovies.jsp">
            <button>Delete Movies</button>
        </a>
    </div>

    <div class="card">
        <h2>View Movies</h2>
        <a href="NewadM.jsp">
            <button>View Movies</button>
        </a>
    </div>
</div>

</body>
</html>
