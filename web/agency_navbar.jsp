<%@ page import="model.Agency" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-light  custom-nav">
        <a class="navbar-brand" href="view_hotels.jsp"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("") ||
                request.getRequestURI().replace(request.getContextPath() + "/", "").equals("view_hotels.jsp") ? "active": "" %>">
                    <a class="nav-link" href="view_hotels.jsp">Home</a>
                </li>
                <% Agency agency = (Agency)session.getAttribute("userObj");
                    if (agency != null) {
                %>
                <li class="nav-item <%=request.getRequestURI().replace(request.getContextPath() + "/", "").equals("reservations_of_agency.jsp") ? "active": "" %>">
                    <a class="nav-link" href="reservations_of_agency.jsp">Reservations<span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> <%=agency.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link logout" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </li>
                <%} else {%>
                <a class="nav-link" href="hotel_registration.jsp"> Sign up your hotel</a>
                <a class="nav-link" href="new_agency.jsp"> Sign up your agency</a>
                <a class="nav-link login" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Log in</a>
                <% }%>
            </ul>
        </div>
    </nav>
</header>