package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/images/*") // Catch all requests starting with /images/
public class ImageServlet extends HttpServlet {

    // Your real folder where images are stored
    private static final String IMAGES_DIR = "C:/Users/Tharindu/Desktop/OOP_WEb/images/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedImage = request.getPathInfo(); // Example: /movieposter.png

        if (requestedImage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 if no file specified
            return;
        }

        File imageFile = new File(IMAGES_DIR, requestedImage);

        if (!imageFile.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 if file not found
            return;
        }

        // Set content type based on file
        String mime = getServletContext().getMimeType(imageFile.getName());
        if (mime == null) {
            mime = "application/octet-stream"; // Default binary
        }
        response.setContentType(mime);

        // Copy the file to response output
        try (FileInputStream in = new FileInputStream(imageFile);
             OutputStream out = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
