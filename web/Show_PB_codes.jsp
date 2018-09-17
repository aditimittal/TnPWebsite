<%-- 
    Document   : Show_PB_codes
    Created on : Feb 21, 2018, 10:51:07 AM
    Author     : pallavisingh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try{
                
            System.out.println("hiiiii");
            Connection con1;
            Statement stm,stm2;
            String year=request.getParameter("year_db");
            System.out.println(year);
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year,"root","");
             stm = (Statement)con1.createStatement();
                          stm2 = (Statement)con1.createStatement();
                          String buffer="";
          String sql = "select *from programme_codes order by Programme_Code;";
            ResultSet res = stm.executeQuery(sql);
            buffer+="<table class='table' style='margin-top:2em;margin-left:9em;width:80%'><thead class='thead-dark'><tr><th>PROGRAMME CODE</th><th>BRANCH CODE</th><th>PROGRAMME NAME</th><th>TYPE</th></tr></thead><tbody>";
         while(res.next()){
                String prog_code = res.getString("Programme_Code");
                String prog_name = res.getString("Programme_Name");
                String prog_type = res.getString("Programme_Type");
                int count = 0;
                String sql2 = "select * from branch_codes where Programme_Name = '"+ prog_name +"';";
                System.out.println(sql2);
                ResultSet res2 = stm2.executeQuery(sql2);
                while(res2.next()){
                    count++;
                    System.out.println(prog_code+" "+prog_name+" "+prog_type+"ooooooooo");
                    String branch_code = res2.getString("Branch_Code");
                    String full_prog_name = prog_name+" - "+res2.getString("Branch_Name");
        buffer+="<tr><td> "+prog_code +"</td><td> "+branch_code +"</td> <td> "+full_prog_name+" </td><td> "+prog_type+" </td> </tr>";
        
                }

                if(count == 0){
                    System.out.println(prog_code+" "+prog_name+" "+prog_type);
                buffer+="<tr><td> "+prog_code+" </td><td> --- </td><td> "+prog_name +"</td><td> "+prog_type +"</td></tr>";
        
                }
            }
System.out.println("bye");
buffer+="</tbody></table>";
        response.getWriter().println(buffer);
        }    
        catch(Exception e){
            System.out.println("Error "+e);
        }
        
        %>
        
    </body>
</html>
