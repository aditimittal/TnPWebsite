<%-- 
    Document   : stu_mail
    Created on : Jul 6, 2017, 3:40:08 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style_one.css">
        <title>IGDTUW</title>

        <style>

            table1 {
                border-collapse: collapse;
                border : 0px;
            }

            tr, td {
                padding: 8px;
                text-align: left;
                border-bottom: 0;
            }
            input[type=text], textarea, #dropdown{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type=button], input[type=submit], input[type=reset] {
                background-color: #008000;
                border: none;
                color: white;
                padding: 7px 10px;
                text-decoration: none;
                font-size: 22px;
                margin: 4px 2px;
                cursor: pointer;
            }

        </style>


    </head>

    <body>
        <div class="container">
            <header>
                <div class="image">

                    <img class="logo" src="images/logo.jpg" alt="logo">
                </div>
                <h2 style="font-family: 'Helvetica', 'Arial', safont-familyns-serif; font-size:32px; color:green;text-align:center;padding:0;margin:0;"> TRAINING  AND  PLACEMENT  CELL </h2>

                <h4 style="font-family: 'Helvetica', 'Arial', safont-familyns-serif; font-size:18px;color:green;text-align:center;padding:0;margin:0;"> INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN </h4>

                <h3 style="text-align:center;padding:0;margin:0;"> (Established by Govt.of Delhi vide Act 9 of 2012) </h3>

                <h4 style="text-align:center;padding:0;margin:0;"> (Formerly Indira Gandhi Institue of Technology) </h4>

                <br/>
                <br/>
                <div class="clear"></div>
                <nav class="student_nav">
                    <ul>
                        <li><a href="notify.jsp">NOTIFICATION BOARD</a></li>
                        <li><a href="admin_mailbox.jsp">MAILBOX</a></li>
                        <li><a href="screen_admin_database.html">DATABASE</a></li>
                        <li><a href="screen_admin_stats.jsp">STATISTICS</a></li>
                        <li><a href="ShowLogs.jsp?page=1">LOGS</a></li>
                        <li><a href="screen_admin_rights.jsp">ADMIN RIGHTS</a></li>
                        <li><a href="screen_admin_deadlines.jsp">SET DEADLINES</a></li>
                    </ul>
                </nav>
            </header>
            <br>
            <br>
            <br>
            <br>
            <br>
       
            <h2 style="font-family: 'Helvetica', 'Arial', safont-familyns-serif; font-size:16px; text-align:center;padding:0;margin:0;"> You are logged in as Administrator </h2>
            
            
           
            <article class="box_notif">
                <h1 class="heading"><center>MAILBOX </center></h1>
                <br>

                <form action="action_page.jsp" method="post" >
                    <table1 >
                      

                        <tr>
                          <td>
                                                       
                               <b> Subject:
                               <br>

                            </td>
                            
                            
                            <td>
                                                   
                                <select name="subject" id="dropdown">
                                <option value="Personal Details Updation">Personal Details Updation</option>
                                <option value="Marks Updation">Marks Updation</option>
                                <option value="OTHERS">Others</option>
                                                                    
                                </select>
  <br><br>
                            </td>
                        </tr>

                                                <tr>
                                                    <td>
                                                        <b> Message Text:

                                                            <br>
                                                            </td>
                                                            <td>
                                                                <textarea rows="12" cols="120" name="content" required ></textarea ><br/>
                                                            </td>
                                                </tr>
                                                
                                                
                                               

                                                <tr>
                                                    <td>
                                                        <input type="submit" value="Send">
                                                    </td>
                                                    <td>
                                                        <input type="reset" value="Reset">
                                                    </td>
                                                </tr>

                                                </table1>

                                                </form>  


</article>
</div>	
</body>
</html>                                                                                            