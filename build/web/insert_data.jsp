<%-- 
    Document   : insert_data
    Created on : Jan 15, 2018, 6:38:07 PM
    Author     : pallavisingh
--%>

<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("insert");
    System.out.println(request.getParameter("year"));
    try{
    String year=request.getParameter("year");
    String sem=request.getParameter("sem");
    String nname=request.getParameter("nname");
    String ncode=request.getParameter("ncode");
    String ncredit=request.getParameter("ncredit");
    String course=request.getParameter("course");
    String branch=request.getParameter("branch");
    int s=Integer.parseInt(sem);
    System.out.println("hhhh");
    System.out.println(sem);
    System.out.println(branch+"branch ");
    System.out.println(course);
    System.out.println(ncode+"code");
    System.out.println(nname+"name");
    System.out.println(ncredit+"credit");
    Class.forName("com.mysql.jdbc.Driver");  
                String str="jdbc:mysql://localhost:3306/db_"+year;
            Connection con1=DriverManager.getConnection(str,"root","");
                           Statement st = (Statement)con1.createStatement();
                           Statement st2 = (Statement)con1.createStatement();
                           String bc="null";
                           if(!branch.equals("null"))
                           {String sq="select * from branch_codes where Branch_Name='"+branch+"' and Programme_Name='"+course+"'";
                            ResultSet res= st.executeQuery(sq);
                             res.next();
                             bc=res.getString("Branch_Code");
                           }
                           String sq1="select * from programme_codes where programme_name='"+course+"'";
                           ResultSet res1=st2.executeQuery(sq1);
                           res1.next();
                           String pc=res1.getString("Programme_Code");
                           System.out.println("bc"+bc);
                           Statement st1 = (Statement)con1.createStatement();
                           Statement stmt = (Statement)con1.createStatement();
                           String s1="select * from subjects where Semester='"+sem+"'and Subject_code='"+ncode+"'";
                           ResultSet res2=stmt.executeQuery(s1);
                           if(!res2.next())
                           {
                               String sql="INSERT INTO `subjects`(`Subject_code`, `Subject_name`, `Semester`, `credits`) VALUES ('"+ncode+"','"+nname+"','"+sem+"','"+ncredit+"')";
                           st.executeUpdate(sql);
                           System.out.println(sql);
                           }
                           String sql1="INSERT INTO `subject_codes`(`Subject_code`, `branch_code`, `programme_code`,`sem`) VALUES ('"+ncode+"','"+bc+"','"+pc+"','"+sem+"')";
                           st1.executeUpdate(sql1);
                           
                           String str1="select * from subjects where Subject_name='"+nname+"'";
                           Statement st3 = (Statement)con1.createStatement();
                           ResultSet rs=st3.executeQuery(str1);
                           rs.next();
                           System.out.println(str1+" vnfkd"+rs);
                           System.out.println("hhhhkkkkkk");
                           System.out.println(rs.getString("Subject_name"));
    }
    catch(Exception e)
    {
        out.println(e+"error...");
    }
%>