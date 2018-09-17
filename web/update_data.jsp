<%-- 
    Document   : store_data.jsp
    Created on : Jan 14, 2018, 9:31:52 PM
    Author     : pallavisingh
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println(request.getParameter("year"));
    try{
        String year=request.getParameter("year");
    String sem=request.getParameter("sem");
    String name=request.getParameter("name");
    String code=request.getParameter("code");
    String credits=request.getParameter("credits");
    String course=request.getParameter("course");
    String branch=request.getParameter("branch");
    String oname=request.getParameter("oname");
    String no=request.getParameter("no");
            String ocode=request.getParameter("ocode");
    int s=Integer.parseInt(sem);
    System.out.println("hhhh");
    System.out.println(name.length()+" "+oname.length());
    System.out.println(sem);
    System.out.println(name);
    System.out.println(code);
    System.out.println(credits);
        System.out.println(ocode);
    System.out.println(oname);
    Class.forName("com.mysql.jdbc.Driver");  
                String str="jdbc:mysql://localhost:3306/db_"+year;
            Connection con1=DriverManager.getConnection(str,"root","");
                           Statement st = (Statement)con1.createStatement();
                           Statement st2 = (Statement)con1.createStatement();
                           String sql2="UPDATE `subject_codes` SET `Subject_code`='"+code+"' WHERE programme_code='"+course+"'and branch_code='"+branch+"'and Subject_code='"+ocode+"' and sem='"+sem+"'";
                           st2.executeUpdate(sql2);
                           System.out.println(sql2);
                           String sql="UPDATE `subjects` SET `Subject_code`='"+code+"',`Subject_name`='"+name+"',`credits`='"+credits+"' WHERE Semester='"+s+"'and Subject_name='"+oname+"' and Subject_code='"+ocode+"'";
                           st.executeUpdate(sql);
                           System.out.println(sql);
                           String str1="select * from subjects where Subject_name='"+oname+"'";
                           Statement st1 = (Statement)con1.createStatement();
                           ResultSet rs=st1.executeQuery(str1);
                           rs.next();
                           System.out.println(str1+" vnfkd"+rs);
                           System.out.println("hhhhkkkkkk");
                           System.out.println(rs.getString("Subject_name"));
//                           
    }                           
    catch(Exception e)
    {
        out.println(e+"error...");
    }
%>