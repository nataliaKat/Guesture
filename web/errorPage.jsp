<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
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
