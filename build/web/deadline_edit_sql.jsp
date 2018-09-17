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
<%@page errorPage="ErrorPage.jsp"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>
    <%! String course, dept, year, start_date, end_date; %>
    <% 
        String id = request.getParameter("id");
        
        String sql = "select * from deadline where did = "+id;
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        
        while(rs.next()){
            course = rs.getString("course");
            dept = rs.getString("department");
            year = rs.getString("year");
        }
        
        
    %>
    <%! String Text = null; %>
    
        <%
        
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        
        Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
        Date ed = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
        
        if(ed.before(sd) || start_date.equals(end_date) ){
            Text = "ending date is set before or same as the start date";
        }
        else{
                            sql = "update deadline set start_date='"+start_date+"', end_date='"+end_date+"' where did="+id+"";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.executeUpdate();
                            String username = (String)session.getAttribute("name");
                            String msg = "Deadline Edited for "+course+" "+dept+" "+year+" year from "+start_date+" to "+end_date+" (New Deadline)";
                            insertLog(username, "Deadline Edited", msg );
                            
                            Text = "deadline edited";
        }
        
//        out.println(id+"<br>"+start_date+"<br>"+end_date+"<br>");
        
        con.close();
        response.getWriter().println(Text);
        %>
