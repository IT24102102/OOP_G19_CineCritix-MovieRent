<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>

<div class="movies-section">
  <h2>Available Movies for Rent</h2>

  <div class="movies-container">
    <%
      // Folder where movie images are located (use absolute or relative path)
      String imagePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Nimages/";
      File folder = new File(imagePath);
      File[] listOfFiles = folder.listFiles();

      if (listOfFiles != null && listOfFiles.length > 0) {
        for (File file : listOfFiles) {
          if (file.isFile()) {
            String fileName = file.getName();
            String movieTitle = fileName.substring(0, fileName.lastIndexOf('.'));
    %>
    <div class="movie-card">
      <!-- Movie poster -->
      <img src="displayImage?filename=<%= URLEncoder.encode(fileName, "UTF-8") %>"
           alt="Movie Image"
           style="width: 200px; height: 300px; object-fit: cover;">

      <!-- Movie title -->
      <div class="movie-title"><%= movieTitle %></div>

      <!-- Rent form -->
      <form action="rent" method="post" style="text-align:center;">
        <input type="hidden" name="movieName" value="<%= movieTitle %>">

        <!-- You can remove username input if you manage user via session -->
        <input type="text" name="username" placeholder="Enter Username" required
               style="margin-bottom: 8px; padding: 5px; width: 90%;"><br>

        <button type="submit" class="rent-now-button">Rent Now</button>
      </form>
    </div>
    <%
        }
      }
    } else {
    %>
    <p style="color:white; text-align:center;">No movies found in the directory.</p>
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

  h2 {
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

  .rent-now-button {
    background-color: #ff5c5c;
    color: #fff;
    padding: 10px;
    margin-top: 5px;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    width: 90%;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .rent-now-button:hover {
    background-color: #ff3838;
  }
</style>
