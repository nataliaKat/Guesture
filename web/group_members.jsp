<%@ page import="dao.GroupingDao" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="model.Agency" %>
<%@ page import="model.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<html>
<head>
    <title>Dream Hotel | Group Members</title>
    <%@include file="header.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<%
    int reservationId = Integer.parseInt(request.getParameter("reservation"));
    request.setAttribute("reservation", reservationId);
    Agency signedInAgency = (Agency)session.getAttribute("userObj");
    if (signedInAgency == null) {
        throw new Exception("You are not authorized to view this content");
    }
    GroupingDao groupingDao = new GroupingDao();
    ReservationDao reservationDao = new ReservationDao();
    Reservation foundReservation = reservationDao.getById(reservationId);

    if (!foundReservation.getAgencyName().equals((signedInAgency).getUsername())) {
        throw new Exception("You are trying to view content you are not allowed to");

    }
    if (foundReservation == null) {
        throw new Exception("Reservation not found!");
    }
    if (!groupingDao.getGroupingsPerReservation(reservationId).isEmpty() || foundReservation.getConfirmed() == false) {
        throw new Exception("Customers cannot be inserted");
    }
%>
<div id="cover-spin"></div>
<main class="container-fluid" id="group">
    <div class="row">
        <!-- Form -->
        <div id="myform" class="col-sm-12 col-lg-4 ml-5">
            <form action="" method="POST" class="form-horizontal">
                <div class="form-group">
                    <label for="name" class="control-label">First Name </label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="cust_name" class="form-control" placeholder="name"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sname" class="control-label">Last Name</label>
                    <div class="col-sm-10">
                        <input type="text" id="sname" name="cust_sname" class="form-control" placeholder="surname"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idnumber" class="control-label">Identity Number</label>
                    <div class="col-sm-10">
                        <input type="text" id="idnumber" name="cust_id" class="form-control" placeholder="number">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="control-label">Phone</label>
                    <div class="col-sm-10">
                        <input type="tel" id="telephone" name="cust_tel" class="form-control"
                               placeholder="phone">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="control-label">e-mail</label>
                    <div class="col-sm-10">
                        <input type="tel" id="email" name="cust_mail" class="form-control" placeholder="mail">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <button type="submit" class="brownButton">Insert</button>
                        <button type="reset" class="blueButton">Clear</button>

                    </div>
                </div>

            </form>
        </div>
        <!-- Table -->
        <div class="col-xs-12 col-lg-7">
            <div class="row">
                <div class="table-responsive table-striped table-sm">
                    <table id="customer-table" class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Identity Number</th>
                            <th scope="col">Phone</th>
                            <th scope="col">email</th>
                            <th scope="col">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="cust-submit" class="row">
                <button class="btn btn-secondary" onclick="location.href='group.html'"
                        style="border-radius: 7px; margin-left: 3px;">Back</button>
                <!-- Button trigger modal -->
                <button type="button" class="brownButton" data-toggle="modal" data-target="#exampleModal">
                    Submit
                </button>
                <button id="new-room" style="border-radius: 7px; margin-right: 3px;" class="darkBlueButton">New Room</button>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Members are going to be submitted
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="blueButton" data-dismiss="modal">Cancel</button>
                            <button type="button" class="brownButton" id="final-submit">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<script src="js/customers.js"></script>
</body>
</html>
