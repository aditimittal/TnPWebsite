<%-- 
    Document   : screen_admin_rights2_new.jsp
    Created on : 27 Jun, 2017, 7:24:54 PM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style_one.css">
<link rel="stylesheet" href="css/commonCSS.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Training and Placement Cell,IGDTUW</title>
<style>
    select{
        width: 40%;    
        padding: 2px 20px;
        margin-left: 2em;
        margin-top: 1em;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    *{
        font-style: normal;
        text-align: center;
        margin: 0px;
        margin-top: 0%;
        margin-left: 0%;
        font-family: 'Helvetica', sans-serif;
        text-decoration: none;
        padding: 0px;
        list-style-type: none;
    }
    .logo
    {
        width: 140px;
        margin-left: 25%;
        float: left;
    }
    input[type=text], input[type=password]{
        width: 90%;
/*        padding: 2px 20px;*/
/*        margin: 8px 0;*/
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    input[type=email]{
        width: 40%;
        padding: 2px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

/*    input[type=submit] {
        width: 40%;
        background-color: #7BA566;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }*/
    input[type=checkbox]{
        float: left;
        margin-left: 25%;
        padding: 20%;
    }
    #below{
        width: 40%;
        background-color: #333333;
        color: white;
        padding: 14px 20px;
        margin-left: 0%;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
/*    #above{
        background-color:#39843c;
        border: none;
        color: white;
        padding: 1em 1em 1em 1em;
        text-decoration: none;
        font-size: 1em;
        margin: 2px 2px;
        cursor: pointer;
        width: auto;
        height: 3.2em;
    }*/
</style>
</head>

<body>
    
		
        
		<div class="clear"> </div>
                <br><br><br><br>
		<section>
			<article class="box">
				<h1 style="color:#39843c;">ADD ADMIN</h1>
				<br>
                                <div>
                                    <form action="admin_add.jsp" onsubmit="return validateForm()" method="post" name="add_admin">
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="name">User Name</label>
                                            </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="name" id="name"  placeholder="Enter User Name"  required>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                        <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="name">Email</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="email" id="email" placeholder="Enter email-id of the user"  required>
                                            </div>
                                        </div><br>
                                        <div class="row">
                                        <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="designation">Designation</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="designation" id="desig"  placeholder="Enter Designatin of the user" required >
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                        <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="department">Department</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="department" id="dept" placeholder="Enter department of user" required >
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                        <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="password">Password</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="password" minlength="6" maxlength="10" name="password" id="pass" placeholder="Enter Password!"  required >
                                            </div>
                                        </div><br>
                                        
                                        <div class="row">
                                       
                                            <div class="col-sm-1 col-md-3">
                                        <label for="confirmed_password">Confirm Password</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="password" minlength="6" maxlength="10" name="confirmed_password" id="cpass" placeholder="Enter password again!"  required >
                                            </div>
                                        </div><br><br>
                                        <div class="row">
                                        <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="rights">Rights</label>
                                        </div>
                                            <div class="col-sm-2 col-md-3">
                                        <input type="radio" name="rights" onclick="disp()" id="full" value="full" id="r2"  checked> Full
                                        </div>
                                            <div class="col-sm-1 col-md-3"><input type="radio" name="rights"  onclick="disp()" id="partial"  value="partial" > Partial<br>
                                            </div></div>       
                                           <br><br>
                                        
                                        <div id="partial_option" style="display:  none; margin-top: 0%">
                                         
                                            <label for="pages" style="float: left;margin-left: 20%;">Provide Rights For</label>
                                            <br><br>
                                            
                                            <input type="checkbox" name="pages" value="Notifications"><span style="float: left; padding-left: 7px;"> Notifications</span><br>
                                            <input type="checkbox" name="pages" value="mail box" ><span style="float: left; padding-left: 7px;"> Mail Box</span><br>
                                            <input type="checkbox" name="pages" value="create_delete_database"><span style="float: left; padding-left: 7px;" > Create & Delete Database</span><br>
                                            <input type="checkbox" name="pages" value="view_database"><span style="float: left; padding-left: 7px;">View Database</span><br>
                                            <input type="checkbox" name="pages" value="view subjects"><span style="float: left; padding-left: 7px;">View Subjects</span><br>
                                            <input type="checkbox" name="pages" value="View Statistics"><span style="float: left; padding-left: 7px;">View Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Update Statistics"><span style="float: left; padding-left: 7px;">Update Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Logs"><span style="float: left; padding-left: 7px;">Logs</span><br>
                                            <input type="checkbox" name="pages" value="calender"><span style="float: left; padding-left: 7px;">Calender</span><br>
                                            <input type="checkbox" name="pages" value="Admin rights"><span style="float: left; padding-left: 7px;">Admin rights</span><br>
                                            <input type="checkbox" name="pages" value="Set deadline" ><span style="float: left; padding-left: 7px;">Set deadline</span><br>
                                            <input type="checkbox" name="pages" value="View Placements" ><span style="float: left; padding-left: 7px;" >View Placements</span><br>
                                            <input type="checkbox" name="pages" value="Placement Offers" ><span style="float: left; padding-left: 7px;">Placement Offers</span><br>
                                            
                                            
                                        </div>
                                        <br>
                                        <input type="submit" value="Submit" class="tnpbtn">
                                        <script>
                                            function disp(){
                                                if(document.getElementById('partial').checked){
                                                     document.getElementById('partial_option').style.display = 'block';
                                                     document.getElementById('below').style.display = 'block';
                                                }
                                                else if(document.getElementById('full').checked){
                                                     document.getElementById('partial_option').style.display = 'none';
                                                }
                                            }
                                            function validateForm () {
                                                var desig = document.add_admin.designation;
                                                var dept = document.add_admin.department;
                                                var pass = document.add_admin.password;
                                                var email = document.add_admin.email;
                                                var conf=document.add_admin.confirmed_password;

                                                if( ValidateEmail(email))
                                                {
                                                    if(allLetter(desig))
                                                    {
                                                        if(allLetter(dept))
                                                        { 
                                                            if(passid_validation(pass,6,10))
                                                            {
                                                                   if(checkpass(pass,conf)) 
                                                                   {

                                                                   }
                                                            }
                                                        } 
                                                    }
                                                }


                                                return false;

                                               } 

                                                function allLetter(uname){ 
                                                    var letters = /^[A-Za-z ]+$/;
                                                    if(uname.value.match(letters)){
                                                        return true;
                                                    }
                                                    else{
                                                        alert(uname.name+' must have alphabet characters only');
                                                        uname.focus();
                                                        return false;
                                                    }
                                                }

                                                function ValidateEmail(uemail){
                                                    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                                                    if(uemail.value.match(mailformat)){
                                                        return true;
                                                    }
                                                    else{
                                                        alert("You have entered an invalid email address!");
                                                        uemail.focus();
                                                        return false;
                                                    }
                                                } 
                                                function checkpass(pass,conf){
                                                    if(pass.value==conf.value){
                                                        return true;
                                                    }
                                                    else{
                                                        alert("Password and confirmed password doesn't match");
                                                        pass.focus();
                                                        return false;
                                                    }
                                                }

                                            
                                            


                                        </script>
                                        
                                      </form>
                                </div>
				
			</article>


</body>
<br><br><br>
</html>
<footer class="tnpfooter><%@include file="footer2.jsp" %></footer>