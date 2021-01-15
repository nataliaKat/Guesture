<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.*" %>


<% 

String name = request.getParameter("name");
String telephone = request.getParameter("phone");
String mail = request.getParameter("mail");
String vatNumber = request.getParameter("vat");
String date = request.getParameter("date");

if ( name == null || phone == null || mail == null || vat == null || date == null) {
    
    response.sendRedirect("new_agency.jsp");
    return;
 
 }

 try {
    
    if ( name.length() == 0 ) {
        throw new Exception("No Name inserted");
    }

    if ( telephone.length() == 0 ) {
        throw new Exception("No Telephone inserted");
    }

    if ( mail.length() == 0 ) {
        throw new Exception("No email inserted");
    }
    
	String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(mail);
	
	//Case 2: if email is not valid throw an Exception with the message.
	if( !m.matches() ) {		
		throw new Exception(username + " is not a valid email address!");
    }
    
    if ( vatNumber.length() == 0 ) {
        throw new Exception("No VAT Number inserted");
    }

    if ( date.length() == 0 ) {
        throw new Exception("No Date inserted");
    }

    request.setAttribute("hotel_obj", hotel);
    %>    
        <jsp:forward page="index.jsp"/>
    <% 
    
 } catch(Exception e) {
    // adding error message to request and forward to form page
    request.setAttribute( "error_message", e.getMessage() );
    
 %>
        <jsp:forward page="new_agency.jsp"/>
 <%    
 } 
 %>






