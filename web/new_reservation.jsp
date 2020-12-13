<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Service" %>

<!doctype html>
<html lang="en">

<head>

    <title>Dream Agency | New Reservation</title>
    <%@include file="header.jsp"%>

</head>

<body id="new_reservation">
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand" href="index.html"><img class="logo" src="../web/images/logo_blue_nav.png" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="agencies.html">Agencies</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="reservations.html">Reservations<span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reviews.html">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="chart.html">Statistics</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-user"></i> Dream Hotel</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link logout" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <!-- Begin page content -->
    <main class="container">
        <div class="row">
            <!-- Form -->
            <div id="res-form" class="col-xs-12 col-md-10 col-lg-8" style="padding: 20px">
                <h1 class="text-center">New Reservation</h1>
                <!-- Form method should be "POST" and action should be included at the real system, removed it for demo purposes -->
                <form class="form-horizontal" action="makeReservation.jsp" method="POST">
                    <input type="hidden" id="agencyName" name="agencyName" value="">
                    <input type="hidden" id="hotelName" name="hotelName" value="">

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
                                <option value="1">Morning</option>
                                <option value="2">Noon</option>
                                <option value="3">Afternoon</option>
                                <option value="4">Evening</option>
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
                            <input type="number" min="2" id="num-of-people" name="num-of-people" class="form-control" required>
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
                                                <th scope="col">Price per Room</th>
                                                <th scope="col">Number of Rooms Needed</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Single</td>
                                                <td>
                                                    <input type="text" name="singleprice" readonly>
                                                </td>
                                                <td>
                                                    <input min="0" name="n-1" id="n-1" type="number" class="table-input"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Double</td>
                                                <td>
                                                    <input type="text" name="doubleprice" readonly>
                                                </td>
                                                <td>
                                                    <input name="n-2" id="n-2" type="number" class="table-input" min="0"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Triple</td>
                                                <td>
                                                    <input type="text" name="tripleprice" readonly>
                                                </td>
                                                <td>
                                                    <input name="n-3" id="n-3" type="number" class="table-input" min="0"
                                                        required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Quadruple</td>
                                                <td>
                                                    <input type="text" name="quadruple" readonly>
                                                </td>
                                                <td>
                                                    <input name="n-4" id="n-4" type="number" class="table-input" min="0"
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
                                <input readonly id="total-cost" class="form-control">
                            </div>
                        </div>
                        <br>

                        <% 
                        ReservationDao rd = new ReservationDao();
                        List<Service> services = rd.getAllServices(hotelName);
                        int counter = 0;

                        for (int i = 0; i < services.size() ; i++) {} %>

                            <div class="form-group checkbox">
                                <label class="col-sm-2 control-label"><%=services.get(i).getName() %></label>
                                <input type="checkbox" value="" name="<%=++counter%>">
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
                                <button type="submit" class="my-button">Submit</button>
                                <button type="reset" class="blueButton">Clear</button>

                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </main>

    <%@include file="footer.jsp"%>
    <script src="../web/js/res_form.js"></script>
</body>

</html>
