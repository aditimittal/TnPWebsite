<%-- 
    Document   : modal_msg
    Created on : Jul 7, 2017, 4:42:47 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="connection.jsp" %>
<% 
    
String id;

%>

<%
id = request.getParameter("id");
      Statement stmt= con.createStatement();  
      ResultSet rs=stmt.executeQuery("select * from admin_sentbox where id = "+id+" ");
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
        
 <%  
 String msg="" , recipient="";  
 if(!rs.next() ) {
    out.println("no data... error ocurred");
 } else{
     do{
      
      msg = rs.getString(3);
      recipient = rs.getString(4);
       } while (rs.next());
 }
con.close();
        
 %>


       
  <b><center><font color="red"><% out.println(msg);%></b>   
          
          <br>
          <b><center><font color="red"><% out.println(recipient);%></b>   
    </body>
</html>
