<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<%@include file="common_header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
        <title> TnP | IGDTUW </title>
	
	
	
</head>

	

	


	

    </head>
    <body>
       
       
	
        
       
             
             
   <% /************************CTC Filter*************************************************************/
	
String year =  request.getParameter("year");
String db_name = "db_"+year;
  // out.println(year); 
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
   
    
DefaultPieDataset CTCdataset=new DefaultPieDataset();
Statement stmt= con.createStatement();  
try{
   
ResultSet CTCBelow5=stmt.executeQuery("select count(ctc_current_year) from company_details where ctc_current_year>0 and ctc_current_year<=500000 ");
if(CTCBelow5.next()){
    //out.println(CTCBelow5.getInt(1));
CTCdataset.setValue("0-5 LPA",new Integer(CTCBelow5.getInt(1)));
}

CTCBelow5.close();

ResultSet CTC5and10=stmt.executeQuery("Select count(ctc_current_year) from  company_details where ctc_current_year>500000 and ctc_current_year<=1000000   ");
if(CTC5and10.next()){ 
    //out.println(CTC5and10.getInt(1));
CTCdataset.setValue("5-10 LPA",new Integer(CTC5and10.getInt(1)));
}
CTC5and10.close();


ResultSet CTC10and15=stmt.executeQuery("Select count(ctc_current_year) from company_details where ctc_current_year>1000000 and ctc_current_year<=1500000   "); 
if(CTC10and15.next()){
   //  out.println(CTC10and15.getInt(1));
CTCdataset.setValue("10-15 LPA",new Integer(CTC10and15.getInt(1)));
} 
CTC10and15.close();



ResultSet CTCabove15=stmt.executeQuery("Select count(ctc_current_year) from company_details where ctc_current_year>1500000  "); 
if(CTCabove15.next()){
   //  out.println(CTCabove15.getInt(1));
CTCdataset.setValue("Above 15 LPA",new Integer(CTCabove15.getInt(1)));
}
CTCabove15.close();

}catch(Exception error){System.out.println(error);}
con.close();
//
if(CTCdataset.getItemCount()!=0){ 
   // out.println("hi");
//JFreeChart piechart=ChartFactory.createPieChart("CTC Analysis in %",CTCdataset,true,true,false);
//PiePlot plot = (PiePlot) piechart.getPlot();
//PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1}", new DecimalFormat("0.0%"), new DecimalFormat("0%"));
//plot.setLabelGenerator(gen);
//piechart.getLegend().setItemFont(new Font(Font.SERIF,Font.BOLD,20));
//plot.setSectionPaint("Above 15 LPA", Color.black);
//Font font = new Font(Font.SERIF,Font.BOLD,15);
//plot.setLabelFont(font);

JFreeChart piechart=ChartFactory.createPieChart("CTC Analysis in %" , CTCdataset,true,true,false);
PiePlot plot = (PiePlot) piechart.getPlot();
PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1}", new DecimalFormat("0"), new DecimalFormat("0%"));
plot.setLabelGenerator(gen);

Font font = new Font(Font.SERIF,Font.BOLD,15);
piechart .getLegend().setItemFont(new Font(Font.SERIF,Font.BOLD,20));
String CTCfilename="ctc_variation" + year+ ".jpeg";
File PieChart= new File( "/home/vedi/Desktop/TnpFeb/web/images/"+CTCfilename ); 


       // int width = 64 0;    
       // int height = 480;       
 ChartUtilities.saveChartAsJPEG( PieChart , piechart , 640 , 480 ); 
 //out.println("bi");
 }  %>  
 
 
 
 
 
 <br>
 <br>
 <br>
 <br>

 <br>
 
 <article class="box_notif1">
     <%
         if(CTCdataset.getItemCount()!=0){ 
             
       %>
   
     <center> <IMG SRC=images/<% out.println("ctc_variation"+year+".jpeg") ; %> WIDTH="640" HEIGHT="480" />  </center>
     <% 
         }
else {


      %> 
     <p> NO DATA TO DISPLAY </P>
     
     <% }%>
    
     
     
 </article>
           
          
            
            
      

      
       
        
            
    </body>  
</html>
