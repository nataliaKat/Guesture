<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
int hotelId = request.getParameter("hotelId");
int agencyId = request.getParameter("agencyId");
Date arrival = request.getParameter("arrival");
String time1 = request.getParameter("time1");
Date departure = request.getParameter("departure");
String time2 = request.getParameter("time2");
int num-of-people = request.getParameter("num-of-people");
int n-1 = request.getParameter("n-1");
int n-2 = request.getParameter("n-2");
int n-3 = request.getParameter("n-3");
int n-4 = request.getParameter("n-4");
String comments = request.getParameter("comments");

comments = new String(comments.getBytes("ISO-8859-1"), "UTF-8");

