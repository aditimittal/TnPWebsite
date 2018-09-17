<%@include file="connection.jsp" %>
<%@include file="dash.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <title>IGDTUW</title>
        <style>
            .boxborder{
                /*margin-left: 20%;  */
                width:50%; 
                height:90%;
               /* margin-top:0.5%;*/
                background-color: #F5F5F5;
                padding: 30px;
                border: 2px solid #39843c;
            }
             @media screen and (max-width: 510px) {
                .boxborder{
                width:70%; 
                height:100%;
                background-color: #F5F5F5;
                padding: 30px;
                border: 2px solid #39843c;
            }
            }
        </style>
    </head>
    <body>
        <div class="clear"> </div>
                <br><br><br><br>
    <center>
			<div class="boxborder" align="center">
                            <center><h2 class="tnpheading">CHANGE PASSWORD</h2></center>
                                <%
                                    if(request.getParameter("txt") == null){
                              //                out.println("<center><h5 style=\"color:red\">no text</h5></center>");
                                    }
                                    else{
                                              out.println("<center><h4 style=\"color:red\">"+request.getParameter("txt")+"</h4></center>");
                                    }
                                %>
				<br>
                                <div>
                                    <form name="myform" align="center" class="form-horizontal" role="form" action="student_change_password_db.jsp" method="post" style="margin-top:20px;" >                                        
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="password">Old Password:</label>
                                            <div class="col-sm-6">
                                              <input class="form-control" type="password" name="old_password" id="opass" placeholder="Enter old password" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="new_password">New Password:</label>
                                            <div class="col-sm-6">
                                              <input class="form-control" type="password" name="new_password" minlength="6" maxlength="10" id="npass" placeholder="Enter new password" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="new_password"> Confirm New Password:</label>
                                            <div class="col-sm-6">
                                              <input class="form-control" type="password" name="confirmed_password" minlength="6" maxlength="10" id="cpass" placeholder="Enter new password again" required>
                                            </div>
                                        </div>
                                        <div class="form-group"> 
                                            <div class="col-sm-offset-3 col-sm-5">
                                                <div class="col-sm-offset-2 col-sm-4">
                                                    <input type="submit" name="submit" class="tnpbtn btn btn-success btn-lg tnpbtn" >
                                                </div>
                                            </div>
                                        </div>
    </div>
                                      </form>
                                </div>
    </center>
				
			</div>
                        <br><br><br><br>
    </body>
    
</html>
<footer><%@include file="footer2.jsp"%></footer>