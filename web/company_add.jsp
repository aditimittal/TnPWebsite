<%-- 
    Document   : company_add
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
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
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
    tr:nth-child(even) {
    background-color: #ffffff;
}
        </style>
        
        <script>
            function validate(){
                
                if(document.getElementById("inter_loc2").checked){
                    var x = document.getElementById("interview_location").value;
                    if(x === ""){
                        window.alert("Interview Location Not entered.");
                        document.getElementById("interview_location").focus();
                        return;
                    }
                }
                
                if(document.getElementById("ans1_1").checked){
                    var x = document.getElementById("online_test_date").value;
                    
                    if(!x){
                        window.alert("Online Test Date not selected!");
                        document.getElementById("online_test_date").focus();
                        return;
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
                        return;
                    }
                }
                
                addCompany();
            }
            
            var xmlHttp;
            function addCompany(){
                if (typeof XMLHttpRequest !== "undefined"){
                xmlHttp= new XMLHttpRequest();
                }
                else if (window.ActiveXObject){
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request")
                return;
                } 
                var url="company_add_sql.jsp";
                url +="?company_name=" +document.getElementById("company_name").value;
                url +="&company_type=" +document.getElementById("company_type").value;
                url +="&type=" +document.getElementById("type").value;
                url +="&profile=" +document.getElementById("profile").value;
                url +="&profile_type=" +document.getElementById("profile_type").value;
                url +="&industry=" +document.getElementById("industry").value;
                url +="&job_location=" +document.getElementById("job_location").value;
                
                if(document.getElementById("inter_loc2").checked){
                    url +="&r1=" +document.getElementById("inter_loc2").value;
                    url +="&interview_location=" +document.getElementById("interview_location").value;
                }
                else{
                    url +="&r1=" +document.getElementById("inter_loc1").value;
                }
                
                url +="&batch=" +document.getElementById("batch").value;
                url +="&description=" +document.getElementById("description").value;
                url +="&ctc_last_year=" +document.getElementById("ctc_last_year").value;
                url +="&ctc_current_year=" +document.getElementById("ctc_current_year").value;
                url +="&ctc_breakup=" +document.getElementById("ctc_breakup").value;
                url +="&student_poc=" +document.getElementById("student_poc").value;
                url +="&company_poc=" +document.getElementById("company_poc").value;
                url +="&contact=" +document.getElementById("contact").value;
                url +="&email=" +document.getElementById("email").value;
                
                if(document.getElementById("ans1_1").checked){
                    url +="&ans1=" +document.getElementById("ans1_1").value;
                    url +="&online_test_date=" +document.getElementById("online_test_date").value;
                }
                else{
                    url +="&ans1=" +document.getElementById("ans1_2").value;
                }
                
                if(document.getElementById("ans2_1").checked){
                    url +="&ans2=" +document.getElementById("ans2_1").value;
                    url +="&visiting_date=" +document.getElementById("visiting_date").value;
                    url +="&day_visiting=" +document.getElementById("day_visiting").value;
                }
                else{
                    url +="&ans2=" +document.getElementById("ans2_2").value;
                }
                
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("POST", url, true);
                xmlHttp.send();
            }
            
            function stateChange(){   
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                window.scrollTo(0,0);
                var txt = xmlHttp.responseText.trim();
                txt = txt.replace(/(\r\n|\n|\r)/gm, "");
                document.getElementById("status").innerHTML=txt;
                console.log(txt);
                if(isNaN(txt)=== false){ 
                    window.location = "company_branch_add.jsp?id="+txt+"&batch="+document.getElementById("batch").value;
                }
                
                }   
            }
        </script>
    </head>
    <body>
     <br>	<br><br>
		<div class="clear"> </div>
		<section>
                    <article class="boxborder">
			<article class="box">
				<h1  style="color:#39843c;">ADD COMPANY</h1>
                                <h4 id="status" ></h4>
                                
				<br>
                                <div id="form">
                                    
                                        <table class="table_form">
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_name">Company Name :</label>
                                                    <br><br>
                                                    <input type="text" name="company_name" id="company_name"  required placeholder="Enter company's name" />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_type">Company Type :</label>
                                                    <br><br>
                                                    <select name="company_type" id="company_type" >
                                                        <option value="Regular Recruiter">Regular Recruiter</option>
                                                        <option value="Elite Recruiter">Elite Recruiter</option>
                                                        <option value="Mass Recruiter">Mass Recruiter</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="type">Offer Type :</label>
                                                    <br><br>
                                                    <select name="type" id="type" style="width: 40%" onchange="selectBatch()">
                                                        <option value="FTE">FTE</option>
                                                        <option value="Internship">Internship</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="profile">Profile :</label>
                                                    <br><br>
                                                    <input type="text" name="profile" id="profile"  required placeholder="Enter company's profile" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="profile_type">Profile Type :</label>
                                                    <br><br>
                                                    <select name="profile_type" id="profile_type">
                                                        <option value="Technical">Technical</option>
                                                        <option value="Non Technical">Non Technical</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="industry">Industry Type :</label>
                                                    <br><br>
                                                    <input type="text" name="industry" id="industry" required placeholder="Enter type of Industry" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="job_location">Job Location :</label>
                                                    <br><br>
                                                    <input type="text" name="job_location" id="job_location" required placeholder="Enter Job Location" />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="interview_location">Interview Location :</label>
                                                    <br><br>
                                                    <input id="inter_loc1" style="float:left; margin-left: 0.5em" type="radio" name="r1" value="College Campus" onclick="interviewLocation('College Campus')" checked ><span style="float: left; margin-left: 1em;">College Campus</span>
                                                    <input id="inter_loc2" style="float:left; margin-left: 1em" type="radio" name="r1" value="Other" onclick="interviewLocation('Other')"><span style="float: left; margin-left: 1em;">Other</span>
                                                    
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
                                                    <div id="interview_location_div" style="display: none">
                                                        <br><br>
                                                        <input style="float: left; margin-left: 1em;" type="text" name="interview_location" id="interview_location" placeholder="Enter Interview Location" />
                                                    </div>
                                                    
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
                                                    
                                                    <!--<label class="left-align" for="batch">Company For Batch :</label>-->
                                                    
                                                    <select name="batch" id="batch" style="width: 40%" hidden>
                                                        <option value="<%= year_use-3 %>"><%= year_use-3 %></option>
                                                        <option value="<%= year_use-2 %>" ><%= year_use-2 %></option>
                                                    </select>
                                                    <!--<input type="text" name="batch" id="batch" required required placeholder="Enter Batch" />-->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br>
                                                    <label class="left-align" for="description">Company Description :</label>
                                                    <br><br>
                                                    <textarea style="float: left;margin-left: 0.5em;padding-left: 0" name="description" id="description" rows="4" cols="50" placeholder="Enter the Company's Description" required></textarea>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="ctc_last_year">CTC (Last Year) :</label>
                                                    <br><br>
                                                    <input type="text" name="ctc_last_year" id="ctc_last_year" required placeholder="Enter last year's CTC " />
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="ctc_current_year">CTC (Current Year) :</label>
                                                    <br><br>
                                                    <input type="text" name="ctc_current_year" id="ctc_current_year" required placeholder="Enter current year CTC"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br>
                                                    <label class="left-align" for="ctc_breakup">CTC Breakup :</label>
                                                    <br><br>
                                                    <textarea style="float: left;margin-left: 0.5em;padding-left: 0" name="ctc_breakup" id="ctc_breakup" rows="6" cols="50" placeholder="Enter CTC Breakup" required></textarea>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="student_poc">Student POC :</label>
                                                    <br><br>
                                                    <input type="text" name="student_poc" id="student_poc" required placeholder="Enter student POC's name"/>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="company_poc">Company POC :</label>
                                                    <br><br>
                                                    <input type="text" name="company_poc" id="company_poc" required required placeholder="Enter company POC's name"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="contact">Contact :</label>
                                                    <br><br>
                                                    <input type="text" name="contact" id="contact" required  required placeholder="Enter company's contact"/>
                                                </td>
                                                <td>
                                                    <br>
                                                    <label class="left-align" for="email">Email :</label>
                                                    <br><br>
                                                    <input type="text" name="email" id="email" required required placeholder="Enter company's email id"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br><br>
                                                    <label class="left-align" for="online_test_date">Online Test Date Decided?</label>
                                                    <input style="margin-left: -30em;"  type="radio" name="ans1" id="ans1_1" value="Yes" onclick="online_check('yes')" ><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans1" id="ans1_2" value="No" onclick="online_check('no')" checked><span style="margin-left: 0.5em;">No</span>
                                                    
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
                                                    <br>
                                                    <div style="display: none;" id="online_test_date_div">
                                                        <br>
                                                        <label class="left-align" for="online_test_date">Online Test Date :</label><br><br>
                                                        <input type="date" name="online_test_date" id="online_test_date"  />
                                                    </div>
                                                    
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br><br>
                                                    <label class="left-align" for="visiting_date">Visiting Date Decided?</label>
                                                    <input style="margin-left: -32em;"  type="radio" name="ans2" id="ans2_1" value="Yes" onclick="visit_check('yes')" ><span style="margin-left: 0.5em;">Yes</span>
                                                    <input style="margin-left: 1em;" type="radio" name="ans2" id="ans2_2" value="No" onclick="visit_check('no')" checked><span style="margin-left: 0.5em;">No</span>
                                                    
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
                                                    <br>
                                                    <div style="display: none;" id="visiting_date_div">
                                                        <br>
                                                        <label class="left-align" for="visiting_date">Visiting Date :</label><br><br>
                                                        <input  type="date" name="visiting_date" id="visiting_date"  />
                                                        <br><br><br>
                                                        <label class="left-align" for="day_visiting">company visiting for :</label><br><br>
                                                        <input style="width: 25%"  type="text" name="day_visiting" id="day_visiting" placeholder="Enter No. of Days" />
                                                    </div>
                                                    
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
                                        
                                        <input type="submit" value="Submit" onclick="validate()">
                                      
                                </div>
                        </article>
			</article>
                </section>
    </body>
    <br><br><br>
    <footer><%@include file="footer2.jsp" %></footer>
</html>