<%@ page import="models.User" %>
<%@ page import="java.io.File" %>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome To CineCritix</title>

    <style>
        /* General Styling */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('images/BG.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            position: relative;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            z-index: -1;
        }

        /* Header */
        .site-header {
            background-color: #111;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #f39c12;
        }

        .welcome-message {
            font-size: 1.2rem;
            color: #ccc;
            font-weight: bold;
            flex: 1;
            text-align: center;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .nav-links a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #fff;
        }

        .buttons button {
            margin-left: 1rem;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        .login-btn {
            background-color: #444;
            color: white;
        }

        .signup-btn {
            background-color: #f39c12;
            color: white;
        }

        /* Movie Grid */
        .movies-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .movie-card {
            width: 220px;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        .movie-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 15px;
        }

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
        .card-inner {
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            transition: transform 0.6s;
        }

        .movie-card:hover .card-inner {
            transform: rotateY(180deg);
        }

        .card-front, .card-back {
            width: 100%;
            height: 100%;
            position: absolute;
            backface-visibility: hidden;
            border-radius: 15px;
        }

        .card-front img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 15px;
        }

        .card-back {
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            font-size: 1.2rem;
            transform: rotateY(180deg);
        }

        .watch-now-btn {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #f39c12;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Carousel Section */
        .carousel-section {
            margin: 3rem 0;
        }

        .carousel-container {
            width: 100%;
            overflow: hidden;
            padding: 1rem 0;
        }

        .carousel-track {
            display: flex;
            gap: 2rem;
            animation: scroll 40s linear infinite;
        }

        .carousel-item {
            flex: 0 0 auto;
            width: 250px;
            transition: transform 0.3s;
        }
        .carousel-item-title {
            text-align: center;
            margin-top: 0.5rem;
            font-size: 1rem;
            font-weight: bold;
            color: #fff; /* or change based on your theme */
        }
        .carousel-item img {
            width: 100%;
            height: 370px;
            object-fit: cover;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        }

        @keyframes scroll {
            0% { transform: translateX(0%); }
            100% { transform: translateX(-100%); }
        }
        /* Movie Card Flip Effect */
        .movie-card {
            width: 220px;
            height: 300px;
            perspective: 1000px;
            display: inline-block;
        }

        .card-inner {
            width: 100%;
            height: 100%;
            transform-style: preserve-3d;
            transition: transform 0.6s ease-in-out;
        }

        .movie-card:hover .card-inner {
            transform: rotateY(180deg);
        }

        .card-front,
        .card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 15px;
        }

        .card-front img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
        }

        .card-back {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            transform: rotateY(180deg);
        }

        .movie-title {
            font-size: 1.5rem;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }
        /* Style for the 'Watch Now' button */
        .watch-now-button {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #FF6347; /* Tomato color */
            color: white;
            font-size: 1rem;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .watch-now-button:hover {
            background-color: #FF4500; /* Darker tomato */
        }



        footer {
            width: 100%;
            background-color: #007bff;
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
            margin-top: 20px;
        }

        a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }
    </style>
</head>
<body>

<%
    User loggedInUser = (User) session.getAttribute("user");
    String welcomeName = (loggedInUser != null) ? loggedInUser.getUsername() : null;
%>

<div class="site-header">
    <div class="logo">CineCritix</div>

    <% if (welcomeName != null) { %>
    <div class="welcome-message">Welcome, <%= welcomeName %>!</div>
    <% } else { %>
    <div class="welcome-message">Welcome to CineCritix!</div>
    <% } %>

    <div class="nav-links">
        <a href="index.jsp">Home</a>

        <div class="buttons">
            <button class="login-btn" onclick="window.location.href='Watched.jsp'">Watched Movies</button>
            <button class="login-btn" onclick="window.location.href='ShowReviews.jsp'">Reviews</button>
            <button class="login-btn" onclick="window.location.href='availableMovies.jsp'">Rent Movies</button>
            <button class="login-btn" onclick="window.location.href='profile.jsp'">Profile</button>
            <button class="signup-btn" onclick="window.location.href='login.jsp'">Logout</button>
        </div>

    </div>
