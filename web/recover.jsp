<%@page errorPage="ErrorPage.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
  <%@include file="css/bootstrap.min.css" %>
  <%@include file="css/index.css" %>
  <%@include file="css/bootstrap.css" %>
  .navbar-default{ background-color: white; border-width: 0px;}
  .con{ margin-left:25%; margin-top:5%; width:50%;background-color: #F5F5F5; padding: 30px; border-radius: 30px;}
 
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<div class="con">
<center><h3>Forget Password</h3></center><br>
<form class="form-horizontal" method="post" action="email" id="formForgotPassword" data-toggle="validator" role="form" >
<p>Please enter your email-id to reset your password</p>
 <input name="inputEmail" type="email" class="form-control" id="inputEmail" placeholder="Enter Email" data-error="Enter valid Email" required>
 <br><center><input type="submit" class="btn-lg btn-success"></center>
</form>
</div>

</body>
</html>