<%@ page import="model.Agency" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<%Hotel signedInHotel = (Hotel)session.getAttribute("userObj");
if (signedInHotel == null) {
throw new Exception("You are not authorized to view this content");
}
%>
<head>
  <title>Dream Hotel | Home</title>
  <%@include file="header.jsp"%>
</head>
<body id="home">
<%@include file="navbar.jsp"%>
<!-- Page Content -->
<main>
  <section>
    <div class="container">
      <div class="row">
        <div class="col-lg-6" style="color: white;">
          <b><h1 class="mt-5">Welcome back!</h1></b>
          <b><p>Take a look at your progress:</p></b>
          <button class="btn btn-info" onclick="location.href = 'chart.jsp'">Show Statistics</button>

        </div>
      </div>
      <%
        if (request.getAttribute("successMessage") != null) {
          %>
      <div class="row">
      <div class="alert alert-success mt-3 col-12 text-center" role="alert">
        <div class="page-header">
          <%=request.getAttribute("successMessage")%>
        </div>
      </div>
    </div>
        <%}%>

    </div>
  </section>
</main>
<%@include file="footer.jsp"%>
</body>

</html>
