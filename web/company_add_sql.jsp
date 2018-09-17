<%-- 
    Document   : company_add_sql
    Created on : 23 Jan, 2018, 6:19:37 PM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
         
//        ******* selecting which database to work on ******
        String current_month, current_year, Text = null;  
        int year_use; 
        
        current_month = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
        current_year = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());

        if(Integer.parseInt(current_month) < 8){
            year_use = Integer.parseInt(current_year) - 1;    
        }
        else{
            year_use = Integer.parseInt(current_year);    
        }
        
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_use,"root","");
        
//        ************** checking if the offer already exist **************
        
        String sql1 = "select * from company_details where company_name = '"+company_name+"' and profile='"+profile+"' and type='"+type+"' ";
                        
        Statement st1 = con1.createStatement();
        ResultSet rs1 = st1.executeQuery(sql1);
        
        int count =0;
        if(rs1.next()){
            Text = "This offer already exist";
            count = 1;
        }
        
        rs1.close();
        st1.close();
        
        
//        ********************* if the offer doesnt exist then add the offer *****************************
        if(count == 0){
            sql1 = "INSERT INTO `company_details`(`company_name`, `company_type`, `type`, `company_description`, `industry`, `job_location`, `profile_type`, `profile`, `ctc_last_year`, `ctc_current_year`,"
                    + " `ctc_breakup`, `student_poc`, `company_poc`, `contact_no`, `email_addr`, `interview_location`, `online_test_date`, `visit_date`, `day_visiting`)"
                    + " VALUES ('"+company_name+"','"+company_type+"','"+type+"','"+description+"','"+industry+"','"+job_location+"','"+profile_type+"','"+profile+"',"+ctc_last_year+","+ctc_current_year+","
                    + "'"+ctc_breakup+"','"+student_poc+"','"+company_poc+"','"+contact+"','"+email+"','"+interview_location+"','"+online_test_date+"','"+visiting_date+"',"+day_visiting+")";
            PreparedStatement ps = con1.prepareStatement(sql1);
            ps.executeUpdate();
            ps.close();
            
//            ********************* passing the id of the offer created ************************************
            sql1 = "select company_id from company_details where company_name = '"+company_name+"'  and profile='"+profile+"' and type='"+type+"' ";
            st1 = con1.createStatement();
            rs1 = st1.executeQuery(sql1);
                            
            int id = 0;
                                    
            while(rs1.next()){
                id = rs1.getInt(1);
            }
            
            rs1.close();
            st1.close();
            
            
            Text = Integer.toString(id);    
        }
        
        response.getWriter().println(Text);         
        
            
            
            
        }catch(Exception e){
            out.println("Error...<br>"+e);
            response.getWriter().println("Error...<br>"+e);   
        }
        
        %>
    