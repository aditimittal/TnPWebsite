<%-- 
    Document   : select_course
    Created on : Feb 1, 2018, 7:06:55 PM
    Author     : pallavisingh
--%>
<%@page errorPage="ErrorPage.jsp"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
                    try{
                        System.out.println("select course");
                        String sem=request.getParameter("sem");
                        String year=request.getParameter("year");
                        String program=request.getParameter("course");
                        String branch=request.getParameter("branch");
                        System.out.println(year);
                        System.out.println(sem);
                        Class.forName("com.mysql.jdbc.Driver");  
                        String str="jdbc:mysql://localhost:3306/db_"+year;
                        Connection con1=DriverManager.getConnection(str,"root","");
                        Statement stmt = con1.createStatement(); 
                        Statement stmt1 = con1.createStatement(); 
                        ResultSet rs2 = stmt1.executeQuery("Select * from programme_codes");
                        String buffer="<div id='t_course'><div id='course1'><select name='course' id='course' onchange='selectBranch(this.value)'>"; 
                        System.out.println("andar1111");
                        while(rs2.next())
                        {
                            
                            String str1=rs2.getString("Programme_Name");
                            System.out.println("andar"+str1);
                            if(str1.equals(program))
                            {
                                System.out.println("eee");
                                buffer+="<option selected value='"+str1+"'>"+str1+"</option>";
                            }
                            else
                            {
                                buffer+="<option value='"+str1+"'>"+str1+"</option>";
                            }
                            
                        }
                        buffer=buffer+"</select></div><div id='t_branch'>";
                        ResultSet rs1 = stmt.executeQuery("Select  * from branch_codes where Programme_Name='"+program+"'");
                        System.out.println(program);
                        if(rs1.next())
                        {
                            int t=0;
                             buffer+="<div id='branch2'><select name='branch' id='branch'>"; 
                        System.out.println(program+"lllll");
                          do{
                              String str1=rs1.getString("Branch_Name");
                              System.out.println(str1+"jjjj");

                                   if(str1.equals(branch))
                                buffer=buffer+"<option selected value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>";   
                                   else if(branch.equals("null")&t==0)
                                   {
                                    buffer=buffer+"<option selected value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>";     
                                   }
                              else
                          buffer=buffer+"<option value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>";  
                          }while(rs1.next()); 
                        buffer=buffer+"</select></div>";
                        }
                       
                        buffer+="<div id='sem1'><select name='sem' id='sem'>";  
                         Statement stmt2 = con1.createStatement();  
                        ResultSet rs11 = stmt2.executeQuery("Select  * from programme_codes where Programme_Name='"+program+"'");
                        rs11.next();
                        
                        String str1=rs11.getString("Programme_Duration");
                        int s=Integer.parseInt(str1);
                        int i=1;
                        int j=Integer.parseInt(sem);
                        while(i<=s*2)
                        {
                            if(i==j)
                            {
                                System.out.println("eee");
                                buffer+="<option selected value='"+j+"'>"+j+"</option>";
                            }
                            else
                            buffer=buffer+"<option value='"+i+"'>"+i+"</option>";   
                         i++;
                        }            
                        
                        buffer=buffer+"</select></div></div>";
                        response.getWriter().println(buffer); 
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                             %>
