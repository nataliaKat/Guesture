<%@ page import="dao.GroupingDao" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="model.Grouping" %>
<%@ page import="model.Reservation" %>
<%@ page import="service.GroupCustomerService" %>
<%@ page import="java.util.List" %>
<%@ page import="model.GroupCustomer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    int reservationId = Integer.parseInt(request.getParameter("reservation"));
    request.setAttribute("reservation", reservationId);

    GroupingDao groupingDao = new GroupingDao();
    ReservationDao reservationDao = new ReservationDao();
    Reservation foundReservation = reservationDao.getById(reservationId);
    if (foundReservation == null) {
        throw new Exception("Reservation not found!");
    }
    if (groupingDao.getGroupingsPerReservation(reservationId).isEmpty()) {
        throw new Exception("No customers found");
    }
    if (!foundReservation.getConfirmed()) {
        throw new Exception("Reservation has not been confirmed");
    }
%>
<head>
    <title>Dream Hotel | Rooms</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<!-- Page Content -->
<main>
    <div class="container">
        <div class="row col-md-8">
            <table id="rooms-table" class="table table-bordered table-sm">
                <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Telephone</th>
                    <th scope="col">email</th>
                    <th scope="col">Identity/Passport Number</th>
                    <th scope="col">Room</th>
                </tr>
                </thead>
                <tbody>
                <%
                    GroupCustomerService groupCustomerService = new GroupCustomerService();
                    List<Grouping> groupings = groupCustomerService.getGroupings(reservationId);
                    for (Grouping grouping : groupings) {
                        List<GroupCustomer> custs = grouping.getGroupCustomers();
                        for (int i = 0; i < custs.size(); i++) {
                %>
                        <tr>
                            <td><%=custs.get(i).getCustomerId()%></td>
                            <td><%=custs.get(i).getName()%></td>
                            <td><%=custs.get(i).getSurname()%></td>
                            <td><%=custs.get(i).getTelephone()%></td>
                            <td><%=custs.get(i).getEmail()%></td>
                            <td><%=custs.get(i).getIdentityNumber()%></td>
                  <% if (i == 0) {%>
                            <td id="gr-<%=custs.get(i).getCustomerId()%>" rowspan="<%=custs.size()%>" ondrop="drop(event)" ondragover="allowDrop(event)"></td>
                            <% } %>
                        </tr>

                    <% } %>
                <% } %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="room" id="r-101" draggable="true" ondragstart="drag(event)">
                101
            </div>
            <div class="room" id="r-102" draggable="true" ondragstart="drag(event)">
                102
            </div>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
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
