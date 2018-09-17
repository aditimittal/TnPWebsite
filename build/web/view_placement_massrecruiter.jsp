<%-- 
    Document   : view_placement_percentage
    Created on : Nov 24, 2017, 8:54:36 PM
    Author     : Anjali
--%>
<%@page errorPage="ErrorPage.jsp"%>

<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.chart.labels.StandardPieSectionLabelGenerator"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Font"%>
<%@page import="org.jfree.chart.plot.PiePlot"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.jfree.chart.labels.PieSectionLabelGenerator"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
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
    String dept =  request.getParameter("dept");
    String tod =  request.getParameter("tod");
   
    
    
   
     
    String db_name = "db_" + year;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
    Statement s1= conn.createStatement();
    Statement s2= conn.createStatement(); 
    Statement s3= conn.createStatement(); 
    Statement s4= conn.createStatement(); 
    Statement s5= conn.createStatement(); 
   
        
    
    
   

 
%>
<html>
    <head>
       <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- Bootstrap CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
        <title>IGDTUW</title>
        
        
        <style>
             .tnpbtn a{ color:white;}
             *{
                 text-align: center;
             }
             .tnpbtn, .tnpbtn:hover{
                 margin: 0px 0px;
             }
             
          

            </style>
            
          
    </head>
    <body>
        
       
       
         <div class="boxborder" style="overflow-x:auto;">
        <div class="row">
    <h2 class="tnpheading col-sm-9">PLACEMENT- MASSRECRUITER </h2>

<a href="#" class="tnpbtn col-sm-3" style="float: right;" id ="export" role='button'>Export Data as CSV </a>

    </div>
       
        <br>
        <br>
<div id="dvData" > 
        <center>
 <table>
    
     
 <thead >
<tr>
   



<%
    
    // PRINT BRANCHES NAME AS TABLE COLUMN HEADERS
ResultSet rs1=  s1.executeQuery(" select * from branch_codes");
while(rs1.next()){
String br = rs1.getString("Branch_Name");
String dp = rs1.getString("Programme_Name");

dp = dp.toUpperCase();
br = br.toUpperCase();

String name = dp + " "+ br;
%>
<th style="width: 150px"> 
 <% out.println(name); %> </th>
 
<%
    }
rs1.close();
%>

  
<th style="width: 100px" > <b> Total Offers</th>  
</tr>
</thead>


<div class = "con">
 
<%
    
DefaultPieDataset piedataset = new DefaultPieDataset();
int flag=0;
ResultSet rs3=  s1.executeQuery(" select * from branch_codes"); 
out.println(   "<tr> "   ) ;
String com_id="";
String dp="";
int total = 0;
while(rs3.next()){    
// GET BRANCH AND PROGRAMME NAMES
    String br_code = rs3.getString("Branch_Code");
    String dp_na = rs3.getString("Programme_Name");
    String dp_code = "";
    
    ResultSet rs7=  s5.executeQuery(" select Programme_Code from programme_codes where Programme_Name = '"+dp_na+"'"); 
    while(rs7.next()){
       dp_code = rs7.getString("Programme_Code");
    }
    
   String br = rs3.getString("Branch_Name");
    
    
// FIND COUNT OF STUDENTS PLACED IN EACH BRANCH     
    ResultSet rs4=  s2.executeQuery(" select * from placementrecord where branch_code = '"+br_code+"' and programme_code = '"+dp_code+"' ");
    int  number =0;

    while(rs4.next()){
          
     com_id = rs4.getString("company_id");
     ResultSet rs5=  s3.executeQuery(" select company_type from company_details where company_id = '"+com_id+"' ");
     while(rs5.next()){
     String type = rs5.getString("company_type");
     type = type.trim();
     if(!type.equals("mass recruiter")){
         number++;
     }
     }
    }
    total = total+number;
    out.println("<td>"+ number +"</td>"); 

    ResultSet rs6=  s4.executeQuery(" select Programme_Name from programme_codes where Programme_Code='"+dp_code+"'");
     while(rs6.next()){
       dp = rs6.getString("Programme_Name");
    }

    dp = dp.toUpperCase();
    br = br.toUpperCase();

    String name = dp + " "+ br;

    
    
    //SET VALUES IN PIE CHART 
piedataset.setValue(name ,new Double(number));    
}
    
out.println("<td>"+ total +"</td>"); 
out.println("</tr>");          
           
           
          
  

int width = 640 ;
int height = 480;


if(piedataset.getItemCount()!=0){   
JFreeChart piechart=ChartFactory.createPieChart("Course Wise Without MassRecruiter Percentage " ,piedataset,true,true,false);
PiePlot plot = (PiePlot) piechart.getPlot();
PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1}", new DecimalFormat("0"), new DecimalFormat("0%"));
plot.setLabelGenerator(gen);

Font font = new Font(Font.SERIF,Font.BOLD,15);
piechart.getLegend().setItemFont(new Font(Font.SERIF,Font.BOLD,20));

String Piefile= "PieChart_"+"without_massrecruiter_Percentage"+year+".jpeg";
File PieChart= new File( "/home/vedi/Desktop/TnpFeb/web/images/"+Piefile ); 

ChartUtilities.saveChartAsJPEG( PieChart , piechart , width, height );
               
}else{
      out.println("ERROR :  NO ENTERIES FOR THESE DETAILS TO SHOW PIE CHARTS, PLEASE FILL DATABASE FIRST ");
}
conn.close();  
%> 

  

 </table>

        </center>
</div>

<article class="boxborder">
   
    <%
       if(piedataset.getItemCount()!=0 ){
    %>
    
  
<center> <IMG SRC="images/<% out.println("PieChart_without_massrecruiter_Percentage"+year+".jpeg") ; %>" WIDTH="640" HEIGHT="480" />  </center>
<% 
   }


%>

 </article>
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
<footer ><%@include file="footer2.jsp" %></footer>
