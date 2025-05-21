package servlets;

import models.Movie;
import utils.MovieFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import utils.MyStack;
import java.util.Stack;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10) // 10MB

public class MovieServlet extends HttpServlet {
    private static final String IMAGE_UPLOAD_PATH = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Newimages/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("addMovie".equals(action)) {
            // Get form parameters for adding a movie
            int movieId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));

            // Handle file upload
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Saving the File
            saveImage(filePart, fileName);

            // Create movie object with image file name
            Movie movie = new Movie(movieId, title, director, year, fileName);
            MovieFileUtil.saveMovie(movie);

            response.sendRedirect("NewadM.jsp");

        } else if ("updateMovie".equals(action)) {
            // Get form parameters for updating a movie
            int id = Integer.parseInt(request.getParameter("id"));
            String newTitle = request.getParameter("newTitle");
            String newDirector = request.getParameter("newDirector");
            int newYear = Integer.parseInt(request.getParameter("newYear"));

            // Handle the new image if uploaded
            Part newImagePart = request.getPart("newImage");
            String newImageFileName = (newImagePart != null) ? Paths.get(newImagePart.getSubmittedFileName()).getFileName().toString() : null;

            // Fetch the movie by ID
            Movie movie = MovieFileUtil.getMovieById(id);

            if (movie != null) {
                // Update fields
                movie.setTitle(newTitle);
                movie.setDirector(newDirector);
                movie.setYear(newYear);

                // If new image uploaded, save and update filename
                if (newImageFileName != null && !newImageFileName.isEmpty()) {
                    saveImage(newImagePart, newImageFileName);
                    movie.setImageFileName(newImageFileName);
                }

                // Save the updated movie
                MovieFileUtil.saveMovie(movie);

                response.sendRedirect("NewadM.jsp");
            } else {
                response.getWriter().println("Movie not found!");
            }

        } else if ("deleteMovieById".equals(action)) {
            // Delete movie by ID
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            boolean isDeleted = MovieFileUtil.deleteMovieById(movieId);

            if (isDeleted) {
                request.setAttribute("message", "Movie deleted successfully!");
            } else {
                request.setAttribute("message", "Movie not found.");
            }

            request.getRequestDispatcher("DeleteMovies.jsp").forward(request, response);
        }
    }

    private void saveImage(Part part, String fileName) throws IOException {
        File uploadDir = new File(IMAGE_UPLOAD_PATH);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // Create directory if it doesn't exist
        }
        part.write(IMAGE_UPLOAD_PATH + fileName);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("watchMovie".equals(action)) {
            // Get the movie ID from the request
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            Movie movie = MovieFileUtil.getMovieById(movieId);

            if (movie != null) {
                // Get the current session or create a new one
                HttpSession session = request.getSession();

                MyStack watchedStack = (MyStack) session.getAttribute("watchedStack");

                if (watchedStack == null) {
                    watchedStack = new MyStack(5); // Max 5 recent movies
                }

// Avoid duplicates manually (optional logic not built-in)
                String currentTitle = movie.getTitle(); // or use getId() for uniqueness
                boolean alreadyWatched = false;
                for (int i = 0; i < watchedStack.size(); i++) {
                    if (watchedStack.pop().equals(currentTitle)) {
                        alreadyWatched = true;
                        break;
                    }
                }
                if (!alreadyWatched) {
                    watchedStack.push(currentTitle);
                }

// Save back to session
                session.setAttribute("watchedStack", watchedStack);


                // Forward the movie details to the 'viewMovie.jsp' for displaying
                request.setAttribute("movie", movie);
                request.getRequestDispatcher("viewMovie.jsp").forward(request, response);
            } else {
                response.getWriter().println("Movie not found.");
            }
        }
    }
}