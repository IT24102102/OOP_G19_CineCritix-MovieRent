package com.example;

public class Payment {
    private String paymentId;
    private double amount;
    private String paymentMethod; // e.g., "Credit Card", "Debit Card", "Cash"
    private String cardNumber; // if needed
    private boolean isSuccessful;

    public Payment(String paymentId, double amount, String paymentMethod, String cardNumber) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.isSuccessful = false;
    }

    public boolean processPayment() {
        if (paymentMethod.equalsIgnoreCase("Cash")) {
            isSuccessful = true; // Assume cash payments are always successful
        } else if (paymentMethod.equalsIgnoreCase("Credit Card") || paymentMethod.equalsIgnoreCase("Debit Card")) {
            isSuccessful = validateCard(cardNumber);
        }
        return isSuccessful;
    }

    private boolean validateCard(String cardNumber) {
        return cardNumber != null && cardNumber.length() == 16;
    }

    public void displayPaymentStatus() {
        if (isSuccessful) {
            System.out.println("Payment Successful! Thank you for your purchase.");
        } else {
            System.out.println("Payment Failed! Please check your details and try again.");
        }
    }

    // Getters and Setters if needed
}
