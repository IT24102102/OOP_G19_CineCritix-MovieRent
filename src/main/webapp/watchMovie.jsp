<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="utils.WatchedHandler" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<html>
<head>
  <title>Watch Movie</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #121212;
      color: #ffffff;
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
      text-align: center;
    }

    h1 {
      color: #f39c12;
    }

    h2 {
      margin-top: 20px;
      color: #ffffff;
    }

    video {
      margin-top: 20px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(243, 156, 18, 0.4);
    }

    a {
      display: inline-block;
      margin-top: 30px;
      padding: 10px 20px;
      background-color: #f39c12;
      color: #121212;
      text-decoration: none;
      font-weight: bold;
      border-radius: 8px;
      transition: background-color 0.3s ease;
    }

    a:hover {
      background-color: #d68910;
    }
  </style>
</head>
<body>

<div class="header">
  <div class="logo">CineCtrix</div>
</div>

<div class="container">
  <%
    String movie = request.getParameter("movie");

    if (movie != null && !movie.trim().isEmpty()) {
      WatchedHandler.addWatchedMovie(movie);
  %>
  <h2>Now Watching: <%= movie %></h2>

  <video width="1280" height="720" controls>
    <source src="trailer?movie=<%= movie %>" type="video/mp4">
    Your browser does not support the video tag.
  </video>
  <%
  } else {
  %>
  <p>No movie selected</p>
  <%
    }
  %>

  <br>
  <a href="Watched.jsp">View Watched Movies</a>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
