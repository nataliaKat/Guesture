<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>  
<%@page import="java.util.List" %>
<%@page import="java.text.ParseException"%>

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

for (int i=0; i <= services.size(); i ++){

     name_list.add(request.getParameter(String.valueOf(i)));

}

String comments = request.getParameter("comments");

comments = new String(comments.getBytes("ISO-8859-1"), "UTF-8");

Reservation reservation = new Reservation(hotelName, agencyName, sqlDateArrival, time1, sqlDateDeparture, time2, numOfPeopleInt, n1Int, n2Int, n3Int, n4Int, comments);
rd.insertReservation(reservation);

%>


<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp"%>

</head>

<body id="makeReservation">
    <header>
        <meta name="description" content="">
        <meta name="author" content="">
    
        <title>Dream Hotel | New Reservation</title>
        <%@include file="header.jsp" %>
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

    <%@include file="footer.jsp"%>
    
</body>

</html>

