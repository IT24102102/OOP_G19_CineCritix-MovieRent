<%@ page import="java.util.*, com.example.model.Rental" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Rented Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>📋 All Rented Movies</h2>

<%-- Display messages if any --%>
<%
    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
    if (message != null) {
%>
<div class="alert alert-success">
    <%= message %>
</div>
<%
        session.removeAttribute("message");
    }
    if (error != null) {
%>
<div class="alert alert-danger">
    <%= error %>
</div>
<%
        session.removeAttribute("error");
    }
%>

<%
    // If rentals attribute is not set, get them directly
    List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");
    if (rentals == null) {
        rentals = Rental.getAllRentals();
        request.setAttribute("rentals", rentals);
    }
%>

<% if (rentals != null && !rentals.isEmpty()) { %>
<table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
        <th>Rental ID</th>
        <th>User ID</th>
        <th>Movie ID</th>
        <th>Rental Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Rental r : rentals) { %>
    <tr>
        <td><%= r.getRentalId() %></td>
        <td><%= r.getUserId() %></td>
        <td><%= r.getMovieId() %></td>
        <td><%= r.getRentalDate() %></td>
        <td>
            <!-- Update Form -->
            <form action="RentalServlet" method="post" class="d-inline-block me-2">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="rentalId" value="<%= r.getRentalId() %>">
                <input type="date" name="rentalDate" required>
                <button type="submit" class="btn btn-warning btn-sm">Update</button>
            </form>

            <!-- Delete Form -->
            <form action="RentalServlet" method="post" class="d-inline-block">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="rentalId" value="<%= r.getRentalId() %>">
                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
            </form>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% } else { %>
<div class="alert alert-info">
    No rentals found. <a href="rentMovie.jsp" class="alert-link">Rent a movie now</a>.
</div>
<% } %>

<div class="mt-4">
    <a href="rentMovie.jsp" class="btn btn-primary">Rent a Movie</a>
</div>
</body>
</html>