<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/12/2025
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - CineCritix</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
  <div class="container">
    <nav class="navbar">
      <a href="${pageContext.request.contextPath}/index.jsp" class="logo">CineCritix</a>
      <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/dashboard.jsp">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
      </ul>
    </nav>
  </div>
</header>

<main class="container">
  <c:if test="${empty sessionScope.user}">
    <c:redirect url="/login.jsp"/>
  </c:if>

  <div class="dashboard">
    <div class="dashboard-header">
      <h2>Welcome, ${sessionScope.user.fullName}!</h2>
    </div>

    <div class="user-info">
      <h3>Your Account Information</h3>

      <div class="info-item">
        <span class="info-label">Username:</span>
        <span>${sessionScope.user.username}</span>
      </div>

      <div class="info-item">
        <span class="info-label">Email:</span>
        <span>${sessionScope.user.email}</span>
      </div>

      <div class="info-item">
        <span class="info-label">Full Name:</span>
        <span>${sessionScope.user.fullName}</span>
      </div>
    </div>

    <div class="action-buttons">
      <a href="${pageContext.request.contextPath}/profile" class="btn btn-primary">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/logout" class="btn btn-secondary">Logout</a>
    </div>
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
