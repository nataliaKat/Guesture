<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<%@ page import="dao.GroupCustomerDao" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="model.GroupCustomer" %>
<%@ page import="model.Service" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <%@include file="header.jsp"%>
    <title>Dream Hotel | Reservation Details</title>
</head>
<body>
<%@include file="navbar.jsp"%>

<% 

        ReservationDao rd = new ReservationDao();

        String hotelUsername = ((Hotel)session.getAttribute("userObj")).getUsername();

        String idString = request.getParameter("rid");
        int id = Integer.parseInt(idString);

        double [] prices = rd.getPricePerRoomType(hotelUsername);
        
        List<Reservation> reservationsOfHotelList = rd.getAll(hotelUsername);
        int reservationId = reservationsOfHotelList.get(id).getReservationId();

    %>
<main>
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12">
                <h2><i>Reservation <%=reservationId %> Details</i></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box">
                    <b>Reservation id:</b> <%=reservationId %><br>
                    <b>Agency:</b> <%=reservationsOfHotelList.get(id).getAgencyName() %><br>
                    <b>Created on:</b> <%=reservationsOfHotelList.get(id).getSubmittedOn() %><br>
                    <b>Confirmed: </b> <%=reservationsOfHotelList.get(id).getConfirmed() %><br>
                    <b>Checked in: </b> <% 
                    if (reservationsOfHotelList.get(id).isCheckedOut()) { %>
                        No
                    <% } %>
                    <br>
                    <b>Checked out: </b> <% 
                    if (reservationsOfHotelList.get(id).isCheckedOut()) { %>
                        Yes
                    <% } %>
                    <br>
                    <b>Comments: </b>
                    <%=reservationsOfHotelList.get(id).getComments() %>
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
                                <td><%=prices[0]%></td>
                                <td><%=reservationsOfHotelList.get(id).getSingleRooms() %></td>
                              </tr>
                              <tr>
                                <td>Double</td>
                                <td><%=prices[1]%></td>
                                <td><%=reservationsOfHotelList.get(id).getDoubleRooms() %></td>
                              </tr>
                              <tr>
                                <td>Triple</td>
                                <td><%=prices[2]%></td>
                                <td><%=reservationsOfHotelList.get(id).getTripleRooms() %></td>
                              </tr>
                              <tr>
                                <td>Quad</td>
                                <td><%=prices[3]%></td>
                                <td><%=reservationsOfHotelList.get(id).getQuadrupleRooms() %></td>
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
                            <% 

                            GroupCustomerDao gcd = new GroupCustomerDao();
                            List<GroupCustomer> groupMembers = gcd.getGroupCustomersPerReservation(reservationId);
                            for (int i = 0; i < groupMembers.size() ; i++) {
                                
                            %>

                            <tr>
                                <td><%=reservationId %></td>
                                <td><%=groupMembers.get(i).getName() %></td>
                                <td><%=groupMembers.get(i).getSurname() %></td>
                                <td><%=groupMembers.get(i).getIdentityNumber() %></td>
                                <td><%=groupMembers.get(i).getTelephone() %></td>
                                <td><%=groupMembers.get(i).getEmail() %></td>
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
                    List<Service> services = sd.getServicesPerReservation(reservationId, hotelUsername);
                    for (int i = 0; i < services.size(); i++) {
                        
                    %>
                        <li><%=services.get(i).getName() %></li>

                    <% } %>
                </ol>
            </div>
        </div>
    </div>
</main>

<%@include file="footer.jsp"%>
</body>
</html>
