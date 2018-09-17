<%-- 
    Document   : company_edit_sql
    Created on : 30 Oct, 2017, 1:20:06 AM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="connection.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
        try{

        // *********** getting all the data from the form ************
        String company_name = request.getParameter("company_name");
        String company_type = request.getParameter("company_type");
        String type = request.getParameter("type");
        String profile = request.getParameter("profile");
        String profile_type = request.getParameter("profile_type");
        String industry = request.getParameter("industry");
        String job_location = request.getParameter("job_location");
        String inter_loc_opt = request.getParameter("r1");
        String batch = request.getParameter("batch");
        String description = request.getParameter("description");
        String ctc_last_year = request.getParameter("ctc_last_year");
        String ctc_current_year = request.getParameter("ctc_current_year");
        String ctc_breakup = request.getParameter("ctc_breakup");
        String student_poc = request.getParameter("student_poc");
        String company_poc = request.getParameter("company_poc");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String online_date_ans = request.getParameter("ans1");
        String visit_date_ans = request.getParameter("ans2");
        String interview_location = "College Campus";
        out.println(inter_loc_opt+"-----");
        
        
        if(inter_loc_opt.equalsIgnoreCase("Other")){
            interview_location = request.getParameter("interview_location");                
        }

        String online_test_date = "0000-00-00";
        String visiting_date = "0000-00-00";
        String day_visiting = null;
        if(online_date_ans.equalsIgnoreCase("Yes")){
            online_test_date = request.getParameter("online_test_date");
        }
        if(visit_date_ans.equalsIgnoreCase("Yes")){
            visiting_date = request.getParameter("visiting_date");
            day_visiting = request.getParameter("day_visiting");
        }
        
        int d = 0;
        if(day_visiting!=null){
            d = Integer.parseInt(day_visiting);
        }
        
         
//        ******* selecting which database to work on ******
        String year_db = request.getParameter("year_db");
        String id = request.getParameter("id");
        
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db,"root","");
        
//        ********************* if the offer doesnt exist then add the offer *****************************
        
            String sql1 = "UPDATE `company_details` SET `company_name`='"+company_name+"',`company_type`='"+company_type+"',`type`='"+type+"',`company_description`='"+description+"',`industry`='"+industry+"',"
                    + "`job_location`='"+job_location+"',`profile_type`='"+profile_type+"',`profile`='"+profile+"',`ctc_last_year`='"+ctc_last_year+"',`ctc_current_year`='"+ctc_current_year+"',`ctc_breakup`='"+ctc_breakup+"',"
                    + "`student_poc`='"+student_poc+"',`company_poc`='"+company_poc+"',`contact_no`='"+contact+"',`email_addr`='"+email+"',`interview_location`='"+interview_location+"',"
                    + "`online_test_date`='"+online_test_date+"',`visit_date`='"+visiting_date+"',`day_visiting`="+d+" WHERE company_id="+id;
            PreparedStatement ps = con1.prepareStatement(sql1);
            ps.executeUpdate();
            ps.close();
            
            sql1 = "UPDATE `company_branch` SET `batch`='"+batch+"' WHERE company_id = '"+id+"'";
            ps = con1.prepareStatement(sql1);
            ps.executeUpdate();
            ps.close();
            String msg = "Placement offer for "+company_name+","+type+","+profile+" has been edited"; 
            insertLog(request.getParameter("idx"), "Company Offer Edited ", msg );

            
        
        response.sendRedirect("company_view.jsp?id="+id+"&year_db="+year_db); 
        
            
            
            
        }catch(Exception e){
            out.println("Error...<br>"+e);
            response.getWriter().println("Error...<br>"+e);   
        }
        
        %>
    
