<%@page errorPage="ErrorPage.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>IGDTUW</title>
    <link href="index.css" rel="stylesheet">
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <style type="text/css">
  <%@include file="css/bootstrap.min.css" %>
  <%@include file="css/bootstrap.css" %>
  .container{background-color: #F5F5F5; border-radius:30px; margin-top:10%; width:50%}
  </style>
  </head>
<body>
<div class="container">
  <center><h3>Forgot Password</h3></center>
<form name="myform" align="center" class="form-horizontal" role="form" action="forgot" method="post"
 style="margin-top:20px;" >
<div class="form-group">
      <label class="col-sm-4 control-label">Enrollment Number:</label>
      <div class="col-sm-6">
        <input class="form-control" id="focusedInput" type="text" name="eno" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label">New Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="focusedInput" type="password" name="pass" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label">Confirm Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="focusedInput" type="password" name="cpass" required="required">
      </div>
</div>
<br>
<div class="form-group"> 
<div class="col-sm-offset-3 col-sm-5">
		<div class="col-sm-offset-2 col-sm-4">
		<input type="submit" name="submit" class="btn btn-success btn-lg" >
    </div>
    </div>
  </div>
  
         </form>
</div>

</body>
</html>