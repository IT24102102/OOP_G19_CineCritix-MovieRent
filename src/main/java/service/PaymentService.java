package service;

import models.Payment;
import utils.PaymentFileUtil;

import java.io.IOException;

public class PaymentService {

    public void savePayment(Payment payment) throws IOException {
        PaymentFileUtil.savePayment(payment);
    }

    // Additional payment-related methods can go here (e.g., find by ID)
}
