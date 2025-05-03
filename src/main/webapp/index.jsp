<jsp:include page="header.jsp" />
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome To CineCritix</title>

    <style>
        /* General Page Styling */
        body {
            background-color: #0055fd;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Wider Header */
        header {
            width: 100%;
            background-color: #007bff;
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
        }

        /* Movie Container */
        .movies-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            overflow-y: auto;
        }

        /* Movie Block */
        .movie-card {
            width: 220px; /* Slightly wider cards */
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        /* Movie Poster */
        .movie-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 15px;
        }

        /* Movie Title Overlay */
        .movie-title {
            position: absolute;
            bottom: 10px;
            left: 10px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            background: rgba(0, 0, 0, 0.5);
            padding: 5px 10px;
            border-radius: 5px;
        }

        /* Scrollable Effect */
        .scroll-container {
            height: 80vh;
            overflow-y: scroll;
            padding-bottom: 20px;
        }

        /* Footer Styling */
        footer {
            width: 100%;
            background-color: #007bff;
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
            margin-top: 20px;
        }

        /* Links Styling */
        a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        /* Button Styling */
        .admin-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>

</head>
<body>



<h3>Roll Out the Red Carpet - Your Next Movie Adventure Awaits!</h3>

<h2 style="text-align: center;">Movie Collection</h2>

<div class="movies-container">
    <div class="movie-card" onclick="showMovieInfo(1)">
        <img src="images/intersteller.jpg" alt="Interstellar">
        <p class="movie-title">Interstellar</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(2)">
        <img src="images/Inception.jpg" alt="Inception">
        <p class="movie-title">Inception</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(3)">
        <img src="images/Tenet.jpg" alt="Tenet">
        <p class="movie-title">Tenet</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(4)">
        <img src="images/FvsF.jpg" alt="Ford Vs Ferrari">
        <p class="movie-title">Ford Vs Ferrari</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(5)">
        <img src="images/KGMAN.jpg" alt="The King's Man">
        <p class="movie-title">The King’s Man</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(6)">
        <img src="images/POC.jpg" alt="Pirates of the Caribbean">
        <p class="movie-title">Pirates of the Caribbean</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(7)">
        <img src="images/WOW.jpg" alt="The Wolf of Wall Street">
        <p class="movie-title">The Wolf of Wall Street</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(8)">
        <img src="images/Dun.jpg" alt="Dunkirk">
        <p class="movie-title">Dunkirk</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(9)">
        <img src="images/MR.jpg" alt="The Maze Runner">
        <p class="movie-title">The Maze Runner</p>
    </div>
    <div class="movie-card" onclick="showMovieInfo(10)">
        <img src="images/PR.jpg" alt="Pacific Rim">
        <p class="movie-title">Pacific Rim</p>
    </div>
</div>

<!-- Movie Info Modal -->
<div id="movie-info-modal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="movie-title"></h2>
        <p id="movie-description"></p>
    </div>
</div>



<jsp:include page="footer.jsp" />

</body>
</html>
