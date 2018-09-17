<%--
    Document   : screen_admin_date
    Created on : 10 Jul, 2017, 1:51:17 PM
    Author     : Ashima
--%>

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
<link rel="shortcut icon" href="no_logo.ico" />
<link rel="stylesheet" type="text/css" href="css/commonCSS.css">

<title>IGDTUW</title>
<style>
*{
    text-align: center;
}
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
    padding: 6px 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }

    input[type=date]{
        width: 90%;
    padding: 6px 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }

</style>
</head>
<%! String id,prog,branch,year,start_date,end_date;%>
    <%
    id = request.getParameter("id");
    prog = request.getParameter("prog");
    branch = request.getParameter("branch");
    year = request.getParameter("year");
    start_date = request.getParameter("start_date");
    end_date = request.getParameter("end_date");
//    out.println(id+" "+prog+" "+branch+" "+year+" "+start_date+" "+end_date);
    %>
<script>
    var xmlHttp;
    function editDeadline(){


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

        var url = "deadline_edit_sql.jsp";
        url+="?id="+<%= id%>;
        url+="&start_date="+document.getElementById("start_date").value;
        url+="&end_date="+document.getElementById("end_date").value;



        xmlHttp.onreadystatechange = stateChange;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

    function stateChange(){
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
            console.log(xmlHttp.responseText);
        document.getElementById("textual").innerHTML=xmlHttp.responseText.trim();
        if(xmlHttp.responseText.trim() === "deadline edited"){
            console.log("hello");
            window.location = "screen_admin_deadline.jsp";

        }
    }
}
    function deleteAlert(id){
        var result = confirm("Want to delete?");
        if (result) {
            if (typeof XMLHttpRequest !== "undefined"){
            xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp===null){
            alert("Browser does not support XMLHTTP Request");
            return;
            }
            var url="deadline_delete.jsp?id="+id;
            xmlHttp.onreadystatechange = stateChangeDel;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
    }

    function stateChangeDel(){
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
        window.location = "screen_admin_deadline.jsp";
        }
    }
</script>

<body>



    <br>

		<section>
			<article class="boxborder">

                            <h2 style="color:#008000;">DEADLINE FOR STUDENT REGISTRATION  </h2>
                            <h4 id="textual" style="color: #ff0000"></h4>
                            <a class="deadline add" onclick="deleteAlert(<% out.println(id);%>)"><img src="images/delete.png" class="del_logo"/></a>
                            <br><br><br>


                                    <div class="row">
                                            <div class="col-sm-0 col-md-4"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="course">Courses</label>
                                            </div>
                                            <div class="col-sm-1 col-md-2">
                                        <span style="color: #666666">
                                          <% out.println(prog); %>
                                        </span>
                                    </div>
                                    </div>
                                        <br><br>
                                        <div class="row">


                                        <% if(!branch.equals("null")){ %>
                                        <div class="col-sm-0 col-md-4"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="dept">Department</label>
                                        </div>
                                            <div class="col-sm-1 col-md-2">
                                        <span style=" color: #666666">
                                            <% out.println(branch); %>
                                        </span>
                                        </div>

                                        <% } %>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-4"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="year">Year</label>
                                        </div>
                                            <div class="col-sm-1 col-md-2">
                                        <span style=" color: #666666">
                                          <% out.println(year); %>
                                        </span>
                                        </div>
                                        </div>
                                        <br><br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-3"></div>
                                            <div class="col-sm-1 col-md-3">
                                        <label for="start_date">Starting Date</label>
                                        </div>
                                            <div class="col-sm-1 col-md-4">
                                        <input type="date" name="start_date" id="start_date"  value=<% out.println(start_date);%> />
                                        </div>
                                        </div
                                        <br><br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-3"></div>
                                            <div class="col-sm-1 col-md-3">
                                        <label for="end_date">Ending Date</label>
                                        </div>
                                            <div class="col-sm-1 col-md-4">
                                        <input type="date" name="end_date" id="end_date" value=<% out.println(end_date);%> />
                                            </div>
                                        </div><br><br>

                                        <input type="submit" class="tnpbtn" value="Edit" onclick="editDeadline()"/>




			</article>
                </section>
</body>

</html>
<footer><%@include file="footer2.jsp" %></footer>