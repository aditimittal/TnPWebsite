<!DOCTYPE html>
<% 
    if(request.getParameter("page").equalsIgnoreCase("student")){
%>
<%@include file="student_login_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<%
    }
    else{
%>
<%@include file="admin_login_header.jsp" %>
<%
    }
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <script>
    document.getElementById("contact_us").className = "active";
    
    </script>
    
    
  </head>

  <body>



</body>
</html>