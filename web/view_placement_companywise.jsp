<%-- 
    Document   : view_placement
    Created on : Jul 16, 2017, 10:09:50 PM
    Author     : ANJALI
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String company_name="";
    String year=  request.getParameter("year");
    String dept_db =  request.getParameter("dept");
    String tod =  request.getParameter("tod");
   
   
  
     
    
     
    String db_name = "db_" + year;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    try{
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
    } catch(Exception e){
     System.out.println("e" + e);
}
    Statement s1= conn.createStatement(); 
    Statement s2= conn.createStatement();
    Statement s3= conn.createStatement(); 
    Statement s4= conn.createStatement();  
    Statement s5= conn.createStatement();  
    Statement s6= conn.createStatement(); 
    Statement s7= conn.createStatement(); 
    Statement s8= conn.createStatement(); 
%>
<html>  
    <head>
       <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
        <title>IGDTUW</title>
        <style>
            table{
                width:100%;
            }
        </style>
    </head>
    <body>
        
        
       
<br>
<div class="boxborder">
<div class="row">
    <h2 class="tnpheading col-sm-7" align="center">PLACEMENT - COMPANYWISE </h2>
    <div class="button col-sm-4"><a href="#" class="tnpbtn" style="float: right;" id="export" role="button">Export Data as CSV </a></div>
</div>
    <br><br>
<div id="dvData" style="overflow-x: auto;">
<table>
<tr>
   
<th style="width: 70px" ><b>S No.</th>
<th style="width: 100px" ><b> DATE OF VISIT </th>
<th style="width: 100px" > <b>COMPANY</th>
<th style="width: 100px" > <b>PROFILE OFFERED</th>
<th style="width: 100px"> <b> STUDENT POC</th>
<th style="width: 100px" > <b> CTC </th>
<th style="width: 150px"> <b> ELIGIBLE BRANCHES </th>
 <%
     
try{
ResultSet rs7=  s7.executeQuery(" select * from Branch_Codes");
while(rs7.next()){
String br = rs7.getString("Branch_Name");
String d = rs7.getString("Programme_Code");
String dp="";
ResultSet rs8=  s8.executeQuery(" select * from Programme_Codes where Programme_Code='"+d+"'");
while(rs8.next()){
     dp = rs8.getString("Programme_Name");
}
dp = dp.toUpperCase();
br = br.toUpperCase();
String name = dp + " "+ br;
%>
<th style="width: 80px"> 
 <% out.println(name); %> </th>
 

<%
    }
%>


  
<th style="width: 100px" > <b> Total Offers</th>  
</tr>
</thead>


<div class = "con">
 
<%
    int i = 1;
    int rowid=1;
   
   
//for(String com : hs ){
       
   ResultSet rs1=s1.executeQuery("select * from company_details  ");
   String  pro_off="" , com="",  student_poc="", eligible="" ,date=""  , com_id="" , dept_code="" , branch_code="" , branch_name="" , dept_name = ""; 
   int ctc=0, stipend=0;
   
   while(rs1.next()){
       
    student_poc = rs1.getString("student_poc");
    ctc = rs1.getInt("ctc_current_year");
    com_id = rs1.getString("company_id");
    com = rs1.getString("company_name");
   
    pro_off =  rs1.getString("profile");
    date= rs1.getString("visit_date");
  
    String branches="";
  
ResultSet rs2=  s2.executeQuery(" select course , department from company_branch where company_id = '"+com_id+"'  ");
  
while(rs2.next()) {
       
branch_code = rs2.getString("course");
dept_code = rs2.getString("department");
 /* 
ResultSet rs2=s.executeQuery("select branch , program  from course_codes where branch_code='"+branch_code+"' and program_code= '"+dept_code+"' ");
while(rs2.next()){
     branch_name = rs2.getString("branch");
     dept_name = rs2.getString("program");
    
 }
   */
 ResultSet rs3=s3.executeQuery("select Branch_Name from Branch_Codes where Branch_Code='"+branch_code+"'  ");
 while(rs3.next()){
    branch_name = rs3.getString("Branch_Name");
 }
 
 
 ResultSet rs4=s4.executeQuery("select Programme_Name from Programme_Codes where Programme_Code ='"+dept_code+"'  ");
 while(rs4.next()){
    dept_name = rs4.getString("Programme_Name");
   
     
 }
    
 
branches = dept_name+"-"+ branch_name + " " + branches;
 
}
     
      out.println(   "<tr id=rowid> "   ) ; 
      out.println("<td>"+i+"</td>");
      out.println("<td>"+date+"</td>");
      out.println("<td>"+com+"</td>");
      out.println("<td>"+pro_off+"</td>");
      out.println("<td>"+student_poc+"</td>");
      out.println("<td>"+ctc+"</td>");
      out.println("<td>"+branches+"</td>");
 
    
       
  /*  
try 
{
           
 ResultSet rs8=  stmm.executeQuery(" select (Enrollment_Number) from placementrecord where company_id = '"+com_id+"' and year='"+year+"' ");
 String rollno="" , branch_cod="", dept_cod="" ;
 int btechcse=0 , btechit=0 , btechece=0, btechmae=0 , mtechit=0 , mtechcse=0 , mtechece=0, mtechmae=0, mca=0, total_offers=0; 
           
while(rs8.next()) {
                    
    rollno=rs8.getString(1);
    dept_cod = String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4));
    branch_cod = String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6));
                 
              
    if(dept_cod.equals("01")){
            if(branch_cod.equals("01"))
                     btechcse++;
                 if(branch_cod.equals("02"))
                     btechece++;
                 if(branch_cod.equals("03")){
                  
                     btechit++;
                 }
                 if(branch_cod.equals("04"))
                     btechmae++;
                } else if(dept_cod.equals("02")){
                    
                 if(branch_cod.equals("01"))
                     mtechcse++;
                 if(branch_cod.equals("02"))
                     mtechece++;
                 if(branch_cod.equals("03"))
                     mtechit++;
                 if(branch_cod.equals("04"))
                     mtechmae++;
                } else if(dept_code.equals("04")){
                    mca++;
                }
                 
                 total_offers= btechcse+btechmae+btechit+btechece+mtechece+mtechcse+mtechit+mtechmae+mca;
                 
                }
                out.println("<td>"+ btechcse+"</td>");
                out.println("<td>"+ btechit+"</td>");
                out.println("<td>"+ btechece+"</td>");
                out.println("<td>"+ btechmae+"</td>");
                out.println("<td>"+ mtechcse+"</td>");
                out.println("<td>"+ mtechece+"</td>");
                out.println("<td>"+ mtechit+"</td>");
                out.println("<td>"+ mtechmae+"</td>");
                 out.println("<td>"+ mca+"</td>");
                out.println("<td>"+ total_offers +"</td>");
                
            }
        
        catch (SQLException e) {
                 e.printStackTrace();
              } 
        */
  
  int tot =0;
   ResultSet rs5=  s5.executeQuery(" select * from branch_codes");
   while(rs5.next()){
       String br_code = rs5.getString("branch_code");
       String dp_code = rs5.getString("programme_code");
       
       ResultSet rs6=  s6.executeQuery(" select count(distinct( Enrollment_number)) from placementrecord where branch_code = '"+br_code+"' and programme_code = '"+dp_code+"' and company_id = '"+com_id+"'");
       while(rs6.next()){
           
           int number = rs6.getInt(1);
           tot = tot+number;
           out.println("<td>"+ number +"</td>");
           
           
       }       
     
      }
    
    
     
     
     out.println("<td>"+ tot +"</td>");
     rowid++;              
     i++;
     out.println("</tr>"); 
       
     }   /// end of for lopp
   
  
}
catch(Exception e){
 System.out.println("e" + e);
}
conn.close();
  %> 

  

    </table>
  
