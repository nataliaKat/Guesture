<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="dao.AgencyDao" %>
<%@page import="dao.ReservationDao" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page errorPage="errorPage.jsp" %>


<!doctype html>
<html lang="en">
<head>
    <%@include file="header.jsp" %>
    <%@include file="datatables_stylesheets.jsp" %>
    <title>Guesture | Reservations</title>
</head>
<% Hotel signedInHotel = null;
    try {
        signedInHotel = (Hotel) session.getAttribute("userObj");
    } catch (ClassCastException e) {
        request.setAttribute("message", "You are not authorized to view this content");
%>
<jsp:forward page="view_hotels.jsp"></jsp:forward>

<% }
    if (signedInHotel == null) {
        request.setAttribute("message", "You should sign in first");
%>
<jsp:forward page="login.jsp"></jsp:forward>

<%
    }
%>
<body id="reservation">
<%@include file="navbar.jsp" %>

<!-- Begin page content -->
<main class="container-fluid">
    <div class="m-3">
        <table id="example"
               class="table table-hover table-striped table-bordered dt-responsive nowrap table-dark"
               style="width: 100%;">
            <thead>
            <tr>
                <th scope="col">Reservation code</th>
                <th scope="col">Agency</th>
                <th scope="col">Reservation Details</th>
                <th scope="col">Action</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody style="text-align: center;">
                <% ReservationDao rd = new ReservationDao();
                                                        AgencyDao agencyDao = new AgencyDao();
                                                        String username = signedInHotel.getUsername();
                                                        int reservationCode = 0;

                                                        List<Reservation> reservations = rd.getAll(username);
                                                        for (int i = 0; i < reservations.size(); i++) {

                                                            reservationCode = reservations.get(i).getReservationId();

                                                    %>

            <tr>
                <td>
                    <%=reservationCode%>

                </td>
                <td>
                    <%=agencyDao.getByUsername(reservations.get(i).getAgencyName()).getName()%>
                </td>
                <td>
                    <form action="reservation_details_hotel.jsp?rid=<%=reservationCode%>" target="_blank" method="POST">
                        <button class="blueButton">Reservation Details</button>
                    </form>
                </td>
                <td>

                    <% if (reservations.get(i).getConfirmed() == false) { %>

                    <button type="button" class="btn btn-success"
                            onclick="location.href='confirmController.jsp?resId=<%=reservationCode%>'"><i
                            class="fas fa-check"></i></button>

                    <% } else if (reservations.get(i).getConfirmed() == true && reservations.get(i).isCheckedIn() == false) { %>

                    <button type="button" class="btn btn-info"
                            onclick="location.href='checkinController.jsp?resId=<%=reservationCode%>'"><i
                            class="fas fa-door-closed"></i></button>

                    <% } else if (reservations.get(i).getConfirmed() == true && reservations.get(i).isCheckedIn() == true &&
                            reservations.get(i).isCheckedOut() == false) { %>

                    <button type="button" class="btn btn-info"
                            onclick="location.href='checkoutController.jsp?resId=<%=reservationCode%>'"><i
                            class="fas fa-door-open"></i></button>

                    <% } else { %>
                    -
                    <% } %>

                </td>
                <td>
                    <button type="button" class="btn btn-danger"
                            onclick="location.href='deleteController.jsp?resId=<%=reservationCode%>'"><i
                            class="fas fa-trash-alt"></i></button>
                </td>
            </tr>

                <% } %>
            <tfoot>
            <tr>
                <th scope="col">Reservation code</th>
                <th scope="col">Agency</th>
                <th scope="col">Reservation Details</th>
                <th scope="col">Action</th>
                <th scope="col">Delete</th>
            </tr>
            </tfoot>
            </tbody>
        </table>
    </div>


</main>
<%@include file="footer.jsp" %>
<%@include file="datatables_scripts.jsp" %>
<script src="js/reservations.js"></script>

</body>

</html>