<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <style>
    body {
      background-image: url('images/AdBG.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      text-align: center;
      color: white;
      background: rgba(0, 0, 0, 0.6);
      padding: 30px 0;
      font-size: 36px;
      font-weight: bold;
      text-shadow: 2px 2px 8px black;
    }

    .dashboard {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 40px;
      padding: 60px 30px;
    }

    .card {
      position: relative;  /* to contain ::before overlay */
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-color: rgba(255, 255, 255, 0.85); /* slight transparency */
      border-radius: 20px;
      box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
      width: 280px;
      padding: 30px 20px;
      text-align: center;
      transition: transform 0.3s ease-in-out;
      color: white;
      overflow: hidden; /* to clip overlay */
    }

    .card:hover {
      transform: scale(1.07);
    }

    .card h2 {
      font-size: 22px;
      margin-bottom: 15px;
      color: #2c3e50;
      position: relative;
      z-index: 2;
    }

    .card button {
      position: relative;  /* ensures button stays above overlay */
      z-index: 2;
      padding: 12px 25px;
      border: none;
      border-radius: 10px;
      background-color: #2c3e50;
      color: white;
      cursor: pointer;
      font-size: 16px;
      transition: background 0.3s;
    }

    .card button:hover {
      background-color: #34495e;
    }

    /* Specific background images for each card */
    .card.users {
      background-image: url('images/user.jpg');
    }

    .card.income {
      background-image: url('images/income.jpg');
    }

    .card.subscriptions {
      background-image: url('images/sub.jpg');
    }

    .card.movies {
      background-image: url('images/managem.jpg');
    }

    /* Overlay for movies card to improve contrast */
    .card.movies::before {
      content: '';
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 0, 0.4);
      border-radius: 20px;
      z-index: 1;
    }

    footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      color: white;
      text-align: center;
      padding: 15px 0;
      font-size: 14px;
      z-index: 1000; /* ensures footer is above other content */
    }

    .button-link {
      display: inline-block;
      padding: 10px 25px;
      margin-top: 20px;
      background-color: #2c3e50;
      color: white;
      text-decoration: none;
      border-radius: 10px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .button-link:hover {
      background-color: #34495e;
    }
  </style>
</head>
<body>

<div class="header">
  🎬 Admin Dashboard – Welcome, Admin!
</div>

<div class="dashboard">
  <div class="card users">
    <h2>Current Users</h2>
    <a href="Users.jsp">
      <button>View Users</button>
    </a>
  </div>

  <div class="card income">
    <h2>Monthly Income</h2>
    <a href="viewIncome.jsp">
      <button>View Income</button>
    </a>
  </div>

  <div class="card subscriptions">
    <h2>Subscriptions</h2>
    <a href="viewRents.jsp">
      <button>View Subscriptions</button>
    </a>
  </div>

  <div class="card movies">
    <h2>Manage Movies</h2>
    <button id="managemoviesBtn">Manage Movies</button>
  </div>
</div>

<div style="text-align: center; margin: 20px;">
  <a href="login.jsp" class="button-link">Log out</a>
</div>

<script>
  document.getElementById('managemoviesBtn').addEventListener('click', function() {
    window.location.href = 'managemovies.jsp'; // Adjust filename if needed
  });
</script>

<jsp:include page="footer.jsp" />

</body>
</html>
