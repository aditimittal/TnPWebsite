<%-- 
    Document   : error
    Created on : 27 Feb, 2018, 2:41:24 PM
    Author     : vedi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Exception : <%=exception%>
    </body>
</html>
