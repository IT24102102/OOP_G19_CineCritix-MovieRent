<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Movies</title>
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
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(255, 255, 255, 0.15); /* slight transparency */
            border-radius: 20px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.4);
            width: 280px;
            padding: 30px 20px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 0;
        }

        .card h2,
        .card button {
            position: relative;
            z-index: 1;
        }

        .card:hover {
            transform: scale(1.07);
        }

        .card h2 {
            font-size: 22px;
            margin-bottom: 15px;
        }
        .button-link {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 10px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .button-link:hover {
            background-color: #34495e;
        }


        .card button {
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

        /* Custom backgrounds for each card */
        .card.add {
            background-image: url('images/Abg.jpg');
        }

        .card.update {
            background-image: url('images/update.jpg');
        }

        .card.delete {
            background-image: url('images/delete.jpg');
        }

        .card.view {
            background-image: url('images/view.jpg');
        }
        .button-link {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 10px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .button-link:hover {
            background-color: #fac104;
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
            z-index: 1000;
        }
    </style>
</head>
<body>

<div class="header">
    Manage Movies
</div>

<div class="dashboard">
    <div class="card add">
        <h2>Add New Movies</h2>
        <a href="addNewMovies.jsp">
            <button>Add New Movies</button>
        </a>
    </div>

    <div class="card update">
        <h2>Update Movies</h2>
        <a href="UpdateMovies.jsp">
            <button>Update Movies</button>
        </a>
    </div>

    <div class="card delete">
        <h2>Delete Movies</h2>
        <a href="DeleteMovies.jsp">
            <button>Delete Movies</button>
        </a>
    </div>

    <div class="card view">
        <h2>View Movies</h2>
        <a href="NewadM.jsp">
            <button>View Movies</button>
        </a>
    </div>
</div>
<div style="text-align: center; margin: 20px;">
    <a href="adminHome.jsp" class="button-link">Back to Admin Home</a>
</div>


<jsp:include page="footer.jsp" />

</body>
</html>
