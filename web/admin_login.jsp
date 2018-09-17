<%@include file="admin_login_header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="css/commonCSS.css">
  
<style type="text/css">
      .login{ 
        margin-left: 30px;
        width:40%;
        margin-top:50px;
        background-color: #F5F5F5;
        padding: 30px;
        border: 2px solid #39843c;
    }  
</style>
  </head>

  <body>
    

<!-- login div-->
<div class="login">
    <center><h2 class="tnpheading">ADMIN LOGIN</h3></center><br>
  <%
      if(request.getParameter("txt") == null){
//                out.println("<center><h5 style=\"color:red\">no text</h5></center>");
      }
      else{
                out.println("<center><h5 style=\"color:red\">"+request.getParameter("txt")+"</h5></center>");
      }
  %>
<form name="myform" align="center" class="form-horizontal" role="form" action="Login" method="post"
 style="margin-top:20px;">
<div class="form-group">
      <label class="col-sm-4 control-label">Username:</label>
      <div class="col-sm-6">
        <input class="form-control" id="eno" type="text" name="user" required="required">
      </div>
</div>
<div class="form-group">
      <label class="col-sm-4 control-label">Password:</label>
      <div class="col-sm-6">
        <input class="form-control" id="pass" type="password" name="pass" required="required">
        <!--<a href="#">forgot password?</a>-->
      </div>
</div>
<br>
<div class="form-group"> 
    <div class="col-sm-offset-4 col-sm-2">
      <button type="submit" id="submit" name="submit" class="btn btn-success btn-lg tnpbtn">Login</button>
    </div>
</div>
In case of <b>Forgot password</b> send mail to abc@gmail.com
         </form>
  
</div>
  </body>
  <br><br><br>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>
