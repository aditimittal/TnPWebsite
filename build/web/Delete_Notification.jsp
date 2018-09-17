<%@page import="java.sql.PreparedStatement"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<%! PreparedStatement ps; %>
<%! String sql; %>

<%
    //int id = Integer.parseInt(request.getParameter("id"));
    //out.print(request.getParameter("id"));
    int id = Integer.parseInt(request.getParameter("id"));
    String sub = request.getParameter("subject");
    
    System.out.println(id);
    System.out.println(sub);
    
    try{
        sql = "DELETE FROM notifications WHERE id = "+id;
        ps = con.prepareStatement(sql);
        int i = ps.executeUpdate();
        if(i>0){
            String user = (String)session.getAttribute("name");
            String content = "Notification Deleted";
            insertLog(user, content, sub);
%>
        <jsp:forward page="/List_Notification.jsp"/>
<%
        }
        else{
%>
            <%@include file="common_header.jsp" %>
            <br><br><br>
<%
            out.println("ERROR OCCURED!! ");
            out.println("NOTIFICATION DOESNOT EXIST");          
        }
    }catch(Exception e){
        System.out.println("Error: "+e);
    }
%>