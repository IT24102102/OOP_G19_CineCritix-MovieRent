package service;

import models.Payment;
import utils.PaymentFileUtil;

import java.io.IOException;
import java.util.List;

public class PaymentService {

    public void savePayment(Payment payment) throws IOException {
        PaymentFileUtil.savePayment(payment);
    }

    public List<Payment> getAllPayments() {
        return PaymentFileUtil.readAllPayments();  // This reads from payments.txt
    }


    // Additional payment-related methods can go here (e.g., find by ID)
}
