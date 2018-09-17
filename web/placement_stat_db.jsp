<%@page errorPage="ErrorPage.jsp"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import=" java.text.SimpleDateFormat"%>
<%
    
//Calendar cal=Calendar.getInstance();
//int currentYear=cal.get(Calendar.YEAR);

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placementstat","root",""); 
Statement st= con.createStatement(); 
String r = request.getParameter("rollno");
String n = request.getParameter("sname");
String c = request.getParameter("company");
float p = Float.parseFloat(request.getParameter("package"));
String t = request.getParameter("tof");
String role = request.getParameter("role");
//out.println(session.getAttribute( "branch "));
String b =(String)session.getAttribute("branch");
String y =(String)session.getAttribute("year");
String d=(String)session.getAttribute("dept");

//String y = request.getParameter("year");
//String d = request.getParameter("dept");
//y=y.toLowerCase();
//d=d.toLowerCase();
//b=b.toLowerCase();



int res=st.executeUpdate("INSERT INTO placement_"+y+" VALUES('"+r+"' , '"+c+"' , '"+p+"' , '"+t+"','"+role+"')");
         
if(res==0)
   out.println("error occured...");

 
response.sendRedirect("placement.jsp");
 
 %>

