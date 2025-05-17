<%@ page import="models.Movie, java.util.List, models.Clients" %>
<%
    Clients loggedInUser = (Clients) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rent a Movie - CineCritix</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/BG.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            color: white;
        }
        .overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 10px #000;
        }
        h2 {
            text-align: center;
            color: #f39c12;
            margin-bottom: 20px;
        }
        select, .btn-rent {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            font-size: 16px;
            border-radius: 8px;
            border: none;
        }
        select {
            background-color: #fff;
            color: #333;
        }
        .btn-rent {
            background-color: #f39c12;
            color: white;
            cursor: pointer;
        }
        .btn-rent:hover {
            background-color: #e67e22;
        }
        .message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: #2ecc71;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<div class="container">
    <h2>Rent a Movie</h2>

    <form action="RentServlet" method="post">
        <label for="movieName">Select Movie:</label>
        <select name="movieName" id="movieName" required>
            <option value="" disabled selected>-- Choose a Movie --</option>
            <% if (movies != null && !movies.isEmpty()) {
                for (Movie movie : movies) { %>
            <option value="<%= movie.getMovieName() %>"><%= movie.getMovieName() %></option>
            <%  }
            } else { %>
            <option value="">No movies available</option>
            <% } %>
        </select>

        <button type="submit" class="btn-rent">Rent Now</button>
    </form>

    <% if (message != null) { %>
    <div class="message"><%= message %></div>
    <% } %>
</div>
</body>
</html>
