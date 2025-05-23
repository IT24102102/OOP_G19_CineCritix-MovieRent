package servlets;

import utils.WatchedHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteWatched")
public class DeleteWatchedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movie = request.getParameter("movie");

        if (movie != null && !movie.trim().isEmpty()) {
            WatchedHandler.deleteWatchedMovie(movie);
        }

        response.sendRedirect("Watched.jsp");
    }
}
