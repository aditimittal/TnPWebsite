<%-- 
    Document   : student_change_password_db
    Created on : 13 Oct, 2017, 10:12:25 PM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page import="com.exp.HashPassword" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
        <%
        try{
            String old_pass, new_pass, conf_pass;
            old_pass = request.getParameter("old_password");
            new_pass = request.getParameter("new_password");
            conf_pass = request.getParameter("confirmed_password");
            out.println(old_pass+" "+new_pass+" "+conf_pass);
            String txt = null;
            String idd=(String)session.getAttribute("eno"); 
            
            String sql1 = "select pass from login where eno ="+idd;
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(sql1);
            
            String pass = null;
            String hash_pass; 
            while(rst.next()){
                pass = rst.getString(1);
            }
            out.println("<br>"+pass+" ");
            hash_pass = HashPassword.generateHash(old_pass);
            
            if(!new_pass.equals(conf_pass)){
                txt = "New passwords doesnt match";
            }
            else if(!pass.equals(hash_pass)){
                txt = "Password entered is incorrect";
            }
            else{
                String up_pass = HashPassword.generateHash(new_pass);
                String sql = "update login set pass = '"+up_pass+"' where eno="+idd;
                PreparedStatement ps = con.prepareStatement(sql);
                ps.executeUpdate();
                txt = "Password changed!!";
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("student_change_password.jsp?txt="+txt);
            rd.forward(request, response);
            
        }catch(Exception e){
            out.println("error....<br>"+e);
        }
        %>
    </body>
</html>
