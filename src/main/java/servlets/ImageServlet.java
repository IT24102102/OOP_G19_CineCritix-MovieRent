package servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig
public class ImageServlet extends HttpServlet {

    private static final String SAVE_DIR = "C:/Users/Tharindu/Desktop/OOP_WEb/Nimages/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the file part from the request
        Part filePart = request.getPart("image"); // "image" is the name attribute in your form input

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getFileName(filePart);

            // Create folder if it doesn't exist
            File saveDir = new File(SAVE_DIR);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            // Save the file
            File file = new File(SAVE_DIR + fileName);
            Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            response.getWriter().println("Image uploaded successfully!");
        } else {
            response.getWriter().println("No image file selected.");
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

