<%-- 
    Document   : placement
    Created on : Jul 11, 2017, 4:59:49 PM
    Author     : Anjali 
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
 <%@include file="connection.jsp" %>
 <%@include file="common_header.jsp" %>
 
 
 <%
     String dept="";
     String year=  request.getParameter("year2");
     String po =  request.getParameter("po");
     String branch =  request.getParameter("branch");
     String dept_db =  request.getParameter("dept");
     branch=branch.toLowerCase();
     branch=branch.trim();
     
     dept_db = dept_db.toLowerCase();
     dept_db = dept_db.trim();
     
     po=po.trim();
     
    
    
     String company =  request.getParameter("company_value");
     String tof =  request.getParameter("tof");
     tof=tof.trim();
     String db_name = "db_"+year;
   //  out.println(year);
     //out.println(company);
    // Class.forName("com.mysql.jdbc.Driver").newInstance();
     java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
     Statement st= conn.createStatement(); 
     Statement stmm= conn.createStatement(); 
     Statement sb= conn.createStatement(); 
     Statement sd= conn.createStatement(); 

     
     
    
     
                                                    
  %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
  
<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

th{
 font-size:1.2em;
font-family: 'Helvetica', 'Arial', sans-serif;
height: 3em;
                
}
tr{
font-size:1.2em;
}
                
            
</style>
</head>
    
    
<body>
    
<form type="input" method="post" action="classRecord_db.jsp"> 
    
<table class="table table-hover" >
<table class="table table-bordered" >
<table class="table table-striped" >
    
 <thead class="thead-inverse">
<tr>
<th style="width: 30px" ><b>S No.</th>
<th style="width: 200px" ><b> ENROLLMENT NO. </th>
<th style="width: 100px" > <b> NAME </th>
<th style="width: 100px" > <b> CHECKBOX</th>
</tr>
</thead>
 
 
<% 
  
 String branch_code ="" , dept_code=""; 
 
 
 ResultSet rs2=sb.executeQuery("select branch_code from Branch_codes where branch_name='"+branch+"'  ");
 while(rs2.next()){
    branch_code = rs2.getString("branch_code");
 }
 //out.println(branch_code);
 
 ResultSet rs4=sd.executeQuery("select programme_code from Programme_codes where programme_name ='"+dept_db+"'  ");
 while(rs4.next()){
    dept_code = rs4.getString("programme_code");
   
     
 }
 
 //out.println(dept_code);
 
 
String year_inroll="",br="" , dp="";
int i = 1;

ResultSet rs=st.executeQuery("select * from undergraduatetable order by Enrollment_Number asc");  
  while(rs.next()){
    String rollno = rs.getString("Enrollment_Number");
    year_inroll=  rollno.substring(rollno.length() - 4);                           
    br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6))  ;
    dp = String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4))  ;
                       
                       
    if(year_inroll.equals(year) && br.equals(branch_code) && dp.equals(dept_code)){
                         
        String name="";
        ResultSet rs3=stmm.executeQuery("select First_Name, Last_Name from personal_details where Enrollment_Number = '"+rollno+"'");
        while(rs3.next()){
             name="";
             name = rs3.getString("First_Name");
             name = name + " " + rs3.getString("Last_Name");
        }                              
                                                        
        out.println("<tr>");
        out.println("<td>"+i+"</td>");
        out.println("<td>"+rollno+"</td>");
        out.println("<td>"+name+"</td>"); 
%>
<td><input type="checkbox" name="checked_students" value = "<%out.println(rollno) ;%>"   /></td> 
<%
       
    i++;
 } 
  
   out.println("</tr>");
  
 }  
con.close();    
conn.close();

%> 
  
  

</table>
  
  
 
 <input type="hidden"  id="company"  name="company" value="<%out.println(company);%>">
 <input type="hidden"  id="branch"  name="branch" value="<%out.println(branch);%>">
 <input type="hidden"  id="year"  name="year" value="<%out.println(year);%>">
 <input type="hidden"  id="dept"  name="dept" value="<%out.println(dept_db);%>">
 <input type="hidden"  id="tof"  name="tof" value="<%out.println(tof);%>">
 <input type="hidden"  id="po"  name="po" value="<%out.println(po);%>">
  
  <br>
  <br>
 
  
<input type="submit">
</form>  
</body>
</html>
