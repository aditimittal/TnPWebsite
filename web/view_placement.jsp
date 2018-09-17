<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@include file="common_header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String company_name="";
    String year=  request.getParameter("year");
    String branch_code =  request.getParameter("branch");
    
   
    String dept_code =  request.getParameter("dept_code");
     
    String tod =  request.getParameter("tod");
    String db_name = "db_"+year;
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
    Statement st= conn.createStatement(); 
    Statement stmm= conn.createStatement(); 
    Statement s= conn.createStatement();
    Statement sb= conn.createStatement();
    Statement sd= conn.createStatement();
    Statement sc= conn.createStatement();
    Statement scc= conn.createStatement();  
  
%>
<html>
    <head>
       <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
 <title>IGDTUW</title>
        
        
        <style>
            table{
                width: 100%;
            }
        </style>
    </head>
    <body>
        
       <br>
<div class="boxborder">
    
    <div class='button'>
    <a href="#" class="tnpbtn" style="float:right;" id ="export" role='button'>Export Data as CSV
    </a>
    <h2 class="tnpheading">VIEW PLACEMENTS</h2>
    </div> 
    <br><br>  
    <div id = "dvData" style="overflow-x: auto;">

 <table>
 
<tr>
<th style="width: 80px" ><b>S No.</th>
<th style="width: 150px" ><b> ROLL NO. </th>
<th style="width: 150px" ><b> NAME </th>
<th style="width: 150px" > <b>COMPANY 1 </th>
<th style="width: 150px" > <b>PACKAGE</th>
<th style="width: 150px" > <b>COMPANY 2 </th>
<th style="width: 150px" > <b>PACKAGE</th>
<th style="width: 150px" > <b>COMPANY 3 </th>
<th style="width: 150px" > <b>PACKAGE</th>

</tr>
 
        
   
        
        
<%
    int i = 1;
%>
   
 <%  
      ResultSet rs=st.executeQuery("select * from undergraduatetable order by Enrollment_Number asc");
      String year_inroll ="";
      String br = "" , dp="";
      String company_id = ""; 
        
      while(rs.next()){
            
           
            String rollno = rs.getString("Enrollment_Number");
          //  year_inroll=  rs.getString("year");
            year_inroll=  rollno.substring(rollno.length() - 4);
                          
            br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6));
            dp= String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4));
            
            String name="";          
            if(year_inroll.equals(year) && br.equals(branch_code) && dp.equals(dept_code)){
           
            ResultSet rs3=stmm.executeQuery("select First_Name, Last_Name from personal_details where Enrollment_Number = '"+rollno+"'");
            
            while(rs3.next()){
             name = rs3.getString("First_Name");
            
            name = name + " " + rs3.getString("Last_Name");
            }
             out.println("<tr>");
             out.println("<td>"+i+"</td>");
             out.println("<td>"+rollno+"</td>");
             
             
             out.println("<td>"+name+"</td>");
             
            
          ResultSet rs1=stmm.executeQuery("select * from  placementrecord where Enrollment_Number = "+rollno+" and type='"+tod+"' "); 
           
         
          while (rs1.next())
           {
            
            company_id = rs1.getString("company_id");
            ResultSet rs5=sc.executeQuery("select * from  company_details  where company_id = '"+company_id+"' "); 
            
            if(rs5.next()){
            company_name = rs5.getString("company_name");   
            out.println("<td>"+company_name+"</td>");
            
            //String type = rs5.getString("type");
            String profile_offered = rs5.getString("profile");
            profile_offered = profile_offered.trim();
            profile_offered = profile_offered.toLowerCase();
        
        //  out.println(profile_offered);
            
            ResultSet rs6 =scc.executeQuery("select distinct(ctc_current_year) from company_details where company_name='"+company_name+"' and company_id = "+company_id+" and batch="+year+" and profile='"+profile_offered+"' ");
            while(rs6.next()){
            // out.println("hi");
            Integer package_name = rs6.getInt("ctc_current_year");
            out.println("<td>" +package_name+ "</td>"); 
            }
            
            
           // out.println("<td>"+type+"</td>"); 
            }
           
            
            }
                                                       
                       
            i++;
                       
  
                       
                       
 
                                                  
  
   out.println("</tr>");
           } 
  
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
                var outputFile = "placement_classwise";
                outputFile = outputFile.replace('.csv','') + '.csv' ;
                 
                // CSV
                exportTableToCSV.apply(this, [$('#dvData>table'), outputFile]);
                
                // IF CSV, don't do event.preventDefault() or return false
                // We actually need this to be a typical hyperlink
            });
        });
    </script>  
    </body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>