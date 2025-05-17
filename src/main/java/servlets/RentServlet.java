package servlets;

import controller.RentController;
import models.Movie;
import models.Clients;
import javax.servlet.ServletException;
import service.MovieService;
import service.RentService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/RentServlet")
public class RentServlet extends HttpServlet {

    private RentController rentController;
    private RentService rentService;

    @Override
    public void init() throws ServletException {
        String rentFilePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CRent.txt";
        File rentFile = new File(rentFilePath);
        if (!rentFile.exists()) {
            try {
                rentFile.createNewFile();  // create if not exist
            } catch (IOException e) {
                throw new ServletException("Could not create Rent.txt file", e);
            }
        }
        rentService = new RentService(rentFilePath);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form parameters
        String username = req.getParameter("username");
        String movieName = req.getParameter("movieName");

        if (username == null || username.trim().isEmpty() || movieName == null || movieName.trim().isEmpty()) {
            req.setAttribute("error", "Username and Movie Name are required!");
            req.getRequestDispatcher("availableMovies.jsp").forward(req, resp);
            return;
        }

        try {
            rentService.addRent(username.trim(), movieName.trim());

            // Redirect to payment page with rent info as URL params
            String redirectURL = String.format("payment.jsp?username=%s&movieName=%s",
                    java.net.URLEncoder.encode(username, "UTF-8"),
                    java.net.URLEncoder.encode(movieName, "UTF-8"));
            resp.sendRedirect(redirectURL);

        } catch (IOException e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to save rent data.");
            req.getRequestDispatcher("availableMovies.jsp").forward(req, resp);
        }
    }
}
