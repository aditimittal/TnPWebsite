<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style_one.css">
        <title>IGDTUW</title>
        <style>
            #go-to{
                background-color:#39843c;
                border: none;
                color: white;
                padding: 1em 2em;
                text-decoration: none;
                font-size: 1em;
                margin: 4px 2px;
                cursor: pointer;
            }
            .body-wrapper{
                min-height:50vh;
            }
        </style>
</head>
<body>
    <div class="body-wrapper">
    
    <center>
        <h3 style="margin-top:10%"><%=request.getAttribute("Message")%></h3>
        <form action="List_Notification.jsp">
                <input id="go-to" type="submit" value="GO TO NOTIFICATIONS">
        </form>
    </center>
    <%
        String username = (String)session.getAttribute("name");
        String subject = (String)session.getAttribute("notifysub");
        String content = (String)session.getAttribute("notifytext");
        
       
        
        String msg = "New Notifcation Sent with \n Subject: "+subject+"\n"+" Content: "+content;
        request.getSession().removeAttribute("notifysub");
        request.getSession().removeAttribute("notifytext");
        System.out.println(msg);
        insertLog(username, "Notification Board Updated", msg);
    %>
    
    </div>
</body>
<footer><%@include file="footer2.jsp" %></footer>
</html>