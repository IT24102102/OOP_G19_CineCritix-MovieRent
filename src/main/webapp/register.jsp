<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - CineCritix</title> <!-- Updated Title -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #121212;
      color: white;
    }

    .site-header {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 30px;
      background-color: #111;
      color: white;
      flex-wrap: wrap;
      box-sizing: border-box;
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
      color: #f39c12;
      text-decoration: none;
    }

    .search-bar input[type="text"] {
      padding: 6px 10px;
      border: none;
      border-radius: 5px;
      width: 200px;
    }

    .nav-links a {
      margin-left: 20px;
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    .nav-links a:hover {
      color: #f39c12;
    }

    .container {
      max-width: 500px;
      margin: 50px auto;
      padding: 20px;
    }

    .form-container {
      background-color: #1e1e1e;
      padding: 30px;
      border-radius: 10px;
    }

    .form-title {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
    }

    .form-control {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
    }

    .btn-primary {
      background-color: #f39c12;
      color: white;
      border: none;
      padding: 10px;
      width: 100%;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-primary:hover {
      background-color: #e67e22;
    }

    .form-footer {
      text-align: center;
      margin-top: 15px;
    }

    .alert {
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
      text-align: center;
    }

    .alert-danger {
      background-color: #e74c3c;
      color: white;
    }

    .alert-success {
      background-color: #2ecc71;
      color: white;
    }

    footer {
      width: 100%;
      background-color: #111;
      color: white;
      padding: 20px 0;
      text-align: center;
      font-size: 14px;
      border-top: 1px solid #444;
      box-sizing: border-box;
    }
  </style>
</head>

<body>
<!-- Header -->
<div class="site-header">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo">CineCritix</a>

  <div class="search-bar">
    <form action="${pageContext.request.contextPath}/search.jsp" method="get">
      <input type="text" name="query" placeholder="Search movies...">
    </form>
  </div>

  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/movies.jsp">Movies</a>
    <a href="${pageContext.request.contextPath}/tvshows.jsp">TV Shows</a>
    <a href="${pageContext.request.contextPath}/watchlist.jsp">Watchlist</a>
    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
    <a href="${pageContext.request.contextPath}/register.jsp">Sign Up</a>
  </div>
</div>

<main class="container">
  <div class="form-container">
    <h2 class="form-title">Create Your Account</h2>

    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger">
          ${errorMessage}
      </div>
    </c:if>

    <form id="registrationForm" action="${pageContext.request.contextPath}/register" method="post">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="fullName" class="form-control" required>
      </div>

      <button type="submit" class="btn btn-primary btn-block">Register</button>

      <div class="form-footer">
        Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
      </div>
    </form>
  </div>
</main>

<script src="${pageContext.request.contextPath}/js/script.js"></script>

<!-- Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
