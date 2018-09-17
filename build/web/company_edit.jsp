<%-- 
    Document   : company_edit
    Created on : 29 Oct, 2017, 11:55:29 PM
    Author     : ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="common_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
        <style>
            
    select{
         width: 60%;
        padding: 12px 20px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        float: left;
        margin-left: 0.5em;
    }
    
    input[type=text]{
        width: 60%;
        padding: 12px 20px;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        float: left;
        margin-left: 0.5em;
        margin: 8px 0;
    }
    
    input[type=date]{
        width: 30%;
        float: left;
        margin-left: 0.5em;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit] {
        width: 40%;
        background-color:#39843c;
        border: none;
        color: white;
        padding: 1em 2em;
        text-decoration: none;
        font-size: 1em;
        margin: 4px 2px;
        cursor: pointer;
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
    
    .left-align{
        float: left;
        margin-left: 0.5em;
    }
    .div_check{
        margin-left: 3em;
    }
    h4{
       color: #ff0033; 
    }
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
           margin-top: -5%;
           margin-right: 13%;

       }
       .add:hover{
           background-color: #666666;
           border-radius: 50%;
       }

        </style>
        
        <script>
            function validate(id){
                
                if(document.getElementById("inter_loc2").checked){
                    var x = document.getElementById("interview_location").value;
                    if(x === ""){
                        window.alert("Interview Location Not entered.");
                        document.getElementById("interview_location").focus();
                        return false;
                    }
                }
                
                if(document.getElementById("ans1_1").checked){
                    var x = document.getElementById("online_test_date").value;
                    
                    if(!x){
                        window.alert("Online Test Date not selected!");
                        document.getElementById("online_test_date").focus();
                        return false;
                    }
                }
                
                if(document.getElementById("ans2_1").checked){
                    var x = document.getElementById("visiting_date").value;
                    var y = document.getElementById("day_visiting").value;
                    if(!x){
                        alert("Visiting Date not selected!");
                        document.getElementById("visiting_date").focus();
                        return false;
                    }
                    else if(y === ""){
                        alert("No. of Visiting days not entered!");
                        document.getElementById("day_visiting").focus();
                        return false;
                    }
                }
            return true;
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
    
     <br>	<br><br>
		<div class="clear"> </div>
		<section>
			<article class="box">
				<h1  style="color:#39843c;">EDIT PLACEMENT OFFER</h1>
                                <a class="add" style="margin-right: 5%" href="company_branch_add.jsp?id=<%out.println(request.getParameter("id"));%>"><img src="images/edit2.png" class="del"/><span style="color: black"><br>Edit Eligibility Criteria</span></a> 
                                <h4 id="status" ></h4>
                                
                                <% out.println("<form onsubmit=\"return validate()\" method=\"POST\" action=\"company_edit_sql.jsp?id="+id+"&year_db="+year_db+"\">"); %>
				<br>
                                <div id="form">
                                    
                                        <table class="table_form">
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_name">Company Name :</label>
                                                    <br><br>
                                                    <input type="text" name="company_name" id="company_name" placeholder="Enter company's name" value="<%= company_name %>" />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_type">Company Type :</label>
                                                    <br><br>
                                                    <select name="company_type" id="company_type" >
                                                        <option value="Regular Recruiter" <% if(company_type.equalsIgnoreCase("Regular Recruiter")){out.println("selected");} %>>Regular Recruiter</option>
                                                        <option value="Elite Recruiter" <% if(company_type.equalsIgnoreCase("Elite Recruiter")){out.println("selected");} %>>Elite Recruiter</option>
                                                        <option value="Mass Recruiter" <% if(company_type.equalsIgnoreCase("Mass Recruiter")){out.println("selected");} %>>Mass Recruiter</option>
                                                    </select>
                                                </td>
                                            </tr><!--
-->                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="type">Offer Type :</label>
                                                    <br><br>
                                                    <select name="type" id="type" style="width: 40%" onchange="selectBatch()">
                                                        <option value="FTE" <% if(type.equalsIgnoreCase("FTE")){out.println("selected");} %>>FTE</option>
                                                        <option value="Internship" <% if(type.equalsIgnoreCase("Internship")){out.println("selected");} %>>Internship</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="profile">Profile :</label>
                                                    <br><br>
                                                    <input type="text" name="profile" id="profile"  value="<%= profile %>" placeholder="Enter company's profile" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="profile_type">Profile Type :</label>
                                                    <br><br>
                                                    <select name="profile_type" id="profile_type">
                                                        <option value="Technical" <% if(profile_type.equalsIgnoreCase("Technical")){out.println("selected");} %>>Technical</option>
                                                        <option value="Non Technical" <% if(profile_type.equalsIgnoreCase("Non Technical")){out.println("selected");} %>>Non Technical</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="industry">Industry Type :</label>
                                                    <br><br>
                                                    <input type="text" name="industry" id="industry" value="<%= industry %>" placeholder="Enter type of Industry" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="job_location">Job Location :</label>
                                                    <br><br>
                                                    <input type="text" name="job_location" id="job_location" value="<%= job_location %>" placeholder="Enter Job Location" />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="interview_location">Interview Location :</label>
                                                    <% 
                                                    if(interview_location.equals("College Campus")){
                                                        %>
                                                    
                                                    <input id="inter_loc1" style="float:left; margin-left: 0.5em" type="radio" name="r1" value="College Campus" onclick="interviewLocation('College Campus')" checked ><span style="float: left; margin-left: 1em;">College Campus</span>
                                                    <input id="inter_loc2" style="float:left; margin-left: 1em" type="radio" name="r1" value="Other" onclick="interviewLocation('Other')"><span style="float: left; margin-left: 1em;">Other</span>
                                                    <div id="interview_location_div" style="display: none">
                                                        <br><br>
                                                        <input style="float: left; margin-left: 1em;" type="text" name="interview_location" id="interview_location" placeholder="Enter Interview Location" />
                                                    </div>
                                                    
                                                    <%    
                                                    }else{
                                                        %>
                                                    
                                                    <input id="inter_loc1" style="float:left; margin-left: 0.5em" type="radio" name="r1" value="College Campus" onclick="interviewLocation('College Campus')"  ><span style="float: left; margin-left: 1em;">College Campus</span>
                                                    <input id="inter_loc2" style="float:left; margin-left: 1em" type="radio" name="r1" value="Other" onclick="interviewLocation('Other')" checked><span style="float: left; margin-left: 1em;" >Other</span>
                                                    <div id="interview_location_div" style="display: block">
                                                        <br><br>
                                                        <input style="float: left; margin-left: 1em;" type="text" name="interview_location" id="interview_location" placeholder="Enter Interview Location" value="<%= interview_location %>" />
                                                    </div>
                                                    <%
                                                    }
                                                    %>
                                                    <br><br>
                                                    
                                                    
                                                    <script>
                                                        function interviewLocation(loc){
                                                            if(loc === 'Other'){
                                                                document.getElementById("interview_location_div").style.display = "block";
                                                            }
                                                            else{
                                                                document.getElementById("interview_location_div").style.display = "none";
                                                            }
                                                            
                                                        }
                                                    </script>
                                                    
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                                    
                                                    <%! 
                                                        String current_month, current_year;
                                                        int year_use; 
                                                    %>
                                                    <%
                                                    try{
                                                        current_month = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
                                                        current_year = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());

                                                        if(Integer.parseInt(current_month) < 8){
                                                            year_use = Integer.parseInt(current_year) - 1;    
                                                        }
                                                        else{
                                                            year_use = Integer.parseInt(current_year);    
                                                        }
                                                    }catch(Exception e){
                                                        out.println("error...<br>"+e);
                                                    }
                                                    %>

                                                
                                                    <td colspan="2">
                                                    <script>
                                                        function selectBatch(){
                                                            var type = document.getElementById("type").value;
                                                            if(type === 'FTE'){
                                                                document.getElementById("batch").selectedIndex = "0";
                                                            }
                                                            else if(type === 'Internship'){
                                                                document.getElementById("batch").selectedIndex = "1";
                                                            }
                                                        }
                                                    </script>
                                                    
                                                    <select name="batch" id="batch" style="width: 40%" hidden>
                                                        <option value="<%= year_use-3 %>" <% if(company_type.equalsIgnoreCase("FTE")){out.println("selected");} %> ><%= year_use-3 %></option>
                                                        <option value="<%= year_use-2 %>" <% if(company_type.equalsIgnoreCase("Internship")){out.println("selected");} %> ><%= year_use-2 %></option>
                                                    </select>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br>
                                                    <label class="left-align" for="description">Company Description :</label>
                                                    <br><br>
                                                    <textarea style="float: left;margin-left: 0.5em;padding-left: 0" name="description" id="description" rows="4" cols="50" placeholder="Enter the Company's Description" ><%= company_description %></textarea>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="ctc_last_year">CTC (Last Year) :</label>
                                                    <br><br>
                                                    <input type="text" name="ctc_last_year" id="ctc_last_year" value="<%= ctc_last_year %>" placeholder="Enter last year's CTC " />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="ctc_current_year">CTC (Current Year) :</label>
                                                    <br><br>
                                                    <input type="text" name="ctc_current_year" id="ctc_current_year" value="<%= ctc_current_year %>" placeholder="Enter current year CTC"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br>
                                                    <label class="left-align" for="ctc_breakup">CTC Breakup :</label>
                                                    <br><br>
                                                    <textarea style="float: left;margin-left: 0.5em;padding-left: 0" name="ctc_breakup" id="ctc_breakup" rows="6" cols="50" placeholder="Enter CTC Breakup"><%= ctc_breakup %></textarea>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="student_poc">Student POC :</label>
                                                    <br><br>
                                                    <input type="text" name="student_poc" id="student_poc" value="<%= student_poc %>" placeholder="Enter student POC's name"/>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_poc">Company POC :</label>
                                                    <br><br>
                                                    <input type="text" name="company_poc" id="company_poc" value="<%= company_poc %>" required placeholder="Enter company POC's name"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="contact">Contact :</label>
                                                    <br><br>
                                                    <input type="text" name="contact" id="contact"   value="<%= contact_no %>" placeholder="Enter company's contact"/>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="email">Email :</label>
                                                    <br><br>
                                                    <input type="text" name="email" id="email"  value="<%= email_addr %>" placeholder="Enter company's email id"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br><br>
                                                    <label class="left-align" for="online_test_date">Online Test Date Decided?</label>
                                                    <%
                                                    
                                                    if(online_test_date!=null){
                                                    %>
                                                    <input style="margin-left: -30em;"  type="radio" name="ans1" id="ans1_1" value="Yes" onclick="online_check('yes')" checked><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans1" id="ans1_2" value="No" onclick="online_check('no')" ><span style="margin-left: 0.5em;">No</span>
                                                    <br>
                                                    <div style="display: block;" id="online_test_date_div">
                                                        <br>
                                                        <label class="left-align" for="online_test_date">Online Test Date :</label><br><br>
                                                        <input type="date" name="online_test_date" id="online_test_date" value="<%= online_test_date %>"  />
                                                    </div>
                                                    
                                                    <%
                                                    }
                                                    else{
                                                    %>
                                                    
                                                    
                                                    <input style="margin-left: -30em;"  type="radio" name="ans1" id="ans1_1" value="Yes" onclick="online_check('yes')" ><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans1" id="ans1_2" value="No" onclick="online_check('no')" checked><span style="margin-left: 0.5em;">No</span>
                                                    <br>
                                                    <div style="display: none;" id="online_test_date_div">
                                                        <br>
                                                        <label class="left-align" for="online_test_date">Online Test Date :</label><br><br>
                                                        <input type="date" name="online_test_date" id="online_test_date"/>
                                                    </div>
                                                    
                                                    
                                                    <%
                                                    }
                                                    
                                                    %>
       
                                                    
                                                    <script>
                                                        
                                                        function online_check(an){
                                                            if(an==='yes'){
                                                                document.getElementById("online_test_date_div").style.display = "block";
                                                            }
                                                            else{
                                                                document.getElementById("online_test_date_div").style.display = "none";
                                                            }
                                                        }
                                                    </script>
                                                    
                                                    
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br><br>
                                                    <label class="left-align" for="visiting_date">Visiting Date Decided?</label>
                                                    <%
                                                         if(visit_date!=null){
                                                    %>
                                                    
                                                    <input style="margin-left: -32em;"  type="radio" name="ans2" id="ans2_1" value="Yes" onclick="visit_check('yes')" checked><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans2" id="ans2_2" value="No" onclick="visit_check('no')" ><span style="margin-left: 0.5em;">No</span>
                                                    
                                                    <br>
                                                    <div style="display: block;" id="visiting_date_div">
                                                        <br>
                                                        <label class="left-align" for="visiting_date">Visiting Date :</label><br><br>
                                                        <input  type="date" name="visiting_date" id="visiting_date" value="<%= visit_date %>"  />
                                                        <br><br><br>
                                                        <label class="left-align" for="day_visiting">company visiting for :</label><br><br>
                                                        <input style="width: 25%"  type="text" name="day_visiting" id="day_visiting" placeholder="Enter No. of Days" value="<%= day_visiting %>"/>
                                                    </div>
                                                    
                                                    <%
                                                
                                                        }
                                                        else{
                                                    %>
                                                    <input style="margin-left: -32em;"  type="radio" name="ans2" id="ans2_1" value="Yes" onclick="visit_check('yes')" ><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans2" id="ans2_2" value="No" onclick="visit_check('no')" checked><span style="margin-left: 0.5em;">No</span>
                                                    
                                                    <br>
                                                    <div style="display: none;" id="visiting_date_div">
                                                        <br>
                                                        <label class="left-align" for="visiting_date">Visiting Date :</label><br><br>
                                                        <input  type="date" name="visiting_date" id="visiting_date"  />
                                                        <br><br><br>
                                                        <label class="left-align" for="day_visiting">company visiting for :</label><br><br>
                                                        <input style="width: 25%"  type="text" name="day_visiting" id="day_visiting" placeholder="Enter No. of Days" />
                                                    </div>
                                                    
                                                    
                                                    <%
                                                        }
                                                    
                                                    %>
                                                    
                                                    <script>
                                                        
                                                        function visit_check(an){
                                                            if(an==='yes'){
                                                                document.getElementById("visiting_date_div").style.display = "block";
                                                            }
                                                            else{
                                                                document.getElementById("visiting_date_div").style.display = "none";
                                                            }
                                                        }
                                                    </script>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        
                                        <script>
                                            function bdisp(str){
                                                if(document.getElementById(str).checked){
                                                    document.getElementById(str+'_disp').style.display = 'block';
                                                }
                                                else
                                                    document.getElementById(str+'_disp').style.display = 'none';
                                                
                                            }
                                        </script>
                                        
                                        <br>
                                        
                                        <input type="submit" value="EDIT">
                                      
                                </div>
                            </form>
				
			</article>
                </section>
    </body>
    <br><br><br>
    
    
    
    <footer><%@include file="footer2.jsp" %></footer>
</html>
