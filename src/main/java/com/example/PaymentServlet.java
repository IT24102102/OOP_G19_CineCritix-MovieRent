package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");

        // Create Payment object
        Payment payment = new Payment(paymentId, amount, paymentMethod, cardNumber);
        boolean success = payment.processPayment();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (success) {
            out.println("<h1>Payment Successful!</h1>");
        } else {
            out.println("<h1>Payment Failed. Please check your details.</h1>");
        }
    }
}
