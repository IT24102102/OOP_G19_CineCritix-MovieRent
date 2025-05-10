<%--
  Created by IntelliJ IDEA.
  User: Tharindu
  Date: 5/10/2025
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    session.invalidate();  // Invalidate the session to log out
    response.sendRedirect("index.jsp");  // Redirect to home page after logging out
%>

