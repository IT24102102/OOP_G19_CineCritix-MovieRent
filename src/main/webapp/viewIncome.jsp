<%@ page import="models.Payment" %>
<%@ page import="service.PaymentService" %>
<%@ page import="java.util.List" %>


<%
    PaymentService paymentService = new PaymentService();
    List<Payment> payments = paymentService.getAllPayments();

    double totalIncome = 0;
    for (Payment p : payments) {
        totalIncome += p.getAmount();
    }
%>
<h2>All Payments</h2>
<table border="1">
    <thead>
    <tr>
        <th>Payment ID</th>
        <th>Rent ID</th>
        <th>Username</th>
        <th>Movie Name</th>
        <th>Amount</th>
        <th>Payment Date</th>
        <th>Card Type</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Payment p : payments) {
    %>
    <tr>
        <td><%= p.getPaymentId() %></td>
        <td><%= p.getRent().getRentId() %></td>
        <td><%= p.getRent().getUsername() %></td>
        <td><%= p.getRent().getMovieName() %></td>
        <td><%= p.getAmount() %></td>
        <td><%= p.getPaymentDate() %></td>
        <td><%= p.getCardType() %></td>
    </tr>

    <%
        }
    %>
    </tbody>
</table>

<h3>Total Income: $<%= totalIncome %></h3>

