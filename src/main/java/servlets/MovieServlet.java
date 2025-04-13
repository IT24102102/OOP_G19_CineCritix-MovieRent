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
            // Get form parameters
            int movieId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));

            // Handle file upload
            Part filePart = request.getPart("image");  // Get the file part
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get file name

            // Save the file to a specific directory (you can change this path)
            String uploadPath = "C:/Users/Tharindu/Desktop/OOP_WEb/images/";  // Folder where the images will be stored
            filePart.write(uploadPath + fileName);  // Save the file

            // Create movie object with image file name
            Movie movie = new Movie(movieId, title, director, year, fileName);

            // Save movie details to file (including image filename)
            MovieFileUtil.saveMovie(movie);

            response.sendRedirect("index.jsp");  // Redirect after saving
        }
    }
}
