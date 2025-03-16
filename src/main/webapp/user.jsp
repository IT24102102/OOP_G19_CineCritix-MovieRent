<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User View</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<h2>Movie Collection</h2>

<!-- Display Movie List -->
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Genre</th>
        <th>Rating</th>
        <th>Add to Watchlist</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${movies}">
        <tr>
            <td>${movie.title}</td>
            <td>${movie.genre}</td>
            <td>${movie.rating}</td>
            <td><a href="addToWatchlistServlet?id=${movie.id}">Add</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h3>Your Watchlist</h3>
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Genre</th>
        <th>Remove</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${watchlist}">
        <tr>
            <td>${movie.title}</td>
            <td>${movie.genre}</td>
            <td><a href="removeFromWatchlistServlet?id=${movie.id}">Remove</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
