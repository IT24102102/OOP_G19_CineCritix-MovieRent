<%
    models.Rent rent = (models.Rent) request.getAttribute("rent");
    if (rent == null) {
%>
<p>No rent information found!</p>
<%
} else {
%>
<p>Rent ID: <%= rent.getRentId() %></p>
<p>Username: <%= rent.getUser().getUsername() %></p>
<p>Movie Name: <%= rent.getMovie().getMovieName() %></p>
<p>Rent Date: <%= rent.getRentDate() %></p>

<!-- Your payment form fields here, include hidden inputs to send rent info back on POST -->
<form action="payment" method="post">
    <input type="hidden" name="rentId" value="<%= rent.getRentId() %>"/>
    <input type="hidden" name="username" value="<%= rent.getUser().getUsername() %>"/>
    <input type="hidden" name="movieName" value="<%= rent.getMovie().getMovieName() %>"/>
    <input type="hidden" name="rentDate" value="<%= rent.getRentDate() %>"/>

    Amount: <input type="text" name="amount" required /><br/>

    Payment Method:
    <select name="paymentMethod" required>
        <option value="">--Select Payment Method--</option>
        <option value="Card">Card</option>
        <option value="PayPal">PayPal</option>
    </select><br/>

    Card Number: <input type="text" name="cardNumber" required /><br/>

    Card Type:
    <select name="cardType" required>
        <option value="">--Select Card Type--</option>
        <option value="Visa">Visa</option>
        <option value="MasterCard">MasterCard</option>
    </select><br/>

    CVV: <input type="text" name="cvv" required /><br/>


    <input type="submit" value="Pay Now" />
</form>
<%
    }
%>
