<%@ page import="utils.MyStack" %>
<%@ page import="utils.WatchedHandler" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Watched Movies</title>
  <style>
    body {
      background-color: #121212;
      color: #fff;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #1f1f1f;
      padding: 20px;
      text-align: center;
    }

    .logo {
      font-size: 1.8rem;
      font-weight: bold;
      color: #f39c12;
    }

    .container {
      padding: 40px;
      max-width: 800px;
      margin: auto;
    }

    h2 {
      color: #f39c12;
      margin-bottom: 20px;
    }

    ul {
      list-style-type: none;
      padding: 0;
    }

    li {
      background-color: #1e1e1e;
      padding: 15px;
      margin-bottom: 10px;
      border-radius: 8px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    form {
      display: inline;
    }

    .delete-button {
      background-color: #e74c3c;
      color: white;
      border: none;
      padding: 8px 12px;
      border-radius: 5px;
      cursor: pointer;
    }

    .delete-button:hover {
      background-color: #c0392b;
    }

    .watch-btn-container {
      text-align: center;
      margin-top: 30px;
    }

    .watch-button {
      background-color: #2980b9;
      color: white;
      padding: 12px 20px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
    }

    .watch-button:hover {
      background-color: #1c5985;
    }
  </style>
</head>
<body>

<div class="header">
  <div class="logo">CineCtrix</div>
</div>

<div class="container">
  <h2>Watched Movies</h2>

  <ul>
    <%
      MyStack watchedMoviesStack = WatchedHandler.loadWatchedMovies();

      while (!watchedMoviesStack.isEmpty()) {
        String movie = watchedMoviesStack.pop();
    %>
    <li>
      <span><%= movie %></span>
      <form action="deleteWatched" method="post">
        <input type="hidden" name="movie" value="<%= movie %>">
        <button class="delete-button" type="submit">Delete</button>
      </form>
    </li>
    <%
      }
    %>
  </ul>

  <div class="watch-btn-container">
    <form action="index.jsp" method="get">
      <button class="watch-button" type="submit">Go to Watch Movies</button>
    </form>
  </div>
</div>

</body>
</html>
