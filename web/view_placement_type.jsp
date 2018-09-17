<%-- 
    Document   : view_placement
    Created on : Jul 16, 2017, 10:09:50 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String company_name="";
    String year=  request.getParameter("year2");
    String branch =  request.getParameter("branch");
    String dept =  request.getParameter("dept");
    String tod =  request.getParameter("tod");
     
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
    Statement st= conn3.createStatement(); 
        
     Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementRecord","root",""); 
    Statement stmm= conn2.createStatement(); 
        
        
    String table_name = "student_"+year+branch+dept;
    String table_placement_name = "place_classwise"+year+branch+dept;
    //System.out.println(table_placement_name);
    table_name = table_name.toLowerCase();
    table_placement_name = table_placement_name .toLowerCase();
    
     
    
   ResultSet rs=st.executeQuery("select * from "+table_name+" order by enrollment_number asc");
%>
<html>
    <head>
       <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous">
        <title>IGDTUW</title>

        <script>
function DL1(elem){
alert("pk");
var row = document.getElementById(rowid);
for(i=0;i<row.children.length;i++) {
if(row.children[i]===elem) {
row.deleteCell(i);
row2=document.getElementById(rowid+1);
row2.appendChild(elem);

}

}

 </script>
        
        <style>
            th{
                border-bottom: 1px solid #ddd;
                background-color: #1E90FF;
                font-family: 'Helvetica', 'Arial', sans-serif;
                height: 3em;
                
            }
             
             
          

            </style>
    </head>
    <body>
        
        <a href="placement1.jsp">Add new Record </a>
        <br>
        
 <table id="tb"  class="table table-hover">
    
     
     <thead class="thead-inverse">
<tr>
<th style="width: 70px" ><b>S No.</th>
<th style="width: 130px" ><b> ROLL NO. </th>
<th style="width: 130px" > <b>COMPANY</th>
<th style="width: 130px" > <b>PACKAGE</th>
<th style="width: 150px"> <b> TYPE 1 OFFER </th>
<th style="width: 130px" > <b>COMPANY</th>
<th style="width: 130px" > <b>PACKAGE</th>
<th style="width: 150px"> <b> TYPE 2 OFFER </th>
<th style="width: 130px" > <b>COMPANY</th>
<th style="width: 130px" > <b>PACKAGE</th>
<th style="width: 150px"> <b> TYPE 3 OFFER </th>
<th 
</tr>
</thead>
<div class = "con">
 
<%
    int i = 1;
%>
   
 <%  
    int rowid = 1; 
  while(rs.next()){
            
            int id = rs.getInt(1);
            String rollno = rs.getString(3);
            String name = rs.getString(2);
            out.println(   "  <tr id=rowid> "   ) ;
            out.println("<td>"+i+"</td>");
            out.println("<td>"+rollno+"</td>");
            
            
            ResultSet rs1=stmm.executeQuery("select * from "+table_placement_name+" where enrollment_no = "+rollno+" and type='"+tod+"' "); 
           
           // ResultSet rs1=stmm.executeQuery("select * from "+table_placement_name+" where enrollment_no = "+rollno+" "); 
            while (rs1.next())
           {
            
            company_name = rs1.getString(2);
            out.println("<td onclick =\"DL1(this)\" >"+company_name+"</td>"); 
            String type = rs1.getString(4);
            Float package_name = rs1.getFloat(3);
            out.println("<td>"+package_name+"</td>"); 
            out.println("<td>"+type+"</td>");
            
           }
                                                        
            rowid++;          
            i++;
                       
  
                       

                       
 
                                                  
  
   out.println("</tr>");
  
  }  
con.close();    

  %> 

  

    </table>
  
  
    </body>
</html>
