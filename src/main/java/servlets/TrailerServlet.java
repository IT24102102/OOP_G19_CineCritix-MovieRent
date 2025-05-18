package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/trailer")
public class TrailerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get movie name from the request
        String movieName = request.getParameter("movie");

        if (movieName != null && !movieName.isEmpty()) {
            // Construct the file path to the trailer based on movie name
            String filePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Ctrailers/" + movieName + ".mp4";  // Adjust this to match your setup

            File trailerFile = new File(filePath);

            if (trailerFile.exists() && trailerFile.isFile()) {
                // Set the content type to video/mp4
                response.setContentType("video/mp4");

                // Set the content length (optional)
                response.setContentLengthLong(trailerFile.length());

                // Stream the file to the client
                try (BufferedInputStream inStream = new BufferedInputStream(new FileInputStream(trailerFile));
                     OutputStream outStream = response.getOutputStream()) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.getWriter().write("Trailer not found.");
            }
        } else {
            response.getWriter().write("Invalid movie name.");
        }
    }
}
