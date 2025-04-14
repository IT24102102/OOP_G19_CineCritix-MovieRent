<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rent a Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>🎬 Rent a Movie</h2>
<form action="RentalServlet" method="post">
    <input type="hidden" name="action" value="rent">


    <div class="mb-3">
        <label class="form-label">Rental ID</label>
        <input type="text" class="form-control" name="rentalId" required>
    </div>
    <div class="mb-3">
        <label class="form-label">User ID</label>
        <input type="text" class="form-control" name="userId" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Movie ID</label>
        <input type="text" class="form-control" name="movieId" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Rental Date (YYYY-MM-DD)</label>
        <input type="text" class="form-control" name="rentalDate" required>
    </div>

    <button type="submit" class="btn btn-primary">Rent</button>


</form>
</body>
</html>
