<%@ page import="models.Rent" %>
<%@ page import="service.RentService" %>
<%@ page import="java.util.List" %>


<%
    String rentFilePath = "C:/Users/Tharindu/Desktop/OOP_WEb/Original/CRent.txt";
    RentService rentService = new RentService(rentFilePath);
    List<Rent> rents = rentService.getAllRents();
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Rent Details</title>
    <style>
        body {
            background-image: url('images/BG.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 30px;
            color: white;
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

        h2 {
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.6); /* semi-transparent black background */
            color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.8);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: rgba(44, 62, 80, 0.9);
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>

<h2>All Rent Details</h2>
<table>
    <thead>
    <tr>
        <th>Rent ID</th>
        <th>Username</th>
        <th>Movie Name</th>
        <th>Rent Date</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Rent rent : rents) {
    %>
    <tr>
        <td><%= rent.getRentId() %></td>
        <td><%= rent.getUsername() %></td>
        <td><%= rent.getMovieName() %></td>
        <td><%= rent.getRentDate() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<jsp:include page="footer.jsp" />
</body>
</html>
