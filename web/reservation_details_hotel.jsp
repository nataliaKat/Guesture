<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<%@ page import="dao.GroupCustomerDao" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="model.GroupCustomer" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.Service" %>
<%@ page import="java.util.List" %>
<%--<%@ page errorPage="errorPage.jsp" %>--%>

<html>
<head>
    <%@include file="header.jsp" %>
    <title>Dream Hotel | Reservation Details</title>
</head>
<body>
<%@include file="navbar.jsp" %>
<%
    Hotel signedInHotel = (Hotel) session.getAttribute("userObj");
    if (signedInHotel == null) {
        request.setAttribute("message", "You should sign in first");

%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
    }
    String hotelUsername = signedInHotel.getUsername();
    ReservationDao rd = new ReservationDao();


    double[] prices = rd.getPricePerRoomType(hotelUsername);

    String reservationCode = request.getParameter("rid");
    int reservationCodeInt = Integer.parseInt(reservationCode);

    Reservation reservation = rd.getReservationOfHotelById(reservationCodeInt, hotelUsername);

    String agencyUsername = reservation.getAgencyName();


%>
<main>
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12">
                <h2><i>Reservation <%=reservationCodeInt %> Details</i></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box">
                    <b>Reservation id:</b> <%=reservationCodeInt %><br>
                    <b>Agency:</b> <%=agencyUsername %><br>
                    <b>Created on:</b> <%=reservation.getSubmittedOn() %><br>
                    <b>Confirmed: </b> <%=reservation.getConfirmed() %><br>
                    <b>Checked in: </b> <%
                    if (reservation.isCheckedIn()) { %>
                    Yes
                    <% } else { %>
                    No
                    <% } %>
                    <br>
                    <b>Checked out: </b> <%
                    if (reservation.isCheckedOut()) { %>
                    Yes
                    <% } else { %>
                    No
                    <% } %>
                    <br>
                    <b>Comments: </b>
                    <% if (reservation.getComments() == null) { %>

                    <% } else { %>
                    <%=reservation.getComments() %>
                    <% } %>
                </div>
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
                            <td><%=prices[0]%>
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
            <div class="col-md-4">
                <div class="box">
                    <form role="form" method="POST" action="editController.jsp">
                        <input type="hidden" id="resiId" name="resId">
                        <div class="row">
                            <div class="col">
                                <label for="ar_date" class="control-label">Arrival date</label>
                                <input id="ar_date" type="date" class="form-control form-control-sm" name="ar_date"
                                       value="<%=reservation.getArrivalDate()%>">
                            </div>
                            <div class="col">
                                <label for="ar_time" class="control-label">Arrival time</label>
                                <select id="ar_time" type="selct" class="form-control form-control-sm" name="ar_time">
                                    <option value="morning"<%if (reservation.getArrivalTime().equals("morning")) { %> selected="selected"<% } %>>morning</option>
                                    <option value="noon" <%if (reservation.getArrivalTime().equals("noon")) { %> selected="selected"<% } %>>noon</option>
                                    <option value="evening" <%if (reservation.getArrivalTime().equals("evening")) { %> selected="selected"<% } %>>evening</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="dep_date" class="control-label">Departure date</label>
                                <input id="dep_date" type="date" class="form-control form-control-sm" name="dep_date"
                                       value="<%=reservation.getDepartureDate()%>">
                            </div>
                            <div class="col">
                                <label for="ar_time" class="control-label">Departure time</label>
                                <select id="dep_time" type="text" class="form-control form-control-sm" name="dep_time">
                                    <option value="morning"<%if (reservation.getDepartureTime().equals("morning")) { %> selected="selected"<% } %>>morning</option>
                                    <option value="noon" <%if (reservation.getDepartureTime().equals("noon")) { %> selected="selected"<% } %>>noon</option>
                                    <option value="evening" <%if (reservation.getDepartureTime().equals("evening")) { %> selected="selected"<% } %>>evening</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <input type="submit" class="ml-auto brownButton" style="margin: 10px;" value="Edit">
                        </div>
                    </form>
                </div>
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
