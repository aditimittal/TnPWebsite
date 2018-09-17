<%-- 
    Document   : deadline_delete
    Created on : 10 Jul, 2017, 6:39:58 PM
    Author     : Ashima
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
        <%!
            String course;
            String dept;
            String yr;
            String start_date;
            String end_date;
        %>
        <%
            try{
                    String id = request.getParameter("id");
                    
                    String query = "select * from deadline where did="+id+"";
                    Statement stm = con.createStatement();
                    ResultSet result = stm.executeQuery(query);
        
                    while(result.next()){
                        course = result.getString("course");
                        dept = result.getString("Department");
                        yr = result.getString("Year");
                        start_date = result.getString("start_date");
                        end_date = result.getString("end_date");
                    }
                    
                    String sql = "delete from deadline where did="+id;
                    PreparedStatement st = con.prepareStatement(sql);
                    st.executeUpdate();
                    String username = (String)session.getAttribute("name");
                    String msg = "Deadline deleted for "+course+" "+dept+" "+yr+" year from "+start_date+" to "+end_date;
                    insertLog(username, "Deadline Deleted", msg );
                    
                    st.close();
                    String ans = "<center>";
                    ans += "<br>"+
                            "<table>"+
                            "<tr>"+
                            "<th>COURSE</th>"+
                            "<th>DEPARTMENT</th>"+
                            "<th>YEAR</th>"+
                            "<th>START DATE</th>"+
                            "<th>END DATE</th>"+
                            "<th>DEADLINE STATUS</th>"+
                            "<th></th>"+
                            "<th></th>"+
                            "</tr>";
                                        
                    
                    sql = "select * from deadline";
                    stm = con.createStatement();
                    ResultSet rs = stm.executeQuery(sql);
                    int count=0;
                    while(rs.next()){
                        count++;
                        String status;
                        String start_date = rs.getString("start_date");
                        String end_date = rs.getString("end_date");

                        Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
                        Date ed = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
                        Date today = new Date();

                        if(sd.before(today) && today.before(ed)){
                            status = "active";

                        }
                        else if(today.before(sd)){
                            status = "Yet to start!";
                        }
                        else{
                            status = "Deadline over";
                        }

                        String year_in = rs.getString("Year");
                        String course = rs.getString("course");
                        String department = rs.getString("Department");

                        String current_month, current_year;
                        int year_use; 

                        current_month = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
                        current_year = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());

                        if(Integer.parseInt(current_month) < 8){
                            year_use = Integer.parseInt(current_year) - Integer.parseInt(year_in);    
                        }
                        else{
                            year_use = Integer.parseInt(current_year) - Integer.parseInt(year_in) + 1;    
                        }

                        Class.forName("com.mysql.jdbc.Driver");  
                        Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_use,"root","");

                        String prog=null, branch=null;

                        if(!department.equals("null")){
                            String sql1 = "SELECT Programme_Name,Branch_Name FROM branch_codes WHERE Branch_Code = '"+department+"' AND Programme_Name = "
                                          + "(SELECT Programme_Name FROM programme_codes WHERE Programme_Code = '"+course+"')";

                            Statement stm1 = con1.createStatement();
                            ResultSet rs1 = stm1.executeQuery(sql1);
                            while(rs1.next()){
                                prog = rs1.getString("Programme_Name");
                                branch = rs1.getString("Branch_Name");
                            }

                            rs1.close();
                            stm1.close();
                            con1.close();
                        }
                        else{
                            String sql1 = "SELECT Programme_Name FROM `programme_codes` WHERE Programme_Code = '"+course+"'";

                            Statement stm1 = con1.createStatement();
                            ResultSet rs1 = stm1.executeQuery(sql1);
                            while(rs1.next()){
                                prog = rs1.getString("Programme_Name");
                            }

                            rs1.close();
                            stm1.close();
                            con1.close();
                        }

                        out.println("<tr>");  

                        


                        ans+="<td>"+prog+"</td>";
                        ans+="<td>";
                        if(branch!=null){
                            ans+=branch;
                        }
                         ans+="</td>";
                        ans+="<td>"+year_in+"</td>";
                        ans+="<td>"+ rs.getString("start_date")+"</td>";
                        ans+="<td>"+rs.getString("end_date")+"</td>";
                        ans+="<td>"+status+"</td>";
                        ans+="<td><a class=\"click\" href=\"deadline_edit.jsp?id="+rs.getInt("did")+"&prog="+prog+"&branch="+branch+"&year="+year_in+ "&start_date="+rs.getString("start_date")+"&end_date="+rs.getString("end_date")+"\">Edit</a></td>";
                        ans+="<td><a class=\"click\" onclick=\"deleteAlert("+rs.getInt("did")+")\" >Delete</a></td>";
                        ans+="</tr>";
                        
                    }
                    
                    ans +="</table>";
                    ans += "</center>";
                    if(count==0){
                        ans = "<br><br><h1 style=\"color: red\">No Deadline Records Found</h1>";
                    }
                    
                    response.getWriter().println(ans); 
                    con.close();
                    
                    
            }catch(Exception e){
                out.println("error...<br>"+e);
            }
        
        
        %>
 