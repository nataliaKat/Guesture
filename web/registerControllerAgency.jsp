<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<%@ page import="dao.AgencyDao" %>
<%@ page import="model.Agency" %>



<% 

String name = request.getParameter("name");
String password = request.getParameter("password");
String repeat_password = request.getParameter("repeat_password");
String telephone = request.getParameter("phone");
String mail = request.getParameter("mail");
String vatNumber = request.getParameter("vat");

if ( name == null || telephone == null || mail == null || vatNumber == null ) {
    
    response.sendRedirect("new_agency.jsp");
    return;
 
 }

String errors = "";

if (name.length() == 0) errors += "<li>No Name inserted</li>";
if (password.length() < 5) errors += "<li>Password must be at least 5 characters long</li>";
if (!(repeat_password.equals(password))) errors+= "<li>Password and Repeat Password do not match</li>";
if (telephone.length() == 0) errors += "<li>No Telephone inserted</li>";
if (mail.length() == 0) errors += "<li>No Mail inserted</li>";

String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
java.util.regex.Matcher m = p.matcher(mail);

if (!m.matches()) errors += "<li>Mail is not a valid email address!</li>";
if (vatNumber.length() == 0) errors += "<li>No VAT Number inserted</li>";



if (errors == "") {
    Agency agency = new Agency(mail, password, name, telephone, mail, vatNumber);
    AgencyDao agencydao  = new AgencyDao();
    agencydao.register(agency);
    request.setAttribute("message", "Registration form has been successfully completed. Login now!");
%>
    <jsp:forward page="login.jsp" />

<%     
} else { %>

<!doctype html>
<html lang="en">

<head>
    <title>Guesture | New Agency</title>
    <!-- Bootstrap 4 -->
    <%@include file="header.jsp"%>
</head>

<body id="hotelRegistration">
    <header>
        <!-- Fixed navbar -->
        <nav class="navbar navbar-expand-md navbar-light  custom-nav">
            <a class="navbar-brand"><img class="logo" src="images/logo_blue_nav.png" alt="logo"></a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Begin page content -->
    <main class="container">
        <div id="registration_form" class="col-xs-12 col-md-10 col-lg-8" style="padding: 20px">
        
                    <div class="page-header">
                        <h1> Registration form has errors</h1>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        <ol>
                            <%=errors%>
                        </ol>
                    </div>
                                          
        </div>
    </main>

    <%@include file="footer.jsp"%>
</body>

</html>
<% } %> 

   