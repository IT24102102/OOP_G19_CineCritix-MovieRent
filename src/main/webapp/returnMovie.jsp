<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Return a Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>🔁 Return a Movie</h2>
<form action="RentalServlet" method="post">
    <input type="hidden" name="action" value="return">

    <div class="mb-3">
        <label class="form-label">Rental ID</label>
        <input type="text" class="form-control" name="rentalId" required>
    </div>

    <button type="submit" class="btn btn-danger">Return</button>


</form>
</body>
</html>
