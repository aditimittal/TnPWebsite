<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.title.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>
<%@ page  import="java.text.DecimalFormat"%>
<%@ page  import="org.jfree.ui.*"%>
<%@ page import="org.jfree.data.xy.XYSeries"%>
<%@ page import="org.jfree.data.xy.XYSeriesCollection"%>
<%@ page import="org.jfree.chart.renderer.xy.XYLineAndShapeRenderer"%>
<%@ page import="org.jfree.chart.axis.NumberAxis"%>
<%-- 
    Document   : view_placement
    Created on : Jul 16, 2017, 10:09:50 PM
    Author     : dell
--%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@include file="common_header.jsp" %>


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
    Statement s6= conn.createStatement(); 
%>
<html>
   <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">

        <title>IGDTUW</title>
        
        
        <style>

            .tnpbtn, .tnpbtn:hover{
                margin: 0px 0px;
                
            }
        </style>
    </head>
    <body>
        
        
<div class="boxborder" style="overflow-x: auto;">
    <div class="row">
    <h2 class="tnpheading col-sm-9">PLACEMENT- PERCENTAGE </h2>

<a href="#" class="tnpbtn col-sm-3" style="float: right;" id ="export" role='button'>Export Data as CSV </a>

    </div>
      <br>
<div id="dvData" >       
    <center>    
 <table>
 <tr>
   

<% 
    try{
ResultSet rs1=  s1.executeQuery(" select * from branch_codes");
while(rs1.next()){
String br = rs1.getString("Branch_Name");
String d = rs1.getString("Programme_Name");
d = d.toUpperCase();
br = br.toUpperCase();
String name = d + " "+ br;
%>
<th style="width: 150px"> 
 <% out.println(name); %> </th>
 

<%
    }
rs1.close();
}
catch(Exception e){
out.println(e);
}
%>
<th style="width: 150px" > <b> Total Offers</th>  

</tr>



<div class = "con">
 
<%
DefaultPieDataset piedataset = new DefaultPieDataset();        
try {
Double tot =0.0;
Double tot_br = 0.0;
ResultSet rs3=  s1.executeQuery(" select * from branch_codes"); 
 out.println(   "<tr> "   ) ;
while(rs3.next()){
    
// GET BRANCH AND PROGRAMME NAMES
    String br_code = rs3.getString("Branch_Code");
    String dp_name = rs3.getString("Programme_Name");
    String br = rs3.getString("Branch_Name");
    
    String dp_code = "";
    
    ResultSet rs9 = s2.executeQuery("select Programme_Code from programme_codes where Programme_Name = '"+dp_name+"' ");
    
    while(rs9.next())
    {
     dp_code = rs9.getString("Programme_Code");  
    } 
   
    
    
// FIND COUNT OF STUDENTS PLACED IN EACH BRANCH    
ResultSet rs4=  s6.executeQuery(" select count(distinct( Enrollment_Number)) from placementrecord where Branch_Code = '"+br_code+"' and Programme_Code = '"+dp_code+"' ");
Double number =0.0;
    while(rs4.next()){
          
           number = rs4.getDouble(1);
           tot = tot+number;
          
      } 
    
   
    Double total_br=0.0;
    
 // FIND TOTAL NUMBER OF STUDENTS IN EACH BRANCH   
    ResultSet rs5 = s3.executeQuery("select distinct Enrollment_Number from undergraduatetable");
    while(rs5.next()){
        String rollno=rs5.getString(1);
        String year_inroll=  rollno.substring(rollno.length() - 4);  
        String branch_code = String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6));
        String dept_code = String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4));
         
        if(year_inroll.equals(year) && branch_code.equals(br_code) && dept_code.equals(dp_code))
        {
            total_br++;
            tot_br++;
        }
       
    } 
// FIND PERCENTAGE 
   
       Double per=0.0;
    
        if(total_br==0.0)
            per=0.0;
        else 
            per = (number/total_br)*100;
        
      
       out.println("<td>"+ per +"</td>"); 
     
       
      
// FIND ROGRAMME NAMES AGAIN      
   
String dp="";
ResultSet rs7=  s5.executeQuery(" select Programme_Name from programme_codes where Programme_Code='"+dp_code+"'");
while(rs7.next()){
     dp = rs7.getString("Programme_Name");
     
}
dp = dp.toUpperCase();
br = br.toUpperCase();
String name = dp + " "+ br;
// SET VALUES IN PIE CHART 
piedataset.setValue(name ,new Double(per));    
}
 //FIND TOTAL PERCENTAGE
Double tot_per = 0.0;
if(tot_br ==0)
    tot_per = 0.0;
else 
 tot_per= (tot/tot_br)*100;
out.println("<td>"+ tot_per +"</td>"); 
// END THE ROW 
out.println("</tr>");    
// PIE CHART DETAILS 
int width = 640 ;
int height = 480;
if(piedataset.getItemCount()!=0){   
JFreeChart piechart=ChartFactory.createPieChart("Course Wise Placement Percentage " ,piedataset,true,true,false);
PiePlot plot = (PiePlot) piechart.getPlot();
PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1}", new DecimalFormat("0"), new DecimalFormat("0%"));
plot.setLabelGenerator(gen);
Font font = new Font(Font.SERIF,Font.BOLD,15);
piechart.getLegend().setItemFont(new Font(Font.SERIF,Font.BOLD,20));
String Piefile= "PieChart_"+"Placement_Percentage"+year+".jpeg";
File PieChart= new File( "/home/vedi/Desktop/TnpFeb/web/images/"+Piefile ); 
ChartUtilities.saveChartAsJPEG( PieChart , piechart , width, height );
} else{
     out.println("ERROR :  NO ENTERIES FOR THESE DETAILS TO SHOW PIE CHARTS, PLEASE FILL DATABASE FIRST ");
}
// end of the try
}catch (SQLException e) {
       e.printStackTrace();
 } 
                
        
  
conn.close();
  
%> 

  
 </table></center>
</div>
<br>
<article >
   
  <%
if(piedataset.getItemCount()!=0){
   
%>     
	  
 <center> <IMG SRC="images/<% out.println("PieChart_Placement_Percentage"+year+".jpeg") ; %>" WIDTH="640" HEIGHT="480" />  </center>
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