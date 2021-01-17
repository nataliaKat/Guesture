<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.HotelDao" %>
<%@ page import="dao.ServiceDao" %>
<%@ page import="model.Hotel" %>
<%@ page import="model.Service" %>
<%@ page import="model.Hotel" %>
<%@ page import="java.util.List" %>


<% 

String username = request.getParameter("username");
String password = request.getParameter("password");
String repeat_password = request.getParameter("repeat_password");
String name = request.getParameter("name");
String address = request.getParameter("address");
String phonenumber = request.getParameter("phonenumber");
String head = request.getParameter("head");
String description = request.getParameter("description");
String priceSingle = request.getParameter("p-1");
String priceDouble = request.getParameter("p-2");
String priceTriple = request.getParameter("p-3");
String priceQuadruple = request.getParameter("p-4");
String servicesAsString = request.getParameter("services");
String terms = request.getParameter("terms");
String photoUrl = request.getParameter("photoUrl");

// convert from ISO-8859-1 (latin) to UTF-8 so as to support Greek characters
address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
head= new String(head.getBytes("ISO-8859-1"), "UTF-8");

    String[] services = servicesAsString.split("\n");

    if (username == null || password == null || repeat_password == null || name == null || address == null || phonenumber == null || description == null || priceSingle == null || priceDouble == null || priceTriple == null || priceQuadruple == null || services == null || terms == null || photoUrl == null) {
   response.sendRedirect("hotel_registration.jsp");
   return;

}
     String errors = "";
    if (username.length() == 0 ) errors += "<li>No email inserted</li>";

    String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(username);
	


    if (!m.matches()) errors += "<li>Username is not a valid email address!</li>";
    if (password.length() < 5) errors += "<li>Password must be at least 5 characters long</li>";
    if (!(repeat_password.equals(password))) errors+= "<li>Password and Repeat Password do not match</li>";
    if (name.length() == 0) errors += "<li>No Name inserted</li>";
    if (address.length() == 0) errors += "<li>No Address inserted</li>";
    if (phonenumber.length() == 0) errors += "<li>No Phonenumber inserted</li>";
    if (head.length() == 0 ) errors += "<li>No Head inserted</li>";
    if (priceSingle.length() == 0) errors += "<li>No Price per Single Room inserted</li>";
    if (priceDouble.length() == 0) errors += "<li>No Price per Double Room inserted</li>";
    if (priceTriple.length() == 0) errors += "<li>No Price per Triple Room inserted</li>";
    if (priceQuadruple.length() == 0) errors += "<li>No Price per Quadruple Room inserted</li>";
    if (services.length == 0) errors += "<li>No Services inserted</li>";
    if (photoUrl.length() == 0) errors += "<li>No Logo Photo inserted</li>";
    if (terms == null) errors += "<li>You must agree to terms and conditions</li>";

    if (errors == "") {

        Hotel hotel = new Hotel(username, password, name, address, phonenumber, head, description, Double.parseDouble(priceSingle), Double.parseDouble(priceDouble), Double.parseDouble(priceTriple), Double.parseDouble(priceQuadruple), services, photoUrl);
        HotelDao hoteldao = new HotelDao();
        hoteldao.register(hotel);
 
        int arrayLength = services.length;
        for (int i = 0; i <= arrayLength - 1; i++) {


            Service service = new Service(services[i], username);
            ServiceDao servicedao = new ServiceDao();
            servicedao.register(service);
        }
        
 %>
        <jsp:forward page="login.jsp" />

<%      request.setAttribute("message", "Registration form has been successfully completed!");
    } else { %>

<!doctype html>
<html lang="en">

<head>
    <title>Guesture | Hotel Registration</title>
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
                        <h1>Registration form has errors</h1>
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


    
    
    
    
   

    



    
