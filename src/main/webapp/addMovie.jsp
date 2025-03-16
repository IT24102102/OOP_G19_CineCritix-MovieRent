<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie</title>
</head>
<body>
<h2>Add New Movie</h2>
<form action="addMovie" method="post">
    <label for="title">Movie Title:</label>
    <input type="text" id="title" name="title" required>
    <br>

    <label for="genre">Genre:</label>
    <input type="text" id="genre" name="genre" required>
    <br>

    <label for="rating">Rating:</label>
    <input type="number" id="rating" name="rating" required min="0" max="10">
    <br>

    <button type="submit">Add Movie</button>
</form>
</body>
</html>
