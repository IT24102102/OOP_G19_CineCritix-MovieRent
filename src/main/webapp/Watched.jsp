<%@ page import="models.Movie" %>
<%@ page import="java.util.Stack" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Recently Watched Movies</title>
  <style>
    .movies-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
      padding: 20px;
    }
    .movie-card {
      width: 150px;
      background-color: #f9f9f9;
      border-radius: 8px;
      padding: 10px;
      text-align: center;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }
    .movie-card img {
      width: 100%;
      height: auto;
      border-radius: 4px;
    }
    .movie-title {
      margin-top: 10px;
      font-weight: bold;
    }

  </style>
</head>
<body>

<%-- Watch Button Example (should be part of each movie card elsewhere) --%>
<a href="MovieServlet?action=watchMovie&movieId=${movie.id}">Watch</a>

<%
  Stack<Movie> watchedStack = (Stack<Movie>) session.getAttribute("watchedStack");
  if (watchedStack != null && !watchedStack.isEmpty()) {
%>
<h3 style="text-align: center;">Recently Watched</h3>
<div class="movies-container">
  <% for (int i = watchedStack.size() - 1; i >= 0; i--) {
    Movie m = watchedStack.get(i);
  %>
  <div class="movie-card">
    <img src="Newimages/<%= m.getImageFileName() %>" alt="<%= m.getTitle() %>">
    <p class="movie-title"><%= m.getTitle() %></p>
  </div>
  <% } %>
</div>
<% } else { %>
<p style="text-align:center;">You haven't watched any movies yet.</p>
<% } %>

</body>
</html>
