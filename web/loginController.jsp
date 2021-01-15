<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<%@ page errorPage="errorPage.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username == null || password == null) {

    response.sendRedirect("login.jsp");
    return;

}
UserDao obj_userdao = new UserDao();
try {
   User user =obj_userdao.authenticate(username, password);
   session.setAttribute("userObj", user);
   if (user instanceof Hotel) {
   %> 
   <jsp:forward page="index.jsp" />
   <% } if (user instanceof Agency){
    %>
    <jsp:forward page="view_hotels.jsp" />
   <% } %>
   <% } catch (Exception e) {
       request.setAttribute("message", "Wrong username or password" + e.getMessage());
   %>
   <jsp:forward page="login.jsp" />
<%
 } 
 %>