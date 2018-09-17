<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/commonCSS.css">

<title>IGDTUW</title>
<style>  
               select{
                    width: 30%;    
                    padding: 12px 20px;
                    margin-left: 2em;
                    margin-top: 1em;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
               }

               input[type=date]{
                    width: 30%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
               }
               
               .boxborder{
                    text-align:center;
               }
</style>
</head>

<body>

    <br>	<br>
		<div class="clear"> </div>
		<section>
			<article class="boxborder">
				<h2 class="tnpheading">SET DEADLINE FOR STUDENT REGISTRATION</h2>
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

                                            var url = "deadline_set_gui.jsp";
                                            url+="?type="+type+"&value="+val;

                                            xmlHttp.onreadystatechange = stateChange;
                                            xmlHttp.open("GET", url, true);
                                            xmlHttp.send(null);
                                        }   
                                        
                                        function stateChange(){   
                                            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                                            document.getElementById("course_div").innerHTML=xmlHttp.responseText;   
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

                                            var url = "deadline_set_gui.jsp";
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
                                        
                                        function setDeadline(){
                                            var year = null, course = null, dept = null;
                                            
                                            year = document.getElementById("year").value;
                                            if(year === 'noYear' ){
                                                document.getElementById("error").innerHTML= "** Year not selected **"; 
                                            }
                                            else{
                                                course = document.getElementById("course").value;
                                                if(course === 'noCourse' ){
                                                    document.getElementById("error").innerHTML= "** Course not selected **"; 
                                                }
                                                else{
                                                    document.getElementById("error").innerHTML= ""; 
                                                    dept_ele = document.getElementById("dept");
                                                    if(!dept_ele){
//                                                        document.getElementById("error").innerHTML= "no branch";
                                                        var start_date = document.getElementById("start_date").value;
                                                        var end_date = document.getElementById("end_date").value;
                                                        var url = "deadline_set_sql.jsp";
                                                        url+="?year="+year+"&course="+course+"&start_date="+start_date;
                                                        url+="&end_date="+end_date;
                                                        ajax_req(url);
                                                        
                                                    }
                                                    else{
                                                        var dept = document.getElementById("dept").value;
                                                        if(dept === 'noBranch'){
                                                        document.getElementById("error").innerHTML= "** Branch not selected **"; 
                                                        }
                                                        else{
                                                            
                                                            var start_date = document.getElementById("start_date").value;
                                                            var end_date = document.getElementById("end_date").value;
                                                            var url = "deadline_set_sql.jsp";
                                                            url+="?year="+year+"&course="+course+"&dept="+dept+"&start_date="+start_date;
                                                            url+="&end_date="+end_date;
                                                            ajax_req(url);

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
                                                console.log(xmlHttp.responseText);
                                            document.getElementById("error").innerHTML=xmlHttp.responseText;   
                                            if(xmlHttp.responseText.trim() === 'Deadline set'){
                                                window.location = "screen_admin_deadline.jsp";
                                            }
                                            }   
                                        }
                                    </script>
                                    <!--<form action="deadline_set_sql.jsp" method="post">-->
                                        <label for="year">Year</label>
                                        <select id="year" name="year" style="margin-left: 8.5em;" onchange="func('course',this.value)">
                                            <option value="noYear" selected disabled>Select year</option>
                                          <option value="1">1st</option>
                                          <option value="2">2nd</option>
                                          <option value="3">3rd</option>
                                          <option value="4">4th</option>
                                        </select>
                                        
                                        
                                        <div id="course_div">
                                        </div>
                                        
                                        
                                        <div id="dept_div">
                                        </div>
                                        
                    
                                        
                                        
                                        <div>
                                        <label for="start_date">Starting Date</label>
                                        <input type="date"  name="start_date" id="start_date" style="margin-left: 4.9em;" />
                                        </div>
                                        
                                        <div>
                                        <label for="end_date">Ending Date</label>
                                        <input type="date" name="end_date" id="end_date" style="margin-left: 5.1em;" />
                                        </div>
                                        <br>
                                        <br>
                                        
                                        <input type="submit" class="tnpbtn" value="Submit" onclick="setDeadline()">
                                      <!--</form>-->
                                
				
			</article>
	
</body>
<br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>