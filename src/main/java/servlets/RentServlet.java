package servlets;

import controller.RentController;
import models.Movie;
import models.Clients;
import javax.servlet.ServletException;
import service.MovieService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/RentServlet")
public class RentServlet extends HttpServlet {
    private RentController rentController;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        // Initialize UserService to authenticate clients
        userService = new UserService();

        // Initialize RentController with available movies (loaded from MovieService)
        List<Movie> movies = loadMovies();  // Use getAllMovies() here
        rentController = new RentController(movies);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String movieId = request.getParameter("movieId");

        // Authenticate the user (client)
        Clients client = (Clients) userService.authenticate(email, password);

        if (client == null) {
            // If authentication fails, show an error message
            request.setAttribute("message", "Authentication failed.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Process the rental for the authenticated client
        String message = rentController.rentMovie(client, movieId);

        // Set the message and forward to a confirmation page
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("rent.jsp");
        dispatcher.forward(request, response);
    }

    private List<Movie> loadMovies() {
        // Use the correct method from MovieService
        MovieService movieService = new MovieService();
        return movieService.getAllMovies();  // Get all movies using the correct method
    }
}
