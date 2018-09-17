<%-- 
    Document   : company_delete
    Created on : 29 Oct, 2017, 11:32:10 PM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>

        <%! String id; %>
        <%! ResultSet res; %>
        <%! Statement stmt; %>
        <%! String company_name, type, profile; %>
        
        <%
        try{
            String year_db = request.getParameter("year_db");
            
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db,"root","");
        id = request.getParameter("id");
        
        stmt = (Statement) con1.createStatement();
        String log_sql = "Select *from company_details where company_id="+id;
        res = stmt.executeQuery(log_sql);
        
        String username = (String)session.getAttribute("name");
        while (res.next()){
            company_name = res.getString("company_name");
            type = res.getString("type");
            profile = res.getString("profile");
        }
        
        res.close();
        stmt.close();
        
        String sql = "delete from company_branch where company_id ="+id;
        PreparedStatement st = con1.prepareStatement(sql);
        st.executeUpdate();
        sql = "delete from company_details where company_id ="+id;
        st = con1.prepareStatement(sql);
        st.executeUpdate();
        
        st.close();
        //Entry in logs
        

        String msg = "Offer set for "+company_name+" "+type+" and "+profile; 
        insertLog(username, "Company Deleted ", msg );
        
        con1.close();
        
        year_db = request.getParameter("year_db");
        String company_for = request.getParameter("company_for");
        String heading = null;
         if(company_for.equalsIgnoreCase("FTE"))
             heading = "Current CTC";
         else
             heading = "Stipend";
        String ans ;

         Class.forName("com.mysql.jdbc.Driver");  
         Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db+"?zeroDateTimeBehavior=convertToNull","root","");

         String sql1 = "select * from company_details where type = '"+company_for+"' ";
         Statement stm = con.createStatement();
         ResultSet rs = stm.executeQuery(sql1);
          ans = "<table><tr><th>Company Name</th><th>Profile</th><th>Type</th>"+
                 "<th>"+heading+"</th><th>Online Test Date</th><th>Visiting Date</th>";
          ans +="<th></th><th></th>"
                   + "</tr>";


         int count = 0;
         while(rs.next()){
             count++;
             String online_date = rs.getString("online_test_date");
             String visiting_date = rs.getString("visit_date");

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
         out.println("error...<br>"+e);   
        }
        
        
        
        %>
    </body>
</html>