</div>
</div>
  
  <script type='text/javascript' src='https://code.jquery.com/jquery-1.11.0.min.js'></script>
       
        <script type='text/javascript'>
        $(document).ready(function () {
         
            function exportTableToCSV($table, filename) {
                var $headers = $table.find('tr:has(th)')
                    ,$rows = $table.find('tr:has(td)')
                    // Temporary delimiter characters unlikely to be typed by keyboard
                    // This is to avoid accidentally splitting the actual contents
                    ,tmpColDelim = String.fromCharCode(11) // vertical tab character
                    ,tmpRowDelim = String.fromCharCode(0) // null character
                    // actual delimiter characters for CSV format
                    ,colDelim = '","'
                    ,rowDelim = '"\r\n"';
                    // Grab text from table into CSV formatted string
                    var csv = '"';
                    csv += formatRows($headers.map(grabRow));
                    csv += rowDelim;
                    csv += formatRows($rows.map(grabRow)) + '"';
                    // Data URI
                    var csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);
                $(this)
                    .attr({
                    'download': filename
                        ,'href': csvData
                        //,'target' : '_blank' //if you want it to open in a new window
                });
                //------------------------------------------------------------
                // Helper Functions 
                //------------------------------------------------------------
                // Format the output so it has the appropriate delimiters
                function formatRows(rows){
                    return rows.get().join(tmpRowDelim)
                        .split(tmpRowDelim).join(rowDelim)
                        .split(tmpColDelim).join(colDelim);
                }
                // Grab and format a row from the table
                function grabRow(i,row){
                     
                    var $row = $(row);
                    //for some reason $cols = $row.find('td') || $row.find('th') won't work...
                    var $cols = $row.find('td'); 
                    if(!$cols.length) $cols = $row.find('th');  
                    return $cols.map(grabCol)
                                .get().join(tmpColDelim);
                }
                // Grab and format a column from the table 
                function grabCol(j,col){
                    var $col = $(col),
                        $text = $col.text();
                    return $text.replace('"', '""'); // escape double quotes
                }
            }
            // This must be a hyperlink
            $("#export").click(function (event) {
                // var outputFile = 'export'
                var outputFile = "placement_companywise";
                outputFile = outputFile.replace('.csv','') + '.csv'
                 
                // CSV
                exportTableToCSV.apply(this, [$('#dvData>table'), outputFile]);
                
                // IF CSV, don't do event.preventDefault() or return false
                // We actually need this to be a typical hyperlink
            });
        });
    </script>
  
  
  
    </body>
</html>