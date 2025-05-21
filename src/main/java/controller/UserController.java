package controller;

import models.User;
import models.Clients;
import models.Admin;
import service.UserService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = {"/register", "/login"})
public class UserController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {

        userService = new UserService(); //  Passing context (For future, when merging the clz)
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/register":
                handleRegister(request, response);
                break;
            case "/login":
                handleLogin(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Invalid action");
        }
    }

    // Handle user registration
    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");

        // Client object Cretion
        User newUser = new Clients(username, email, password, fullName, phoneNumber);

        boolean isRegistered = userService.registerUser(newUser);

        if (isRegistered) {
            request.setAttribute("successMessage", "Registration successful! Please login.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Username or email already exists.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    // Handle the user login
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        User loggedInUser = userService.authenticate(username, password);

        if (loggedInUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", loggedInUser);

            if (loggedInUser instanceof Admin) {
                response.sendRedirect("adminHome.jsp"); // Redirecting to Admin dashboard
            } else {
                response.sendRedirect("index.jsp"); // Home page if we are login as a user,,
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
