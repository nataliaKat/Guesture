<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.*" %>

<%
String uname = request.getParameter("username");
String passwd = request.getParameter("password");

if (uname == null || passwd == null) {

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
    <jsp:forward page="" />
   <% } %>
   <% } catch (Exception e) {
       request.setAttribute("message", "Wrong username or password" + e.getMessage());
   %>
   <jsp:forward page="login.jsp" />
<%
 } 
 %>