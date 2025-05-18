<%@ page import="models.Rent" %>
<%
    Rent rent = (Rent) request.getAttribute("rent");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Secure Payment</title>
    <style>
        body {
            background: #2c3e50;
            font-family: 'Segoe UI', sans-serif;
            color: #2c3e50;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            width: 400px;
            background: #ecf0f1;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 15px 25px rgba(0,0,0,0.2);
        }
        .card h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .btn {
            margin-top: 15px;
            padding: 10px;
            width: 100%;
            background: #3498db;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
        }
        .card-inner {
            width: 320px;
            height: 200px;
            perspective: 1000px;
            margin: 0 auto;
        }

        .card-flip {
            width: 100%;
            height: 100%;
            border-radius: 15px;
            position: relative;
            transform-style: preserve-3d;
            transition: transform 0.8s ease;
        }

        .card-flip.flipped {
            transform: rotateY(180deg);
        }

        .card-front, .card-back {
            position: absolute;
            width: 320px;
            height: 200px;
            border-radius: 15px;
            backface-visibility: hidden;
            color: white;
            font-family: sans-serif;
            padding: 20px;
            box-sizing: border-box;
        }

        .card-front {
            background: #1a1f71; /* For Visa */
        }

        .card-back {
            background: #222; /* Dark background for back */
            transform: rotateY(180deg);
        }

        /* Visa specific colors */
        #visaCard .card-front {
            background: #1a1f71;
        }
        #visaCard .card-back {
            background: #0a0d3d;
        }

        /* MasterCard specific colors */
        #masterCard .card-front {
            background: #000;
        }
        #masterCard .card-back {
            background: #111;
        }

        /* Common styling for card details on front */
        .card-number {
            margin-top: 40px;
            letter-spacing: 2px;
            font-size: 18px;
        }

        .valid-thru {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            margin-top: 5px;
        }

        .cardholder-name {
            margin-top: 30px;
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Back side CVV styling */
        .cvv-label {
            margin-top: 70px;
            font-size: 14px;
        }
        .cvv-code {
            margin-top: 5px;
            font-size: 20px;
            letter-spacing: 3px;
            background: white;
            color: black;
            padding: 5px 15px;
            border-radius: 5px;
            width: fit-content;
        }

        /* Visa logo bottom right on front */
        #visaCard .card-logo {
            text-align: right;
            margin-top: 30px;
            font-size: 24px;
            font-weight: bold;
        }

        /* MasterCard logo bottom right on front */
        #masterCard .card-logo img {
            position: absolute;
            bottom: 20px;
            right: 20px;
            width: 60px;
        }
        .btn:hover {
            background: #2980b9;
        }
        .rent-details {
            background: #dff9fb;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="card">
        <% if (rent == null) { %>
    <p>No rent information found!</p>
        <% } else { %>
    <div class="rent-details">
        <p><strong>Rent ID:</strong> <%= rent.getRentId() %></p>
        <p><strong>Username:</strong> <%= rent.getUser().getUsername() %></p>
        <p><strong>Movie Name:</strong> <%= rent.getMovie().getMovieName() %></p>
        <p><strong>Rent Date:</strong> <%= rent.getRentDate() %></p>
    </div>

    <h2>Payment Info</h2>
    <form action="payment" method="post">
        <!-- Hidden fields -->
        <input type="hidden" name="rentId" value="<%= rent.getRentId() %>"/>
        <input type="hidden" name="username" value="<%= rent.getUser().getUsername() %>"/>
        <input type="hidden" name="movieName" value="<%= rent.getMovie().getMovieName() %>"/>
        <input type="hidden" name="rentDate" value="<%= rent.getRentDate() %>"/>

        <div class="form-group">
            <label>Rental Duration & Amount</label>
            <select name="amount" required>
                <option value="">-- Select Duration --</option>
                <option value="5">2 Weeks - $5</option>
                <option value="8">4 Weeks - $8</option>
                <option value="10">6 Weeks - $10</option>
            </select>
        </div>

        <div class="form-group">
            <label>Payment Method</label>
            <select id="paymentMethodSelect" name="paymentMethod" required>
                <option value="">--Select Payment Method--</option>
                <option value="Card">Card</option>
                <option value="PayPal">PayPal</option>
            </select>
        </div>

        <div class="form-group">
            <label>Card Type</label>
            <select id="cardTypeSelect" name="cardType" required>
                <option value="">--Select Card Type--</option>
                <option value="Visa">Visa</option>
                <option value="MasterCard">MasterCard</option>
            </select>
        </div>

        <div class="form-group">
            <label>Cardholder Name</label>
            <input type="text" id="cardholderInput" placeholder="Name on Card" />
        </div>


        <div id="cardFields">
            <div class="form-group">
                <label>Card Number</label>
                <input type="text" id="cardNumberInput" name="cardNumber" maxlength="19" required />
            </div>

            <div class="form-group">
                <label for="expiryDate">Expiry Date (MM/YY):</label>
                <input type="text" id="expiryDate" placeholder="MM/YY" />
            </div>



            <div class="form-group">
                <label>CVV</label>
                <input type="text" id="cvvInput" name="cvv" maxlength="3" required />
            </div>
        </div>

        <button type="submit" class="btn">Pay Now</button>
    </form>
        <% } %>

    <!-- Visa Card -->
    <div id="visaCard" style="display:none; margin-top: 20px;">
        <div class="card-inner">
            <div class="card-flip" id="visaFlip">
                <div class="card-front">
                    <h3>Visa Card</h3>
                    <p class="card-number" id="visaNumber">•••• •••• •••• ••••</p>
                    <div class="valid-thru">
                        <span>VALID THRU</span>
                        <span id="visaExpiry">MM/YY</span>
                    </div>
                    <p class="cardholder-name" id="visaName">CARDHOLDER NAME</p>
                    <div class="card-logo">VISA</div>
                </div>
                <div class="card-back">
                    <div style="background:#000; height:40px; margin-top:15px;"></div> <!-- magnetic strip -->
                    <div class="cvv-label">CVV</div>
                    <div class="cvv-code" id="visaCvv">•••</div>
                </div>
            </div>
        </div>
    </div>

    <!-- MasterCard -->
    <div id="masterCard" style="display:none; margin-top: 20px;">
        <div class="card-inner">
            <div class="card-flip" id="masterFlip">
                <div class="card-front">
                    <h3>MasterCard</h3>
                    <p class="card-number" id="masterNumber">•••• •••• •••• ••••</p>
                    <div class="valid-thru">
                        <span>VALID THRU</span>
                        <span id="masterExpiry">MM/YY</span>
                    </div>
                    <p class="cardholder-name" id="masterName">CARDHOLDER NAME</p>
                    <div class="card-logo">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="MasterCard" />
                    </div>
                </div>
                <div class="card-back">
                    <div style="background:#333; height:40px; margin-top:15px;"></div> <!-- magnetic strip -->
                    <div class="cvv-label">CVV</div>
                    <div class="cvv-code" id="masterCvv">•••</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const cardTypeSelect = document.getElementById("cardTypeSelect");
        const visaCard = document.getElementById("visaCard");
        const masterCard = document.getElementById("masterCard");

        const cardNumberInput = document.getElementById("cardNumberInput");
        const expiryInput = document.getElementById("expiryDate");
        const cardholderInput = document.getElementById("cardholderInput");

        // Elements to update
        const visaNumber = document.getElementById("visaNumber");
        const visaExpiry = document.getElementById("visaExpiry");
        const visaName = document.getElementById("visaName");
        const visaCvv = document.getElementById("visaCvv");

        const masterNumber = document.getElementById("masterNumber");
        const masterExpiry = document.getElementById("masterExpiry");
        const masterName = document.getElementById("masterName");
        const masterCvv = document.getElementById("masterCvv");

        // Card type change handling
        cardTypeSelect.addEventListener("change", function () {
            const selectedType = this.value;
            visaCard.style.display = selectedType === "Visa" ? "block" : "none";
            masterCard.style.display = selectedType === "MasterCard" ? "block" : "none";
        });

        // Update card number
        cardNumberInput.addEventListener("input", function () {
            const formatted = this.value.replace(/\s/g, '').replace(/(\d{4})/g, '$1 ').trim();
            this.value = formatted;

            if (cardTypeSelect.value === "Visa") {
                visaNumber.textContent = formatted || "•••• •••• •••• ••••";
            } else if (cardTypeSelect.value === "MasterCard") {
                masterNumber.textContent = formatted || "•••• •••• •••• ••••";
            }
        });

        // Update expiry date
        expiryInput.addEventListener("input", function () {
            const val = this.value;
            if (cardTypeSelect.value === "Visa") {
                visaExpiry.textContent = val || "MM/YY";
            } else if (cardTypeSelect.value === "MasterCard") {
                masterExpiry.textContent = val || "MM/YY";
            }
        });

        // Update cardholder name
        cardholderInput.addEventListener("input", function () {
            const val = this.value.trim().toUpperCase() || "CARDHOLDER NAME";
            if (cardTypeSelect.value === "Visa") {
                visaName.textContent = val;
            } else if (cardTypeSelect.value === "MasterCard") {
                masterName.textContent = val;
            }
        });

        // Update CVV
        const cvvInput = document.getElementById("cvvInput");
        cvvInput.addEventListener("input", function () {
            const val = this.value.replace(/\D/g, '').slice(0, 3);
            this.value = val;
            if (cardTypeSelect.value === "Visa") {
                visaCvv.textContent = val || "•••";
            } else if (cardTypeSelect.value === "MasterCard") {
                masterCvv.textContent = val || "•••";
            }
        });
    </script>

</body>
</html>
