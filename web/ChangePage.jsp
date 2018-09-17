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
            int pageNo = 0;
            String linktype = request.getParameter("link");

            if(linktype.equals("prev")){
                pageNo = Integer.parseInt(request.getParameter("page"))-1;

            }
            else{
                pageNo = Integer.parseInt(request.getParameter("page"))+1;
     
            }
            
            String url = "ShowLogs.jsp?page=" + pageNo;
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", url); 
        %>
    </body>
</html>
