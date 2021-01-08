<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="dao.GroupCustomerDao" %>
<%@page import="dao.ReservationDao" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.AgencyDao" %>
<%@ page errorPage="errorPage.jsp"%>


<!doctype html>
<html lang="en">

<head>
    <%@include file="header.jsp" %>
    <%@include file="datatables_stylesheets.jsp"%>
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
                <th scope="col">Arrival date</th>
                <th scope="col">Arrival time</th>
                <th scope="col">Departure date</th>
                <th scope="col">Departure time</th>
                <th scope="col">Made on</th>
                <th scope="col">Check-in</th>
                <th scope="col">Check-out</th>
                <th scope="col">Delete</th>
                <th scope="col">Confirm</th>
            </tr>
            </thead>
            <tbody style="text-align: center;">
                <% ReservationDao rd=new ReservationDao();
                AgencyDao agencyDao = new AgencyDao();
                String username = "sweethome@yahoo.com"; //temporary
                List<Reservation> reservations = rd.getAll(username);
                 for (int i = 0; i < reservations.size(); i++) { %>

            <tr>
                <td>
                    <%=reservations.get(i).getReservationId()%>

                </td>
                <td>
                    <%=agencyDao.getByUsername(reservations.get(i).getAgencyName()).getName()%>
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
                    <%=reservations.get(i).getSubmittedOn()%>
                </td>
                <td>
                    <button type="button" class="btn btn-info"><i
                            class="fas fa-door-closed"></i></button>
                </td>
                <td>
                    <button type="button" class="btn btn-info"><i
                            class="fas fa-door-open"></i></button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger"><i
                            class="fas fa-trash-alt"></i></button>
                </td>
                <td>
                    <button type="button" class="btn btn-success"
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
                <th scope="col">Made on</th>
                <th scope="col">Check-in</th>
                <th scope="col">Check-out</th>
                <th scope="col">Delete</th>
                <th scope="col">Confirm</th>
            </tr>
            </tfoot>
            </tbody>
        </table>
    </div>


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
</main>
<%@include file="footer.jsp" %>
<%@include file="datatables_scripts.jsp"%>
<script src="js/reservations.js"></script>

</main>
</body>

</html>