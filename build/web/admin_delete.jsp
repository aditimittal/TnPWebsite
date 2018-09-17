<%-- 
    Document   : admin_delete
    Created on : 27 Jun, 2017, 8:45:31 PM
    Author     : ashima
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>

<%! String id;
    String name;
    String desig;
    String dept;
%>
<%
id = request.getParameter("id");
String query = "select * from admins where admin_id="+id+"";
Statement stm = con.createStatement();
ResultSet result = stm.executeQuery(query);
        
while(result.next()){
    name = result.getString("name");
    desig = result.getString("designation");
    dept = result.getString("department");
}



String sql = "delete from admins where admin_id="+id+"";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.executeUpdate();
        sql = "delete from admin_rights where user_id="+id;
                        ps = con.prepareStatement(sql);
                        ps.executeUpdate();

String username = (String)session.getAttribute("name");
String msg = "Rights Deleted for "+name+" ("+desig+") "+"of "+dept+" dept";
insertLog(username, "Rights Updated", msg );


        String ans ;
        ans = "<tr>"+
            "<th>NAME</th>"+
            "<th>EMAIL</th>"+
            "<th>DESIGNATION</th>"+
            "<th>DEPARTMENT</th>"+
            "<th>RIGHTS</th>"+
            "<th></th>"+
            "<th></th>"+
            "</tr>";
        
try{
    Statement stmt= con.createStatement();  
    int id2 =  (Integer)session.getAttribute("idx");
    ResultSet rs=stmt.executeQuery("select * from admins where admin_id not in ("+id2+") ");
    int count=0; 
    while(rs.next()){
        count++;
        int id = rs.getInt(1);
        String name = rs.getString("name");
        String email = rs.getString("email");
        String desig = rs.getString("designation");
        String dept = rs.getString("department");
        String rights = rs.getString("rights");
        ans+="<tr>";
        ans+="<td>"+name+"</td>";
        ans+="<td>"+email+"</td>";
        ans+="<td>"+desig+"</td>";
        ans+="<td>"+dept+"</td>";
        ans+="<td>"+rights+"</td>";
        ans+="<td><a class=\"click\" href=\"screen_admin_edit.jsp?id= "+id+" \">Edit</a></td>";
        ans+="<td><a class=\"click\" onclick=\"deleteAlert("+id+")\" >Delete</a></td>";
        ans+="</tr>";
        

    }  

    ans+="</table>";
    if(count==0){
        ans = "<br><h3>No Admins Found!!</h3>";
    }

    response.getWriter().println(ans); 
    con.close();  
    
}
catch(Exception e){
out.println("error.... <br>"+e);
}      
        

%>
