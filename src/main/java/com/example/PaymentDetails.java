package com.example;

public class PaymentDetails {
    private String subscriptionType;
    private int duration;
    private String paymentMethod;
    private String cardNumber;
    private String paypalUsername;

    public PaymentDetails(String subscriptionType, int duration, String paymentMethod,
                          String cardNumber, String paypalUsername) {
        this.subscriptionType = subscriptionType;
        this.duration = duration;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.paypalUsername = paypalUsername;
    }

    public double calculateTotal() {
        return subscriptionType.equalsIgnoreCase("weekly") ? duration * 150 : duration * 500;
    }

    public String getMaskedDetails() {
        if (paymentMethod.equalsIgnoreCase("Card")) {
            if (cardNumber.length() != 16) {
                return "Invalid card number !!";
            }
            return "**** **** **** " + cardNumber.substring(12);
        } else {
            if (paypalUsername.length() < 2) return "*";
            return paypalUsername.charAt(0) + "*".repeat(paypalUsername.length() - 2)
                    + paypalUsername.charAt(paypalUsername.length() - 1);
        }
    }

    public String getSubscriptionType() { return subscriptionType; }
    public int getDuration() { return duration; }
    public String getPaymentMethod() { return paymentMethod; }
}
