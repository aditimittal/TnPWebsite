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
      ResultSet rs=stmt.executeQuery("select * from stu_mail where id = "+id+" ");
%>
<%  
 String msg="" , email="" , enrollmentno="", date="", time="";  
 if(!rs.next() ) {
    out.println("no data... error ocurred");
 } else{
     do{
      
      msg = rs.getString(3);
      email = rs.getString(7);
      enrollmentno= rs.getString(6);
      date= rs.getString(4);
      time= rs.getString(5);
       } while (rs.next());
 }
con.close();
        
 %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.modal-body{
	font-size: 18px;
}
</style>

</head>
<body>

<div class="container">
    <a data-toggle="modal" data-target="#myModal"> OPEN MODAL </a>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <!--Subject--> 
          <h4 class="modal-title"><b> Regarding non-payment of dues for the period of September-October 2017</b></h4>
          
        </div>
        <div class="modal-body">
          <div clabol
               ss="container">
            <form>
              <div class="form-group">
                <label for="from">From:</label>
                <%out.println(email); %>
              </div>
              <div class="form-group">
                <div class="form-group">
                <label for="msg">Message:</label>
                <div style="height: auto; width : 545px; min-height: 100px; max-height: 200px; overflow-y:auto;" class="form-control" id="msg" >
                <%out.println(msg); %> 
                </div>
              </div>
              </div>
              
              
            </form>
</div>
        </div>
        <div class="modal-footer">
          <h5 style="float: left;">Enrollment Number: <%out.println(enrollmentno); %></h5>
          <h5 style="float: right;"><%out.println(date); %>   <%out.println(time); %></h5>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>
