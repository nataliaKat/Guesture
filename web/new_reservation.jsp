<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<%@ page import="model.Service" %>
<%@ page import="model.User" %>

<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>


<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp"%>

</head>

<body id="new_reservation">
<%@include file="navbar.jsp"%>
    

    <% 
    ReservationDao rd = new ReservationDao();

    /* */
    String hotelName = "luxury@gmail.com";
    String agencyName = "holidays@gmail.com";

    double [] prices = rd.getPricePerRoomType(hotelName);

    User user = (User)session.getAttribute("userObj");
    // agencyName = user.getUsername();

    %>

    <!-- Begin page content -->
    <main class="container">
        <div class="row">
            <!-- Form -->
            <div id="res-form" class="col-xs-12 col-md-10 col-lg-8" style="padding: 20px">
                <h1 class="text-center">New Reservation</h1>
                <!-- Form method should be "POST" and action should be included at the real system, removed it for demo purposes -->
                <form class="form-horizontal" action="makeReservationController.jsp" method="POST">
                    <input type="hidden" id="agencyName" name="agencyName" value="<%=agencyName%>">
                    <input type="hidden" id="hotelName" name="hotelName" value="<%=hotelName%>">

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
                                <option value="1">Morning</option>
                                <option value="2">Noon</option>
                                <option value="3">Afternoon</option>
                                <option value="4">Evening</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="num-of-people" class="col-sm-4 control-label">Number of People</label>
                        <div class="col-sm-3">
                            <input type="number" min="2" id="num-of-people" name="numOfPeople" class="form-control" required>
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
                                                    <input name="singleprice" id="singleprice" readonly class="form-control-plaintext" value="<%=prices[0]%>">
                                                </td>
                                                <td>
                                                    <input min="0" name="n1" id="n1" type="number" class="table-input"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Double</td>
                                                <td class="display-flex">
                                                    <input name="doubleprice" id="doubleprice" readonly class="form-control-plaintext" value="<%=prices[1]%>">
                                                </td>
                                                <td>
                                                    <input name="n2" id="n2" type="number" class="table-input" min="0"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Triple</td>
                                                <td class="display-flex">
                                                    <input name="tripleprice" id="tripleprice" readonly class="form-control-plaintext" value="<%=prices[2]%>">
                                                </td>
                                                <td>
                                                    <input name="n3" id="n3" type="number" class="table-input" min="0"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Quadruple</td>
                                                <td>
                                                    <input type="text" name="quadrupleprice" id="quadrupleprice" readonly class="form-control-plaintext" value="<%=prices[3]%>">
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
                        List<Service> services = sd.getAllServices(hotelName);

                        for (int i = 0; i < services.size() ; i++) { %>

                            <div class="form-group checkbox">
                                <label class="col-sm-2 control-label"><%=services.get(i).getName() %></label>
                                <input type="checkbox" value="" name="ser-<%=i%>">
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
                                <button type="submit" class="brownButton">Submit</button>
                                <button type="reset" class="blueButton">Clear</button>

                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@include file="footer.jsp"%>
    <script src="js/res_form.js"></script>
</body>

</html>
