<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<div class="movies-section">
  <h2>Newly Added Movies</h2>

  <div class="movies-container">
    <%
      // Set your correct path to the uploaded images folder
      String imagePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/Newimages/";
      File folder = new File(imagePath);
      File[] listOfFiles = folder.listFiles();

      if (listOfFiles != null) {
        for (File file : listOfFiles) {
          if (file.isFile()) {
            String fileName = file.getName();
    %>
    <div class="movie-card">
      <!-- Use your servlet to display the image -->
      <img src="displayImage?filename=<%= fileName %>" alt="Movie Image" style="width: 200px; height: 300px; object-fit: cover;">
      <div class="movie-title"><%= fileName.substring(0, fileName.lastIndexOf('.')) %></div>
    </div>
    <%
        }
      }
    } else {
    %>
    <p>No movies found.</p>
    <%
      }
    %>
  </div>
</div>

<style>
  body {
    background-image: url('images/BG.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
  }
  h2, h3 {
    margin-top: 20px;
    color: #fff;
    text-align: center;
  }

  .movies-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
    padding: 30px;
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


  .movie-card {
    background-color: #1b263b;
    border-radius: 15px;
    width: 220px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    transition: transform 0.3s, box-shadow 0.3s;
    cursor: pointer;
  }

  .movie-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 16px rgba(255, 255, 255, 0.2);
  }

  .movie-card img {
    width: 100%;
    height: 320px;
    object-fit: cover;
  }

  .movie-title {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 10px;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    color: #fff;
  }

  .btn-primary {
    background-color: #f39c12;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: 500;
    transition: background-color 0.3s;
    display: inline-block;
  }
</style>
<!-- Go Back Button -->
<div class="back-button-container" style="text-align: center; margin: 20px 0;">
  <a href="${pageContext.request.contextPath}/managemovies.jsp" class="btn-primary">Go Back to Manage Movies</a>
</div>

<jsp:include page="footer.jsp" />
