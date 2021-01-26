<%@ page import="dao.HotelDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%
    HotelDao hotelDao = new HotelDao();
    List<Hotel> hotels = hotelDao.getAll();
%>
<head>
    <%@include file="header.jsp" %>
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css?family=Pacifico&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<%@include file="agency_navbar.jsp" %>
<div style="background-image: url('images/hotel.jpg'); background-repeat: no-repeat;background-size: 100%;height: 300px;display: block">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-5 animated fadeInUp">
                <h1 style="color: white; font-size: xxx-large;margin-top: 5%;font-family: 'Pacifico' ;">Make
                    memories for your customers</h1>
            </div>
        </div>
        <!-- <img src="images/hotel.jpg" style="height: 50%; width: 100%;"> -->

    </div>
</div>
<main>
    <div class="container">
        <div class="row m-4">
            <div class="col-sm-12">
                <h3>Pick a hotel to make your reservation</h3>
            </div>
        </div>
        <div class="row ">
            <% for (Hotel hotel : hotels) { %>
            <div class="col-sm-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="<%=hotel.getPhotoUrl()%>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%=hotel.getName()%>
                        </h5>
                        <div class="card-text">
                            <div style="height:200px">
                                <u><%=hotel.getAddress()%> - <%=hotel.getPhoneNumber()%>
                                </u><br>
                                <div style="height: 150px; overflow: auto;">
                                    <%=hotel.getDescription()%>
                                </div>
                            </div>
                        </div>
                        <button onclick="location.href='new_reservation.jsp?hotel=<%=hotel.getUsername()%>'"
                                class="brownButton" style="width: 100%;">Make reservation
                        </button>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    </div>


</main>
<%@include file="footer.jsp" %>
</body>
</html>
