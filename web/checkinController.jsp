<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ReservationDao" %>
<%@ page errorPage="errorPage.jsp" %>
<%

int resId = Integer.parseInt(request.getParameter("resId"));

%>
    <!doctype html>
    <html lang="en">

    <head>

        <title>Guesture | Reservations</title>

        <%@include file="header.jsp" %>
    </head>

    <body id="reservation">
        <%@include file="navbar.jsp" %>

            <!-- Begin page content -->
            <main class="container">
                <% ReservationDao rd = new ReservationDao();
                   rd.checkIn(resId);
                %>  
                <div class="alert alert-success" role="alert">
                    <h1>Reservation has been checked in successfully!</h1>
                </div>
        
            </main>
            <%@include file="footer.jsp" %>
    </body>

    </html>
