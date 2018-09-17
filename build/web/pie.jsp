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
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
       <link rel="stylesheet" type="text/css"  href="css/commonCSS.css">
        <title> TnP | IGDTUW </title>
	
    </hea></head>
    <body>
       
 
    
<%   
     String year=  request.getParameter("year");
     String db_name = "db_"+year;
     String branch_code=  request.getParameter("branch");
     String dept_code=  request.getParameter("dept");
    
     //out.println(dept_code);
     //out.println(branch_code);
    java.sql.Connection con1 = null; 
   try{
     con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"","root",""); 
   }
   catch(Exception e){
       out.println("No database with this year");
        out.println("error....<br>"+e);
   }
    Statement stm= con1.createStatement();  
    Statement stmm= con1.createStatement();
    Statement sb= con1.createStatement();
    Statement sd= con1.createStatement();
    Statement stmt= con1.createStatement();  
    Statement st= con1.createStatement();  
      
    
    
   String dept_db = "" , branch = "" ;
 try{
 ResultSet rs=sb.executeQuery("select Branch_Name from branch_codes where Branch_Code ='"+branch_code+"'  ");
 while(rs.next()){
    branch = rs.getString("Branch_Name");
 }
 
 
 ResultSet rs4=sd.executeQuery("select Programme_Name from programme_codes where Programme_Code ='"+dept_code+"'  ");
 while(rs4.next()){
    dept_db = rs4.getString("Programme_Name");
   
     
 }
 
 }
 catch(Exception e){
     out.println(e);
 }
 //out.println(dept_db);
 
 String  branchName= dept_db + "_" + branch+year;
    
			int totalStudents=0;
                        String Piefile="";
			int placed=0;
			DefaultCategoryDataset companywisePackagedataset=new DefaultCategoryDataset();
			
                       
			ResultSet rs2=stm.executeQuery("SELECT  Enrollment_Number FROM undergraduatetable");
                        
		   try{ 
                      String year_inroll ="";
                      String br = "";
                      String dp = "";
                      
                      while(rs2.next()){
            
            
                      String rollno = rs2.getString("Enrollment_Number");
                      year_inroll=  rollno.substring(rollno.length() - 4);                           
                           
                      br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6))  ;
                      dp = String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4))  ;
                       
                      if(year_inroll.equals(year) && branch_code.equals(br) && dept_code.equals(dp) ){
                        //  out.println(rollno);
                            totalStudents++;
		         }
                      
                      } 
                   }catch(Exception totalexp){}

	ResultSet company_data=stmt.executeQuery(" SELECT Distinct company_id FROM company_details  ");
	
	
        ArrayList<Integer> companies = new ArrayList<Integer>();
   
	try{  
            while(company_data.next()){
               int comp = company_data.getInt(1);
              
                 companies.add(comp);
           }
             company_data.close();
           }catch(Exception offer){}
try{
ResultSet placedStudents= stm.executeQuery("Select distinct(Enrollment_Number) from placementrecord    ");


                      String year_inroll ="";
                      String br = "";
                      String dp = "";
                      placed=0;
                      while(placedStudents.next()){
            
                        
                      String rollno = placedStudents.getString(1);
                   
                      year_inroll=  rollno.substring(rollno.length() - 4);                           
                           
                      br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6))  ;
                      dp= String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4))  ;
                      
                      
                      
                      
                      
                      if(year_inroll.equals(year) && br.equals(branch_code) && dp.equals(dept_code) )
                      {
                         
                           placed++;
		      } 
                      } 
	             }catch(Exception totalexp){}
	

DefaultPieDataset piedataset = new DefaultPieDataset();
for(int name:companies){
try{
    //out.println(name);
ResultSet freq=stm.executeQuery("Select distinct Enrollment_Number FROM placementrecord where company_id="+name+" ");

                      String year_inroll ="";
                      String br = "";
                      String dp = "";
                      int x = 0 ;
                      while(freq.next()){
            
            
                      String rollno = freq.getString("Enrollment_Number");
                      //out.println(rollno);
                       //out.println(name);
                      
                      year_inroll=  rollno.substring(rollno.length() - 4);                           
                           
                      br= String.valueOf(rollno.charAt(5)) + String.valueOf(rollno.charAt(6))  ;
                      dp= String.valueOf(rollno.charAt(3)) + String.valueOf(rollno.charAt(4))  ;
                       
                      if(year_inroll.equals(year) && br.equals(branch_code)  && dp.equals(dept_code)){
                           x++;
		      }
                      } 
                    
                     
                 ResultSet nm=   st.executeQuery( "select company_name from company_details where company_id= "+name+" ");
                 if(nm.next())
                 {    String na = nm.getString("company_name");
                  // out.println(na);
                   //out.println(x);
                   
                      piedataset.setValue(na ,new Integer(x)); 
                 }
}
catch(Exception totalexp){}
	








}
int width = 640 ;
int height = 480;




if(piedataset.getItemCount()!=0){  
   
JFreeChart piechart=ChartFactory.createPieChart("Course Wise Analysis-"+branchName,piedataset,true,true,false);
PiePlot plot = (PiePlot) piechart.getPlot();
PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1}", new DecimalFormat("0"), new DecimalFormat("0%"));
plot.setLabelGenerator(gen);

Font font = new Font(Font.SERIF,Font.BOLD,15);
piechart.getLegend().setItemFont(new Font(Font.SERIF,Font.BOLD,20));
plot.setLabelFont(font);
Piefile= "PieChart_"+branchName+".jpeg";
File PieChart= new File( "/home/vedi/Desktop/TnpFeb/web/images/"+Piefile ); 


TextTitle legendText1 = new TextTitle("TOTAL STUDENTS: "+totalStudents);
//legendText1.setPosition(RectangleEdge.TOP);
piechart.addSubtitle(legendText1);

TextTitle legendText2 = new TextTitle("PLACED STUDENTS: "+placed);
//legendText2.setPosition(RectangleEdge.TOP);
piechart.addSubtitle(legendText2);


ChartUtilities.saveChartAsJPEG( PieChart , piechart , width, height );
}
else {
    out.println("ERROR :  NO ENTERIES FOR THESE DETAILS , PLEASE FILL DATABASE FIRST ");
}

%>
<article class="box_notif1">
   
       
<%
if(piedataset.getItemCount()!=0){
  String path =  "images/" + Piefile  ; 
%>
   <center> <IMG SRC=  <% out.println(path); %> "WIDTH="640" HEIGHT="480" />  </center>
<% }
%>            
 </article>
           
          
            
</body>  
</html>
