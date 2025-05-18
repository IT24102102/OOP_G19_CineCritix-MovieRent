package servlets;

import models.Rent;
import service.RentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/rent")
public class RentServlet extends HttpServlet {

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
        String username = req.getParameter("username");
        String movieName = req.getParameter("movieName");

        if (username == null || username.trim().isEmpty() || movieName == null || movieName.trim().isEmpty()) {
            req.setAttribute("error", "Username and Movie Name are required!");
            req.getRequestDispatcher("availableMovies.jsp").forward(req, resp);
            return;
        }

        try {
            // Call updated addRent and get Rent object
            Rent rent = rentService.addRent(username.trim(), movieName.trim());

            // Redirect to PaymentServlet with rent details in URL parameters
            String redirectURL = String.format("payment?username=%s&movieName=%s&rentDate=%s",
                    java.net.URLEncoder.encode(rent.getUser().getUsername(), "UTF-8"),
                    java.net.URLEncoder.encode(rent.getMovie().getMovieName(), "UTF-8"),
                    java.net.URLEncoder.encode(rent.getRentDate().toString(), "UTF-8"));

            resp.sendRedirect(redirectURL);

        } catch (IOException e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to save rent data.");
            req.getRequestDispatcher("availableMovies.jsp").forward(req, resp);
        }
    }
}