package com.example.servlet;

import com.example.model.Rental;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RentalServlet")
public class RentalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rentalId = Integer.parseInt(request.getParameter("rentalId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String rentalDate = request.getParameter("rentalDate");

        Rental rental = new Rental(rentalId, userId, movieId, rentalDate);
        Rental.createRental(rental);

        // Absolute path including context path
        response.sendRedirect(request.getContextPath() + "/rentalConfirmation.jsp?rentalId=" + rentalId
                + "&userId=" + userId
                + "&movieId=" + movieId
                + "&rentalDate=" + rentalDate);

        response.sendRedirect("rentalSuccess.jsp");



    }
}



