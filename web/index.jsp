<%@page errorPage="ErrorPage.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
  <%@include file="css/index.css" %>
  <%@include file="css/bootstrap.css" %>
       .navbar-default{ background-color: white; border-width: 0px;}
      .navbar-inverse{ border-width: 0px;height: 53px;}
      li{padding-left: 110px; font-size:18px;}
      .login{ margin-left: 30px;  width:40%; margin-top:50px; background-color: #F5F5F5; padding: 30px; border-radius: 30px;}
    </style>
  </head>

  <body>
    <div class="container">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <a href="#" class="navbar-left"><img src="logo.jpg" class="img-responsive" alt="logo" width="120"></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav" style="margin-left:150px;">
		          <center><h3>Indira Gandhi Delhi Technical University for Women</h3>
              <h4>(Established by Govt. of Delhi vide Act 9 of 2012) <br>(Formerly Indira Gandhi Institute of Technology)
              </h4></center>	
            </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
          </div> <!-- /container -->
<nav class="navbar navbar-inverse" >
  <div class="container-fluid">    
    <ul class="nav navbar-nav navbar">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="screen_why.jsp">Why IGDTUW</a></li>
      <li><a href="screen.stats.jsp">Placement Stats</a></li>
      <li><a href="screen.placements.jsp">Placements</a></li>
      <li><a href="contact.jsp">Contact Us</a></li>
    </ul>
  </div>
</nav>

<!-- login div-->
<div class="login">
  <center><h3  >Admin Login</h3></center>
<form name="myform" align="center" class="form-horizontal" role="form" action="login" method="post"
 style="margin-top:20px;">
<div class="form-group">
      <label class="col-sm-4 control-label">Username:</label>
      <div class="col-sm-6">
        <input class="form-control" id="focusedInput" type="text" name="user" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label">Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="focusedInput" type="password" name="pass" required="required">
        <a href="#">forgot password?</a>
      </div>
</div>
<br>
<div class="form-group"> 
    <div class="col-sm-offset-4 col-sm-2">
      <button type="submit" name="submit" class="btn btn-success btn-lg">Login</button>
    </div>
</div>
         </form>
</div>
  </body>
</html>
