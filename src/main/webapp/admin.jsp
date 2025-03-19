<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.Movie" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("admin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("adminLogin.jsp"); // Redirect to login if not admin
        return;
    }

    // Assuming movies are stored in session (Modify this if using a database)
    List<Movie> movies = (List<Movie>) session.getAttribute("movies");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<h2>Admin Panel - Manage Movies</h2>

<a href="addMovie.jsp">Add New Movie</a> |
<a href="LogoutServlet">Logout</a>
<br><br>

<!-- Display Movie List -->
<table border="1">
    <thead>
    <tr>
        <th>Image</th>
        <th>Title</th>
        <th>Genre</th>
        <th>Rating</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="<%= movies %>">
        <tr>
            <td><img src="${movie.imageUrl}" alt="Movie Poster" width="100"></td>
            <td>${movie.title}</td>
            <td>${movie.genre}</td>
            <td>${movie.rating}</td>
            <td>
                <a href="editMovie.jsp?id=${movie.id}">Edit</a> |
                <a href="deleteMovieServlet?id=${movie.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="LogoutServlet" style="color: red; font-weight: bold;">Logout</a> <!-- Logout link -->
</body>
</html>
