<%-- 
    Document   : classRecord_db
    Created on : Jul 13, 2017, 2:23:49 PM
    Author     : dell
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="InsertLogs.jsp" %>
<%@include file="connection.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page errorPage="ErrorPage.jsp"%>
 <%@page import="java.sql.Statement"%>



<%
    
String dept="";
String year=  request.getParameter("year");
String po =  request.getParameter("po");
String branch_code =  request.getParameter("branch");
String dept_code =  request.getParameter("dept");
String company =  request.getParameter("company");
String tof =  request.getParameter("tof");
String selected =  request.getParameter("selected");
 




// TRIMMING VALUES 

year = year.trim(); 
tof = tof.trim();
po = po.trim();
company = company.trim();


String db_name = "db_" + year;



int final_id= 0, x = 0;    
String rollno="";
if(selected.equals('1')){
    
String lang[]=request.getParameterValues("checked_students");







java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
Statement stmm= conn.createStatement(); 
Statement s= conn.createStatement(); 
Statement s1= conn.createStatement(); 



 




     
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<% 
    

try{  

 for(int i=0;i<lang.length;i++){
       
     rollno = lang[i];
     rollno = rollno.trim();
      
  
String sql1 = "delete from placementrecord where Enrollment_Number = '"+rollno+"'  and company_id =  "+company+" and profile_offered= '"+po+"'  and type='"+tof+"'  ; " ;

int res= stmm.executeUpdate( sql1  ); 
if(res<=0)
   out.println("This record does not exist!");
else
    response.sendRedirect("view_placement.jsp?year="+year+"&branch="+branch_code+"&dept="+dept_code+"&tod="+tof+"  ");
                
          
         
 }         
 
}catch(Exception e){
      out.println("error...<br>"+e);  
}
         



conn.close();

} else {
%>

<p> YOU DID NOT SELECT ANYTHING , GO BACK AND SELECT SOME STUDENT </p>

<%
}



%>

 
         
    </body>
</html>
