<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style_one.css">
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 80%;
    table-layout: fixed;
    margin-left:100px;
    
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    overflow: hidden;
    word-wrap:break-word;
}

tr:nth-child(even) {
    background-color: #AAEE80 ;
}



</style>
</head>


<body>
<br/>


<div class="container">
            <header>
                <div class="image">

                    <img class="logo" src="images/logo.jpg" alt="logo"> 
                </div>
                <h2 style="font-family: 'Helvetica', 'Arial', safont-familyns-serif;font-size:32px; color:green;text-align:center;padding:0;margin:0;"> TRAINING  AND  PLACEMENT  CELL </h2>

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
                        <li><a href="screen_admin_logs.jsp">LOGS</a></li>
                        <li><a href="screen_admin_rights.jsp">ADMIN RIGHTS</a></li>
                        <li><a href="screen_admin_deadlines.jsp">SET DEADLINES</a></li>
                    </ul>
                </nav>
            </header>
    
    <br>
    <br>
    <br>
    <br>
    
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<%

Class.forName("com.mysql.jdbc.Driver");
  java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
Statement st= con.createStatement(); 
String rm = "select * from notifications order by id desc";
                    ResultSet rs=st.executeQuery(rm);
%>
<br>
<br>
<br>

<table>
<tr>
<td style="width: 20px" ><b>S No.</td>
<td style="width: 200px" ><b> Notice </td>
<td style="width: 100px" > <b> Date and time of Upload</td>
<td style="width: 50px" > <b> Download</td>
</tr>

<%
int i=0;
while(rs.next())
{

i++;%>
<tr>
<td style="width: 20px" >
<%
out.println(i);
%>
</td>
<td style="width: 200px" >
<%
out.println(rs.getString(2));
%>
</td>
<td style="width: 100px" >
<%
out.println(rs.getString(3));
%>
</td>
<td>
<%
 
byte[] b=rs.getBytes("pdf");
if(b!=null)
{
%>

<a href="<%=request.getContextPath()%>/noticeread?id=<%=rs.getString(1)%>" target="_blank">pdf </a>
<%}
//out.println("pdf");
else
out.println("-");

%>
</td>
</tr>

<%
}
rs.close();

%>


</table>
    


</body>
</html>