<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="header.jsp" %>
    <title>Dream Hotel | Home</title>
</head>

<body>
<%@include file="navbar.jsp" %>
<%
    Hotel signedInHotel = (Hotel) session.getAttribute("userObj");
    if (signedInHotel == null) {
        request.setAttribute("message", "You should sign in first");
%>
<jsp:forward page="login.jsp"></jsp:forward>

<%
    }
%>
<!-- Page Content -->
<main>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <form id="room-to-register" action="submitRoom" method="post">
                    <div class="form-group">
                        <label for="number">Room Number</label>
                        <input type="text" class="form-control" id="number" name="number" placeholder="number">
                    </div>
                    <div class="form-group">
                        <label for="floor">Floor</label>
                        <input type="number" class="form-control" id="floor" name="floor" placeholder="number">
                    </div>
                    <div class="form-group">
                        <label for="type">Room Type</label>
                        <select class="form-control" name="type" id="type">
                            <option>Select room type</option>
                            <option value="single">single</option>
                            <option value="double">double</option>
                            <option value="triple">triple</option>
                            <option value="quadruple">quadruple</option>
                        </select>
                    </div>
                    <button type="submit" id="submit-rooms">Save Room</button>
                </form>
            </div>
            <div class="col-md-6">
                <h5 class="text-center">Saved rooms</h5>
                <div style="max-height: 500px;display: block; overflow-y: scroll">
                    <table class="table table-striped table table-bordered table-sm" id="roomtable">
                        <tr>
                            <th scope="col">Number</th>
                            <th scope="col">Floor</th>
                            <th scope="col">Type</th>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp" %>
<script defer src="js/register_rooms.js"></script>
</body>

</html>