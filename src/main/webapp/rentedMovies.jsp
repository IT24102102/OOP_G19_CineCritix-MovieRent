<%@ page import="com.example.model.Rental" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Rental" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Rental> rentals = (List<Rental>) request.getAttribute("rentalList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Rented Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="container mt-5">
<h2>📋 Rented Movies</h2>

<% if (rentals != null && !rentals.isEmpty()) { %>
<table class="table table-bordered mt-3">
    <thead class="table-light">
    <tr>
        <th>Rental ID</th>
        <th>User ID</th>
        <th>Movie ID</th>
        <th>Rental Date</th>
    </tr>
    </thead>
    <tbody>
    <% for (Rental r : rentals) { %>
    <tr>
        <td><%= r.getRentalId() %></td>
        <td><%= r.getUserId() %></td>
        <td><%= r.getMovieId() %></td>
        <td><%= r.getRentalDate() %></td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<p>No rentals found.</p>
<% } %>
</body>
</html>
