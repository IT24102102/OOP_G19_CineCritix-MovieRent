<%@ page import="models.Movie" %>
<%@ page import="utils.MovieFileUtil" %>
<%
    // Get the movie ID from the request (assuming it's passed as a query parameter)
    String movieIdParam = request.getParameter("movieId");
    Movie movie = null;

    if (movieIdParam != null) {
        // Fetch the movie details from the file based on movie ID
        int movieId = Integer.parseInt(movieIdParam);
        movie = MovieFileUtil.getMovieById(movieId);
    }
%>
<title>Update Movie Details </title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: url('images/ADNewBG.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
    }
    form {
        background: #f2f2f2;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
    }
    input, button {
        display: block;
        width: 100%;
        margin-bottom: 15px;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    label {
        margin-bottom: 5px;
        font-weight: bold;
    }
    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #5c67f2;
        text-decoration: none;
    }
</style>

<!-- Update Movie Block -->
<div class="block">
    <h2>Update Movie</h2>
    <form action="MovieServlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="action" value="updateMovie">

        <!-- Display the movie ID for the user to see -->
        <label for="movieId">Movie ID:</label>
        <input type="text" id="movieId" name="id" value="<%= movie != null ? movie.getId() : "" %>"><br><br>


        <label for="newTitle">New Title:</label>
        <input type="text" id="newTitle" name="newTitle" value="<%= movie != null ? movie.getTitle() : "" %>"><br><br>

        <label for="newDirector">New Director:</label>
        <input type="text" id="newDirector" name="newDirector" value="<%= movie != null ? movie.getDirector() : "" %>"><br><br>

        <label for="newYear">New Year:</label>
        <input type="number" id="newYear" name="newYear" value="<%= movie != null ? movie.getYear() : "" %>"><br><br>

        <label for="newImage">New Poster Image:</label>
        <input type="file" id="newImage" name="newImage"><br><br>

        <button type="submit">Update Movie</button>
    </form>
</div>
