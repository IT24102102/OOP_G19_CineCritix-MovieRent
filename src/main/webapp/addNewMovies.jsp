<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Movies </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('images/ADNewBG.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
        }
        form {
            background: #f2f2f2;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        input, button {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #5c67f2;
            text-decoration: none;
        }
    </style>



    <form action="MovieServlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="action" value="addMovie">

        <label for="id">Movie ID:</label>
        <input type="text" id="id" name="id" required><br><br>

        <label for="title">Movie Title:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="director">Director:</label>
        <input type="text" id="director" name="director" required><br><br>

        <label for="year">Year:</label>
        <input type="number" id="year" name="year" required><br><br>

        <label for="image">Movie Poster:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br><br>

        <button type="submit">Add Movie</button>
    </form>

</head>



