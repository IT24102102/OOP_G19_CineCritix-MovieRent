package com.movie;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/addMovie")
public class AddMovieServlet extends HttpServlet {
    private MovieService movieService;

    @Override
    public void init() {
        movieService = new MovieService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");

        // Validate rating input
        double rating = 0;
        try {
            rating = Double.parseDouble(request.getParameter("rating"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid rating value");
            return;
        }

        // Check for missing fields
        if (title == null || genre == null || title.trim().isEmpty() || genre.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields");
            return;
        }

        // Create new movie object
        Movie newMovie = new Movie(title, genre, rating);

        // Add movie to the list
        movieService.addMovie(newMovie);

        // Get the updated list of movies
        List<Movie> movies = movieService.getAllMovies();

        // Set the list of movies as a request attribute
        request.setAttribute("movies", movies);

        // Forward to index.jsp to display the updated list of movies
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
