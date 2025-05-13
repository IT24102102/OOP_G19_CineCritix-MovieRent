<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Rent a Movie</title>
</head>
<body>
<h1>Rent a Movie</h1>

<!-- Movie Rental Form -->
<form action="RentServlet" method="post">
  <label for="email">Your Email:</label>
  <input type="email" id="email" name="email" required>
  <br><br>

  <label for="movieId">Select Movie:</label>
  <select id="movieId" name="movieId" required>
    <c:forEach var="movie" items="${movies}">
      <option value="${movie.id}">${movie.title}</option>
    </c:forEach>
  </select>
  <br><br>

  <input type="submit" value="Rent Movie">
</form>

<!-- Message display after form submission -->
<c:if test="${not empty message}">
  <p>${message}</p>
</c:if>
</body>
</html>
