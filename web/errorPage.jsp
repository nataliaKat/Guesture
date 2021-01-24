<%@ page import="model.Hotel" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <%@include file="header.jsp"%>
    <title>Error</title>

</head>
<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-expand-md navbar-light  custom-nav">
    <a class="navbar-brand"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav ml-auto">

        </ul>
    </div>
</nav>
<main class="container">
    <div class="row">
        <div class="alert alert-danger col-md-12" role="alert">
            <%=exception.get%>
        </div>
    </div>
</main>

<%@include file="footer.jsp"%>
</body>
</html>
