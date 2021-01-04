<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.util.List" %>

<%@ page import="model.Service" %>
<%@ page import="model.User" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.GroupCustomer" %>

<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="dao.GroupCustomerDao" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file="header.jsp" %>

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dream Hotel | Reservation</title>



</head>

<body>
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand" href="index.html"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="agencies.jsp">Agencies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reservations.jsp">Reservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reviews.jsp">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="chart.jsp">Statistics</a>
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

    <% 
        /* */
        String hotelUsername = "portoven@gmail.com";
        String agencyUsername = "holidays@gmail.com";

        ReservationDao rd = new ReservationDao();

        double [] prices = rd.getPricePerRoomType(hotelUsername);

        User user = (User)session.getAttribute("userObj");
//      agencyUsername = user.getUsername();

        int id = 1;
//      int id = request.getParameter("id");
        
        List<Reservation> reservationsOfAgencyList = rd.getReservationsPerAgency(agencyUsername);

    %>

    <main>
        <div class="container">
            <div class="row">
                <div class="col-md-4 box">
                    <b>Reservation id:</b> <%=reservationsOfAgencyList.get(id).getReservationId() %><br>
                    <b>Hotel:</b> <%=reservationsOfAgencyList.get(id).getHotelName() %><br>
                    <b>Arrival Date:</b> <%=reservationsOfAgencyList.get(id).getArrivalDate() %><br>
                    <b>Arrival Time:</b> <%=reservationsOfAgencyList.get(id).getArrivalTime() %><br>
                    <b>Departure Date:</b> <%=reservationsOfAgencyList.get(id).getDepartureDate() %><br>
                    <b>Departure Time:</b> <%=reservationsOfAgencyList.get(id).getDepartureTime() %><br>
                    <b>Created on:</b> <%=reservationsOfAgencyList.get(id).getSubmittedOn() %><br>
                    <b>Confirmed by hotel:</b> <%=reservationsOfAgencyList.get(id).getConfirmed() %><br>
                    <b>Completed:</b> <% 
                        if (reservationsOfAgencyList.get(id).isCheckedOut()) { %>
                            Yes
                        <% } else { %>
                            No
                        <% } %>
                    <br>
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
                                <%=prices[0]%>
                              </td>
                              <td><%=reservationsOfAgencyList.get(id).getSingleRooms() %></td>
                            </tr>
                            <tr>
                              <td>Double</td>
                              <td><%=prices[1]%></td>
                              <td><%=reservationsOfAgencyList.get(id).getDoubleRooms() %></td>
                            </tr>
                            <tr>
                              <td>Triple</td>
                              <td><%=prices[2]%></td>
                              <td><%=reservationsOfAgencyList.get(id).getTripleRooms() %></td>
                            </tr>
                            <tr>
                              <td>Quad</td>
                              <td><%=prices[3]%></td>
                              <td><%=reservationsOfAgencyList.get(id).getQuadrupleRooms() %></td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                </div>
                <div class="col-md-4 box">
                    <h5>Comments</h5>
                    <%=reservationsOfAgencyList.get(id).getComments() %>
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

                                <% 

                                GroupCustomerDao gcd = new GroupCustomerDao();
                                List<GroupCustomer> groupMembers = gcd.getGroupCustomersPerReservation(id);
                                for (int i = 0; i < groupMembers.size() ; i++) {
                                    
                                %>

                                <tr>
                                    <td><%=id%></td>
                                    <td><%=groupMembers.get(i).getName() %></td>
                                    <td><%=groupMembers.get(i).getSurname() %></td>
                                    <td><%=groupMembers.get(i).getIdentityNumber() %></td>
                                    <td><%=groupMembers.get(i).getTelephone() %></td>
                                    <td><%=groupMembers.get(i).getEmail() %></td>
                                    <td><%=groupMembers.get(i).getSurname() %></td>
                                    <td><%=groupMembers.get(i).getGrouping().getRoomId() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-3">
                    <h4 class="text-center">Services</h4>
                    <ol>
                    <%

                    ServiceDao sd = new ServiceDao();
                    List<Service> services = sd.getServicesPerReservation(id, hotelUsername);
                    for (int i = 0; i < services.size(); i++) {
                        
                    %>
                        <li><%=services.get(i).getName() %></li>

                    <% } %>

                    </ol>
                </div>
            </div>
        </div>
    </main>

    <%@include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript -->

        <script>
            function allowDrop(ev) {
              ev.preventDefault();
            }
            
            function drag(ev) {
              ev.dataTransfer.setData("text", ev.target.id);
            }
            
            function drop(ev) {
              ev.preventDefault();
              var data = ev.dataTransfer.getData("text");
              ev.target.appendChild(document.getElementById(data));
              $('.droppable').droppable('disable');
            }
            </script>
</body>

</html>