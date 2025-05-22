<%@ page import="java.util.*, java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  class Movie {
    String title;
    String author;
    String image;
    Date watchedDate;

    Movie(String title, String author, String image, Date watchedDate) {
      this.title = title;
      this.author = author;
      this.image = image;
      this.watchedDate = watchedDate;
    }
  }

  // Sample movie list (in memory)
  List<Movie> watchedMovies = new ArrayList<>();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  watchedMovies.add(new Movie("Inception", "Christopher Nolan", "inception.jpg", sdf.parse("2025-05-01")));
  watchedMovies.add(new Movie("Interstellar", "Christopher Nolan", "interstellar.jpg", sdf.parse("2025-04-20")));
  watchedMovies.add(new Movie("Ford Vs Ferrari", "James Mangold", "fordvsferrari.jpg", sdf.parse("2025-03-15")));
%>

<html>
<head>
  <title>Watched List - CineCritix</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-image: url('background.jpg');
      background-size: cover;
      background-attachment: fixed;
      padding: 0 50px; /* Left and right spacing */
    }

    .container {
      max-width: 1000px;
      margin: 50px auto;
      background-color: rgba(255, 255, 255, 0.85);
      padding: 30px;
      border-radius: 12px;
    }

    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 30px;
    }

    .movie-card {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      background: #fff;
      border-radius: 10px;
      margin: 30px 0;
      padding: 15px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .movie-card img {
      width: 120px;
      height: 180px;
      border-radius: 8px;
      object-fit: cover;
      margin-right: 20px;
    }

    .movie-info {
      flex-grow: 1;
    }

    .movie-info h2 {
      margin: 0 0 10px 0;
      font-size: 20px;
    }

    .movie-info p {
      margin: 4px 0;
    }

    .delete-button {
      background-color: #e74c3c;
      color: white;
      border: none;
      padding: 10px 14px;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .delete-button:hover {
      background-color: #c0392b;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Your Watched Movies</h1>



  <%
    for (Movie movie : watchedMovies) {
  %>
  <div class="movie-card">
    <img src="images/<%= movie.image %>" alt="<%= movie.title %>">
    <div class="movie-info">
      <h2><%= movie.title %></h2>
      <p><strong>Author:</strong> <%= movie.author %></p>
      <p><strong>Watched Date:</strong> <%= sdf.format(movie.watchedDate) %></p>
    </div>
    <form method="post" action="delete-movie">
      <input type="hidden" name="title" value="<%= movie.title %>">
      <button class="delete-button">Delete</button>
    </form>
  </div>
  <%
    }
  %>
</div>
</body>
</html>
