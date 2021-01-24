<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@page import="dao.GroupCustomerDao" %>
        <%@page import="dao.ReservationDao" %>
            <%@ page import="model.Reservation" %>
                <%@ page import="java.util.List" %>
                    <%@ page import="dao.AgencyDao" %>
                        <%@ page errorPage="errorPage.jsp" %>


                            <!doctype html>
                            <html lang="en">

                            <head>
                                <%@include file="header.jsp" %>
                                    <%@include file="datatables_stylesheets.jsp" %>
                                        <title>Dream Hotel | Reservations</title>
                            </head>

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
                                                    <% ReservationDao rd=new ReservationDao(); 
                                                        AgencyDao agencyDao=new AgencyDao(); 
                                                        String username=((Hotel)session.getAttribute("userObj")).getUsername();
                                                        int reservationCode = 0;

                                                        boolean btrue = true;
                                                        boolean bfalse = false;

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

                                                                    <% if (reservations.get(i).getConfirmed() == bfalse) { %>

                                                                        <button type="button" class="btn btn-success"
                                                                        data-toggle="modal"
                                                                        data-target="#confirm-modal"><i
                                                                            class="fas fa-check"></i></button>
                                                                        
                                                                    <% } else if (reservations.get(i).getConfirmed() == btrue && reservations.get(i).isCheckedIn() == bfalse) { %>
                                                                
                                                                        <button type="button" class="btn btn-info"
                                                                            data-toggle="modal"
                                                                            data-target="#checkin-modal"><i
                                                                                class="fas fa-door-closed"></i></button>

                                                                    <% } else { %> 

                                                                        <button type="button" class="btn btn-info"
                                                                        data-toggle="modal"
                                                                        data-target="#checkout-modal"><i
                                                                            class="fas fa-door-open"></i></button>

                                                                    <% } %>
                                                                 
                                                                </td>
                                                                <td>
                                                                    <button type="button" class="btn btn-danger"
                                                                        data-toggle="modal"
                                                                        data-target="#delete-modal"><i
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


                                        <% for (int i=0; i < reservations.size(); i++) { %>
                                            <!-- Modal For Confirm -->
                                            <div class="modal fade" id="confirm-modal" tabindex="-1" role="dialog"
                                                aria-labelledby="Confirm Reservation" aria-hidden="true">
                                                <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                    role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title" id="Confirm">Confirm</h1>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form role="form" method="POST"
                                                                action="confirmController.jsp">
                                                                <div class="form-group">
                                                                    <label class="control-label">The reservation
                                                                        will be
                                                                        confirmed</label>
                                                                </div>
                                                                <div class="form-group">

                                                                    <button type="button" class="btn btn-success"
                                                                        data-dismiss="modal"
                                                                        onclick="location.href = 'confirmController.jsp?resId=<%=reservations.get(i).getReservationId()%>'">Confirm</button>
                                                                    <button type="button" class="btn btn-secondary"
                                                                        data-dismiss="modal">Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>

                                                <% for (int i=0; i < reservations.size(); i++) { %>
                                                    <!-- Modal For Delete -->
                                                    <div class="modal fade" id="delete-modal" tabindex="-1"
                                                        role="dialog" aria-labelledby="Delete Reservation"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title" id="Delete">Delete</h1>
                                                                    <button type="button" class="close"
                                                                        data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form role="form" method="POST"
                                                                        action="deleteController.jsp">
                                                                        <div class="form-group">
                                                                            <label class="control-label">The reservation
                                                                                will be
                                                                                deleted</label>
                                                                        </div>
                                                                        <div class="form-group">

                                                                            <button type="button"
                                                                                class="btn btn-success"
                                                                                data-dismiss="modal"
                                                                                onclick="location.href = 'deleteController.jsp?resId=<%=reservations.get(i).getReservationId()%>'">Delete</button>
                                                                            <button type="button"
                                                                                class="btn btn-secondary"
                                                                                data-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } %>

                                                        <% for (int i=0; i < reservations.size(); i++) {
                                                            rd.checkOut(reservations.get(i).getReservationId()); %>
                                                            <!-- Modal For Check-out -->
                                                            <div class="modal fade" id="checkout-modal" tabindex="-1"
                                                                role="dialog" aria-labelledby="Checkout Reservation"
                                                                aria-hidden="true">
                                                                <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                                    role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h1 class="modal-title" id="Checkout">
                                                                                Check-out</h1>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">

                                                                            <div class="form-group">
                                                                                <label class="control-label">The
                                                                                    reservation
                                                                                    has been checked out</label>
                                                                            </div>
                                                                            <div class="form-group">

                                                                                <button type="button" class="btn btn-success"
                                                                                data-dismiss="modal"
                                                                                onclick="location.href = 'checkoutController.jsp?resId=<%=reservations.get(i).getReservationId()%>'">Check-out</button>
                                                                                <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Close</button>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <% } %>

                                                                <% for (int i=0; i < reservations.size(); i++) {
                                                                    rd.checkIn(reservations.get(i).getReservationId());
                                                                    %>
                                                                    <!-- Modal For Check-in -->
                                                                    <div class="modal fade" id="checkin-modal"
                                                                        tabindex="-1" role="dialog"
                                                                        aria-labelledby="Checkin Reservation"
                                                                        aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                                            role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h1 class="modal-title"
                                                                                        id="Checkin">Check-in</h1>
                                                                                    <button type="button" class="close"
                                                                                        data-dismiss="modal"
                                                                                        aria-label="Close">
                                                                                        <span
                                                                                            aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">

                                                                                    <div class="form-group">
                                                                                        <label class="control-label">The
                                                                                            reservation
                                                                                            has been checked in</label>
                                                                                    </div>
                                                                                    <div class="form-group">

                                                                                        <button type="button" class="btn btn-success"
                                                                                        data-dismiss="modal"
                                                                                        onclick="location.href = 'checkinController.jsp?resId=<%=reservations.get(i).getReservationId()%>'">Check-in</button>
                                                                                        <button type="button" class="btn btn-secondary"
                                                                                        data-dismiss="modal">Close</button>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <% } %>
                                    </main>
                                    <%@include file="footer.jsp" %>
                                        <%@include file="datatables_scripts.jsp" %>
                                            <script src="js/reservations.js"></script>

                            </body>

                            </html>