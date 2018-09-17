<%-- 
    Document   : result
    Created on : Jul 5, 2017, 7:12:40 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Result</title>
</head>
<body>
    <center>
        <h3>${requestScope.message}</h3>
        <%
            String username = (String)session.getAttribute("name");
            String recipient = (String)session.getAttribute("sendto");
            String subject = (String)session.getAttribute("LogSub");
            String content = (String)session.getAttribute("LogContent");
            String sendto = "Mail Sent to "+recipient;
            String msg = "Subject: "+subject+"\n"+"Content: "+content;
            request.getSession().removeAttribute("sendto");
            request.getSession().removeAttribute("LogSub");
            request.getSession().removeAttribute("LogContent");
            insertLog(username, sendto, msg);
        %>
        
    </center>
</body>
</html>