<%@page errorPage="ErrorPage.jsp"%>
<%@include file="student_login_header.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/commonCSS.css">
    <style>
        .con{ 
            margin-left: 300px;  
            width:50%; 
            margin-top:50px;
            background-color: #F5F5F5;
            padding: 30px;
            border: 2px solid #39843c;
        }
    </style>
  </head>
<body>

<div class="con">
    <center><h2 class="tnpheading">NEW STUDENT</h2></center><br>
<form name="myform" align="center" class="form-horizontal" role="form" action="Register" method="post"
 style="margin-top:20px;" >
<div class="form-group">
      <label class="col-sm-4 control-label">Enrollment Number:</label>
      <div class="col-sm-6">
        <input class="form-control" id="eno" type="text" name="eno" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label"> Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="pass" type="password" name="pass" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label">Confirm Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="confpass" type="password" name="cpass" required="required">
      </div>
</div>
<br>
<div class="form-group"> 
<div class="col-sm-offset-3 col-sm-5">
		<div class="col-sm-offset-2 col-sm-4">
		<input type="submit" name="submit" class="btn btn-success btn-lg tnpbtn" >
    </div>
    </div>
  </div>
  
         </form>
</div>

</body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp"%></footer>