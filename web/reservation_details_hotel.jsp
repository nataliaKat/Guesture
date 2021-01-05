<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp"%>
    <title>Dream Hotel | Reservation Details</title>
</head>
<body>
<%@include file="navbar.jsp"%>
<main>
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12">
                <h2><i>Reservation #18 Details</i></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box">
                    <b>Reservation id:</b> 18<br>
                    <b>Agency:</b> Dream Agency<br>
                    <b>Created on:</b> 2020/02/12<br>
                    <b>Confirmed: </b> Yes<br>
                    <b>Checked in: </b> Yes<br>
                    <b>Checked out: </b> No<br>
                    <b>Comments: </b>
                    Mrs X wants a room in the 1st floor, Vegan menu
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
                            <td>
                                45
                            </td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>Double</td>
                            <td>50</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>Triple</td>
                            <td>55</td>
                            <td>25</td>
                        </tr>
                        <tr>
                            <td>Quad</td>
                            <td>60</td>
                            <td>13</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box">
                    <form role="form" method="POST" action="edit.jsp">
                        <input type="hidden" id="resiId" name="resId">
                        <div class="row">
                            <div class="col">
                                <label for="ar_date" class="control-label">Arrival date</label>
                                <input id="ar_date" type="date" class="form-control form-control-sm" name="ar_date"
                                       value="2021-05-12">
                            </div>
                            <div class="col">
                                <label for="ar_time" class="control-label">Arrival time</label>
                                <select id="ar_time" type="selct" class="form-control form-control-sm" name="ar_time">
                                    <option value="morning">morning</option>
                                    <option value="noon" selected="selected">noon</option>
                                    <option value="evening">evening</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="dep_date" class="control-label">Departure date</label>
                                <input id="dep_date" type="date" class="form-control form-control-sm" name="ar_date"
                                       value="2021-05-20">
                            </div>
                            <div class="col">
                                <label for="ar_time" class="control-label">Departure time</label>
                                <select id="dep_time" type="text" class="form-control form-control-sm" name="dep_time">
                                    <option value="morning">morning</option>
                                    <option value="noon">noon</option>
                                    <option value="evening" selected="selected">evening</option>
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

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-3">
                <h4 class="text-center">Services</h4>
                <ol>
                    <li>...</li>
                </ol>
            </div>
        </div>
    </div>
</main>

<%@include file="footer.jsp"%>
</body>
</html>
