<%-- 
    Document   : connection
    Created on : Jun 28, 2017, 10:57:45 AM
    Author     : shivangi
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%! Connection con; %>
        <%
        
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");
        
        
        

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
        
        %>
    