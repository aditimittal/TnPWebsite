<%-- 
    Document   : state_change_data
    Created on : Jan 16, 2018, 5:25:03 AM
    Author     : pallavisingh
--%>
<%@page errorPage="ErrorPage.jsp"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("trying");
    System.out.println(request.getParameter("year"));
    String year=request.getParameter("year");
    String sem=request.getParameter("sem");
    try{
    String course=request.getParameter("course");
    String branch=request.getParameter("branch");
    System.out.println("course:"+course);
    int s=Integer.parseInt(sem);
    System.out.println("hhhh");
    System.out.println(sem);
    Class.forName("com.mysql.jdbc.Driver");  
                String str="jdbc:mysql://localhost:3306/db_"+year;
            Connection con1=DriverManager.getConnection(str,"root","");
                           Statement st = (Statement)con1.createStatement();
                           Statement st3 = (Statement)con1.createStatement();
                           String bc = null;
                           if(branch!=null){
                           String str2="select * from branch_codes where Programme_Name='"+course+"' and Branch_Name='"+branch+"'";
                           ResultSet rs2=st.executeQuery(str2);
                           System.out.println("jjjjj"+str2);
                           System.out.println(branch+"br");
                            while(rs2.next()){
                           bc=rs2.getString("Branch_Code");
                            }
                            }
                           System.out.println(bc+"b1r");
                           String str3="select * from programme_codes where Programme_Name='"+course+"'";
                           ResultSet rs3=st3.executeQuery(str3);
                           rs3.next();
                           String pc=rs3.getString("Programme_Code");
                           String str4="select * from subject_codes where programme_code='"+pc+"' and branch_code='"+bc+"' and sem='"+sem+"'";
                           Statement st4 = (Statement)con1.createStatement();
                           ResultSet rs4=st4.executeQuery(str4);
                           String buffer="<input type='hidden' id='year2' name='year1' value='"+year+"'><input type='hidden' id='sem2' name='sem1' value='"+sem+"'>";
                           buffer+="<tr><th>SUBJECT CODE</th><th>SUBJECT NAME</th><th>CREDITS</th><th></th></tr>";
                          System.out.println("ddddd");
                          int i=0;
                           while(rs4.next())
                            {   i=i+1;
                            String str1="select * from subjects where Subject_code='"+rs4.getString("Subject_code")+"' and Semester='"+sem+"'";
                           Statement st1 = (Statement)con1.createStatement();
                           ResultSet rs=st1.executeQuery(str1);
                           rs.next();
                                String name=rs.getString("Subject_name");
                                String code=rs.getString("Subject_code");
                                String credit=rs.getString("credits");
                                String tr="row"+i;
                                String td2="name_row"+i;
                                String td1="code_row"+i;
                                String td3="credit_row"+i;
                                String sb="save_button"+i;
                                String eb="edit_button"+i;
                                String icon="icon"+i;
                                buffer+="<tr id='"+tr+"'><td id='"+td1+"'>"+code+"</td><td id='"+td2+"'>"+name+"</td><td id='"+td3+"'>"+credit+"</td>"; 
                                buffer+=" <td id='"+icon+"'><a style='border-bottom: none;' onclick='edit_row("+i+")'><span id='"+eb+"' class='glyphicon glyphicon-edit' style='color:#6c9dc6;;font-size: 20px;'></span> </a>";
                                buffer+="<a style='border-bottom: none;' onclick='save_row("+i+")'><span id='"+sb+"' class='glyphicon glyphicon-save-file' style='color:green;font-size: 20px;display:none;'></span></a>";
                                buffer+="&nbsp;&nbsp;<a style='border-bottom: none;' onclick='delete_row("+i+")'><span  class='glyphicon glyphicon-trash' style='color:#A0522D;font-size: 20px;'></span></a>";
                                buffer+="</td></tr>";
                    
                               
                           }
                           buffer+="<tr><td><input type='text' id='new_country'></td><td><input type='text' id='new_name'></td><td><input type='text' id='new_age'></td><td><input type='button' class='add' onclick='add_row();' value='Add Row'></td></tr>";
                           response.getWriter().println(buffer); 
                           System.out.println("hhhhkkkkkk");
    }
    catch(Exception e)
    {
        System.out.println(e+"error...");
        
        String buffer="<input type='hidden' id='year2' name='year1' value='"+year+"'><input type='hidden' id='sem2' name='sem1' value='"+sem+"'>";
        buffer+="<tr><th>SUBJECT CODE</th><th>SUBJECT NAME</th><th>CREDITS</th><th></th></tr>";
        buffer+="<tr><td><input type='text' id='new_country'></td><td><input type='text' id='new_name'></td><td><input type='text' id='new_age'></td><td><input type='button' class='add' onclick='add_row();' value='Add Row'></td></tr>";
        response.getWriter().println(buffer);
    }
%>
