package servlets;

import models.Payment;
import models.Rent;
import service.PaymentService;
import utils.RentFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private PaymentService paymentService = new PaymentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get username, movieName, rentDate params to fetch Rent and show in form
        String username = req.getParameter("username");
        String movieName = req.getParameter("movieName");
        String rentDateStr = req.getParameter("rentDate");

        if (username == null || movieName == null || rentDateStr == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
            return;
        }

        LocalDate rentDate = LocalDate.parse(rentDateStr);

        Rent rent = RentFileUtil.findRent(username, movieName, rentDate);
        if (rent == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Rent record not found");
            return;
        }

        // Pass rent to JSP for showing rentId, username, movieName
        req.setAttribute("rent", rent);
        req.getRequestDispatcher("payment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Process payment form submission

        String rentId = req.getParameter("rentId");
        String username = req.getParameter("username");
        String movieName = req.getParameter("movieName");
        String rentDateStr = req.getParameter("rentDate");

        String amountStr = req.getParameter("amount");
        String paymentMethod = req.getParameter("paymentMethod");
        String cardNumber = req.getParameter("cardNumber");
        String cardType = req.getParameter("cardType");
        String cvv = req.getParameter("cvv");

        if (rentId == null || username == null || movieName == null || rentDateStr == null
                || amountStr == null || paymentMethod == null || cardNumber == null || cardType == null || cvv == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing form fields");
            return;
        }

        LocalDate rentDate = LocalDate.parse(rentDateStr);
        Rent rent = new Rent(rentId, new models.User(username), new models.Movie(movieName), rentDate);
        double amount = Double.parseDouble(amountStr);
        LocalDate paymentDate = LocalDate.now();

        // Create payment ID
        String paymentId = "P" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        Payment payment = new Payment(paymentId, rent, amount, paymentDate,
                paymentMethod, cardNumber, cardType, cvv);

        paymentService.savePayment(payment);

        // After successful payment, redirect to success page or confirmation
        resp.sendRedirect("paymentSuccess.jsp");
    }
}
