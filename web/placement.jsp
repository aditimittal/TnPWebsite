<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%-- 
    Document   : placement
    Created on : Jul 11, 2017, 4:59:49 PM
    Author     : Anjali 
--%>
 <%@page errorPage="ErrorPage.jsp"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
 

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
  
 
<style>
    table {
        width:100%;
    }   

</style>
</head>
    
    
  

<%
    
     String dept="";
     String year=  request.getParameter("year");
     String po =  request.getParameter("po");
     String branch =  request.getParameter("branch");
     String dept_db =  request.getParameter("dept");
     String company =  request.getParameter("com");
     String tof =  request.getParameter("tod");
     
     
      po=po.trim();
      tof=tof.trim();
      
      
     String db_name = "db_"+year;
   
     java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
     Statement st= conn.createStatement(); 
     Statement stmm= conn.createStatement(); 
     Statement sb= conn.createStatement(); 
     Statement sd= conn.createStatement(); 

    
    
     
                                                    
  %>
    
   
<body>

<form type="input" method="post" action="classRecord_db.jsp">    
<div class="container">
<article class="boxborder">
<div style="overflow-x:auto;">
<table>

    
<tr>
<th  ><b><center>S No.</center></th>
<th <b><center> ENROLLMENT NO. </center></th>
<th  > <b><center> NAME </center></th>
<th  > <b><center> CHECKBOX </center></th>
</tr>

  

 
 
<%
   

String year_inroll="",br="" , dp="";
int i = 1;
int flag =0;

ResultSet rs=st.executeQuery("select * from undergraduatetable order by Enrollment_Number asc");  

while(rs.next()){
      
  
      flag =1;
      
    String rollno = rs.getString("Enrollment_Number");
    year_inroll=  rollno.substring(rollno.length() - 4);                           
    br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6))  ;
    dp = String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4))  ;
                       
                       
    if(year_inroll.equals(year) && br.equals(branch) && dp.equals(dept_db)){
                         
        String name="";
        try{
        ResultSet rs3=stmm.executeQuery("select First_Name, Last_Name from personal_details where Enrollment_Number = '"+rollno+"'");
        while(rs3.next()){
             name="";
             name = rs3.getString("First_Name");
             name = name + " " + rs3.getString("Last_Name");
        } 
        }
        catch(Exception e)
        {
             response.getWriter().println(e);
            
        }
                                                        
        out.println("<tr>");
        out.println("<td>"+i+"</td>");
        out.println("<td>"+rollno+"</td>");
        out.println("<td>"+name+"</td>"); 

%>
 <td><input type="checkbox" name="checked_students" value = "<  %out.println(rollno) ;%>"   /></td>  
<%
       
   i++;
 } 
  
   out.println("</tr>"); 
  
 } 


//con.close();    
conn.close();


%>

<%
   if(flag ==0 ) {
 %>
 <p> NO DATA TO SHOW !! </p>
 
<%}
%>

 
</table>
</div>
</article>
</div>

  
  
 
 <input type="hidden"  id="company"  name="company" value="<%out.println(company);%>">
 <input type="hidden"  id="branch"  name="branch" value="<%out.println(branch);%>">
 <input type="hidden"  id="year"  name="year" value="<%out.println(year);%>">
 <input type="hidden"  id="dept"  name="dept" value="<%out.println(dept_db);%>">
 <input type="hidden"  id="tof"  name="tof" value="<%out.println(tof);%>">
 <input type="hidden"  id="po"  name="po" value="<%out.println(po);%>">
  
 <br>
 <br>
 <center><input type="submit" class="tnpbtn"></center>
 
 
</form>  
</article>
</body>
</html>

<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>