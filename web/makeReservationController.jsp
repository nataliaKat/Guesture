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

    String hotelName = request.getParameter("hotelName");
    String agencyName = request.getParameter("agencyName");
    String arrival = request.getParameter("arrival");
    String time1 = request.getParameter("time1");
    String departure = request.getParameter("departure");
    String time2 = request.getParameter("time2");
    String numOfPeople = request.getParameter("numOfPeople");
    String n1 = request.getParameter("n1");
    String n2 = request.getParameter("n2");
    String n3 = request.getParameter("n3");
    String n4 = request.getParameter("n4");

    int numOfPeopleInt = Integer.parseInt(numOfPeople);
    int n1Int = Integer.parseInt(n1);
    int n2Int = Integer.parseInt(n2);
    int n3Int = Integer.parseInt(n3);
    int n4Int = Integer.parseInt(n4);


    /* Convert Strings arrival and departure to Sql Date */

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date date = sdf.parse(arrival);
    java.sql.Date sqlDateArrival = new java.sql.Date(date.getTime());

    java.util.Date date1 = sdf.parse(departure);
    java.sql.Date sqlDateDeparture = new java.sql.Date(date1.getTime());



    /* read names of all checkboxes and turn them to String */

    ReservationDao rd = new ReservationDao();
    ServiceDao sd = new ServiceDao();
    List<Service> services = sd.getAllServices(hotelName);
    ArrayList<String> name_list = new ArrayList<String>();

    String comments = request.getParameter("comments");

    comments = new String(comments.getBytes("ISO-8859-1"), "UTF-8");

    Reservation reservation = new Reservation(hotelName, agencyName, sqlDateArrival, time1, sqlDateDeparture, time2, numOfPeopleInt, n1Int, n2Int, n3Int, n4Int, comments);
    int savedReservation = rd.insertReservation(reservation);


    for (Service s : services) {
        if (request.getParameter("ser-" + s.getServiceId()) != null) {
            sd.save(savedReservation, s.getServiceId());
        }
    }
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

