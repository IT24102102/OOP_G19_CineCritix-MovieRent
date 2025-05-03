<%@ page import="models.Movie" %>
<%@ page import="utils.MovieFileUtil" %>
<%@ page import="java.util.List" %>

<%
    List<Movie> movies = MovieFileUtil.loadMovies();
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Movie</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/ADNewBG.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        h2, h3 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        input[type="number"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #5c67f2;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #4048d0;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
        }

        li {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .alert {
            background-color: #f44336;
            color: white;
            padding: 12px 15px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }

        .card.movies {
            margin-top: 40px;
            text-align: center;
        }

        .card.movies button {
            width: auto;
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delete Movie</h2>

    <!-- Delete Form -->
    <h3>Delete Movie by ID</h3>
    <form action="MovieServlet" method="POST">
        <input type="hidden" name="action" value="deleteMovieById">

        <label for="movieId">Enter Movie ID:</label>
        <input type="number" id="movieId" name="movieId" required>

        <button type="submit">Delete Movie</button>
    </form>

    <!-- Existing Movies -->
    <h3>Existing Movies</h3>
    <ul>
        <% for (Movie movie : movies) { %>
        <li><strong><%= movie.getId() %></strong> - <%= movie.getTitle() %></li>
        <% } %>
    </ul>

    <!-- Feedback Message -->
    <% if (message != null) { %>
    <div class="alert"><%= message %></div>
    <script>
        setTimeout(() => {
            document.querySelector('.alert').style.display = 'none';
        }, 3000);
    </script>
    <% } %>

    <!-- Navigation -->
    <div class="card movies">
        <h2>Manage Movies</h2>
        <button id="managemoviesBtn">Go to Manage Movies</button>
    </div>
</div>

<script>
    document.getElementById('managemoviesBtn').addEventListener('click', () => {
        window.location.href = 'managemovies.jsp';
    });
</script>
</body>
</html>
