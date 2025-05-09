<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4>🎫 Payment Invoice</h4>
        </div>
        <div class="card-body">
            <p><strong>Subscription Type:</strong> ${subscriptionType}</p>
            <p><strong>Duration:</strong> ${duration}</p>
            <p><strong>Payment Method:</strong> ${paymentMethod}</p>
            <p><strong>Details:</strong> ${maskedDetail}</p>
            <p><strong>Total:</strong> LKR ${total}</p>
        </div>
    </div>
</div>
</body>
</html>
