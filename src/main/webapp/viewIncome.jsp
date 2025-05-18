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

<!DOCTYPE html>
<html>
<head>
    <title>All Payments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/BG.jpg'); /* Adjust filename if different */
            background-size: cover;          /* Cover whole screen */
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;    /* Background stays fixed when scrolling */
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: #fdfdfd;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2, h3 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #bbb;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tfoot td {
            font-weight: bold;
        }

        footer {
            text-align: center;
            background-color: #222;
            color: white;
            padding: 15px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>All Payments</h2>
    <table>
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
            <td>$<%= p.getAmount() %></td>
            <td><%= p.getPaymentDate() %></td>
            <td><%= p.getCardType() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <h3>Total Income: $<%= totalIncome %></h3>
</div>

<footer>
    &copy; 2025 CineCritix - All Rights Reserved
</footer>

</body>
</html>
