<%-- 
    Document   : screen_admin_date
    Created on : 10 Jul, 2017, 1:51:17 PM
    Author     : Ashima
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
    
    <%! String Text=null; %>

        <%
            try{
                
                String course = request.getParameter("course");
                String dept =  request.getParameter("dept");
                String year = request.getParameter("year");
                String start_date = request.getParameter("start_date");
                String end_date = request.getParameter("end_date");
//                Text = course+"--"+dept+"--"+year+"--";
                if(start_date.isEmpty() || end_date.isEmpty()){
                    Text = "Date fields were left empty";
                }
                else{
                    Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
                    Date ed = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
                    
                    if(ed.before(sd) || start_date.equals(end_date) ){
                       
                        Text = "ending date is set before or same as the start date";
                    }
                    else{
                        
                        String sql = "select * from deadline where course = '"+course+"' and department= '"+dept+"' and year = "+year+" ";
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(sql);
                        int count =0; 
                        while(rs.next()){
                            count++;
                        }
                        if(count!=0){
                          
                            Text = "Deadline has already been set for the chosen course,department and year";
                        }
                        else{
                            
                            sql = "insert into deadline(course,Department,Year,start_date,end_date) values('"+course+"','"+dept+"','"+year+"','"+start_date+"','"+end_date+"')";
                            
                            PreparedStatement ps = con.prepareStatement(sql);
                            
                            try{
                                ps.executeUpdate();                            
                            }
                            catch(Exception e){
                                System.out.println("e" + e);
                            }
                            
                            Text = "Deadline set";
                            String username = (String)session.getAttribute("name");
                            String msg = "Deadline set for "+course+" "+dept+" "+year+" year from "+start_date+" to "+end_date;
                            insertLog(username, "Deadline Set", msg );


                        }
                    }
                }
                
                                                
                            response.getWriter().println(Text);
//                out.println(course+"<br>"+dept+"<br>"+year+"<br>"+start_date+"<br>"+end_date);
                
            }catch(Exception e){
                response.getWriter().println(e);
            }
            
            
            
        %>
        
