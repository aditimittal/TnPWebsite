<%-- 
    Document   : company_view
    Created on : 29 Oct, 2017, 11:00:33 PM
    Author     : ashim
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="connection.jsp" %>--%>
<%@include file="common_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
        <style>
            td{
                width:50%;
            }
            h1, .lab, .lab1,.lab2, .left-align{font-family: 'Helvetica', 'Arial', sans-serif;}
            select{
            width: 20%;    
            padding: 12px 20px;
            margin-left: 2em;
            margin-top: 1em;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            }

            input[type=text]{
            width: 30%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            }

            input[type=date]{
                width: 20%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            }

           input[type=submit]{
                width: 15%;
                background-color:#39843c;
                border: none;
                color: white;
                padding: 1em 2em;
                text-decoration: none;
                font-size: 1em;
                margin: 4px 2px;
                cursor: pointer;
            }

        /*    input[type=submit]:hover {
                background-color: #666666;
            }*/

            .del{
             height: 2em;
             width: 2em;
             color: white
            }
            .add{
                float: right;
                width: auto;
                height: auto;
                background-color: transparent;
                color: white;
                padding: 0.5em;

                border: none;
                border-radius: 4px;
                cursor: pointer;
                   float: right;
                /*margin-top: -5%;*/
                margin-right: 13%;

            }
            .add:hover{
                background-color: #666666;
                border-radius: 50%;
            }
            .container{
                width: 100%;
            }
            
            .table_form{
                width: 95%;
                margin-left: 2.5%;
                border: none;
            }

            td,tr{
                border: none;
            }

            .table_form > tr{
                padding-left: 0%;

            }

            .left-align-1{
                float: left;
                margin-left: 10%;
                text-align: left;
                
            }
            .left-align-2{
                float: left;
                margin-left: 20%;
                text-align: left;
            }
             .left-align-5{
                float: left;
                margin-left: -40%;
                text-align: left;
            }
            .left-align-3{
                float: left;
                width: 50%;
                margin-left: -20em;
                text-align: left;
                word-wrap:break-word;
            }
            .topic-1{
                text-align: left;
                margin-left: 0.5em;
            }

            @media (max-width:500px) {
                 
  h1,h2 {
   font-size:100%;
   align:center;/*The width is 100%, when the viewport is 800px or smaller*/
  }
  h1{
   font-size:120%;
   align:center;/*The width is 100%, when the viewport is 800px or smaller*/
  }
  .add{
                float: right;
                width: auto;
                height: auto;
                background-color: transparent;
                color: white;
                padding: 0.5em;

                border: none;
                border-radius: 4px;
                cursor: pointer;
                   float: right;
                margin-top: -5%;
                margin-right: 13%;

            }
            .del{
             height: 1.5em;
             width: 1.5em;
             color: white;
            /* margin-right: 70%;*/
            }
            
       }

</style>
<script>
    function deleteAlert(id, year){
        var result = confirm("Want to delete?");
        if (result) {     
            deleteData(id,year);
        }
    }

    function deleteData(id, year){
        if(typeof  XMLHttpRequest !== "undefined"){
            xmlHttp = new XMLHttpRequest();
        }
        else if(window.ActiveXObject){
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        if(xmlHttp === null){
            alert("Browser does not support XMLHTTP Request");
            return;
        }
        
        var url = "company_delete.jsp?id="+id;
        url+="&year_db="+year;


        xmlHttp.onreadystatechange = del;
        xmlHttp.open("POST", url, true);
        xmlHttp.send(null);
    }

    function del(){
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
            
        window.location = "Placement_offer.jsp";
        }
    }
