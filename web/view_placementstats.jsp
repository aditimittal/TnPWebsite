<%-- 
    Document   : screen_admin_date
    Created on : 10 Jul, 2017, 1:51:17 PM
    Author     : Ashima
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="no_logo.ico" />
<link rel="stylesheet" type="text/css"  href="css/commonCSS.css">

<title>Training and Placement Cell,IGDTUW</title>
<style>
.hed{
    font-weight:bold;
}
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
@media (max-width:500px) {
     input[type="text"], select {
        width: 100%;
        padding: 5px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }  
    .hed{
        font-size:15px;
    }     
</style>

</head>

<body>

    <br>	<br>
		<div class="clear"> </div>
		<section>
                    <article class="boxborder">
			<article class="box">
				<h2 class="tnpheading">
                                    <center>VIEW PLACEMENT STATISTICS </center></h2>
                                <h4 id="error" style="color: #ff0000"></h4>
				<br>
                                <div>
                                    <script>
                                        var xmlHttp;

                                        function func(type, val){
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

                                            var url = "view_placement_ajax.jsp";
                                            url+="?type="+type+"&value="+val;

                                            xmlHttp.onreadystatechange = stateChange;
                                            xmlHttp.open("GET", url, true);
                                            xmlHttp.send(null);
                                        }   
                                        
                                        function stateChange(){   
                                            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                                                
                                               
                                               
                                              
                                                
                                           document.getElementById("course_div").innerHTML =  xmlHttp.responseText;  
                                          
                                           document.getElementById("dept_div").innerHTML="";   
                                            }   
                                        } 
                                        
                                        function func_dept(type, val){
                                            var year = document.getElementById("year").value;
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

                                            var url = "view_placement_ajax.jsp";
                                            url+="?type="+type+"&value="+val+"&year="+year;

                                            xmlHttp.onreadystatechange = stateChange_new;
                                            xmlHttp.open("GET", url, true);
                                            xmlHttp.send(null);
                                        }
                                        
                                        function stateChange_new(){   
                                            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                                            document.getElementById("dept_div").innerHTML=xmlHttp.responseText;   
                                            }   
                                        }
                                        
                                       
    
                                        function stats(){
                                            var year = null, course = null, dept = null;
                                            
                                            year = document.getElementById("year").value;
                                            if(year === 'noYear' ){
                                                document.getElementById("error").innerHTML= "** Year not selected **"; 
                                            }
                                            else{
                                                course = document.getElementById("course").value;
                                                if(course === 'noCourse' || course == ''){
                                                    document.getElementById("error").innerHTML= "** Course not selected **"; 
                                                }
                                                else{
                                                    document.getElementById("error").innerHTML= ""; 
                                                    dept_ele = document.getElementById("dept");
                                                    if(!dept_ele)
                                                    {
//                                                        document.getElementById("error").innerHTML= "no branch";
                                                        var tod = document.getElementById("tod").value;
                                                        var stat = document.getElementById("stat").value;
                                                        
                                                        if(tod == 'select value')
                                                            document.getElementById("error").innerHTML= "** Type of Database not selected **"; 
                                                       else {
                                                           if(stat == 'select value')
                                                               document.getElementById("error").innerHTML= "** Type not selected **"; 
                                                            else {
                                                                var dept="null";
                                                                document.getElementById("error").innerHTML= "success"; 
                                                                var url = "view_placement_stats.jsp";
                                                                url+="?year="+year+"&dept="+course+"&branch="+dept+"&tod="+tod+"&stat="+stat;
                                                                window.location = url;
                                                                  }
                                                            }
                                                        }
                                                    else{
                                                        var dept = document.getElementById("dept").value;
                                                        if(dept === 'noBranch'){
                                                        document.getElementById("error").innerHTML= "** Branch not selected **"; 
                                                        }
                                                        else{
                                                            var tod = document.getElementById("tod").value;
                                                            if(tod == 'select value')
                                                                document.getElementById("error").innerHTML= "** Type of Daatabase not selected **"; 
                                                        else
                                                        {
                                                            var stat = document.getElementById("stat").value;
                                                            if(stat == 'select value')
                                                               document.getElementById("error").innerHTML= "** Type not selected **"; 
                                                           else {
                                                            document.getElementById("error").innerHTML= "success"; 
                                                           
                                                        
                                                        
                                                        var url = "view_placement_stats.jsp";
                                                        url+="?year="+year+"&dept="+course+"&branch="+dept+"&tod="+tod+"&stat="+stat;
                                                        window.location = url;
                                                               }
                                                        }

                                                        }
                                                    }
                                                    
//                                                    
                                                }
                                            }
                                            

                                        }
                                        
                                        function ajax_req(url){
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

                                            

                                            xmlHttp.onreadystatechange = stateChange_sql;
                                            xmlHttp.open("GET", url, true);
                                            xmlHttp.send(null);
                                            
                                        }
                                        
                                        function stateChange_sql(){   
                                            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                                            document.getElementById("error").innerHTML=xmlHttp.responseText;   
                                            }   
                                        }
                                    </script>
                                    
                                        <label for="year">Year</label>
                                        <select id="year" name="year"  onchange="func('course',this.value)">
                                         
                                          <option value="noYear" selected disabled>Select year</option>
                                          <% 
                                              int i =0;
                                              int year = Calendar.getInstance().get(Calendar.YEAR);
                                              int year1 = year - 5;
                                              
                                              while(year1 < year-1){
                                                  year1 = year1+1;
                                            %>
                                               
                                                 
                                                  <option value=  <% out.println(year1) ; %> > <% out.println(year1); %>
                                                 
                                                   </option> 
                                              <%
                                                   
                                                   i++;
                                                   
                                              }
                                           %>
                                            <option value=  <% out.println(year) ; %> > <% out.println(year); %>
                                            <% 
                                              int p =0;
                                              int year2 = year;
                                              while(p<5){
                                                  year2 = year2 + 1;
                                            %>
                                               
                                                 
                                                  <option value=  <% out.println(year2) ; %> > <% out.println(year2); %>
                                                 
                                                   </option> 
                                              <%
                                                  
                                                   p++;
                                                   
                                              }
                                           %>
                                         
                                        </select>
                                        
                                        
                                        <div id="course_div">
                                        </div>
                                        
                                        
                                        <div id="dept_div">
                                        </div>
                                           
                                         <div id="com_div">
                                        </div>
                                           
                                        
                                        
                    
                                        <label for="tod"> Type Of Database </label>
                                        <select name="tod" id ="tod" required>
                                        <option value="select value" slected = "selected" >select value</option>
                                        <option value="Intern">Intern</option>
                                        <option value="FTE">FTE</option>

                                        </select>

                                        <br>
   
                                        <label for = "stat" > View Placement Statistics </label>
                                           <select name="stat"  id = "stat" required>
                                           <option value="select value" slected = "selected" >select value </option>
                                           <option value="statdb" id = "statdb" >View Placement Statistics Company Wise As Database</option>
                                           <option value="statpie" id="statpie"> View Placement Statistics Company Wise As Pie Charts </option>
                                           <option value="statper" id="statper"> View Placement Percentage  </option>
                                           <option value="statmass" id="statmass"> View Placement Percentage Without Mass Recruiters  </option>
                                           <!-- <option value="statmass" id="statmass"> View Placement Percentage With Different Profiles As Database </option> -->
                                          <option value="ctc" id="ctc"> View CTC Variation  </option>


                                           </select>

                                        
                                            <br>                     
                                        <input type="submit" class="tnpbtn" value="Submit" onclick="stats()">
                                      <!--</form>-->
                                
			
			</article>
                    </article>
</body>

</html>
<footer><%@include file="footer2.jsp" %></footer>