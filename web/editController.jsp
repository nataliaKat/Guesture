<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ReservationDao" %>
<%@ page errorPage="errorPage.jsp" %>

<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDao" %>

<%

int resId = Integer.parseInt(request.getParameter("resId"));
String arrival = request.getParameter("ar_date");
String time1 = request.getParameter("ar_time");
String departure = request.getParameter("dep_date");
String time2 = request.getParameter("dep_time");

/* Convert Strings arrival and departure to Sql Date */

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date = sdf.parse(arrival);
java.sql.Date sqlDateArrival = new java.sql.Date(date.getTime());

java.util.Date date1 = sdf.parse(departure);
java.sql.Date sqlDateDeparture = new java.sql.Date(date1.getTime());

/* get today's date and convert it to Date type */

LocalDate localdate = LocalDate.now();
Date localDateDate = java.sql.Date.valueOf(localdate);

String errors = "";

if (date.after(date1)) errors += "<li>Departure date is later than arrival date.</li>";
if (date.before(localDateDate)) errors += "<li>Arrival date is earlier that today's date.</li>";

%>
    <!doctype html>
    <html lang="en">

    <head>

        <title>Guesture | Edit</title>

        <%@include file="header.jsp" %>
    </head>

    <body id="reservation">
        <%@include file="navbar.jsp" %>

            <!-- Begin page content -->
            <main class="container">
                
                <% if (errors == "") { %>
                <div class="alert alert-success" role="alert">
                    <h1>Reservation has been edited successfully!</h1>
                </div>

                <% Reservation r = new Reservation(sqlDateArrival, time1, sqlDateDeparture, time2, resId);
                ReservationDao rd = new ReservationDao();
                rd.edit(r);

             } else { %>
                <div class="alert alert-danger" role="alert">
                    <ol>
                        <%=errors%>
                    </ol>
                </div>
            <% } %>   

            </main>
            <%@include file="footer.jsp" %>
    </body>

    </html>