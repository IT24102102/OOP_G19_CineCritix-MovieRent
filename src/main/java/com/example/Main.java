package com.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Subscription Type (weekly/monthly): ");
        String type = sc.nextLine();

        System.out.print("Duration: ");
        int duration = sc.nextInt();
        sc.nextLine();  // clear newline

        System.out.print("Payment Method (Card/PayPal): ");
        String method = sc.nextLine();

        String card = "", paypal = "";
        if (method.equalsIgnoreCase("Card")) {
            System.out.print("Enter Card Number (16 digits): ");
            card = sc.nextLine();
        } else {
            System.out.print("Enter PayPal Username: ");
            paypal = sc.nextLine();
        }

        PaymentDetails payment = new PaymentDetails(type, duration, method, card, paypal);
        Invoice invoice = new Invoice(payment);

        System.out.println("\n" + invoice.generateInvoice());
    }
}
