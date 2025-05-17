package models;

import java.time.LocalDate;

public class Payment {
    private String paymentId;
    private Rent rent; // composition: Payment includes Rent info
    private double amount;
    private LocalDate paymentDate;
    private String paymentMethod;
    private String cardNumber;
    private String cardType;
    private String cvv;

    public Payment(String paymentId, Rent rent, double amount, LocalDate paymentDate,
                   String paymentMethod, String cardNumber, String cardType, String cvv) {
        this.paymentId = paymentId;
        this.rent = rent;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.cardType = cardType;
        this.cvv = cvv;
    }

    // getters and setters

    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

    public Rent getRent() { return rent; }
    public void setRent(Rent rent) { this.rent = rent; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public LocalDate getPaymentDate() { return paymentDate; }
    public void setPaymentDate(LocalDate paymentDate) { this.paymentDate = paymentDate; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public String getCardType() { return cardType; }
    public void setCardType(String cardType) { this.cardType = cardType; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }
}
