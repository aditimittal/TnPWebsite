<%-- 
    Document   : company_branch_gui
    Created on : 25 Jan, 2018, 6:21:22 PM
    Author     : ashim
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! 
    String current_month, current_year;
    int year_use; 
    Connection con1;
%>
<%
    current_month = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
    current_year = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());

    if(Integer.parseInt(current_month) < 8){
        year_use = Integer.parseInt(current_year) - 1;    
    }
    else{
        year_use = Integer.parseInt(current_year);    
    }
%>
<%
    Class.forName("com.mysql.jdbc.Driver");  
    con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_use+"?zeroDateTimeBehavior=convertToNull","root","");
%>


<%
String type = request.getParameter("type");

if(type.equalsIgnoreCase("branch")){
    String programme = request.getParameter("value");
    
    String sql1 = "SELECT * FROM `branch_codes` WHERE branch_codes.Programme_Name = "
            + "(SELECT Programme_Name FROM programme_codes where programme_codes.Programme_Code = '"+programme+"')";
    Statement stm1 = con1.createStatement();
    ResultSet rs1 = stm1.executeQuery(sql1);
    
    String ans = "<select name=\"branch\" id=\"branch\">";
    ans += "<option selected disabled>Select Branch</option>";
    int count = 0;
    while(rs1.next()){
        ans += "<option value="+rs1.getString("Branch_Code") +">"+rs1.getString("Branch_Name") +"</option>";
        count++;
    }
    ans += "</select>";

    rs1.close();
    stm1.close();
    
    if(count == 0){
        ans = "";
    }
    
    sql1 = "SELECT Programme_Type FROM `programme_codes` WHERE Programme_Code = '"+request.getParameter("value") +"'";
    stm1 = con1.createStatement();
    rs1 = stm1.executeQuery(sql1);
    ans += "#";
    while(rs1.next()){
        ans += rs1.getString("Programme_Type");
    }
    rs1.close();
    stm1.close();
    
    response.getWriter().println(ans); 
}
else if(type.equalsIgnoreCase("insert")){
    String cid = request.getParameter("cid");
    String batch = request.getParameter("batch");
    String programme = request.getParameter("programme");
    String branch = request.getParameter("branch");
    Float tenth_perc = Float.valueOf(request.getParameter("tenth_perc"));
    Float twelfth_perc = Float.valueOf(request.getParameter("twelfth_perc"));
    Float undergrad_perc = Float.valueOf(request.getParameter("undergrad_perc"));
    Float postgrad_perc = Float.valueOf(request.getParameter("postgrad_perc"));
    int active_backs = Integer.parseInt(request.getParameter("active_backs"));
    int dead_backs = Integer.parseInt(request.getParameter("dead_backs"));
    
    String sql3 = "select * from company_branch where company_id = '"+cid+"' and course = '"+programme+"' and department ='"+branch+"'";
    
    Statement stm3 = con1.createStatement();
    ResultSet rs3 = stm3.executeQuery(sql3);
    int cnt =0;
    while(rs3.next()){
        cnt++;
    }
    rs3.close();
    stm3.close();
    String ans;
    if(cnt>0){
        ans = "Eligibility Criteria for this program already exist";
    }
    else{
        
    String sql1 = "INSERT INTO `company_branch`(`company_id`, `department`, `course`, `batch`, `elig_tenth`, `elig_twelfth`, `elig_grad`, `elig_pgrad`, `active_backs`, `dead_backs`)"
            + " VALUES ('"+cid+"','"+branch+"','"+programme+"','"+batch+"','"+tenth_perc+"','"+twelfth_perc+"','"+undergrad_perc+"','"+postgrad_perc+"',"+active_backs+","+dead_backs+")";
    
    PreparedStatement ps = con1.prepareStatement(sql1);
    ps.executeUpdate();
    ps.close();
    
    ans = "Eligibility Criteria added";
    }
    ans += "#";
    
    String sql1 = "SELECT * FROM `company_branch` where company_id="+request.getParameter("cid");
    Statement stm1 = con1.createStatement();
    ResultSet rs1 = stm1.executeQuery(sql1);

    ans  += "<table class=\"table\">"
    +"<thead>"
    +"<th>Program</th>"
    +"<th>Branch</th>"
    +"<th>10th eligibility</th>"
    +"<th>12th eligibility</th>"
    +"<th>undergraduate eligibility</th>"
    +"<th>postgraduate eligibility</th>"
    +"<th>Active Backs</th>"
    +"<th>Dead Backs</th>"
    +"<th></th>"
    +"</thead>";

    int count = 0;
    while(rs1.next()){
        count++;
        ans += "<tr>";
        if(rs1.getString("department").equalsIgnoreCase("null")){
            String sql2 = "SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"'";
            Statement stm2 = con1.createStatement();
            ResultSet rs2 = stm2.executeQuery(sql2);
            String c = null, b = null; 
            while(rs2.next()){
                c = rs2.getString("Programme_Name");
            }

            rs2.close();
            stm2.close();
            ans +="<td>"+c+"</td>"; 
            ans +="<td> - </td>"; 
        }else{

            String sql2 = "SELECT Branch_Name,Programme_Name FROM `branch_codes` WHERE "
                + "branch_codes.Branch_Code = '"+rs1.getString("department")+"' and "
                + "Programme_Name = "
                + "(SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"')";
            Statement stm2 = con1.createStatement();
            ResultSet rs2 = stm2.executeQuery(sql2);
            String c = null, b = null; 
            while(rs2.next()){
                c = rs2.getString("Programme_Name");
                b = rs2.getString("Branch_Name"); 
            }

            rs2.close();
            stm2.close();

            ans +="<td>"+c+"</td>"; 
            ans +="<td>"+b+"</td>"; 
        }
        ans +="<td>"+rs1.getString("elig_tenth")+"</td>"; 
        ans +="<td>"+rs1.getString("elig_twelfth")+"</td>"; 
        ans +="<td>"+rs1.getString("elig_grad")+"</td>"; 

        if(rs1.getString("elig_pgrad").equalsIgnoreCase("0")){
            ans +="<td> - </td>"; 
        }else{
            ans +="<td>"+rs1.getString("elig_pgrad")+"</td>"; 
        }
        ans +="<td>"+rs1.getString("active_backs")+"</td>"; 
        ans +="<td>"+rs1.getString("dead_backs")+"</td>"; 
        ans += "<td><a class=\"click\" onclick=\"deleteAlert("+request.getParameter("cid")+",'"+rs1.getString("course")+"','"+rs1.getString("department")+"')\" >Delete</a></td>"; 
        ans += "</tr>";
//                   
    }


    rs1.close();
    stm1.close();

    ans += "</table>";

    if(count==0){
        ans = "No eligibility criteria added yet.";
    }
    response.getWriter().println(ans); 
}
else if(type.equals("delete")){
    String id = request.getParameter("value");
    
    String sql1 = "delete from company_branch where company_id = '"+id+"' and course = '"+request.getParameter("programme")+"' and department = '"+request.getParameter("branch") +"'";
    PreparedStatement ps = con1.prepareStatement(sql1);
    ps.executeUpdate();
    
    
    String ans = "Eligibility criteria deleted";
    ans+="#";
    
    sql1 = "SELECT * FROM `company_branch` where company_id="+id;
    Statement stm1 = con1.createStatement();
    ResultSet rs1 = stm1.executeQuery(sql1);

    ans  += "<table class=\"table\">"
    +"<thead>"
    +"<th>Program</th>"
    +"<th>Branch</th>"
    +"<th>10th eligibility</th>"
    +"<th>12th eligibility</th>"
    +"<th>undergraduate eligibility</th>"
    +"<th>postgraduate eligibility</th>"
    +"<th>Active Backs</th>"
    +"<th>Dead Backs</th>"
    +"<th></th>"
    +"</thead>";

    int count = 0;
    while(rs1.next()){
        count++;
        ans += "<tr>";
        if(rs1.getString("department").equalsIgnoreCase("null")){
            String sql2 = "SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"'";
            Statement stm2 = con1.createStatement();
            ResultSet rs2 = stm2.executeQuery(sql2);
            String c = null, b = null; 
            while(rs2.next()){
                c = rs2.getString("Programme_Name");
            }

            rs2.close();
            stm2.close();
            ans +="<td>"+c+"</td>"; 
            ans +="<td> - </td>"; 
        }else{

            String sql2 = "SELECT Branch_Name,Programme_Name FROM `branch_codes` WHERE "
                + "branch_codes.Branch_Code = '"+rs1.getString("department")+"' and "
                + "Programme_Name = "
                + "(SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"')";
            Statement stm2 = con1.createStatement();
            ResultSet rs2 = stm2.executeQuery(sql2);
            String c = null, b = null; 
            while(rs2.next()){
                c = rs2.getString("Programme_Name");
                b = rs2.getString("Branch_Name"); 
            }

            rs2.close();
            stm2.close();

            ans +="<td>"+c+"</td>"; 
            ans +="<td>"+b+"</td>"; 
        }
        ans +="<td>"+rs1.getString("elig_tenth")+"</td>"; 
        ans +="<td>"+rs1.getString("elig_twelfth")+"</td>"; 
        ans +="<td>"+rs1.getString("elig_grad")+"</td>"; 

        if(rs1.getString("elig_pgrad").equalsIgnoreCase("0")){
            ans +="<td> - </td>"; 
        }else{
            ans +="<td>"+rs1.getString("elig_pgrad")+"</td>"; 
        }
        ans +="<td>"+rs1.getString("active_backs")+"</td>"; 
        ans +="<td>"+rs1.getString("dead_backs")+"</td>"; 
        ans += "<td><a class=\"click\" onclick=\"deleteAlert("+id+",'"+rs1.getString("course")+"','"+rs1.getString("department")+"')\" >Delete</a></td>"; 
        ans += "</tr>";
//                   
    }


    rs1.close();
    stm1.close();

    ans += "</table>";

    if(count==0){
        ans = "Eligibility criteria deleted";
        ans +="#";
        ans += "No eligibility criteria added yet.";
    }
    
    response.getWriter().println(ans); 
    
    
}
else if(type.equalsIgnoreCase("done")){
    String id = request.getParameter("value");
    
    String sql1 = "select * from company_branch where company_id = "+id;
    
    Statement stm1 = con1.createStatement();
    ResultSet rs1 = stm1.executeQuery(sql1);
    
    int count=0;
    while(rs1.next()){
        count++;
    }
    
    rs1.close();
    stm1.close();
    
    String ans = "success";
    
    if(count==0){
        ans = "fail";
    }
    
    response.getWriter().println(ans); 
}


con1.close();
%>
