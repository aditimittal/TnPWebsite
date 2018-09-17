<%-- 
    Document   : connection
    Created on : Jun 28, 2017, 10:57:45 AM
    Author     : shivangi
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
        <%! Connection conn; %>
        <%
        String year=  request.getParameter("year");
        String db_name = "db_"+year;
        
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root","");
        
        
        

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
        
        %>
    </body>
</html>
