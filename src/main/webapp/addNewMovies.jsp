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

<a href="NewadM.jsp">View Newly Added Movies</a>

