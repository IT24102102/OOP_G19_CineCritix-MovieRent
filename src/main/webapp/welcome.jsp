<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>CineCritix - Movie Platform</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #0b0b0b;
      color: white;
      overflow-x: hidden;
    }

    /* Header */
    .site-header {
      background-color: #111;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1rem 2rem;
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    .logo {
      font-size: 1.8rem;
      font-weight: bold;
      color: #f39c12;
    }

    .search-bar input {
      padding: 0.5rem;
      border-radius: 5px;
      border: none;
      width: 250px;
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 1.5rem;
    }

    .nav-links a {
      color: #ccc;
      text-decoration: none;
      transition: color 0.3s;
    }

    .nav-links a:hover {
      color: #fff;
    }

    .buttons button {
      margin-left: 1rem;
      padding: 0.5rem 1rem;
      border: none;
      border-radius: 20px;
      cursor: pointer;
    }

    .login-btn {
      background-color: #444;
      color: white;
    }

    .signup-btn {
      background-color: #f39c12;
      color: black;
    }

    /* Hero */
    .hero {
      text-align: center;
      padding: 3rem 1rem 1rem;
    }

    .hero h1 {
      font-size: 3rem;
      margin-bottom: 0.5rem;
    }

    .hero p {
      font-size: 1.2rem;
      color: #ccc;
    }

    /* Carousel Section */
    .carousel-section {
      margin: 2rem 0;
    }

    .carousel-container {
      width: 100%;
      overflow: hidden;
      padding: 1rem 0;
    }

    .carousel-track {
      display: flex;
      gap: 2rem;
      animation: scroll 40s linear infinite;
    }

    .carousel-item {
      flex: 0 0 auto;
      width: 250px;
      transition: transform 0.3s;
    }

    .carousel-item img {
      width: 100%;
      height: 370px;
      object-fit: cover;
      border-radius: 20px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
    }

    @keyframes scroll {
      0% { transform: translateX(0); }
      100% { transform: translateX(-50%); }
    }

    /* Footer */
    footer {
      background-color: #111;
      color: #ccc;
      text-align: center;
      padding: 1.5rem;
      position: relative;
      margin-top: 3rem;
    }

    .social-icons {
      margin-top: 0.5rem;
    }

    .social-icons a {
      color: #ccc;
      margin: 0 10px;
      font-size: 1.5rem;
      transition: color 0.3s;
    }

    .social-icons a:hover {
      color: #f39c12;
    }
  </style>
</head>
<body>

<!-- Header -->
<div class="site-header">
  <div class="logo">CineCritix</div>
  <div class="search-bar"><input type="text" placeholder="Search movies..."></div>
  <div class="nav-links">
    <a href="#">Home</a>
    <a href="#">Movies</a>
    <a href="#">TV Shows</a>
    <a href="#">Watchlist</a>
    <div class="buttons">
      <button class="login-btn" onclick="window.location.href='login.jsp'">Login</button>
      <button class="signup-btn" onclick="window.location.href='register.jsp'">Sign Up</button>

    </div>
  </div>
</div>

<!-- Hero Section -->
<header class="hero">
  <h1>Welcome to CineCritix</h1>
  <p>Explore top-rated and newly released movies</p>
</header>

<!-- Most Viewed Section -->
<section class="carousel-section">
  <h2 style="text-align: center; font-size: 2rem; margin-bottom: 1rem;">Most Viewed</h2>
  <div class="carousel-container">
    <div class="carousel-track" id="carouselTrack">
      <div class="carousel-item"><img src="images/Inception.jpg" alt="Inception"></div>
      <div class="carousel-item"><img src="images/Tenet.jpg" alt="Tenet"></div>
      <div class="carousel-item"><img src="images/intersteller.jpg" alt="Interstellar"></div>
      <div class="carousel-item"><img src="images/Dun.jpg" alt="Dune"></div>
      <div class="carousel-item"><img src="images/PR.jpg" alt="Past Lives"></div>
      <div class="carousel-item"><img src="images/FvsF.jpg" alt="Avatar"></div>
      <div class="carousel-item"><img src="images/KGMAN.jpg" alt="Oppenheimer"></div>
      <div class="carousel-item"><img src="images/MR.jpg" alt="Matrix"></div>
      <!-- Duplicate for smooth loop -->
      <div class="carousel-item"><img src="images/Inception.jpg" alt="Inception"></div>
      <div class="carousel-item"><img src="images/Tenet.jpg" alt="Tenet"></div>
    </div>
  </div>
</section>

<!-- Newly Arrived Section -->
<section class="carousel-section">
  <h2 style="text-align: center; font-size: 2rem; margin-top: 3rem; margin-bottom: 1rem;">Newly Arrived</h2>
  <div class="carousel-container">
    <div class="carousel-track">
      <div class="carousel-item"><img src="images/POC.jpg" alt="New Movie 1"></div>
      <div class="carousel-item"><img src="images/MR.jpg" alt="New Movie 2"></div>
      <div class="carousel-item"><img src="images/WOW.jpg" alt="New Movie 3"></div>
      <div class="carousel-item"><img src="images/SpiderManFFH.jpg" alt="New Movie 4"></div>
    </div>
  </div>
</section>

<!-- Footer -->



</body>

</html>
