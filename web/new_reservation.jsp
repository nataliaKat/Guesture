<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<%@page import="dao.HotelDao" %>
<%@page import="dao.ReservationDao" %>

<%@ page import="dao.ServiceDao" %>
<%@ page import="model.Hotel" %>

<%@ page import="model.Service" %>
<%@ page import="java.util.List" %>


<!doctype html>
<html lang="en">

<head>

    <title>Guesture | New Reservation</title>
    <%@include file="header.jsp" %>

</head>
<% Agency signedInAgency = null;
    try {
        signedInAgency = (Agency) session.getAttribute("userObj");
    } catch (ClassCastException e) {
        request.setAttribute("message", "You are not authorized to view this content");
%>
<jsp:forward page="index.jsp"></jsp:forward>

<% }
    if (signedInAgency == null) {
        request.setAttribute("message", "You should sign in first");
%>
<jsp:forward page="login.jsp"></jsp:forward>

<%
    }
%>
<body id="new_reservation">
<%@include file="agency_navbar.jsp" %>

<%
    ReservationDao rd = new ReservationDao();
    HotelDao hotelDao = new HotelDao();

    String hotelUsername = (String) request.getParameter("hotel");

    Hotel hotel = hotelDao.getHotelByUsername(hotelUsername);
    String hotelName = hotel.getName();

    double[] prices = rd.getPricePerRoomType(hotelUsername);

    String agencyUsername = signedInAgency.getUsername();

%>

<!-- Begin page content -->
<div id="cover-spin"></div>

<main class="container">
    <div class="row">
        <!-- Form -->
        <div id="res-form" class="col-xs-12 col-md-10 col-lg-8" style="padding: 20px">
            <h1 class="text-center">New Reservation for <%=hotelName%></h1>
            <!-- Form method should be "POST" and action should be included at the real system, removed it for demo purposes -->
            <!--    <form class="form-horizontal" action="makeReservationController.jsp" method="POST">     -->
            <form class="form-horizontal" action="makeReservationController.jsp" method="POST">
                <input type="hidden" id="agencyName" name="agencyName" value="<%=agencyUsername%>">
                <input type="hidden" id="hotelName" name="hotelName" value="<%=hotelUsername%>">

                <div class="form-group">
                    <label for="arrival" class="col-sm-4 control-label">Arrival Date</label>
                    <div class="col-sm-10">
                        <input type="date" id="arrival" name="arrival" class="form-control" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="time1" class="col-sm-4 control-label">Arrival Time</label>
                    <div class="col-sm-10">
                        <select id="time1" name="time1" class="form-control" required>
                            <option value="">Select zone</option>
                            <option value="morning">Morning</option>
                            <option value="noon">Noon</option>
                            <option value="afternoon">Afternoon</option>
                            <option value="evening">Evening</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="departure" class="col-sm-4 control-label">Departure Date</label>
                    <div class="col-sm-10">
                        <input type="date" id="departure" name="departure" class="form-control" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="time2" class="col-sm-4 control-label">Departure Time</label>
                    <div class="col-sm-10">
                        <select id="time2" name="time2" class="form-control" required>
                            <option value="">Select zone</option>
                            <option value="morning">Morning</option>
                            <option value="noon">Noon</option>
                            <option value="afternoon">Afternoon</option>
                            <option value="evening">Evening</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="num-of-people" class="col-sm-4 control-label">Number of People</label>
                    <div class="col-sm-3">
                        <input type="number" min="2" id="num-of-people" name="numOfPeople" class="form-control"
                               required>
                    </div>
                </div>

                <div class=" form-group">
                    <div class="col-xs-12 col-lg-8">
                        <div class="row">
                            <div class="table-responsive table-striped" style="overflow-x: visible;">
                                <table id="cost-table" class="table table-hover table-striped table-bordered ml-3"
                                       style="text-align: center;">
                                    <thead>
                                    <tr>
                                        <th scope="col">Room Type</th>
                                        <th scope="col">Price per Room (&#8364)</th>
                                        <th scope="col">Number of Rooms Needed</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Single</td>
                                        <td class="display-flex">
                                            <input name="singleprice" id="singleprice" readonly
                                                   class="form-control-plaintext" value="<%=prices[0]%>">
                                        </td>
                                        <td>
                                            <input min="0" name="n1" id="n1" type="number" class="table-input"
                                                   required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Double</td>
                                        <td class="display-flex">
                                            <input name="doubleprice" id="doubleprice" readonly
                                                   class="form-control-plaintext" value="<%=prices[1]%>">
                                        </td>
                                        <td>
                                            <input name="n2" id="n2" type="number" class="table-input" min="0"
                                                   required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Triple</td>
                                        <td class="display-flex">
                                            <input name="tripleprice" id="tripleprice" readonly
                                                   class="form-control-plaintext" value="<%=prices[2]%>">
                                        </td>
                                        <td>
                                            <input name="n3" id="n3" type="number" class="table-input" min="0"
                                                   required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quadruple</td>
                                        <td>
                                            <input type="text" name="quadrupleprice" id="quadrupleprice" readonly
                                                   class="form-control-plaintext" value="<%=prices[3]%>">
                                        <td>
                                            <input name="n4" id="n4" type="number" class="table-input" min="0"
                                                   required>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="num-of-people" class="col-sm-4 control-label">Total Cost</label>
                        <div class="col-sm-3">
                            <input readonly id="total-cost" class="form-control" value="">
                        </div>
                    </div>
                    <br>

                    <%

                        ServiceDao sd = new ServiceDao();
                        List<Service> services = sd.getAllServices(hotelUsername);

                        for (int i = 0; i < services.size(); i++) { %>

                    <div class="form-group checkbox">
                        <label class="col-sm-2 control-label"><%=services.get(i).getName() %>
                        </label>
                        <input type="checkbox" value="" name="ser-<%=services.get(i).getServiceId()%>">
                    </div>

                    <% } %>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">Comments </label>
                        <div class="col-sm-10">

                                <textarea class="form-control" rows="3" maxlength="200" name="comments"
                                          placeholder="Insert any comments here"></textarea>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-2">
                            <button type="submit" id="final-submit" class="brownButton">Submit</button>
                            <button type="reset" class="blueButton">Clear</button>

                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
<script src="js/res_form.js"></script>
</body>

</html>
