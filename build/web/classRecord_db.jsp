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
    
String tof =   request.getParameter("tof"); 
tof=tof.trim();

String po=   request.getParameter("po"); 
po=po.trim();

char p = ' ';
 for(int u = 0 ; u < po.length();  u++)
   {
                    if(po.charAt(u) == '_')
                    
                       po = po.substring(0, u) + p + po.substring(u + 1);
   }
                   
                    


String company_name = request.getParameter("company");
String branch_db = request.getParameter("branch");
branch_db=branch_db.trim();

 
String year_db = request.getParameter("year");
year_db= year_db.trim();

String dept_db = request.getParameter("dept");













company_name = company_name.trim();

        
int ctc_last_year=0;
int ctc_current_year=0;
String db_name = "db_" + year_db;

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
Statement stmm= conn2.createStatement(); 
Statement s= conn2.createStatement(); 
Statement sb= conn2.createStatement(); 
Statement sd= conn2.createStatement(); 
Statement sc= conn2.createStatement(); 
Statement scc= conn2.createStatement(); 

int final_id=0 ;  
 int x = 0;    
String rollno , result="" , resul="";
String lang[]=request.getParameterValues("checked_students");
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 






//ResultSet rsp =st.executeQuery("select company_id from company_branch where   course = '"+branch_code+"' and department = '"+dept_code+"' ");



 
 
ResultSet rsp =sc.executeQuery("select company_id from company_branch where   course = '"+branch_db+"' and department = '"+dept_db+"' ");
while(rsp.next()){

int id =   rsp.getInt("company_id");

ResultSet rs= scc.executeQuery("select * from company_details where company_id = "+id+"  and company_name = '"+company_name+"'  ");
try{
if(rs.next())
{   
    
    final_id = id;
    ctc_last_year = rs.getInt("ctc_last_year");
    ctc_current_year = rs.getInt("ctc_current_year");   
    x=1;
}
}
catch(Exception e){
    result = "error : the company you selected is not there in company database !! first add it in company database";
}
}
       
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
    
if(x==1){
   int r = 0;          
            
try{  
    //stmm.executeUpdate("ALTER TABLE "+table_name+" ADD UNIQUE KEY `my_unique_key` (`enrollment_no`, `company_id` , `type`)") ;
    for(int i=0;i<lang.length;i++){
     rollno = lang[i];
     out.println(rollno);
     
  ResultSet rse = stmm.executeQuery("select count(*) as total from placementrecord where Enrollment_Number = '"+rollno+"' and type = '"+tof+"' ");
     
       while(rse.next()){
       r =rse.getInt("total");
     
     } 
 
    if(r<=2){
        
         
            int res = stmm.executeUpdate( "INSERT INTO placementrecord (Enrollment_Number, company_id , profile_offered,  type, year , branch_code , programme_code) values ( '"+rollno+"'  , "+final_id+" ,  '"+po+"'  , '"+tof+"', '"+year_db+"' , '"+branch_db+"' , '"+dept_db+"' )  "   ); 
            out.println(res);
            if(res<=0)
                out.println("This record already exists!");
       
            else{
                
                String user = (String)session.getAttribute("name");
                String content = "Placement Record Updated";
                String msg = "Records Updated for "+dept_db+" "+branch_db+" ("+ tof + ") for Company: "+company_name+" "+" Profile: "+po;
                insertLog(user, content, msg);
              //  response.sendRedirect("view_placementDb.jsp");
               response.sendRedirect("view_placement.jsp?year="+year_db+"&branch="+branch_db+"&dept="+dept_db+"&tod="+tof+"  ");
            } 
           }else{
             out.println("error ... cannot enter more than 3 enteries for this");
             out.println(rollno);
            } 
         
 }     //// end of for lopp     
 
}  //// end of try 


   catch(Exception e){
      out.println("error...<br>"+e);  
}
         
}
else{
    out.println("WRONG COMPANY DETAILS OR NO DATA TO INSERT, GO BACK ");
}
     %>
         
    </body>
</html>
