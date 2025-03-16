<!DOCTYPE html>
<jsp:include page="header.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome To CineCritix</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to CSS file -->
    <style>
        /* Movie Cards Grid */
        .movies-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }

        .movie-card {
            background-color: #222;
            color: white;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease;
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        .movie-card h3 {
            margin: 10px 0;
            font-size: 18px;
        }

        .movie-card p {
            font-size: 14px;
            opacity: 0.8;
        }

        .add-movie-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #e50914;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .add-movie-btn:hover {
            background-color: #b20710;
        }
    </style>
</head>
<body>
<h2>Welcome To CineCritix</h2>


<h3>Roll Out the Red Carpet - Your Next Movie Adventure Awaits!   </h3>

<!-- <a href="addMovie.jsp">Add New Movie</a>
<br><br> -->
<div class="movies-container">
    <c:forEach var="movie" items="${movies}">
        <div class="movie-card">
            <h3>${movie.title}</h3>
            <p><strong>Genre:</strong> ${movie.genre}</p>
            <p><strong>Rating:</strong> ${movie.rating} ⭐</p>
        </div>
    </c:forEach>
</div>



</body>
</html>
