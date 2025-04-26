<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - CineCritix</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header>
    <div class="container">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo">CineCritix</a>
            <ul class="nav-links">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register.jsp">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/dashboard.jsp">Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</header>

<main class="container">
    <c:if test="${param.deleted eq 'true'}">
        <div class="alert alert-success">
            Your account has been successfully deleted.
        </div>
    </c:if>

    <div style="text-align: center; margin-top: 3rem;">
        <h1>Welcome to CineCritix</h1>
        <p style="margin: 1rem 0 2rem;">A platform where you can rent your favourite movies and review them</p>

        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <div style="display: flex; gap: 1rem; justify-content: center;">
                    <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary">Login</a>
                    <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-secondary">Register</a>
                </div>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
            </c:otherwise>
        </c:choose>
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