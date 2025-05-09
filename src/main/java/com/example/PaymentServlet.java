package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String subscriptionType = request.getParameter("subscriptionType");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String paypalUsername = request.getParameter("paypalUsername");

        PaymentDetails payment = new PaymentDetails(subscriptionType, duration, paymentMethod, cardNumber, paypalUsername);
        Invoice invoice = new Invoice(payment);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println(invoice.generateInvoice());
    }
}