</div>

<h3 style="text-align: center; margin-top: 20px;">Roll Out the Red Carpet - Your Next Movie Adventure Awaits!</h3>
<!-- Newly Arrived Section -->

<!-- Newly Arrived Section -->
<section class="carousel-section">
    <h2 style="text-align: center; font-size: 2rem; margin-top: 3rem; margin-bottom: 1rem;">Newly Arrived</h2>
    <div class="carousel-container">
        <div class="carousel-track" id="newlyArrivedTrack">
            <%
                String imagePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Newimages/";
                File folder = new File(imagePath);
                File[] listOfFiles = folder.listFiles();

                if (listOfFiles != null) {
                    for (File file : listOfFiles) {
                        if (file.isFile()) {
                            String fileName = file.getName();
                            String movieTitle = fileName.substring(0, fileName.lastIndexOf('.'));
            %>
            <div class="carousel-item">
                <img src="displayImage?filename=<%= fileName %>" alt="Movie Image">
                <div class="carousel-item-title"><%= movieTitle %></div>
            </div>
            <%
                    }
                }
            } else {
            %>
            <p>No newly arrived movies.</p>
            <%
                }
            %>
        </div>
    </div>
</section>

<h2 style="text-align: center;">Free Movie Collection</h2>
<div class="movies-container">
    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/intersteller.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Interstellar</p>
                <a href="watchMovie.jsp?movie=Interstellar" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/Inception.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Inception</p>
                <a href="watchMovie.jsp?movie=Inception" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/Tenet.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Tenet</p>
                <a href="watchMovie.jsp?movie=Tenet" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/FvsF.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Ford Vs Ferrari</p>
                <a href="watchMovie.jsp?movie=Ford%20Vs%20Ferrari" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/KGMAN.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">The King’s Man</p>
                <a href="watchMovie.jsp?movie=The%20King’s%20Man" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/POC.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Pirates of the Caribbean</p>
                <a href="watchMovie.jsp?movie=Pirates%20of%20the%20Caribbean" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/WOW.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">The Wolf of Wall Street</p>
                <a href="watchMovie.jsp?movie=The%20Wolf%20of%20Wall%20Street" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/Dun.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Dunkirk</p>
                <a href="watchMovie.jsp?movie=Dunkirk" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/MR.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">The Maze Runner</p>
                <a href="watchMovie.jsp?movie=The%20Maze%20Runner" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>

    <div class="movie-card">
        <div class="card-inner">
            <div class="card-front">
                <img src="images/PR.jpg">
            </div>
            <div class="card-back">
                <p class="movie-title">Pacific Rim</p>
                <a href="watchMovie.jsp?movie=Pacific%20Rim" class="watch-now-button">Watch Now</a>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="movie-info-modal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="movie-title"></h2>
        <p id="movie-description"></p>
    </div>
</div>





<script>
    function showMovieInfo(id) {
        const titles = ["", "Interstellar", "Inception", "Tenet", "Ford Vs Ferrari", "The King's Man", "Pirates of the Caribbean", "The Wolf of Wall Street", "Dunkirk", "The Maze Runner", "Pacific Rim"];
        const descriptions = ["", "A sci-fi space adventure through wormholes.", "A dream within a dream thriller by Nolan.", "A time-inverted espionage action movie.", "Based on the true story of Ford vs Ferrari.", "Spy action prequel with elite agents.", "Fantasy pirate saga with Jack Sparrow.", "The rise and fall of a Wall Street broker.", "A WWII survival from land, air, and sea.", "Teens race for survival in a deadly maze.", "Humans vs giant monsters using robots."];
        document.getElementById("movie-title").innerText = titles[id];
        document.getElementById("movie-description").innerText = descriptions[id];
        document.getElementById("movie-info-modal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("movie-info-modal").style.display = "none";
    }


</script>


<jsp:include page="footer.jsp" />


</body>
</html>
