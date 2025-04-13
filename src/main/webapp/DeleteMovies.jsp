<%@ page import="models.Movie" %>
<%@ page import="utils.MovieFileUtil" %>
<%@ page import="java.util.List" %>

<%
    // Fetch all movies to display options for deletion
    List<Movie> movies = MovieFileUtil.loadMovies();
    String message = (String) request.getAttribute("message"); // Get the message from request
%>

<h2>Delete Movie</h2>

<!-- Block to delete a movie by ID -->
<div class="delete-movie-block">
    <h3>Delete Movie by ID</h3>
    <form action="MovieServlet" method="POST">
        <input type="hidden" name="action" value="deleteMovieById">

        <label for="movieId">Enter Movie ID:</label>
        <input type="number" id="movieId" name="movieId" required><br><br>

        <button type="submit">Delete Movie</button>
    </form>
</div>

<h3>Existing Movies:</h3>
<ul>
    <% for (Movie movie : movies) { %>
    <li><%= movie.getId() %> - <%= movie.getTitle() %></li>
    <% } %>
</ul>

<!-- Display the message if it exists -->
<% if (message != null) { %>
<div class="alert">
    <%= message %>
</div>
<script>
    setTimeout(function() {
        document.querySelector('.alert').style.display = 'none';
    }, 3000); // Hide the message after 3 seconds
</script>
<% } %>

<!-- Optional: Styling for the message -->
<style>
    .alert {
        background-color: #f44336; /* Red */
        color: white;
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 4px;
    }
</style>
