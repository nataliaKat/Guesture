<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@page import="java.text.ParseException" %>

<%@ page import="model.Service" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>


<%


%>


<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp" %>

</head>

<body id="makeReservation">
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-light  custom-nav">
        <a class="navbar-brand" href="index.html"><img class="logo" src="images/logo_blue_nav.png"
                                                       alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="agencies.html">Agencies</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="reservations.html">Reservations<span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reviews.html">Reviews</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="chart.html">Statistics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> Dream Hotel</a>

                </li>
                <li class="nav-item">
                    <a class="nav-link logout" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!-- Begin page content -->
<main class="container">
    <div class="row">

        <!-- form -->

        <div class="alert alert-success" role="alert">
            <div class="page-header">
                <h1>Reservation almost done!</h1>
                <hr>
                <h2> Please wait until the hotel confirms your reservation. </h2>
            </div>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>

</body>

</html>

