<%-- 
    Document   : select_program
    Created on : Jan 16, 2018, 1:22:43 AM
    Author     : pallavisingh
--%>

<%@page errorPage="ErrorPage.jsp"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
                    try{
                        System.out.print("select branch");
                        String branch=request.getParameter("branch");
                        String sem=request.getParameter("sem");
                        String year=request.getParameter("year");
                        String program=request.getParameter("course");
                        System.out.println(year);
                        System.out.println(program);
                        System.out.println(branch);
                        Class.forName("com.mysql.jdbc.Driver");  
                        String str="jdbc:mysql://localhost:3306/db_"+year;
                        Connection con1=DriverManager.getConnection(str,"root","");
                        Statement stmt = con1.createStatement();  
                        String temp="Select  * from branch_codes where Programme_Name='"+program+"'";
                        ResultSet rs1 = stmt.executeQuery(temp);
                        System.out.println(temp);  
                        String buffer="";
                        if(rs1.next())
                        {
                            System.out.println("wel");
                            int t=0;
                            System.out.println("check"+rs1.getString("Branch_Name"));
                             buffer="<div id='branch3'><select name='branch' id='branch'>";  
                          do{
                              String str1=rs1.getString("Branch_Name");
                              System.out.println(str1+"kkkkkkk");

                                  if(str1.equals(branch))
                                  {buffer=buffer+"<option selected value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>"; 
                                  }  
                                   else if(branch.equals("null")&t==0)
                                   {
                                       System.out.println("nul");
                                    buffer=buffer+"<option selected value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>";     
                                   }
                                  else
                                buffer=buffer+"<option value='"+str1+"'>"+rs1.getString("Branch_Name")+"</option>";
   
                          }while(rs1.next());
                        buffer=buffer+"</select></div>";
                        
                        }
                         
                         Statement stmt2 = con1.createStatement();  
                         String y="Select  * from programme_codes where Programme_Name='"+program+"'";
                        ResultSet rs11 = stmt2.executeQuery(y);
                        rs11.next();
                        System.out.println(y);
                        String str1=rs11.getString("Programme_Duration");
                        int s=Integer.parseInt(str1);
                        int i=1;
                        int j=Integer.parseInt(sem);
                        buffer+="<div id='sem1'><select name='sem' id='sem'>";  
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
                        
                        buffer=buffer+"</select></div>";
                        System.out.print("bro");
                        response.getWriter().println(buffer); 
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                             %>