</script>
    </head>
    <body>
         <%! String company_name, company_type, type, company_description, industry, job_location, profile_type, profile;
         String ctc_last_year, ctc_current_year, ctc_breakup, student_poc, company_poc, contact_no, email_addr, interview_location;
         String online_test_date,visit_date, day_visiting;
         String year_db, id;
         %>
         
    <% 
        year_db = request.getParameter("year_db");
        id = request.getParameter("id");
        
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db+"?zeroDateTimeBehavior=convertToNull","root","");
        
        String sql1 = "select * from company_details where company_id = "+id;
        Statement stm1= con1.createStatement();
        ResultSet rs1 = stm1.executeQuery(sql1);
        
        while(rs1.next()){
            company_name = rs1.getString("company_name");
            company_type = rs1.getString("company_type");
            type = rs1.getString("type");
            company_description = rs1.getString("company_description");
            industry = rs1.getString("industry");
            job_location = rs1.getString("job_location");
            profile_type = rs1.getString("profile_type");
            profile = rs1.getString("profile");
            ctc_last_year = rs1.getString("ctc_last_year");
            ctc_current_year = rs1.getString("ctc_current_year");
            ctc_breakup = rs1.getString("ctc_breakup");
            student_poc = rs1.getString("student_poc");
            company_poc = rs1.getString("company_poc");
            contact_no = rs1.getString("contact_no");
            email_addr = rs1.getString("email_addr"); 
            interview_location = rs1.getString("interview_location"); 
            online_test_date = rs1.getString("online_test_date");
            visit_date = rs1.getString("visit_date");
            day_visiting = rs1.getString("day_visiting");
        }
        
        String od;
        if(online_test_date!=null){
            SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = original_format.parse(online_test_date);
            SimpleDateFormat date_format = new SimpleDateFormat("dd-MM-yyyy");
            od = date_format.format(date);
        }
        else{
            od = "Online Test Date not decided";
        }
        
        String vd;
        String days;
        
        if(visit_date!=null){
            SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = original_format.parse(visit_date);
            SimpleDateFormat date_format = new SimpleDateFormat("dd-MM-yyyy");
            vd = date_format.format(date);
            days = day_visiting+" Days";
        }
        else{
            vd = "Visiting Date not decided";
            days = "Duration Unknown";
        }
        
        
        String ctc_l_y;
        
        if(ctc_last_year.equalsIgnoreCase("0")){
            ctc_l_y = "Company did not Visit Last Year";
        }
        else{
            ctc_l_y = ctc_last_year;
        }
        
        
        stm1.close();
        rs1.close(); 
    %>
    <br>
        <section>
			<article class="box">
                            <br>
                            <h1  align="center" style="color:#39843c;">PLACEMENT OFFER</h1>
                            <% out.println("<a class=\"add\" onclick=\"deleteAlert('"+request.getParameter("id")+"','"+request.getParameter("year_db")+"')\" ><img src=\"images/delete.png\" class=\"del\" /></a>"); %> 
                            <a class="add" style="margin-right: 5%" href="company_edit.jsp?id=<%= id %>&year_db=<%= year_db %>"><img  src="images/edit2.png" class="del"/></a>
                            
                            <br>
                                <div>
                                    <% out.println("<form action=\"company_edit.jsp?id="+id+"&year_db="+year_db+"\" method=\"post\">"); %>
                                    
                                    <h2 class="topic-1">BASIC DETAILS</h2>
                                    <br>
                                    <table class="table">
                                        <tr class="row">
                                            <td><label class="left-align-1">Company Name :</label></td>
                                            <td><span class="lab2 left-align-2"><%= company_name %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Offer For :</label></td>
                                            <td><span class="lab2 left-align-2"><%= type %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Profile :</label></td>
                                            <td><span class="lab2 left-align-2"><%= profile %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">CTC / Stipent :</label></td>
                                            <td><span class="lab2 left-align-2"><%= ctc_current_year %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Job Location :</label></td>
                                            <td><span class="lab2 left-align-2"><%= job_location %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Profile Type :</label></td>
                                            <td><span class="lab2 left-align-2"><%= profile_type %></span></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <h2 class="topic-1">COMPANY'S VISITING DETAILS</h2>
                                    <br>
                                    <table class="table">
                                        <tr class="row">
                                            <td><label class="left-align-1">Online Test Date :</label></td>
                                            <td><span class="lab2 left-align-2"><%= od %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Visiting Date :</label></td>
                                            <td><span class="lab2 left-align-2"><%= vd %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Duration of Recruitment Process :</label></td>
                                            <td><span class="lab2 left-align-2"><%= days %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Interview Location :</label></td>
                                            <td><span class="lab2 left-align-2"><%= interview_location %></span></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <h2 class="topic-1">OFFICIAL DETAILS</h2>
                                    <br>
                                    <table class="table">
                                        <tr class="row">
                                            <td><label class="left-align-1">Student POC :</label></td>
                                            <td><span class="lab2 left-align-2"><%= student_poc %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Copmany POC :</label></td>
                                            <td><span class="lab2 left-align-2"><%= company_poc %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Company's HRD Contact :</label></td>
                                            <td><span class="lab2 left-align-2"><%= contact_no %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Company's HRD Email :</label></td>
                                            <td><span class="lab2 left-align-2"><%= email_addr %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">CTC for last Year :</label></td>
                                            <td><span class="lab2 left-align-2  "><%= ctc_l_y %></span></td>
                                        </tr>
                                    </table>
                                    <br>
                                    <h2 class="topic-1">OTHER DETAILS</h2>
                                    <br>
                                    <table class="table">
                                        <tr class="row">
                                            <td><label class="left-align-1">Company Type :</label></td>
                                            <td><span class="lab2 left-align-2"><%= company_type %></span></td>
                                        </tr>
                                        <tr class="row">
                                            <td><label class="left-align-1">Industry :</label></td>
                                            <td><span class="lab2 left-align-2"><%= industry %></span></td>
                                        </tr>
                                    </table>
                                    
                                    <label class="left-align-1">&nbsp;&nbsp;Company Description :</label><br><br>
                                    <span class="lab2 left-align-3"><%= company_description %></span>
                                    <br><br><br><br>
                                    <label class="left-align-1">&nbsp;&nbsp;CTC Breakup :</label><br><br>
                                    <span class="lab2 left-align-3"> <%= ctc_breakup %></span>
                                    
                                    <br><br><br>
                                    <h2 class="topic-1">ELIGIBILITY CRITERIA</h2>
                                     <%
                                       sql1 = "SELECT * FROM `company_branch` where company_id="+request.getParameter("id");
                                        stm1 = con1.createStatement();
                                        rs1 = stm1.executeQuery(sql1);
                                        String ans = "";
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
                                        +"</thead>";

                                        int count = 0;
                                        while(rs1.next()){
                                            count++;
                                            ans += "<tr>";
                                            if(rs1.getString("department").equalsIgnoreCase("null")){
                                                String sql2 = "SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"'";
                                                Statement stm2 = con1.createStatement();
                                                ResultSet rs2 = stm2.executeQuery(sql2);
                                                String course = null, branch = null; 
                                                while(rs2.next()){
                                                    course = rs2.getString("Programme_Name");
                                                }

                                                rs2.close();
                                                stm2.close();
                                                ans +="<td>"+course+"</td>"; 
                                                ans +="<td> - </td>"; 
                                            }else{

                                                String sql2 = "SELECT Branch_Name,Programme_Name FROM `branch_codes` WHERE "
                                                    + "branch_codes.Branch_Code = '"+rs1.getString("department")+"' and "
                                                    + "Programme_Name = "
                                                    + "(SELECT Programme_Name from programme_codes WHERE programme_codes.Programme_Code = '"+rs1.getString("course")+"')";
                                                Statement stm2 = con1.createStatement();
                                                ResultSet rs2 = stm2.executeQuery(sql2);
                                                String course = null, branch = null; 
                                                while(rs2.next()){
                                                    course = rs2.getString("Programme_Name");
                                                    branch = rs2.getString("Branch_Name"); 
                                                }

                                                rs2.close();
                                                stm2.close();

                                                ans +="<td>"+course+"</td>"; 
                                                ans +="<td>"+branch+"</td>"; 
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
                                            
                                            ans += "</tr>";
                        //                   
                                        }


                                        rs1.close();
                                        stm1.close();

                                        ans += "</table>";

                                        if(count==0){
                                            ans = "No eligibility criteria added yet.";
                                        }

                                        
                                    %>
                                    
                                    
                                    <a class="add" style="margin-right: 5%" href="company_branch_add.jsp?id=<%out.println(request.getParameter("id"));%>"><img src="images/edit2.png" class="del"/><span style="color: black"><% if(count==0){out.println("Add");}else{out.println("Edit");}%></span></a> 
                                    <br>
                                    <%= ans %>
                                    
                                    <br><br>
                                    
                                    
                                        
                                        <input type="submit" value="EDIT">
                                    </form>
                                </div>
				
			</article>
                </section>
    </body>
    <br><br><br>
    
     <footer><%@include file="footer2.jsp" %></footer>
</html>
   