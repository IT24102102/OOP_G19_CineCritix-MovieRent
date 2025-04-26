package servlets;

import models.Movie;
import utils.MovieFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10) // 10MB

public class MovieServlet extends HttpServlet {

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
            Part filePart = request.getPart("image");  // Get the file part
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get file name

            // Save the file to a specific directory
            String uploadPath = "C:/Users/Tharindu/Desktop/OOP_WEb/Nimages/";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Create directory if not exist
            }
            filePart.write(uploadPath + fileName);  // Save the file

            // Create movie object with image file name
            Movie movie = new Movie(movieId, title, director, year, fileName);
            MovieFileUtil.saveMovie(movie);  // Save movie details (including image file name)

            response.sendRedirect("index.jsp");

        } else if ("updateMovie".equals(action)) {
            // Get form parameters for updating a movie
            int id = Integer.parseInt(request.getParameter("id"));
            String newTitle = request.getParameter("newTitle");
            String newDirector = request.getParameter("newDirector");
            int newYear = Integer.parseInt(request.getParameter("newYear"));

            // Handle the new image if uploaded
            Part newImagePart = request.getPart("newImage");
            String newImageFileName = newImagePart != null ? Paths.get(newImagePart.getSubmittedFileName()).getFileName().toString() : null;

            // Fetch the movie by ID to update it
            Movie movie = MovieFileUtil.getMovieById(id);

            if (movie != null) {
                // Update the movie fields
                movie.setTitle(newTitle);
                movie.setDirector(newDirector);
                movie.setYear(newYear);

                // If a new image is uploaded, save it and update the movie
                if (newImageFileName != null && !newImageFileName.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("/") + "Nimages/";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    newImagePart.write(uploadPath + newImageFileName);

                    movie.setImageFileName(newImageFileName);
                }

                // Save the updated movie (overwrite the file with updated list)
                MovieFileUtil.saveMovie(movie);

                // Redirect back to the movie list or confirmation page
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().println("Movie not found!");
            }

        } else if ("deleteMovieById".equals(action)) {
            // Delete movie by ID
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            boolean isDeleted = MovieFileUtil.deleteMovieById(movieId);

            if (isDeleted) {
                // Set success message in the request
                request.setAttribute("message", "Movie deleted successfully!");
            } else {
                // Set failure message in the request
                request.setAttribute("message", "Movie not found.");
            }

            // Forward the request to the delete.jsp page
            request.getRequestDispatcher("DeleteMovies.jsp").forward(request, response);
        }

    }
}