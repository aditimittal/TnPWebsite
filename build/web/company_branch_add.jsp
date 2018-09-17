<%-- 
    Document   : company_branch_add
    Created on : 23 Jan, 2018, 11:04:46 PM
    Author     : ashim
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/commonCSS.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
        <title>IGDTUW</title>
        <style>
            .tnpfooter{
    left: 0;
   
    width: 100%;
    position:fixed;
}
/*        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td{
            border-bottom: 1px solid #ddd;
            border-left: none;
            border-right: none;
            vertical-align: middle;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #e7ffba}
        tr:nth-child(odd){background-color: #ffffff}

        th {
            background-color: #39843c;
            color: white;
            text-align: left;
        }      
        tr:hover{
            background-color: #ddd;
            cursor: pointer;
        }*/
#elig{
    margin-left: -15%;
}
        .box{
            text-align: center;
            background-color:#f5f5f0;
            margin-left:9%;
            width:75%;
            padding: 2% 2% 2% 4%;
        }

        *
        {
            text-align:center;
            margin: 0px;
            margin-top:0.1%;
            margin-left:0%;
            font-family: 'Helvetica', 'Arial', sans-serif;
            text-decoration:none;
            padding: 0px;
            list-style-type:none;
        }
        .logo{
            width:140px;
            margin-left: 25%;
        }    
        select{
             float: left;
            width: 90%;    
            padding: 8px 4px;
            margin-left: 0.5em;
            margin-top: 0.5em;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=date]{
            width: 30%;
            padding: 12px 20px;
/*            margin: 8px 0;*/
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit]{
            float: left;
            background-color:#39843c;
            border: none;
            color: white;
            padding: 4px 6px;
            text-decoration: none;
            font-size: 1em;
            margin-left: 5%;
            margin-top: 0.5em;
            cursor: pointer;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type=text]{
            float: left;
            width: 90%;    
            padding: 3px 1px;
            margin-left: 0.5em;
            margin-top: 0.5em;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
/*        #branch{
            width:50%;
            margin-left: 1.8%;
        }*/
        .click{
            width: 20%;
            height: 10%;
            background-color: #e6e6e6;
            color: #008000;
            padding: 0.2em;

            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        </style>
        
        <script>
            var xmlHttp,xmlHttp1;
            function getBranch(programme){
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
                
                var url = "company_branch_gui.jsp";
                url+="?type=branch&value="+programme;

                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
                
            }
            function stateChange(){   
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
                    var ans = xmlHttp.responseText;
                    var res = ans.split("#");
                    document.getElementById("branch_div").innerHTML=res[0]; 
                    console.log(res[1]);
                    if(res[1].trim() === "POSTGRADUATE"){
                        document.getElementById("postgrad_div").style.display="block"; 
                    }
                    else if(res[1].trim()==="UNDERGRADUATE"){
                        document.getElementById("postgrad_div").style.display="none"; 
                    }
                } 
            }
            
            
            function insertData(id,batch){
                var programme = document.getElementById("programme");
                var branch = document.getElementById("branch");
                var tenth_perc = document.getElementById("tenth_perc");
                var twelfth_perc = document.getElementById("twelfth_perc");
                var undergrad_perc = document.getElementById("undergrad_perc");
                var postgrad_perc = document.getElementById("postgrad_perc");
                var active_backs = document.getElementById("active_backs");
                var dead_backs = document.getElementById("dead_backs");
                var b = null, p = "0";
                if(programme.value === "Select Program"){
                    alert("Program not selected!");
                    document.getElementById("programme").focus();
                    return;
                }
                if(branch){
                    if(branch.value === "Select Branch"){
                        alert("Branch not selected");
                        document.getElementById("branch").focus();
                        return;
                    }
                    else{
                        b = branch.value;
                    }
                }
                if(tenth_perc.value === "" || tenth_perc.value > 100 || tenth_perc.value < 0){
                    alert("10th cutoff not entered or invalid");
                    document.getElementById("tenth_perc").focus();
                    return;
                }
                if(twelfth_perc.value === "" || twelfth_perc.value > 100 || twelfth_perc.value < 0){
                    alert("12th cutoff not entered or invalid");
                    document.getElementById("twelfth_perc").focus();
                    return;
                }
                if(undergrad_perc.value === "" || undergrad_perc.value > 100 || undergrad_perc.value < 0){
                    alert("undergraduate cutoff not entered or invalid");
                    document.getElementById("undergrad_perc").focus();
                    return;
                }
                
                if(document.getElementById("postgrad_div").style.display === "block"){
                    if(postgrad_perc.value === "" || postgrad_perc.value > 100 || postgrad_perc.value < 0){
                        alert("postgraduate cutoff not entered or invalid");
                        document.getElementById("postgrad_perc").focus();
                        return;
                    }
                    else{
                        p = postgrad_perc.value;
                    }
                }
                if(active_backs.value === ""){
                    active_backs.value = '0';
                }
                if(dead_backs.value === ""){
                    dead_backs.value = '0';
                }
                
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
                
                var url = "company_branch_gui.jsp";
                url+="?type=insert";
                url+="&programme="+programme.value;
                url+="&branch="+b;
                url+="&tenth_perc="+tenth_perc.value;
                url+="&twelfth_perc="+twelfth_perc.value;
                url+="&undergrad_perc="+undergrad_perc.value;
                url+="&postgrad_perc="+p;
                url+="&cid="+id;
                url+="&batch="+batch;
                url+="&active_backs="+active_backs.value;
                url+="&dead_backs="+dead_backs.value;
                    
                    

                xmlHttp.onreadystatechange = inserted;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
                
            }
            
            function inserted(){
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
                    var ans = xmlHttp.responseText;
                    var res = ans.split("#");
                    console.log(ans);
                    document.getElementById("status").innerHTML = res[0];
                    document.getElementById("elig").innerHTML = res[1];
                    document.getElementById("programme").selectedIndex = "0";
                    document.getElementById("branch_div").innerHTML = "";
                    document.getElementById("tenth_perc").value = "";
                    document.getElementById("twelfth_perc").value = "";
                    document.getElementById("undergrad_perc").value = "";
                    document.getElementById("postgrad_perc").value = "";
                    document.getElementById("postgrad_div").style.display = "none"; 
                    document.getElementById("active_backs").value = "";
                    document.getElementById("dead_backs").value = "";
                } 
            }
            
            function deleteAlert(id,programme,branch){
                var result = confirm("Want to delete?");
                if (result) {
                    deleteData(id,programme,branch);
                }   
            }
            
            function deleteData(id,programme,branch){
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
                
                
                
                var url = "company_branch_gui.jsp";
                url+="?type=delete&value="+id;
                url+="&programme="+programme;
                url+="&branch="+branch;

                xmlHttp.onreadystatechange = deleteFunc;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
            }
            
            function deleteFunc(){
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
                    var ans = xmlHttp.responseText;
                    var res = ans.split("#");
                    console.log(ans);
                    document.getElementById("status").innerHTML = res[0];
                    document.getElementById("elig").innerHTML = res[1];
                }
            }
            
            function done(id){
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
                
                console.log(id);
                
                var url = "company_branch_gui.jsp";
                url+="?type=done&value="+id;
                

                xmlHttp.onreadystatechange = doneFunc;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
            }
            
            function doneFunc(){
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
                    var ans = xmlHttp.responseText;
                    console.log(ans);
                    if(ans.trim() === "fail"){
                        var result = confirm("You have not add any eligibility criteria.Are you sure you want to continue?");
                        if (result) {
                            window.location = "Placement_offer.jsp";
                        }
                    }
                    else{
                        window.location = "Placement_offer.jsp";
                    }
                }
            }
           
        </script>
    </head>
    <body>
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
        <br><br>
        <div class="container box">
            <h2  style="color:#39843c;">COMPANY'S ELIGIBILITY CRITERIA</h2>
            <br>
            <div class="row">
                <div class="col-sm-5 col-md-3">
            <select name="programme" id="programme" onchange="getBranch(this.value)">
                
                <option selected disabled>Select Program</option>
                
                <%
                    String sql1 = "SELECT * FROM programme_codes";
                    Statement stm1 = con1.createStatement();
                    ResultSet rs1 = stm1.executeQuery(sql1);
                    
                    while(rs1.next()){
                        out.println("<option value="+rs1.getString("Programme_Code") +">"+rs1.getString("Programme_Name") +"</option>");
                    }
                    
                    rs1.close();
                    stm1.close();
                %>
            </select>
                </div>
            <div class="row">
                    <div class="col-sm-5 col-md-3">
            <div id="branch_div">
               
                </div>
            </div>
            </div>
            <div class="col-sm-5 col-md-3 ">
            <input type="text" id="tenth_perc" name="tenth_perc" placeholder="Enter 10th %"/>
            </div>
            <div class="col-sm-5 col-md-3">
            <input type="text" id="twelfth_perc" name="twelfth_perc" placeholder="Enter 12th %"/>
            <br><br>
            </div>
            </div>
            <div class="row">
                <div class="col-sm-5 col-md-3">    
                <input type="text" id="undergrad_perc" name="undergrad_perc" placeholder="Enter Graduation %"/>
                </div>
                <div id="postgrad_div" style="display: none">
                    <div class="col-sm-5 col-md-3">
                    <input type="text" id="postgrad_perc" name="postgrad_perc" placeholder="Enter Post Graduation %"/>
                </div>
                </div>
                <div class="col-sm-5 col-md-3">
                <input type="text" id="active_backs" name="active_backs" placeholder="Active Backs Allowed"/>
                </div>
                <div class="col-sm-5 col-md-3"><input type="text" id="dead_backs" name="dead_backs" placeholder="Dead Backs Allowed"/>
                </div>
                <input type="submit" value="ADD" onclick="insertData(<% out.println(request.getParameter("id")); %>, <% out.println(request.getParameter("batch")); %>)" />
            </div>
            <br><br>
            <h4 style="color: red" id='status'></h4>
            <br>
            
            <div class="container" id="elig">
                
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
                    ans += "<td><a class=\"click\" onclick=\"deleteAlert("+request.getParameter("id")+",'"+rs1.getString("course")+"','"+rs1.getString("department")+"')\" >Delete</a></td>"; 
                    ans += "</tr>";
//                   
                }
                

                rs1.close();
                stm1.close();
                
                ans += "</table>";

                if(count==0){
                    ans = "No eligibility criteria added yet.";
                }
                
                out.println(ans);
                %>
                
                
            </div>
                
                <% out.println("<input class=\"tnpbtn\" type=\"button\" name=\"next\" value=\"Done\" onclick=\"done("+request.getParameter("id")+")\"/>"); %>
                
                
                
        </div>
                <br><br>
    </body>
    <footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>
</html>
