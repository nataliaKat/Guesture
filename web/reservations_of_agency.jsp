<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<%@ page import="model.Service" %>
<%@ page import="model.User" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.GroupCustomer" %>

<%@page import="java.util.List" %>

<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="dao.GroupCustomerDao" %>


<%  
String agencyUsername = ((Agency)session.getAttribute("userObj")).getUsername();

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
            <a href="view_hotels.jsp"><button location.href="" class="brownButton"><i class="fas fa-plus"></i> New
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
                        <th scope="col">Reservation Details</th>
                        <th scope="col">Add Members</th>
                    </tr>
                </thead>
                <tbody style="text-align: center;">
                
                    <% 
                    ReservationDao rd = new ReservationDao();
                    List<Reservation> reservationsOfAgencyList = rd.getReservationsPerAgency(agencyUsername);
                    int reservationCode = 0;
                    boolean b1 = true;
                    for (int i = 0; i < reservationsOfAgencyList.size(); i++) {
                        reservationCode = reservationsOfAgencyList.get(i).getReservationId();
                    %>
        
                    <tr>
                        <td><%=reservationCode%></td>
                        <td><%=reservationsOfAgencyList.get(i).getHotelName()%></td>
                        
                        <% if (reservationsOfAgencyList.get(i).getConfirmed() == b1) { %>
                            <td>Yes</td>
                        <% } else { %>
                            <td>No</td>
                        <% } %>
                            
                        <td><%=reservationsOfAgencyList.get(i).getArrivalDate()%></td>

                        <td> 
                            <form action="reservation_details.jsp?rid=<%=reservationCode%>" target="_blank" method="POST">
                                <button class="blueButton">Reservation Details</button>
                            </form>
                       </td>
                        
                        <% 
                        GroupCustomerDao gcd = new GroupCustomerDao();
                        List<GroupCustomer> groupCustomers = gcd.getGroupCustomersPerReservation(reservationCode);
                       
                        if ((reservationsOfAgencyList.get(i).getConfirmed() == b1) && (groupCustomers.size() == 0)) { %>
                               
                            <td> 
                                <form action="group_members.jsp?reservation=<%=reservationCode%>" target="_blank" method="POST">
                                    <button class="blueButton">Add Members</button>
                                </form>
                           </td>

                        <% } else if (reservationsOfAgencyList.get(i).getConfirmed() == b1) { %>

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
                            <th scope="col">Reservation Details</th>
                            <th scope="col">Add Members</th>
                        </tr>
                    </tfoot>
                </tbody>
            </table>
        </div>
    </main>

    
    <%@include file="footer.jsp" %>
    <%@include file="datatables_scripts.jsp"%>
    <script src="js/reservations.js"></script>

</body>

</html>