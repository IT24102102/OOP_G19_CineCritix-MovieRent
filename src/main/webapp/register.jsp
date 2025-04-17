<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - CineCritix</title>
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
        <h2 class="form-title">Create an Account</h2>

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

<footer>
    <div class="container">
        <p>&copy; 2025 CineCritix</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>