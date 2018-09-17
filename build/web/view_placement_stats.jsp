<%-- 
    Document   : view_placement_stats
    Created on : Nov 19, 2017, 9:40:01 PM
    Author     : dell
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String company_name="";
    String year=  request.getParameter("year");
    String branch =  request.getParameter("branch");
    String dept =  request.getParameter("dept");
    String tod =  request.getParameter("tod");
    String stat =  request.getParameter("stat");
    stat = stat.trim();
    
   if(stat.equals("statdb"))
      response.sendRedirect("view_placement_companywise.jsp?year="+year+"&branch="+branch+"&dept="+dept+"&tod="+tod+"  ");
   
   if(stat.equals("statpie"))
      response.sendRedirect("pie.jsp?year="+year+"&branch="+branch+"&dept="+dept+"&tod="+tod+"  ");
    
    if(stat.equals("statper"))
       response.sendRedirect("view_placement_percentage.jsp?year="+year+"&branch="+branch+"&dept="+dept+"&tod="+tod+"  ");
   
    if(stat.equals("statmass"))
       response.sendRedirect("view_placement_massrecruiter.jsp?year="+year+"&branch="+branch+"&dept="+dept+"&tod="+tod+"  ");
    
    if(stat.equals("ctc"))
       response.sendRedirect("screen_admin_stats.jsp?year="+year+"&branch="+branch+"&dept="+dept+"&tod="+tod+"  ");
    
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
  <input type="hidden"  id="branch"  name="branch" value="<%out.println(branch);%>">
  <input type="hidden"  id="year"  name="year" value="<%out.println(year);%>">
  <input type="hidden"  id="dept"  name="dept" value="<%out.println(dept);%>">
  <input type="hidden"  id="tof"  name="tof" value="<%out.println(tod);%>">
 
        
    </body>
    <br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>