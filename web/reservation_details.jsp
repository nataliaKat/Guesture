<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<%@page import="dao.GroupCustomerDao" %>

<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="model.GroupCustomer" %>
<%@ page import="model.Reservation" %>

<%@ page import="model.Service" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="header.jsp" %>

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Reservation</title>

    <%
        Agency signedInAgency = (Agency) session.getAttribute("userObj");
        if (signedInAgency == null) {
            request.setAttribute("message", "You should sign in first");

    %>
    <jsp:forward page="login.jsp"></jsp:forward>
    <%
        }
    %>

</head>

<body>
<header>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Reservation Details</title>
    <%@include file="header.jsp" %>
</header>
<%@include file="agency_navbar.jsp" %>

<%

    ReservationDao rd = new ReservationDao();

    String agencyUsername = ((Agency) session.getAttribute("userObj")).getUsername();

    String reservationCode = request.getParameter("rid");
    int reservationCodeInt = Integer.parseInt(reservationCode);

    Reservation reservation = rd.getReservationOfAgencyById(reservationCodeInt, agencyUsername);

    String hotelUsername = reservation.getHotelName();

    double[] prices = rd.getPricePerRoomType(hotelUsername);

%>

<main>
    <div class="container">
        <div class="row">
            <div class="col-md-4 box">
                <b>Reservation id:</b> <%=reservationCodeInt %><br>
                <b>Hotel:</b> <%=hotelUsername %><br>
                <b>Arrival Date:</b> <%=reservation.getArrivalDate() %><br>
                <b>Arrival Time:</b> <%=reservation.getArrivalTime() %><br>
                <b>Departure Date:</b> <%=reservation.getDepartureDate() %><br>
                <b>Departure Time:</b> <%=reservation.getDepartureTime() %><br>
                <b>Created on:</b> <%=reservation.getSubmittedOn() %><br>
                <b>Confirmed by hotel:</b> <%=reservation.getConfirmed() %><br>
                <b>Completed:</b> <%
                if (reservation.isCheckedOut()) { %>
                Yes
                <% } else { %>
                No
                <% } %>
                <br>
            </div>

            <div class="col-md-4">
                <div class="table-responsive table-striped">
                    <table class="table table-hover table-striped table-bordered" style="text-align: center;">
                        <thead>
                        <tr>
                            <th scope="col">Room Type</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Single</td>
                            <td>
                                <%=prices[0]%>
                            </td>
                            <td><%=reservation.getSingleRooms() %>
                            </td>
                        </tr>
                        <tr>
                            <td>Double</td>
                            <td><%=prices[1]%>
                            </td>
                            <td><%=reservation.getDoubleRooms() %>
                            </td>
                        </tr>
                        <tr>
                            <td>Triple</td>
                            <td><%=prices[2]%>
                            </td>
                            <td><%=reservation.getTripleRooms() %>
                            </td>
                        </tr>
                        <tr>
                            <td>Quad</td>
                            <td><%=prices[3]%>
                            </td>
                            <td><%=reservation.getQuadrupleRooms() %>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4 box">
                <h5>Comments</h5>
                <% if (reservation.getComments() == null) { %>

                <% } else { %>
                <%=reservation.getComments() %>
                <% } %>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-9">
                <h4 class="text-center">Group Members</h4>
                <div class="table-responsive table-striped table-sm">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Identity Number</th>
                            <th scope="col">Phone</th>
                            <th scope="col">email</th>
                            <th scope="col">Room</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            GroupCustomerDao gcd = new GroupCustomerDao();
                            List<GroupCustomer> groupMembers = gcd.getGroupCustomersPerReservation(reservationCodeInt);
                            for (int i = 0; i < groupMembers.size(); i++) {

                        %>

                        <tr>
                            <td><%=reservationCodeInt %>
                            </td>
                            <td><%=groupMembers.get(i).getName() %>
                            </td>
                            <td><%=groupMembers.get(i).getSurname() %>
                            </td>
                            <td><%=groupMembers.get(i).getIdentityNumber() %>
                            </td>
                            <td><%=groupMembers.get(i).getTelephone() %>
                            </td>
                            <td><%=groupMembers.get(i).getEmail() %>
                            </td>
                            <td><%=groupMembers.get(i).getSurname() %>
                            </td>
                            <td><%=groupMembers.get(i).getGrouping().getRoomId() %>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-3">
                <h4 class="text-center">Services</h4>
                <ol>
                    <%
                        ServiceDao sd = new ServiceDao();
                        List<Service> services = sd.getServicesPerReservation(reservationCodeInt, hotelUsername);
                        for (int i = 0; i < services.size(); i++) {

                    %>
                    <li><%=services.get(i).getName() %>
                    </li>

                    <% } %>

                </ol>
            </div>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
</body>

</html>