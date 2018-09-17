<%--  
    Document   : admin_change_password_db
    Created on : 22 Sep, 2017, 11:12:28 PM
    Author     : ashim
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page import="com.exp.HashPassword" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
        <%
            String old_pass, new_pass, conf_pass;
            old_pass = request.getParameter("old_password");
            new_pass = request.getParameter("new_password");
            conf_pass = request.getParameter("confirmed_password");
            
            String txt = null;
            int idd = (Integer) session.getAttribute("idx");
            String sql1 = "select password from admins where admin_id ="+idd;
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(sql1);
            
            String pass = null;
            String hash_pass; 
            while(rst.next()){
                pass = rst.getString(1);
            }
            
            hash_pass = HashPassword.generateHash(old_pass);
            
            if(!new_pass.equals(conf_pass)){
                txt = "New passwords doesnt match";
            }
            else if(!pass.equals(hash_pass)){
                txt = "Password entered is incorrect";
            }
            else{
                String up_pass = HashPassword.generateHash(new_pass);
                String sql = "update admins set password = '"+up_pass+"' where admin_id="+idd;
                PreparedStatement ps = con.prepareStatement(sql);
                ps.executeUpdate();
                txt = "Password changed!!";
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("admin_change_password.jsp?txt="+txt);
            rd.forward(request, response);
            
        %>
    </body>
</html>
