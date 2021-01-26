<%@ page import="dao.ReservationDao" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%
    Hotel signedInHotel = (Hotel) session.getAttribute("userObj");
    if (signedInHotel == null) {
        request.setAttribute("message", "You should sign in first");
%>
<jsp:forward page="login.jsp"></jsp:forward>

<%
    }
%>
<head>
    <title>Dream Hotel | Home</title>
    <%@include file="header.jsp" %>
</head>
<body id="home">
<%@include file="navbar.jsp" %>
<!-- Page Content -->
<main>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-6" style="color: white;">
                    <b><h1 class="mt-5">Welcome back!</h1></b>
                    <b><p>See all reservations</p></b>
                    <button class="btn btn-info" onclick="location.href = 'reservations.jsp'">Show reservations
                    </button>

                </div>
                <div class="col-md-6">
                    <h3>Today's reservations</h3>
                    <table class="table table-bordered table-dark">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Agency</th>
                            <th scope="col">Arrival Time</th>
                            <th scope="col">View More</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ReservationDao reservationDao = new ReservationDao();
                            List<Reservation> reservations = reservationDao.getRecent(signedInHotel.getUsername());
                            for (Reservation r : reservations) {
                        %>
                        <tr>
                            <td><%=r.getReservationId()%>
                            </td>
                            <td><%=r.getAgencyName()%>
                            </td>
                            <td><%=r.getArrivalTime()%>
                            </td>
                            <td>
                                <button class="blueButton"
                                        onclick="location.href='reservation_details_hotel.jsp?rid=<%=r.getReservationId()%>'">
                                    More
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
                if (request.getAttribute("successMessage") != null) {
            %>
            <div class="row">
                <div class="alert alert-success mt-3 col-12 text-center" role="alert">
                    <div class="page-header">
                        <%=request.getAttribute("successMessage")%>
                    </div>
                </div>
            </div>
            <%}%>

        </div>
    </section>
</main>
<%@include file="footer.jsp" %>
</body>

</html>
