<%-- 
    Document   : delete_data
    Created on : Jan 15, 2018, 1:52:56 PM
    Author     : pallavisingh
--%>

<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("delete");
    System.out.println(request.getParameter("year"));
    try{
        String year=request.getParameter("year");
    String sem=request.getParameter("sem");
    String oname=request.getParameter("oname");
    String ocode=request.getParameter("ocode");
    String course=request.getParameter("course");
    //String credit=request.getParameter("credit");
    String branch=request.getParameter("branch");
    int s=Integer.parseInt(sem);
    System.out.println("hhhh");
    System.out.println(sem);
    System.out.println(ocode);
    System.out.println(oname);
    Class.forName("com.mysql.jdbc.Driver");  
                String str="jdbc:mysql://localhost:3306/db_"+year;
            Connection con1=DriverManager.getConnection(str,"root","");
                           Statement st = (Statement)con1.createStatement();
                            Statement st2 = (Statement)con1.createStatement();
                            Statement st3 = (Statement)con1.createStatement();
                            Statement st4 = (Statement)con1.createStatement();
                            Statement st5 = (Statement)con1.createStatement();
                            String str2="select * from branch_codes where Programme_Name='"+course+"' and Branch_Name='"+branch+"'";
                           ResultSet rs2=st4.executeQuery(str2);
                           rs2.next();
                           String bc=rs2.getString("Branch_Code");
                           String str3="select * from programme_codes where Programme_Name='"+course+"'";
                           ResultSet rs3=st3.executeQuery(str3);
                           rs3.next();
                           String pc=rs3.getString("Programme_Code");
                           String sql2="DELETE FROM `subject_codes` WHERE  Subject_code='"+ocode+"' and programme_code='"+pc+"' and branch_code='"+bc+"' and sem='"+sem+"'";
                           st2.execute(sql2);
                           System.out.println(sql2);
                           String s1="select * from subject_codes where  Subject_code='"+ocode+"'";
                           ResultSet res=st5.executeQuery(s1);
//                           String str1="select * from marks where  subject_code='"+ocode+"' and semester='"+sem+"' andprogramCode='"+pc+"' and branchCode='"+bc+"'";
//                           ResultSet rs=st5.executeQuery(str1);
//                           while(rs.next())
//                           {
//                               String eno=rs.getString("Eno_num");
//                               String m=rs.getString("marks");
//                               int marks=Integer.parseInt(m);
//                               Statement stmt=(Statement)con1.createStatement();
//                               String temp="delete from marks where Eno_num='"+eno+"' and subject_code='"+ocode+"' and semester='"+sem+"'";
//                               stmt.execute(temp);                               
//                           }
                           if(!res.next())
                           {
                               String sql="DELETE FROM `subjects` WHERE  Semester='"+s+"'and Subject_name='"+oname+"' and Subject_code='"+ocode+"'";
                           System.out.println("hjjj"+s+" "+sql);
                           st.execute(sql);
                           System.out.println(sql);
                           
                           }
                           System.out.println(sql2);
                           System.out.println("hhhhkkkkkk");
    }
    catch(Exception e)
    {
        out.println(e+"error...");
    }
%>