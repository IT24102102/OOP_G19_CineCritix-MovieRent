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
        return PaymentFileUtil.readAllPayments();  //  reads from payments.txt
    }



}
