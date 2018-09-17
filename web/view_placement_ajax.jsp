<%-- 
    Document   : deadline_set_sql.jsp
    Created on : 5 Jan, 2018, 10:30:21 PM
    Author     : ashim
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        String type,value;
        type = request.getParameter("type");
        value = request.getParameter("value");
        
        if(type.equalsIgnoreCase("course")){
            String year_use = "db_"+value;
            
           

            Class.forName("com.mysql.jdbc.Driver");  
            Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/"+year_use+"","root","");
           
            
            String sql = "select Programme_Name,Programme_Code from programme_codes";
            Statement stm = con1.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String ans = "<label for=\"course\">Courses</label>"+
                         "<select id=\"course\" name=\"course\"  required onchange=\"func_dept('department',this.value)\">";
            ans += "<option value=\"noCourse\" selected disabled>Select Programme</option>";
            
            while(rs.next()){
                ans += "<option value="+rs.getString("Programme_Code")+">"+rs.getString("Programme_Name")+"</option>";
            }
            
            ans+="</select>";
           
            
            response.getWriter().println(ans);
            
             
            
           
        }
        else if(type.equalsIgnoreCase("department")){
            String year_in = request.getParameter("year");
            
            String year_use = "db_"+year_in;

           
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/"+year_use+"","root","");
            
            String sql = "select Branch_Name,Branch_Code from branch_codes where Programme_Name ="
                    + " (select Programme_Name from programme_codes where Programme_Code = '"+value+"')"; 
            Statement stm = con1.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            
            String ans = "<label for=\"dept\">Department</label>"+
                         "<select id=\"dept\" name=\"dept\" >";
            ans += "<option value=noBranch selected disabled>Select Branch</option>";
            int count =0;
            while(rs.next()){
                count++;
                ans += "<option value="+rs.getString("Branch_Code")+">"+rs.getString("Branch_Name")+"</option>";
            }
            
            ans+="</select>";
            
            if(count==0){
                ans = "";
            }
            
            response.getWriter().println(ans);
            
        }
        }catch(Exception e){
            out.println("error....<br>"+e);
        }
        
        %>
    </body>
</html>
