<%@ page import="model.Hotel" %>
<%@ page import="model.Agency" %><%--
  Created by IntelliJ IDEA.
  User: kat26
  Date: 12/5/2020
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("index.jsp") ? "active": "" %>">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("hotels.jsp") ? "active": "" %>">
                    <a class="nav-link" href="agencies.jsp">Hotels</a>
                </li>
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("reservations_of_agency.jsp") ? "active": "" %>">
                    <a class="nav-link" href="reservations.jsp">Reservations<span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("reviews.jsp") ? "active": "" %>">
                    <a class="nav-link" href="reviews.jsp">Reviews</a>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#"><i class="fas fa-user"><%= ((Agency)session.getAttribute("userObj")).getName()%></i></a>--%>

<%--                </li>--%>
                <li class="nav-item">
                    <a class="nav-link logout" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </li>
            </ul>
        </div>
    </nav>
</header>