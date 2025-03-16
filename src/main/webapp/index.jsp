<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- Link to CSS file -->
</head>
<body>
<h2>Movie List</h2>

<a href="addMovie.jsp">Add New Movie</a>
<br><br>

<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Genre</th>
        <th>Rating</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${movies}">
        <tr>
            <td>${movie.title}</td>
            <td>${movie.genre}</td>
            <td>${movie.rating}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
