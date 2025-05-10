<%@ page import="models.Review" %>
<%@ page import="service.MovieService" %>
<%@ page import="service.ReviewService" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Submit a Review</title>
  <style>
    body {
      background-image: url("images/BG.jpg");
      background-size: cover;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    form {
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
      max-width: 500px;
      margin: 60px auto;
    }
    input, select, button {
      display: block;
      width: 100%;
      margin-bottom: 15px;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 16px;
    }
    label {
      font-weight: bold;
    }
    .rating {
      display: flex;
      flex-direction: row-reverse;
      justify-content: center;
    }
    .rating input {
      display: none;
    }
    .rating label {
      cursor: pointer;
      font-size: 30px;
      color: #ccc;
    }
    .rating input:checked ~ label,
    .rating label:hover,
    .rating label:hover ~ label {
      color: #fac104;
    }
  </style>
</head>
<body>

<%
  // Initialize message variable
  String message = "";

  // Get the submitted flag from the form
  String submitted = request.getParameter("submitted");

  if ("true".equals(submitted)) {
    String username = request.getParameter("username").trim();
    String movieName = request.getParameter("movieName").trim();
    String ratingStr = request.getParameter("rating");

    // Validate form inputs
    if (username != null && movieName != null && ratingStr != null &&
            !username.isEmpty() && !movieName.isEmpty() && !ratingStr.isEmpty()) {

      // Parse the rating
      double rating = Double.parseDouble(ratingStr);
      Review review = new Review(username, movieName, rating);

      // Use MovieService to validate the movie name
      MovieService movieService = new MovieService();
      if (movieService.isValidMovie(movieName)) {
        // Save the review using ReviewService
        ReviewService reviewService = new ReviewService();
        reviewService.saveReview(review);
        message = "<p style='color: green;'>Review submitted successfully!</p>";
      } else {
        message = "<p style='color: red;'>Invalid movie name. Please choose a valid movie.</p>";
      }
    } else {
      message = "<p style='color: red;'>Please fill all fields.</p>";
    }
  }
%>

<form method="post" action="SubmitReview.jsp">
  <input type="hidden" name="submitted" value="true">
  <h2 style="text-align: center;">Submit Your Review</h2>

  <label for="username">Username:</label>
  <input type="text" name="username" id="username" required>

  <label for="movieName">Select Movie:</label>
  <select name="movieName" id="movieName" required>
    <option value="">-- Choose a movie --</option>
    <%
      MovieService movieService = new MovieService();
      List<Movie> movieList = movieService.getAllMovies(); // Get all movies
      for (Movie movie : movieList) {
    %>
    <option value="<%= movie.getMovieName() %>"><%= movie.getMovieName() %></option>
    <%
      }
    %>
  </select>

  <label for="rating">Rating:</label>
  <div class="rating">
    <input type="radio" id="star5" name="rating" value="5" required><label for="star5">&#9733;</label>
    <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
    <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
    <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
    <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
  </div>

  <button type="submit">Submit Review</button>
  <%= message %>
</form>

<button class="button" onclick="window.location.href='ShowReviews.jsp'">View Reviews</button>

</body>
</html>
