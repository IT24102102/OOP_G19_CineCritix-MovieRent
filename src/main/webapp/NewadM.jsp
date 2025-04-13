<%@ page import="java.util.List" %>
<%@ page import="models.Movie" %>
<%@ page import="utils.MovieFileUtil" %>
<jsp:include page="header.jsp" /> <!-- Include your header if you have one -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Newly Added Movies</title>
  <link rel="stylesheet" href="css/styles.css"> <!-- Link your external CSS -->

  <style>
    /* Scrollable Page */
    body {
      background-color: #0055fd;
      color: white;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
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
      width: 200px;
      border-radius: 15px;
      overflow: hidden;
      position: relative;
      box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
      transition: transform 0.3s ease-in-out;
      cursor: pointer;
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
  </style>

</head>
<body>

<h2 style="text-align: center; margin-top: 20px;">Newly Added Movies</h2>

<div class="movies-container">
  <%
    // Load the list of movies from the file
    List<Movie> movies = MovieFileUtil.loadMovies();

    // Check if movies exist, otherwise show a message
    if (movies.isEmpty()) {
  %>
  <p style="text-align: center;">No movies added yet!</p>
  <%
  } else {
    for (Movie movie : movies) {
  %>
  <div class="movie-card" onclick="showMovieInfo('<%= movie.getId() %>')">
    <img src="<%= request.getContextPath() + "/Adimages/" + movie.getImageFileName() %>" alt="<%= movie.getTitle() %>">
    <p class="movie-title"><%= movie.getTitle() %></p>
  </div>
  <%
      }
    }
  %>
</div>

<script>
  function showMovieInfo(movieId) {
    window.location.href = "movieInfo.jsp?movieId=" + movieId;
  }
</script>

</body>
</html>
