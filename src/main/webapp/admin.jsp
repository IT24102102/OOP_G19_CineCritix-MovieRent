<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("userRole");
    if (!"admin".equals(role)) {
        response.sendRedirect("../index.jsp"); // Redirect if not admin
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<h2>Admin Panel - Manage Movies</h2>

<a href="addMovie.jsp">Add New Movie</a>
<br><br>

<!-- Display Movie List -->
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Genre</th>
        <th>Rating</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="movie" items="${movies}">
        <tr>
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
</body>
</html>
