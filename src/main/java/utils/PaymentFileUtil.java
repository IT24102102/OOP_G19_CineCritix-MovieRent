package utils;

import models.Payment;
import models.Rent;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PaymentFileUtil {

    private static final String PAYMENT_FILE = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CPayments.txt";

    // Save payment (append)
    public static void savePayment(Payment payment) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(PAYMENT_FILE, true))) {
            // Format: paymentId,rentId,username,movieName,rentDate,amount,paymentDate,paymentMethod,cardNumber,cardType,cvv
            String line = payment.getPaymentId() + "," +
                    payment.getRent().getRentId() + "," +
                    payment.getRent().getUser().getUsername() + "," +
                    payment.getRent().getMovie().getMovieName() + "," +
                    payment.getRent().getRentDate() + "," +
                    payment.getAmount() + "," +
                    payment.getPaymentDate() + "," +
                    payment.getPaymentMethod() + "," +
                    payment.getCardNumber() + "," +
                    payment.getCardType() + "," +
                    payment.getCvv();
            bw.write(line);
            bw.newLine();
        }
    }

    // Load all payments
    public static List<Payment> loadPayments() {
        List<Payment> payments = new ArrayList<>();
        File file = new File(PAYMENT_FILE);

        if (!file.exists()) {
            return payments; // empty list if file missing
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                // paymentId,rentId,username,movieName,rentDate,amount,paymentDate,paymentMethod,cardNumber,cardType,cvv
                String[] parts = line.split(",");
                if (parts.length == 11) {
                    String paymentId = parts[0];
                    String rentId = parts[1];
                    String username = parts[2];
                    String movieName = parts[3];
                    LocalDate rentDate = LocalDate.parse(parts[4]);
                    double amount = Double.parseDouble(parts[5]);
                    LocalDate paymentDate = LocalDate.parse(parts[6]);
                    String paymentMethod = parts[7];
                    String cardNumber = parts[8];
                    String cardType = parts[9];
                    String cvv = parts[10];

                    Rent rent = new Rent(rentId, new models.User(username), new models.Movie(movieName), rentDate);
                    Payment payment = new Payment(paymentId, rent, amount, paymentDate, paymentMethod, cardNumber, cardType, cvv);
                    payments.add(payment);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
