<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - CineCritix</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
  <div class="container">
    <nav class="navbar">
      <a href="${pageContext.request.contextPath}/index.jsp" class="logo">CineCritix</a>
      <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
        <li><a href="${pageContext.request.contextPath}/register.jsp">Register</a></li>
      </ul>
    </nav>
  </div>
</header>

<main class="container">
  <div class="form-container">
    <h2 class="form-title">Login to Your Account</h2>

    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger">
          ${errorMessage}
      </div>
    </c:if>

    <c:if test="${not empty successMessage}">
      <div class="alert alert-success">
          ${successMessage}
      </div>
    </c:if>

    <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control" required>
      </div>

      <button type="submit" class="btn btn-primary btn-block">Login</button>

      <div class="form-footer">
        Don't have an account? <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
      </div>
    </form>
  </div>
</main>

<footer>
  <div class="container">
    <p>&copy; 2025 CineCritix</p>
  </div>
</footer>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>