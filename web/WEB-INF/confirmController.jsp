<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!doctype html>
    <html lang="en">

    <head>

        <title>Dream Hotel | Reservations</title>

        <%@include file="header.jsp" %>
    </head>

    <body id="reservation">
        <%@include file="navbar.jsp" %>

            <!-- Begin page content -->
            <main class="container">
                <% ReservationDao rd = new ReservationDao();
                   rd.confirm();
                <div class="alert alert-success" role="alert">
                    <h1>Reservation has been cofirmed successfully</h1>
                </div>
        
            </main>
            <%@include file="footer.jsp" %>
    </body>

    </html>