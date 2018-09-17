
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<%-- 
    Document   : placement
    Created on : Jul 11, 2017, 4:59:49 PM
    Author     : Anjali 
--%>
 
 
 <%
     String dept="";
     String year=  request.getParameter("year");
     String po =  request.getParameter("po");
     String branch_code =  request.getParameter("branch");
     String dept_code =  request.getParameter("dept");
     String company =  request.getParameter("com");
     String tof =  request.getParameter("tod");
     
    
     po = po.toLowerCase();
    
     po=po.trim();
     tof=tof.trim();
     
    
    
     
      char p = ' ';
      for(int u = 0 ; u < po.length();  u++)
      {
        if(po.charAt(u) == '_')
            po = po.substring(0, u) + p + po.substring(u + 1);
       }
                   
    
     
     
     
    
     
     String db_name = "db_"+year;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
     Statement stmm= conn.createStatement(); 
     Statement stm= conn.createStatement();
     Statement s1= conn.createStatement();
     
     
      
ResultSet rs=stm.executeQuery("select * from placementrecord where company_id = "+company+" and type='"+tof+"' and profile_offered = '"+po+"'");
     
                                                    
  %>

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

    
   
<body>
    
  


 <form type="input" method="post" action="delete_classrecord.jsp">  
<div class="container">
<article class="boxborder">
<div style="overflow-x:auto;">
 <table>
 
       
<tr>
<th style="width: 30px" ><b>S No.</th>
<th style="width: 200px" ><b> ENROLLMENT NO. </th>
<th style="width: 100px" > <b> NAME </th>
<th style="width: 100px" > <b> CHECKBOX</th>
</tr>

   

 
 
<%
   
  
 
int selected = 1;
 
 
 String year_inroll="";
     String br="" , dp="";
      int i = 1;
      int flag = 0;
  while(rs.next()){
                      String rollno = rs.getString("Enrollment_Number");
                      flag = 1;
                       
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
                       <td><input type="checkbox" name="checked_students" value = "<% out.println(rollno) ;%>"   /></td> 
                       
                       

                       

                       
 
                                                  
  <%
     i++;
     } 
  
   out.println("</tr>");
  
  }  

if(flag == 0 ) {
%>


 <p> NO DATA TO SHOW !! </p>
 
 <% 
      selected = 0;
     }
conn.close();

  %> 
  
  
 
    </table>
</div>
</article>
</div>
  
 
 <input type="hidden"  id="company"  name="company" value="<%out.println(company);%>">
  <input type="hidden"  id="branch"  name="branch" value="<%out.println(branch_code);%>">
  <input type="hidden"  id="year"  name="year" value="<%out.println(year);%>">
  <input type="hidden"  id="dept"  name="dept" value="<%out.println(dept_code);%>">
  <input type="hidden"  id="tof"  name="tof" value="<%out.println(tof);%>">
  <input type="hidden"  id="po"  name="po" value="<%out.println(po);%>">
  <input type="hidden"  id="selected"  name="selected" value="<%out.println(selected);%>">
  
  <br>
  <br>
 
  <center><input type="submit" class="tnpbtn"></center>
  </form>  
</body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>