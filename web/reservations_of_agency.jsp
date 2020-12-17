<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Service" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="dao.GroupCustomerDao" %>


<%  

    User user = (User)session.getAttribute("userObj");
//  agencyName = user.getUsername();

%>

<!doctype html>
<html lang="en">

<head>
    
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Reservations Of Agency</title>
    <%@include file="header.jsp" %>
                            
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap4.min.css">
    
</head>

<body id="reservationOfAgency">
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
            <a href="new_reservation.html"><button location.href="" class="brownButton"><i class="fas fa-plus"></i> New
                    Reservation</button></a>
        </div>
        <div class="mb-3 mt-3">
            <table id="example" class="table table-hover table-striped table-bordered dt-responsive nowrap table-dark"
                style="width: 100%;">
                <thead>
                    <tr>
                        <th scope="col">Reservation code</th>
                        <th scope="col">Hotel</th>
                        <th scope="col">Confirmed</th>
                        <th scope="col">Arrival date</th>
                        <th scope="col">Arrival time</th>
                        <th scope="col">Departure date</th>
                        <th scope="col">Departure time</th>
                        <th scope="col">Cost</th>
                        <th scope="col">Made on</th>
                        <th scope="col">Show services</th>
                        <th scope="col">Add Members</th>
                    </tr>
                </thead>
                <tbody style="text-align: center;">
                
                    <% 
                    ReservationDao rd = new ReservationDao();
                    List<Reservation> reservationsOfAgencyList = rd.getReservationsPerAgency(agencyName);

                    for (int i = 0; i < reservationsOfAgencyList.size(); i++) {

                    %>
        
                    <tr>
                        <td><%=reservationsOfAgencyList.get(i).getReservationId()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getHotelName()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getConfirmed()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getArrivalDate()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getArrivalTime()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getDepartureDate()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getDepartureTime()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getTotalCost()</td>
                        <td><%=reservationsOfAgencyList.get(i).getSubmittedOn()%></td>

                        <td>

                            <button type="button" class="btn btn-info" data-toggle="modal"
                                data-target="#services-modal"><i class="fas fa-utensils"></i></button>

                        </td>
                        
                        <td>
                            <form action="group_members.jsp" target="_blank">
                                <button class="blueButton">Add Members</button>
                            </form>
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
                    </tr>
                </tfoot>
                </tbody>
            </table>
        </div>
    </main>
    
    
    <!-- Modal For Services -->
    <div class="modal fade" id="services-modal" tabindex="-1" role="dialog" aria-labelledby="Group Customers"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Services">Services</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="list-group">

                        <% 
                        ServiceDao sd = new ServiceDao();
                        String reservationId = reservationsOfAgencyList.get(i).getReservationId();
                        List<Service> servicesOfReservation = sd.getServicesPerReservation(reservationId, hotelName);
                        
                        for (int i = 0; i < servicesOfReservation.size(); i++) { %>

                            <li class="list-group-item"><%=servicesOfReservation.get(i).getName()%></li>

                     <% } %>

                    </ul>
                </div>
                    
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                            <label class="control-label">Arrival date</label>
                            <div>
                                <input id="ar_date" type="date" class="form-control input-lg" name="ar_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Arrival time</label>
                            <div>
                                <input id="ar_time" type="text" class="form-control input-lg" name="ar_time">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Departure date</label>
                            <div>
                                <input id="dep_date" type="date" class="form-control input-lg" name="dep_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Departure time</label>
                            <div>
                                <input id="dep_time" type="text" class="form-control input-lg" name="dep_time">
                            </div>
                        </div>
                        <div class="row">
                            <input type="submit" class="ml-auto brownButton" style="margin-right: 10px;" value="Edit">
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
    <footer class="footer">
        <div class="container">
            <span class="text-muted">Made with &hearts; by Guesture - Group Management</span>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script src="../web/js/reservations.js"></script>

    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap4.min.js"></script>
</body>

</html>