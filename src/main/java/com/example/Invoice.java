package com.example;

public class Invoice {
    private PaymentDetails payment;

    public Invoice(PaymentDetails payment) {
        this.payment = payment;
    }

    public String generateInvoice() {
        return "<h2>----- Invoice -----</h2>" +
                "<p>Subscription Type: " + payment.getSubscriptionType() + "</p>" +
                "<p>Duration: " + payment.getDuration() + "</p>" +
                "<p>Payment Method: " + payment.getPaymentMethod() + "</p>" +
                "<p>Details: " + payment.getMaskedDetails() + "</p>" +
                "<p>Total: LKR " + payment.calculateTotal() + "</p>";
    }
}
