<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        
        <title>IGDTUW</title>

        <style>
   
    input[type=text], textarea {
        width: 100%;
        padding: 2px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
        </style>


    </head>

    <body>
        
        <br> <br> <br> 
            <article class="boxborder">
                <h2 class="tnpheading"><center> ADD NEW NOTIFICATION </center></h2>
                <br>

                <form action="${pageContext.request.contextPath}/uploadToDBServlet" method="POST" enctype="multipart/form-data">  
                    <table1>
                        <tr>
                            <td ><b style="text-align:left;"> Subject: </b></td>
                            <td> <textarea rows="1" cols="120" name="sub" required></textarea></td>
                            <td><b> Notification Text:</b>
                                    <br></td>
                            <td> <textarea rows="12" cols="120" value="Enter the notification text" name="info" required ></textarea ><br/> </td>
                        </tr>
                        <tr>
                            <td>
                                <b> Select a file:</b>
                            </td>
                            <td><input type = "file" name = "file"/>
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td> <input type="submit" class="tnpbtn" value="Send"> </td>
                            <td> <input type="reset" class="tnpbtn" value="Reset"> </td>
                        </tr>
                                                
                                                
                    </table1>

                </form>  

            </article>
        	
    </body>
    <br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>