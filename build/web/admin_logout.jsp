<%-- 
    Document   : admin_logout.jsp
    Created on : 19 Sep, 2017, 11:57:34 AM
    Author     : ashim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
        <%
            HttpSession s=request.getSession();
		s.invalidate();
		response.sendRedirect("admin_login.jsp");%>
    </body>
</html>
