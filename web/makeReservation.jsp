<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>

<%
int hotelId = request.getParameter("hotelId");
int agencyId = request.getParameter("agencyId");
Date arrival = request.getParameter("arrival");
String time1 = request.getParameter("time1");
Date departure = request.getParameter("departure");
String time2 = request.getParameter("time2");
int num-of-people = request.getParameter("num-of-people");
int n-1 = request.getParameter("n-1");
int n-2 = request.getParameter("n-2");
int n-3 = request.getParameter("n-3");
int n-4 = request.getParameter("n-4");

/* read names of all checkboxes and turn them to String */
ArrayList<String> services_list = new ArrayList<String>();
for (int i=0; i<= services.size(); i ++){
     services_list.add(request.getParameter(String.valueOf(i)));
}
String comments = request.getParameter("comments");

comments = new String(comments.getBytes("ISO-8859-1"), "UTF-8");

Reservation reservation = new Reservation(hotelId, agencyId, arrival, time1, departure, time2, num-of-people, n-1, n-2, n-3, n-4, comments);
ReservationDao rd = new ReservationDao();
rd.insertReservation(reservation);

%>


<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp"%>

</head>

<body>
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand" href="index.html"><img class="logo" src="../web/images/logo_blue_nav.png" alt="logo"></a>
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

            <div class="page-header">
                <h1>Reservation almost done!</h1>
            </div>
    
            <!-- form -->
    
            <div class="alert alert-success" role="alert">
                <h2> Please wait until the hotel confirms your reservation. </h2>
            </div>
        </div>
    </main>

    <%@include file="footer.jsp"%>
    
</body>

</html>

