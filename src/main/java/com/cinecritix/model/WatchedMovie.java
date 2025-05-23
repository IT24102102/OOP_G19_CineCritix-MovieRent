package servlets;

import utils.WatchedHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/watch")
public class WatchMovieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movie = request.getParameter("movie");

        if (movie != null && !movie.trim().isEmpty()) {
            // Save the movie to watched.txt
            WatchedHandler.addWatchedMovie(movie);
            // Set the movie name in the session
            request.getSession().setAttribute("currentMovie", movie);
        } else {
            // In case there's no movie parameter
            request.getSession().setAttribute("currentMovie", "No movie selected");
        }

        // Redirect to watchMovie.jsp to show the movie trailer
        response.sendRedirect("watchMovie.jsp");
    }
}
