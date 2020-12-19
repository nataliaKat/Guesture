<%--
  Created by IntelliJ IDEA.
  User: kat26
  Date: 12/19/2020
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Error</title>
</head>
<body>
<div class="alert alert-danger" role="alert">
    <%=request.getAttribute("message")%>
</div>
</body>
</html>
