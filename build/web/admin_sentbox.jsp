<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
        <title>IGDTUW</title>
       
        <style>
            #LeftPanel select{
                display: none;
                color: green;
            }
         ul1 {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
        }

        li1 a {
            display: block;
            padding: 8px 16px;
            font-weight: bold;
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
       
        

        table {
            width: 96%;
        }

        .click{
            width: 20%;
            height: 10%;
            background-color: #e6e6e6;
            color: green;
            padding: 0.2em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .click:hover{
            background-color: #d9d9d9;
            color: blue;
            text-decoration: none;
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
                #RightPanel{width: 100%;height: 100%;text-align: center;float: right;}
                
</style>
    
   
    </head>
    
  
       
    
    
            




<body>
    <br><br>
<div>
<div id="LeftPanel" style="width: 15%; height: 100%; float:left ; ">
    <br>
    
    
    <center>
<ul1>
  <li1><a  href="admin_mailfront.jsp">INBOX</a></li1>
  <li1><a class="active" href="admin_sentbox.jsp">SENT</a></li1>
  <li1><a href="admin_mailbox.jsp">COMPOSE</a></li1>
  
</ul1>
    </center>
</div>
 <div id="LeftPanel" style=" height: 100%;">
     <center>
<select onchange="location = this.value;">
 <option value="admin_mailfront.jsp">INBOX</option>
 <option selected="selected" value="admin_sentbox.jsp">SENT</option>
 <option  value="admin_mailbox.jsp">COMPOSE</option>
</select>
    </center>
</div>  
    
<div id="RightPanel">
         
<article class="boxborder" >
<h2 class="tnpheading topper"><center> SENT MAIL </center></h2>
<br>
 <div class="table-responsive">
<table class="table">
<tr>
<th style="width: 60px" ><b>S No.</th>
<th style="width: 180px" ><b> SUBJECT </th>
<th style="width: 90px" > <b> DATE </th>
<th style="width: 90px" > <b> TIME </th>
<th style="width: 160px" > <b> RECIPIENT </th>
<th style="width: 150px" > <b> SHOW MESSAGE </th>

</tr>

 <% 
/******* to display data in table and showing msg on other page ***************/
                                                   int i=1;
                                                   
                                                    Statement stmt= con.createStatement();  
                                                    ResultSet rs=stmt.executeQuery("select * from admin_sentbox order by id desc");
                                                    
                                                    
                                                    

                                                    while(rs.next()){
                                                        int sno = i;
                                                        int id = rs.getInt(1);
                                                        String subject = rs.getString(2);
                                                        String date = rs.getString(5);
                                                        String time = rs.getString(6);
                                                        String message = rs.getString(3);
                                                        String recipient = rs.getString(4);
                                                        
                                                        out.println("<tr>");
                                                        out.println("<td>"+sno+"</td>");
                                                        out.println("<td>"+subject+"</td>");
                                                        out.println("<td>"+date+"</td>");
                                                        out.println("<td>"+time+"</td>");
                                                       out.println("<td>"+recipient+"</td>"); %>
                                                       <td><a class="click" href="modal_msg.jsp?id=<% out.println(id);%>">CLICK HERE</a></td>
                                                       <%
                                                           out.println("</tr>");
                                                      
                                                       i++; 
                                                    }  
                                                    

                                                    con.close();   

  %>
                                          
					  
						

</table>

      
</div>        
</article>           
</div> 
    </body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>
