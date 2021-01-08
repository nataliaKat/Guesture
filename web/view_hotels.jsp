<%@ page import="model.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.HotelDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%
    HotelDao hotelDao = new HotelDao();
    List<Hotel> hotels = hotelDao.getAll();
%>
<head>
    <%@include file="header.jsp"%>
    <title>Dream Agency | Hotels</title>
</head>
    <%@include file="agency_navbar.jsp"%>
    <main>
        <div class="container">
            <div class="row m-4">
                <div class="col-sm-12">
                    <h3>Pick a hotel to make your reservation</h3>
                </div>
            </div>
            <div class="row ">
                <% for (Hotel hotel : hotels) { %>
                    <div class="col-sm-3 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%=hotel.getPhotoUrl()%>" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title"><%=hotel.getName()%></h5>
                                <div class="card-text">
                                    <u><%=hotel.getAddress()%> - <%=hotel.getPhoneNumber()%></u><br>
                                    <div style="height: 100px; overflow: auto;">
                                        <%=hotel.getDescription()%>
                                    </div>
                                </div>
                                <button onclick="location.href='new_reservation.jsp?hotel=<%=hotel.getUsername()%>'" class="brownButton" style="width: 100%;">Make reservation</button>
                            </div>
                        </div>
                    </div>
                <% } %>
                </div>
            </div>

        </div>


    </main>
    <%@include file="footer.jsp"%>
</body>
</html>
