<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/12/2025
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - CineCritix</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .error-container {
            text-align: center;
            padding: 50px;
            margin: 50px auto;
            max-width: 600px;
            background-color: indianred;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .error-code {
            font-size: 72px;
            color: #dc3545;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .error-details {
            margin-bottom: 30px;
            color: #6c757d;
            font-style: italic;
        }
    </style>
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
    <div class="error-container">
        <div class="error-code">
            <c:choose>
                <c:when test="${pageContext.errorData.statusCode eq 404}">404</c:when>
                <c:when test="${pageContext.errorData.statusCode eq 500}">500</c:when>
                <c:otherwise>Error</c:otherwise>
            </c:choose>
        </div>

        <div class="error-message">
            <c:choose>
                <c:when test="${pageContext.errorData.statusCode eq 404}">Page Not Found</c:when>
                <c:when test="${pageContext.errorData.statusCode eq 500}">Internal Server Error</c:when>
                <c:otherwise>Something went wrong</c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty pageContext.exception}">
            <div class="error-details">
                    ${pageContext.exception.message}
            </div>
        </c:if>

        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Back to Home</a>
    </div>
</main>

<footer>
    <div class="container">
        <p>&copy; CineCritix</p>
    </div>
</footer>
</body>
</html>