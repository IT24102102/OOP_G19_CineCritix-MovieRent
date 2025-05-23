<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Payment Processing</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f9f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .hidden {
            display: none;
        }

        .container {
            text-align: center;
            background: white;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .checkmark {
            font-size: 72px;
            color: #38a169;
            margin-bottom: 20px;
        }

        h2 {
            margin: 0 0 10px;
        }

        p {
            color: #555;
            margin-bottom: 20px;
        }

        a.button {
            display: inline-block;
            background-color: #38a169;
            color: white;
            padding: 12px 28px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #2f855a;
        }

        /* Loader styles */
        .card {
            --bg-color: #212121;
            background-color: var(--bg-color);
            padding: 1rem 2rem;
            border-radius: 1.25rem;
            margin: 0 auto;
            max-width: 300px;
        }

        .loader {
            color: rgb(124, 124, 124);
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-size: 25px;
            height: 40px;
            padding: 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 8px;
        }

        .words {
            overflow: hidden;
            position: relative;
            margin-left: 10px;
            height: 40px;
            width: 130px;
        }

        .words::after {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(
                    var(--bg-color) 10%,
                    transparent 30%,
                    transparent 70%,
                    var(--bg-color) 90%
            );
            z-index: 20;
        }

        .word {
            display: block;
            height: 40px;
            padding-left: 6px;
            color: #956afa;
            animation: spin_4991 4s infinite;
        }

        @keyframes spin_4991 {
            10% { transform: translateY(-102%); }
            25% { transform: translateY(-100%); }
            35% { transform: translateY(-202%); }
            50% { transform: translateY(-200%); }
            60% { transform: translateY(-302%); }
            75% { transform: translateY(-300%); }
            85% { transform: translateY(-402%); }
            100% { transform: translateY(-400%); }
        }
    </style>
</head>
<body>

<!-- Loading screen -->
<div id="loading" class="container">
    <div class="card">
        <div class="loader">
            <p>Loading</p>
            <div class="words">
                <span class="word">Movies</span>
                <span class="word">Rents</span>
                <span class="word">USer</span>
                <span class="word">cards</span>
                <span class="word">Payment</span>
            </div>
        </div>
    </div>
    <p style="margin-top: 20px;">Processing your payment...</p>
</div>

<!-- Success screen -->
<div id="success" class="container hidden">
    <div class="checkmark">✓</div>
    <h2>Payment Successful!</h2>
    <p>Thank you for your payment. Your transaction is complete.</p>
    <a href="index.jsp" class="button">Return to Home</a>
</div>

<script>
    // After 3 seconds, hide loader and show success message
    setTimeout(() => {
        document.getElementById('loading').classList.add('hidden');
        document.getElementById('success').classList.remove('hidden');
    }, 3000); // 3000 milliseconds = 3 seconds
</script>

</body>
</html>
