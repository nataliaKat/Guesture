<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<%@ page import="dao.UserDao" %>
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


    System.out.println(username);
    System.out.println(password);
    String[] services = servicesAsString.split("\n");

    if (username == null || password == null || repeat_password == null || name == null || address == null || phonenumber == null || description == null || priceSingle == null || priceDouble == null || priceTriple == null || priceQuadruple == null || services == null || terms == null) {
   response.sendRedirect("hotel_registration.jsp");
   return;

}
    
    if ( username.length() == 0 ) {
        throw new Exception("No email inserted");
    }
    
	String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(username);
	
	//Case 2: if email is not valid throw an Exception with the message.
	if( !m.matches() ) {		
		throw new Exception(username + " is not a valid email address!");
    }	


    if ( password.length() < 8 ) {
        throw new Exception("Password must be at least 8 characters");
    }
    
    
    if ( !(repeat_password.equals(password) ) )  {

        throw new Exception("Password and Repeat Password do not match");
    }

    if ( name.length() == 0 ) {
        throw new Exception("No Name inserted");
    }

    if ( address.length() == 0 ) {
        throw new Exception("No Address inserted");
    }

    if ( phonenumber.length() == 0 ) {
        throw new Exception("No Phonenumber inserted");
    }
     
    if ( head.length() == 0 ) {
        throw new Exception("No Head inserted");
    }

    if ( description.length() == 0 ) {
        throw new Exception("No Description inserted");
    }

    if ( priceSingle.length() == 0 ) {
        throw new Exception("No Price per Single Room inserted");
    }

    if ( priceDouble.length() == 0 ) {
        throw new Exception("No Price per Double Room inserted");
    }

    if ( priceTriple.length() == 0 ) {
        throw new Exception("No Price per Triple Room inserted");
    }

    if ( priceQuadruple.length() == 0 ) {
        throw new Exception("No Price per Quadruple Room inserted");
    }

    if ( services.length == 0) {
        throw new Exception("No Services inserted");
    }

    if ( terms.length() == 0 ) {
        throw new Exception("You must agree to terms and conditions");
    }

    Hotel hotel = new Hotel(username, password, name, address, phonenumber, head, description, Double.parseDouble(priceSingle), Double.parseDouble(priceDouble), Double.parseDouble(priceTriple), Double.parseDouble(priceQuadruple), services);
    
    UserDao userdao = new UserDao();
    userdao.register(hotel);
   
    request.setAttribute("hotel_obj", hotel);
%>

<jsp:forward page="hotel_registration.jsp"/>

