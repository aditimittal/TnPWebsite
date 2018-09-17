<%-- 
    Document   : placement_analysis
    Created on : Jul 10, 2017, 2:23:11 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/style_one.css">
        <%@include file="common_header.jsp" %>
        <title>IGDTUW</title>
        <%@include file="connection.jsp" %>
    </head>
    <body>
  
<div class="container">
 
            
            
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<% Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	Statement st= con.createStatement(); 
	ArrayList<String> db_array=new ArrayList<String>();
	ResultSet rs=st.executeQuery("show tables like '%placement_%'");
        try {
                while(rs.next()){
                    try{
                        db_array.add(rs.getString(1));
                       }
                    catch(Exception e){db_array.add("No tables in the system");}

                }
                
  } 
catch (Exception e1) {
     
}
%>

<form method="post">
  	<select id="tables" name="db_name" >
  		<% 

  		for(String dbName:db_array){
  		//if(dbName==db_array.get(db_array.size()-1)){
  		%>
  		<option value="<%=db_array.get(db_array.size()-1)%>" selected><%=db_array.get(db_array.size()-1)%></option>
  		<% //}
  		//else{ 
  		%>
  		<option value="<%=dbName%>"><%=dbName%></option>
  		<% //}
  		 %>
  		<% } %>
  	</select>
  	<input type="submit" value="Ok">
</form>




            
</div> 
</body>
</html>
