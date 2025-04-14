package com.example.servlet;

import com.example.model.Rental;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/RentalServlet")
public class RentalServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        // Set the file path using the web application's real path
        String realPath = getServletContext().getRealPath("/WEB-INF/rentals.txt");
        Rental.setFilePath(realPath);
        System.out.println("RentalServlet initialized with file path: " + realPath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("RentalServlet doPost action: " + action);

        try {
            if ("rent".equals(action)) {
                // Rent a movie
                int rentalId = Integer.parseInt(request.getParameter("rentalId"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                String rentalDate = request.getParameter("rentalDate");

                System.out.println("Creating rental: " + rentalId + ", " + userId + ", " + movieId + ", " + rentalDate);

                // Create rental
                Rental rental = new Rental(rentalId, userId, movieId, rentalDate);
                Rental.createRental(rental);

                // Store rental in session for confirmation
                request.getSession().setAttribute("lastRental", rental);
                response.sendRedirect("rentalSuccess.jsp");

            } else if ("return".equals(action)) {
                // Return a movie
                int rentalId = Integer.parseInt(request.getParameter("rentalId"));
                boolean isDeleted = Rental.deleteRental(rentalId);

                if (isDeleted) {
                    HttpSession session = request.getSession();
                    session.setAttribute("message", "Movie returned successfully.");
                    response.sendRedirect("returnSuccess.jsp");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("error", "Rental ID not found. Return failed.");
                    response.sendRedirect("returnSuccess.jsp");
                }

            } else if ("update".equals(action)) {
                // Update rental date
                int rentalId = Integer.parseInt(request.getParameter("rentalId"));
                String newDate = request.getParameter("rentalDate");
                System.out.println("Updating rental: " + rentalId + " with date: " + newDate);

                boolean isUpdated = Rental.updateRentalDate(rentalId, newDate);

                // Redirect based on success or failure
                if (isUpdated) {
                    request.getSession().setAttribute("message", "Rental date updated successfully.");
                    response.sendRedirect("RentalServlet"); // Redirect to GET method to display all rentals
                } else {
                    request.getSession().setAttribute("error", "Failed to update rental date.");
                    response.sendRedirect("RentalServlet");
                }
            } else if ("delete".equals(action)) {
                // Delete rental
                int rentalId = Integer.parseInt(request.getParameter("rentalId"));
                boolean isDeleted = Rental.deleteRental(rentalId);

                if (isDeleted) {
                    request.getSession().setAttribute("message", "Rental deleted successfully.");
                } else {
                    request.getSession().setAttribute("error", "Failed to delete rental.");
                }
                response.sendRedirect("RentalServlet");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input: " + e.getMessage());
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            System.err.println("Error in RentalServlet: " + e.getMessage());
            e.printStackTrace();
            request.getSession().setAttribute("error", "An error occurred: " + e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("RentalServlet doGet - fetching all rentals");
        List<Rental> rentals = Rental.getAllRentals();
        request.setAttribute("rentals", rentals);
        request.getRequestDispatcher("rentedMovies.jsp").forward(request, response);
    }
}