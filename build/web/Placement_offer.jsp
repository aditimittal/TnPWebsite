<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <title>IGDTUW</title>
        <style>
        table {
            width: 100%;
        }

        th, td{
            padding: 8px;
        }
        select{
                float: left;
                width: 10%;
                background-color: #ffffff;
                color: #000000;
                padding: 14px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 1%;
        }
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
        @media screen and (max-width: 768px) {
            h2{
                font-size: 6vw;
                margin-top: 8%;
            }
        }

    </style>
    </head>
    <body>
        <script>
            var xmlHttp;
            try {
                function downloadData(id)
                {
                    var year = document.getElementById("year_db").value;
                var type = document.getElementById("company_for").value;

                window.location="Download_placementDB.jsp?id="+id+"&year_db="+year+"&company_for="+type;

                }
                function download(){
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                document.getElementById("placements").innerHTML=xmlHttp.responseText;   
                }
            }
            function showState(year){
                var type = document.getElementById("company_for").value;
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
                
                var url = "Placement_offer_SQL.jsp";
                url+="?year_db="+year+"&company_for="+type;
                
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
                
                
            }
            function showType(type){
                var year = document.getElementById("year_db").value;
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
                
                var url = "Placement_offer_SQL.jsp";
                url+="?year_db="+year+"&company_for="+type;
                
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
                
                
            }
            function stateChange(){   
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                document.getElementById("placements").innerHTML=xmlHttp.responseText   ;
                }   
            } 
            
            function deleteAlert(id){
                var result = confirm("Want to delete?");
                if (result) {
                    deleteData(id);
                }
            }
            
            function deleteData(id){
                var year = document.getElementById("year_db").value;
                var type = document.getElementById("company_for").value;
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
                url+="&year_db="+year+"&company_for="+type;
                
                
                xmlHttp.onreadystatechange = del;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
            }
            
            function del(){
                if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                document.getElementById("placements").innerHTML=xmlHttp.responseText;   
                }
            }
            function edit(id){
                var year = document.getElementById("year_db").value;
                window.location = "company_view.jsp?id="+id+"&year_db="+year;
            }
            
    }catch(err){
        document.getElementById("placements").innerHTML = err.message;
    }
        </script>
        <br><br><br><br><br><br>
        <article class="boxborder" style="margin-top: -4%;">
                            <a class="tnpbtn" href="company_add.jsp" style="float: right;margin-top: 0%;margin-right: 2%;">Add Offer</a>
                            <%! 
                            String current_month, current_year;
                            int year_use; 
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
                            <select id="year_db" name="year_db" onchange="showState(this.value)">
                                <option value="<%= year_use %>"><%= year_use %></option>
                                <option value="<%= year_use-1 %>"><%= year_use-1 %></option>
                                <option value="<%= year_use-2 %>"><%= year_use-2 %></option>
                            </select>
                            <select id="company_for" style="margin-left: 2%;width: 10%" name="year_db" onchange="showType(this.value)">
                                <option value="FTE">FTE</option>
                                <option value="Internship">Internship</option>
                            </select>
				<h2 class="tnpheading"> &nbsp CURRENT PLACEMENT OFFERS</h2>
                                
				<br>
                                <div id="placements" style="overflow-x: auto;">
                                <%
                                try{
                                    
                                    String year_db = Integer.toString(year_use);
                                    String company_for = "FTE";
//                                    String year_db = request.getParameter("year_db");
//                                    String company_for = request.getParameter("company_for");
                                    String heading = null;
                                     if(company_for.equalsIgnoreCase("FTE"))
                                         heading = "CURRENT CTC";
                                     else
                                         heading = "STIPEND";
                                    String ans ;

                                     Class.forName("com.mysql.jdbc.Driver");  
                                     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_db+"?zeroDateTimeBehavior=convertToNull","root","");

                                     String sql = "select * from company_details where type = '"+company_for+"' ";
                                     Statement stm = con.createStatement();
                                     ResultSet rs = stm.executeQuery(sql);
                                    ans = "<table><tr><th>COMPANY NAME</th><th>PROFILE</th><th>TYPE</th>"+
                                           "<th>"+heading+"</th><th>ONLINE TEST DATE</th><th>VISITING DATE</th>";
                                    ans +="<th></th><th></th><th></th>"
                                             + "</tr>";


                                     int count = 0;
                                     while(rs.next()){
                                         count++;
                                         String online_date = rs.getString("online_test_date");
                                         String visiting_date = rs.getString("visit_date");

                                         Date today = new Date();

                                         ans += "<tr>";
                                         ans += " <td>"+rs.getString("company_name")+"</td>"+
                                                 "<td>"+rs.getString("profile")+"</td>"+ 
                                                 "<td>"+rs.getString("type")+"</td>"+
                                                 "<td>"+rs.getString("ctc_current_year")+"</td>";
                                         if(online_date == null){
                                             ans+="<td> - </td>";
                                         }else{
                                             ans+="<td>"+online_date+"</td>";
                                         }
                                         if(visiting_date == null){
                                             ans+="<td> - </td>";
                                         }else{
                                             ans+="<td>"+visiting_date+"</td>";
                                         }        

                                         ans+="<td><a class=\"click\" onclick=\"edit("+rs.getInt("company_id")+")\" >Edit</a></td>"; 
                                         ans+="<td><a class=\"click\" onclick=\"deleteAlert("+rs.getInt("company_id")+")\" >Delete</a></td>";
                                         ans+="<td><a class=\"click\" onclick=\"downloadData("+rs.getInt("company_id")+")\" >Download</a></td>";
                                        ans+="</tr>";


                                     }

                                     ans+="</table>";


                                     if(count==0){
                                         ans = " <br><br><h1 style=\"color: red\">No Company Records Found</h1>";
                                     }

                                     stm.close();
                                     rs.close();
                                     con.close();
                                    out.println(ans);
                                }catch(Exception e){
                                    response.getWriter().println("error.....<br>"+e);
                                }
       %>
                                </div>
				
			</article>
    </body>
    
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>