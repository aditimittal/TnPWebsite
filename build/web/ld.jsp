<%-- 
    Document   : change_password
    Created on : 21 Sep, 2017, 12:04:27 AM
    Author     : ashim
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@include file="connection.jsp" %> 
<%@include file="dash.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <title>IGDTUW</title>
        <style>
            input[type=text], input[type=password]{
        width: 20%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }

    input[type=submit] {
        width: 40%;
        background-color: #333333;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #666666;
    }
        </style>
    </head>
    <body>
        <div class="clear"> </div>
                <br><br><br><br>
			<article class="box" align="center">
				<h1 class="heading">Change Password</h1>
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
                                    <form action="student_change_password_db.jsp" method="post">
                                        
                                        <label for="password">Old Password</label>
                                        <input class="box_one" type="password" name="old_password" id="pass" placeholder="Enter Old Password!" style="margin-left: 7em;" required >
                                        <br>
                                        <label for="confirmed_password">New Password</label>
                                        <input class="box_one" type="password" name="new_password" id="cpass" placeholder="Enter new password!" style="margin-left: 7em;" required >
                                        <br>
                                        <label for="confirmed_password">Confirm New Password</label>
                                        <input class="box_one" type="password" name="confirmed_password" id="cpass" placeholder="Enter new password again!" style="margin-left: 3.3em;" required >
                                        <br><br>
                                        <input type="submit" value="Submit">    
                                      </form>
                                </div>
				
			</article>

    </body>
</html>
