<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>  
<%@page import="java.util.List" %>
<%@page import="java.text.ParseException"%>

<%@ page import="model.Service" %>
<%@ page import="model.Room" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="dao.RoomDao" %>

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

/* get today's date and convert it to Date type */

LocalDate localdate = LocalDate.now();
Date localDateDate = java.sql.Date.valueOf(localdate);

/* count available rooms of each type */

RoomDao roomdao = new RoomDao();
/* 
List<Room> availableRooms = roomdao.getAvailableRooms(sqlDateArrival, sqlDateDeparture, hotelName);
int availableRoomsPerType [] = new int[4];

for (int i = 0; i < 4; i++) {

    availableRoomsPerType[i] = 0;

}

for (int i = 0; i < availableRooms.size(); i++) {

    if (availableRooms.get(i).getType() == "Single") {

        availableRoomsPerType [0] = availableRoomsPerType [0] + 1;

    } else if (availableRooms.get(i).getType() == "Double") {

        availableRoomsPerType [1] = availableRoomsPerType [1] + 1;

    } else if (availableRooms.get(i).getType() == "Triple") {

        availableRoomsPerType [2] = availableRoomsPerType [2] + 1;

    } else {

        availableRoomsPerType [3] = availableRoomsPerType [3] + 1;

    }

}
*/

List<Room> availableRooms = roomdao.getAll(hotelName);
    int availableRoomsPerType [] = new int[4];

    for (int i = 0; i < 4; i++) {
    
        availableRoomsPerType[i] = 0;
    
    }
    
    for (int i = 0; i < availableRooms.size(); i++) {
    
        if (availableRooms.get(i).getType().equals("single")) {
    
            availableRoomsPerType [0] = availableRoomsPerType [0] + 1;
    
        } else if (availableRooms.get(i).getType().equals("double")) {
    
            availableRoomsPerType [1] = availableRoomsPerType [1] + 1;
    
        } else if (availableRooms.get(i).getType().equals("triple")) {
    
            availableRoomsPerType [2] = availableRoomsPerType [2] + 1;
    
        } else {
    
            availableRoomsPerType [3] = availableRoomsPerType [3] + 1;
    
        }
    
    }

/* show errors */

String errors = "";

if (date.after(date1)) errors += "<li>Departure date is later than arrival date.</li>";
if (date.before(localDateDate)) errors += "<li>Arrival date is earlier that today's date.</li>";
if (n1Int > availableRoomsPerType[0]) errors += "<li>There aren't enough available Single rooms.</li>";
if (n2Int > availableRoomsPerType[1]) errors += "<li>There aren't enough available Double rooms.</li>";
if (n3Int > availableRoomsPerType[2]) errors += "<li>There aren't enough available Triple rooms.</li>";
if (n4Int > availableRoomsPerType[3]) errors += "<li>There aren't enough available Quadruple rooms.</li>";

%>


<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp"%>

</head>

<body id="makeReservation">
    <%@include file="agency_navbar.jsp"%>

    <header>
        <meta name="description" content="">
        <meta name="author" content="">
    
        <title>Dream Hotel | New Reservation</title>
        <%@include file="header.jsp" %>
    </header>
    
    <!-- Begin page content -->

    <main class="container">
        <div id="makeReservation_form" class="col-xs-12 col-md-10 col-lg-8" style="padding: 20px">
            <% if (errors == "") { %>

                    <div class="alert alert-success" role="alert">
                        <div class="page-header">
                            <h1>Reservation almost done!</h1>
                            <hr>
                            <h2> Please wait until the hotel confirms your reservation. </h2>
                        </div>
                    </div>

                    <%
                
                    Reservation reservation = new Reservation(hotelName, agencyName, sqlDateArrival, time1, sqlDateDeparture, time2, numOfPeopleInt, n1Int, n2Int, n3Int, n4Int, comments);
                
                    rd.insertReservation(reservation);
                   
                } else { %>

                    <div class="page-header">
                        <h1>The Reservation form has errors</h1>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        <ol>
                            <%=errors%>
                        </ol>
                    </div>

            <% } %>                               
        </div>
    </main>

    <%@include file="footer.jsp"%>
    
</body>

</html>

