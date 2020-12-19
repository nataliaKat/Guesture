<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Service" %>
<%@ page import="model.User" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.GroupCustomer" %>

<%@page import="java.util.List" %>

<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="dao.GroupCustomerDao" %>


<%  

    String hotelUsername = "luxury@gmail.com";
    String agencyUsername = "holidays@gmail.com";
    User user = (User)session.getAttribute("userObj");
    //String agencyUsername = user.getUsername();

%>

<!doctype html>
<html lang="en">

<head>
    
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Reservations Of Agency</title>
    <%@include file="header.jsp" %>
    <%@include file="datatables_stylesheets.jsp"%>
    
</head>

<body id="reservationOfAgency">
<%@include file="agency_navbar.jsp"%>
    <!-- Begin page content -->
    <main class="container">
        <div class="row">
            <a href="new_reservation.jsp"><button location.href="" class="brownButton"><i class="fas fa-plus"></i> New
                    Reservation</button></a>
        </div>
        <div class="mb-3 mt-3" style="padding: 20px">
            <table id="example" class="table table-hover table-striped table-bordered dt-responsive nowrap table-dark" style="width: 100%;">
                <thead>
                    <tr>
                        <th scope="col">Reservation code</th>
                        <th scope="col">Hotel</th>
                        <th scope="col">Confirmed</th>
                        <th scope="col">Arrival date</th>
                        <th scope="col">Arrival time</th>
                        <th scope="col">Departure date</th>
                        <th scope="col">Departure time</th>
                        <th scope="col">Made on</th>
                        <th scope="col">Show services</th>
                        <th scope="col">Add Members</th>
                    </tr>
                </thead>
                <tbody style="text-align: center;">
                
                    <% 
                    ReservationDao rd = new ReservationDao();
                    List<Reservation> reservationsOfAgencyList = rd.getReservationsPerAgency(agencyUsername);

                    int reservationId = 0;

                    for (int i = 0; i < reservationsOfAgencyList.size(); i++) {

                        reservationId = reservationsOfAgencyList.get(i).getReservationId();

                    %>
        
                    <tr>
                        <td><%=reservationId%></td>
                        <td><%=reservationsOfAgencyList.get(i).getHotelName()%></td>
                        
                        <% if (reservationsOfAgencyList.get(i).getConfirmed().equals("true")) { %>
                            <td>Yes</td>
                        <% } else { %>
                            <td>No</td>
                        <% } %>
                            
                        <td><%=reservationsOfAgencyList.get(i).getArrivalDate()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getArrivalTime()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getDepartureDate()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getDepartureTime()%></td>
                        <td><%=reservationsOfAgencyList.get(i).getSubmittedOn()%></td>

                        <td>

                            <button type="button" class="btn btn-info" data-toggle="modal"
                                data-target="#services-modal"><i class="fas fa-utensils"></i></button>

                        </td>
                        
                        <% 
                        GroupCustomerDao gcd = new GroupCustomerDao();
                        List<GroupCustomer> groupCustomers = gcd.getGroupCustomersPerReservation(reservationId);
                        String s1 = "true";

                        if (reservationsOfAgencyList.get(i).getConfirmed().equals(s1) && groupCustomers.size() == 0) { %>
                               
                            <td> 
                                <form action="group_members.jsp" target="_blank">
                                    <button class="blueButton">Add Members</button>
                                </form>
                           </td>

                        <% } else if (reservationsOfAgencyList.get(i).getConfirmed().equals(s1)) { %>

                            <td>You have already added members!</td>

                        <% } else { %> 

                            <td>Please wait until the hotel confirms your reservation!</td>

                        <% } %>

                    </tr>

                    <% } %>

                    <tfoot>
                        <tr>
                            <th scope="col">Reservation code</th>
                            <th scope="col">Hotel</th>
                            <th scope="col">Confirmed</th>
                            <th scope="col">Arrival date</th>
                            <th scope="col">Arrival time</th>
                            <th scope="col">Departure date</th>
                            <th scope="col">Departure time</th>
                            <th scope="col">Made on</th>
                            <th scope="col">Show services</th>
                            <th scope="col">Add Members</th>
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
                        
                        List<Service> servicesOfReservation = sd.getServicesPerReservation(reservationId, hotelUsername);
                        
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

    
    <%@include file="footer.jsp" %>
    <%@include file="datatables_scripts.jsp"%>
    <script src="js/reservations.js"></script>

</body>

</html>