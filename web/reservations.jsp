<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@page import="java.util.ArrayList" %>
        <%@page import="java.util.List;" %>
            <%@ page import="model.Reservation" %>
                <%@ page import="model.Service" %>
                    <%@ page import="model.GroupCustomer" %>
                        <%@ page import="dao.ReservationDao" %>
                            <% page import="dao.GroupCustomerDao" %>



                                <!doctype html>
                                <html lang="en">

                                <head>

                                    <title>Dream Hotel | Reservations</title>

                                    <%@include file="header.jsp" %>

                                        <!-- Bootstrap 4 -->
                                        <link rel="stylesheet"
                                            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
                                        <link rel="stylesheet"
                                            href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
                                        <link rel="stylesheet"
                                            href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css">
                                        <link rel="stylesheet"
                                            href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">


                                </head>

                                <body id="reservation">
                                    <%@include file="navbar.jsp" %>

                                        <!-- Begin page content -->
                                        <main class="container">
                                            <div class="mb-3 mt-3">
                                                <table id="example"
                                                    class="table table-hover table-striped table-bordered dt-responsive nowrap table-dark"
                                                    style="width: 100%;">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Reservation code</th>
                                                            <th scope="col">Agency</th>
                                                            <th scope="col">Arrival date</th>
                                                            <th scope="col">Arrival time</th>
                                                            <th scope="col">Departure date</th>
                                                            <th scope="col">Departure time</th>
                                                            <th scope="col">Revenue</th>
                                                            <th scope="col">Made on</th>
                                                            <th scope="col">Show members</th>
                                                            <th scope="col">Show services</th>
                                                            <th scope="col">Edit</th>
                                                            <th scope="col">Check-in</th>
                                                            <th scope="col">Check-out</th>
                                                            <th scope="col">Delete</th>
                                                            <th scope="col">Confirm</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody style="text-align: center;">
                                                        <% ReservationDao rd=new ReservationDao(); List<Reservation>
                                                            reservations = rd.getAll(username);

                                                            for (int i = 0; i < reservations.size(); i++) { %>

                                                                <tr>
                                                                    <td>
                                                                        <%=reservations.get(i).getReservationId()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getAgencyName()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getArrivalDate()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getArrivalTime()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getDepartureDate()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getDepartureTime()%>
                                                                    </td>
                                                                    <td>
                                                                        <%=reservations.get(i).getTotalCost()%>
                                                                    <td>
                                                                        <%=reservations.get(i).getSubmittedOn()%>
                                                                    </td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-info"
                                                                            data-toggle="modal"
                                                                            data-target="#members-modal"><i
                                                                                class="fas fa-users"></i></button>
                                                                    </td>

                                                                    <td>
                                                                        <button type="button" class="btn btn-info"
                                                                            data-toggle="modal"
                                                                            data-target="#services-modal"><i
                                                                                class="fas fa-utensils"></i></button>

                                                                    </td>
                                                                    <td><button type="button" class="btn btn-warning"
                                                                            data-target="#modal-edit" data-res="32153"
                                                                            data-ar_date="2021-05-25"
                                                                            data-ar_time="morning"
                                                                            data-dep_date="2021-05-30"
                                                                            data-dep_time="evening"
                                                                            data-toggle="modal"><i
                                                                                class="fas fa-edit"></i></button>
                                                                    </td>

                                                                    <td><button type="button" class="btn btn-success"><i
                                                                                class="fas fa-door-closed"></i></button>
                                                                    </td>
                                                                    <td><button type="button" class="btn btn-success"><i
                                                                                class="fas fa-door-open"></i></button>
                                                                    </td>
                                                                    <td><button type="button" class="btn btn-danger"><i
                                                                                class="fas fa-trash-alt"></i></button>
                                                                    </td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-warning"
                                                                            data-toggle="modal"
                                                                            data-target="#confirm-modal"><i
                                                                                class="fas fa-check"></i></button>
                                                                    </td>

                                                                </tr>
                                                                <% } %>
                                                    <tfoot>
                                                        <tr>
                                                            <th scope="col">Reservation code</th>
                                                            <th scope="col">Agency</th>
                                                            <th scope="col">Arrival date</th>
                                                            <th scope="col">Arrival time</th>
                                                            <th scope="col">Departure date</th>
                                                            <th scope="col">Departure time</th>
                                                            <th scope="col">Revenue</th>
                                                            <th scope="col">Made on</th>
                                                            <th scope="col">Show members</th>
                                                            <th scope="col">Show services</th>
                                                            <th scope="col">Edit</th>
                                                            <th scope="col">Check-in</th>
                                                            <th scope="col">Check-out</th>
                                                            <th scope="col">Delete</th>
                                                            <th scope="col">Confirm</th>
                                                        </tr>
                                                    </tfoot>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </main>

                                        <% int j=1; GroupCustomerDao gc=new GroupCustomerDao(); for (int i=0; i <
                                            reservations.size(); i++) { %>
                                            <!-- Modal For Members-->
                                            <div class="modal fade" id="members-modal" tabindex="-1" role="dialog"
                                                aria-labelledby="Group Customers" aria-hidden="true">
                                                <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                    role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="Group Customers">Customers</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table table-hover table-bordered text-center">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">#</th>
                                                                        <th scope="col">First Name</th>
                                                                        <th scope="col">Last Name</th>
                                                                        <th scope="col">Identity Number</th>
                                                                        <th scope="col">Phone</th>
                                                                        <th scope="col">email</th>
                                                                        <th scope="col">Room</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row">j++</th>
                                                                        <td>
                                                                            <%= gc.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getName()
                                                                                %>
                                                                        </td>
                                                                        <td>
                                                                            <%= gc.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getSurname()
                                                                                %>
                                                                        </td>
                                                                        <td>
                                                                            <%= gc.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getTelephone()
                                                                                %>
                                                                        </td>
                                                                        <td>
                                                                            <%= gc.gd.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getEmail()
                                                                                %>
                                                                        </td>
                                                                        <td>
                                                                            <%= gc.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getIdentityNumber()
                                                                                %>
                                                                        </td>
                                                                        <td>
                                                                            <%= gc.getGroupCustomersPerReservation(reservations.get(i).getReservationId()).getGrouping().getRoom().getNumber()
                                                                                %>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <% } %>

                                                <!-- Modal For Services -->
                                                <div class="modal fade" id="services-modal" tabindex="-1" role="dialog"
                                                    aria-labelledby="Group Customers" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                        role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="Services">Services</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <ul class="list-group">
                                                                    <li class="list-group-item">Breakfast</li>
                                                                    <li class="list-group-item">Spa</li>
                                                                    <li class="list-group-item">Horse Riding</li>

                                                                </ul>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Modal For Edit -->
                                                <div id="modal-edit" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title">Edit Reservation</h1>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form role="form" method="POST" action="edit.jsp">
                                                                    <input type="hidden" id="resiId" name="resId">
                                                                    <div class="form-group">
                                                                        <label class="control-label">Arrival
                                                                            date</label>
                                                                        <div>
                                                                            <input id="ar_date" type="date"
                                                                                class="form-control input-lg"
                                                                                name="ar_date">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label">Arrival
                                                                            time</label>
                                                                        <div>
                                                                            <input id="ar_time" type="text"
                                                                                class="form-control input-lg"
                                                                                name="ar_time">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label">Departure
                                                                            date</label>
                                                                        <div>
                                                                            <input id="dep_date" type="date"
                                                                                class="form-control input-lg"
                                                                                name="dep_date">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label">Departure
                                                                            time</label>
                                                                        <div>
                                                                            <input id="dep_time" type="text"
                                                                                class="form-control input-lg"
                                                                                name="dep_time">
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <input type="submit" class="ml-auto my-button"
                                                                            style="margin-right: 10px;" value="Edit">
                                                                    </div>
                                                                </form>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal-dialog -->
                                                    </div><!-- /.modal -->
                                                </div>

                                                <% for (int i=0; i < reservations.size(); i++) { %>
                                                    <!-- Modal For Confirm -->
                                                    <div class="modal fade" id="confirm-modal" tabindex="-1"
                                                        role="dialog" aria-labelledby="Confirm Reservation"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-lg modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title" id="Confirm">Confirm</h1>
                                                                    <button type="button" class="close"
                                                                        data-dismiss="modal" aria-label="Close">
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

                                                                            <button type="button"
                                                                                class="btn btn-success"
                                                                                data-dismiss="modal"
                                                                                onclick="location.href = 'confirmController.jsp'">Confirm</button>
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


                                                        <%@include file="footer.jsp" %>
                                                            <script src="../web/js/reservations.js"></script>

                                                            <script
                                                                src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
                                                            <script
                                                                src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
                                                            <script
                                                                src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
                                                            <script
                                                                src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
                                                            <script
                                                                src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                                                            <script
                                                                src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
                                                            <script
                                                                src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
                                                            <script
                                                                src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
                                                            </main>
                                </body>

                                </html>