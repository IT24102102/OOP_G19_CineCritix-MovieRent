package com.movie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("userRole", "admin");
            session.setAttribute("username", username); // Store username
            response.sendRedirect("admin/admin.jsp"); // Redirect to Admin Panel
        } else if ("user".equals(username) && "user123".equals(password)) {
            session.setAttribute("userRole", "user");
            session.setAttribute("username", username); // Store username
            response.sendRedirect("index.jsp"); // Redirect to User Dashboard
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response); // Stay on login page
        }
    }
}