<%-- 
    Document   : Placement_offer_SQL
    Created on : 4 Jan, 2018, 8:22:55 PM
    Author     : ashima
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
    </head>
    <body>
       <%
           try{
            String year_db = request.getParameter("year_db");
            String company_for = request.getParameter("company_for");
            String heading = null;
             if(company_for.equalsIgnoreCase("FTE"))
                 heading = "Current CTC";
             else
                 heading = "Stipend";
            String ans ;

             Class.forName("com.mysql.jdbc.Driver");  
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db+"?zeroDateTimeBehavior=convertToNull","root","");

             String sql = "select * from company_details where type = '"+company_for+"' ";
             Statement stm = con.createStatement();
             
             ResultSet rs = stm.executeQuery(sql);
            ans = "<table><tr><th>Company Name</th><th>Profile</th><th>Type</th>"+
                   "<th>"+heading+"</th><th>Online Test Date</th><th>Visiting Date</th>";
            ans +="<th></th><th></th><th></th>"
                     + "</tr>";
            System.out.println(sql);

             int count = 0;
             while(rs.next()){
                 count++;
                 String online_date = rs.getString("online_test_date");
                 String visiting_date = rs.getString("visit_date");

                 Date today = new Date();

                 ans += "<tr>";
                 ans += " <td>"+rs.getString("company_name")+"</td>"+
                         "<td>"+rs.getString("profile")+"</td>"+ 
                         "<td>"+rs.getString("type")+"</td>"+
                         "<td>"+rs.getString("ctc_current_year")+"</td>";
                 if(online_date == null){
                     ans+="<td> - </td>";
                 }else{
                     ans+="<td>"+online_date+"</td>";
                 }
                 if(visiting_date == null){
                     ans+="<td> - </td>";
                 }else{
                     ans+="<td>"+visiting_date+"</td>";
                 }        

                 ans+="<td><a class=\"click\" onclick=\"edit("+rs.getInt("company_id")+")\" >Edit</a></td>"; 
                 ans+="<td><a class=\"click\" onclick=\"deleteAlert("+rs.getInt("company_id")+")\" >Delete</a></td>"; 
                 ans+="<td><a class=\"click\" onclick=\"downloadData("+rs.getInt("company_id")+")\" >Download</a></td>";
                 ans+="</tr>";


             }

             ans+="</table>";


             if(count==0){
                 ans = " <br><br><h1 style=\"color: red\">No Company Records Found</h1>";
             }

             stm.close();
             rs.close();
             con.close();
                            
               response.getWriter().println(ans);
           }catch(Exception e){
               response.getWriter().println("error.....<br>"+e);
           }
       %>
    </body>
</html>
