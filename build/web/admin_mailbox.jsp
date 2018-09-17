<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
<!--        <link rel="stylesheet" type="text/css" href="css/style_one.css">-->
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <title>IGDTUW</title>

        <style>
            #LeftPanel select{
                display: none;
                color: green;
            }
                footer {
                    clear: both;
                    position: relative;
                    z-index: 10;
                    width:100%;
                    bottom:0;
                }
 
                ul1 {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    width: 200px;
                /*    background-color: #f1f1f1;*/
                }

                li1 a {
                    display: block;
                    font-weight: bold;
                /*    color: white;*/
                    padding: 8px 16px;
                    width:200px;
                    text-decoration: none;
                }

                li1 a.active {
                    background-color: #e6e6e6;
                    color:#39843c;
                    font-weight: bold;
                    padding: 8px 16px;
                    width:200px;
                    text-decoration: none;
                }

                li1 a:hover:not(.active) {
                    color: #000000;
                    font-weight: bold;
                    background-color: #bfbfbf;
                    width: 200px;
                    text-decoration: none;
                    padding: 8px 16px;
                }

                .container{
                        margin: 1px 1px 1px 1px;
                }
                
                input[type=text], textarea {
                    width: 70%;
                    padding: 2px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }
                #RightPanel{
                    width: 85%; 
                    height: 100%; 
                    text-align: left;  
                    float: right;
                }

                @media (max-width: 960px) {
                #LeftPanel ul1     { display: none; }
                #LeftPanel select { display: inline-block; }
                #RightPanel{text-align : center;}
                #RightPanel{width: 100%;height: 100%;text-align: center;float: right;}
                  
                }
        </style>


    </head>
<!-------------- ADMIN MAILBOX : - admin sends mail to students on their gmail id ----------------->
        
<body>




<div id="LeftPanel" style="width: 15%; height: 100%; float:left ; ">
    <br>
    
    
    <center>
<ul1>
  <li1><a  href="admin_mailfront.jsp">INBOX</a></li1>
  <li1><a href="admin_sentbox.jsp">SENT</a></li1>
  <li1><a class="active" href="admin_mailbox.jsp">COMPOSE</a></li1>
</ul1>
    </center>
</div>
    
 <!--for small screen-->
  <div id="LeftPanel" style=" height: 100%;">
     <center>
<select onchange="location = this.value;">
 <option value="admin_mailfront.jsp">INBOX</option>
 <option value="admin_sentbox.jsp">SENT</option>
 <option selected="selected" value="admin_mailbox.jsp">COMPOSE</option>
</select>
    </center>
</div>  
    
 <div id="RightPanel">
         
         
           
            <article class="boxborder">
                <h2 class="tnpheading topper"><center> COMPOSE MAIL </center></h2>
                <br>

                <form action="SendMailAttachServlet" method="post" enctype="multipart/form-data">
                    <table1 >
                        <tr>
                            <td>
                                <b>To:     
                                
                            </td>

                            <td>
                                <b><b><input type="text" name="recipient" placeholder="Enter sender mail-id" style="margin-left: 5.8%; text-align:left;" required />   <br/>
                            </td>
                        </tr>
                        

                        <tr>
                            <td>
                                <b> Subject:
                                

                            </td>
                            <td>
                                <input type="text" name="subject" placeholder="Enter the subject"  style="text-align:left; margin-left:2px;"  required ><br/>
                            </td>
                        </tr>

                        <tr>
                            <td >
                                <b style="text-align:left;"> Message Text:<br> 
                            </td>
                            <td>
                                <textarea rows="12" cols="120" name="content" style="text-align:left;" required ></textarea ><br/>
                            </td>
                        </tr>
                                                
                                                
                        <tr>
                            <td style="text-align:left;">Attach file: </td>
                       
                            <td><input type="file" name="file" size="50" /></td>
                            <br> <br>
                        </tr>
                                                 

                        <tr>
                            <td>
                                <input type="submit" class="tnpbtn" value="Send">
                            </td>
                                                    
                            <td>
                                <input type="reset" class="tnpbtn" value="Reset">
                            </td>
                        </tr>

        </table1>

        </form>  

</article>
     <br><br>
</div>	

    
</body>
</html>

<footer><%@include file="footer2.jsp" %></footer>                                                                                                                                            
