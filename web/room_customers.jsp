<%@ page import="dao.GroupingDao" %>
<%@ page import="dao.ReservationDao" %>
<%@ page import="dao.RoomDao" %>
<%@ page import="model.GroupCustomer" %>
<%@ page import="model.Grouping" %>
<%@ page import="model.Reservation" %>
<%@ page import="model.Room" %>
<%@ page import="service.GroupCustomerService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
    int reservationId = Integer.parseInt(request.getParameter("reservation"));
    request.setAttribute("reservation", reservationId);
    String hotelUsername = "luxury@gmail.com";

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
        <div class="row">
            <div class=" col-md-10">
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
                        <td><%=custs.get(i).getCustomerId()%>
                        </td>
                        <td><%=custs.get(i).getName()%>
                        </td>
                        <td><%=custs.get(i).getSurname()%>
                        </td>
                        <td><%=custs.get(i).getTelephone()%>
                        </td>
                        <td><%=custs.get(i).getEmail()%>
                        </td>
                        <td><%=custs.get(i).getIdentityNumber()%>
                        </td>
                        <% if (i == 0) {%>
                        <td id="gr-<%=custs.get(i).getCustomerId()%>"
                            data-groupingId="<%=grouping.getGroupingId()%>" rowspan="<%=custs.size()%>"
                            ondrop="drop(event, this)" ondragover="allowDrop(event, this)"></td>
                        <% } %>
                    </tr>

                    <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-md-2" ondrop="drop(event, this)" ondragover="allowDrop(event, this)">

                <%
                    RoomDao roomDao = new RoomDao();
//                List<Room> rooms = roomDao.getAvailableRooms(foundReservation.getArrivalDate(), foundReservation.getDepartureDate(), hotelUsername);
                    List<Room> rooms = roomDao.getAll(hotelUsername);
                    for (Room room : rooms) {
                %>
                <div class="room" id="r-<%=room.getId()%>" data-roomId="<%=room.getId()%>" draggable="true"
                     ondragstart="drag(event)">
                    Number: <%=room.getNumber()%><br>
                    Type: <%=room.getType()%><br>
                    Floor: <%=room.getFloor()%>
                </div>
                <% } %>
            </div>
        </div>
        <div class="row d-flex flex-row-reverse">
            <button id="rooms-submit-button" class="brownButton">Submit rooms</button>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        $("#rooms-submit-button").click(() => {
            let groupingRooms = []
            let customerRoomsTable = document.getElementById("rooms-table");
            let tableRows = customerRoomsTable.rows;
            for (let i = 1; i < tableRows.length; i++) {
                if (tableRows[i].cells[6]) {
                    let roomCell = tableRows[i].cells[6]
                    console.log(roomCell)
                    let groupingId = roomCell.getAttribute('data-groupingId');
                    if (roomCell.firstChild) {
                        let roomId = roomCell.firstChild.getAttribute('data-roomId');
                        console.log("grouping is", groupingId, "room is", roomId);
                        let grouping = {
                            groupingId : groupingId,
                            roomId : roomId
                        }
                        groupingRooms.push(grouping)
                    } else {
                        alert('Not all customers have rooms');
                        break;
                    }

                }
            }
            $.ajax({
                type: "POST",
                url: "roomsToCustomers",
                dataType: 'JSON',
                data: {"groupings" : JSON.stringify(groupingRooms)},
                complete: function() {
                    window.location.replace("index.jsp")
                },
                fail: function(xhr, textStatus, errorThrown){
                    alert('fail');
                }
            });
        })
    })
    function allowDrop(ev, ele) {
        ev.preventDefault();
    }

    function drag(ev) {
        ev.dataTransfer.setData("text", ev.target.id);
    }

    function drop(ev, ele) {
        ev.preventDefault();
        var data = ev.dataTransfer.getData("text");
        ele.appendChild(document.getElementById(data));
        // ev.target.appendChild(document.getElementById(data));

        // $('.droppable').droppable('disable');
    }

</script>
</body>

</html>
