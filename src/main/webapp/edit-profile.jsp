<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 4/12/2025
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - CineCritix</title>
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

    <div class="form-container">
        <h2 class="form-title">Edit Your Profile</h2>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                    ${successMessage}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                    ${errorMessage}
            </div>
        </c:if>

        <c:if test="${param.error eq 'delete'}">
            <div class="alert alert-danger">
                Failed to delete account. Please try again.
            </div>
        </c:if>

        <form id="profileForm" action="${pageContext.request.contextPath}/update" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-control" value="${user.username}" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
            </div>

            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" class="form-control" value="${user.fullName}" required>
            </div>

            <div class="form-group">
                <label for="password">New Password (leave blank to keep current)</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
        </form>

        <div class="delete-account">
            <h3>Danger Zone</h3>
            <p>Once you delete your account, there is no going back. Please be certain.</p>
            <form action="${pageContext.request.contextPath}/delete" method="post">
                <button type="submit" id="deleteAccountBtn" class="btn btn-danger">Delete My Account</button>
            </form>
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