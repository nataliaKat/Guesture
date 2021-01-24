<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>

<%
session.invalidate();
%>

<jsp:forward page="login.jsp" />