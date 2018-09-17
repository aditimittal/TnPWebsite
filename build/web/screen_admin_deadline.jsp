<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/commonCSS.css">

<title>IGDTUW</title>
<style>         
            table {
                width: 100%;
            }

            th, td{
                padding: 8px;
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
            
</style>
<script>
    function deleteAlert(id){
        var result = confirm("Want to delete?");
        if (result) {
            showState(id);
        }
    }
    
    function showState(id){
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
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
      document.getElementById("table_div").innerHTML=xmlHttp.responseText   ;
      }   
      }
</script>
</head>

<body>
    <div style="margin-top: 5%;padding-bottom: 5%;">
                <article class="boxborder">
                            <a class="tnpbtn" href="deadline_set.jsp" style="float: right;margin-right: 0%; margin-top:10px;">Set Deadline</a>
				<h2 class="tnpheading">SET OR EDIT DEADLINE FOR STUDENT REGISTRATION</h2>
                                
				<br>
                                <div id="table_div" style="overflow-x:auto;">
                                    <table>
                                        <tr>
                                            <th>COURSE</th>
                                            <th>DEPARTMENT</th>
                                            <th>YEAR</th>
                                            <th>START DATE</th>
                                            <th>END DATE</th>
                                            <th>DEADLINE STATUS</th>
                                            <th></th>
                                            <th></th>

                                        </tr>
                                        <%
                                        try{
                                        String sql = "select * from deadline";
                                        Statement stm = con.createStatement();
                                        ResultSet rs = stm.executeQuery(sql);
                                        int count=0;
                                        while(rs.next()){
                                            count++;
                                            String status;
                                            String start_date = rs.getString("start_date");
                                            String end_date = rs.getString("end_date");
                                            
                                            Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(start_date);
                                            Date ed = new SimpleDateFormat("yyyy-MM-dd").parse(end_date);
                                            Date today = new Date();
                                            
                                            if(sd.before(today) && today.before(ed)){
                                                status = "active";

                                            }
                                            else if(today.before(sd)){
                                                status = "Yet to start!";
                                            }
                                            else{
                                                status = "Deadline over";
                                            }
                                            
                                            
                                            
                                            
                                            String year_in = rs.getString("Year");
                                            String course = rs.getString("course");
                                            String department = rs.getString("Department");
                            
                                            String current_month, current_year;
                                            int year_use; 

                                            current_month = new java.text.SimpleDateFormat("MM").format(new java.util.Date());
                                            current_year = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());

                                            if(Integer.parseInt(current_month) < 8){
                                                year_use = Integer.parseInt(current_year) - Integer.parseInt(year_in);    
                                            }
                                            else{
                                                year_use = Integer.parseInt(current_year) - Integer.parseInt(year_in) + 1;    
                                            }
                                            
                                            Class.forName("com.mysql.jdbc.Driver");  
                                            Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year_use,"root","");
                                            
                                            String prog=null, branch=null;
                                            
                                            if(!department.equals("null")){
                                                String sql1 = "SELECT Programme_Name,Branch_Name FROM branch_codes WHERE Branch_Code = '"+department+"' AND Programme_Name = "
                                                              + "(SELECT Programme_Name FROM programme_codes WHERE Programme_Code = '"+course+"')";
                                                
                                                Statement stm1 = con1.createStatement();
                                                ResultSet rs1 = stm1.executeQuery(sql1);
                                                while(rs1.next()){
                                                    prog = rs1.getString("Programme_Name");
                                                    branch = rs1.getString("Branch_Name");
                                                }
                                                
                                                rs1.close();
                                                stm1.close();
                                                con1.close();
                                            }
                                            else{
                                                String sql1 = "SELECT Programme_Name FROM `programme_codes` WHERE Programme_Code = '"+course+"'";
                                                
                                                Statement stm1 = con1.createStatement();
                                                ResultSet rs1 = stm1.executeQuery(sql1);
                                                while(rs1.next()){
                                                    prog = rs1.getString("Programme_Name");
                                                }
                                                
                                                rs1.close();
                                                stm1.close();
                                                con1.close();
                                            }
                                            
                                            out.println("<tr>");  
                                            
                                            %>
                                        
                                            
                                            <td><% out.println(prog); %></td>
                                            <td><% 
                                            if(branch!=null){
                                                out.println(branch);
                                            }
                                             %></td>
                                            <td><% out.println(year_in); %></td>
                                            <td><% out.println(rs.getString("start_date")); %></td>
                                            <td><% out.println(rs.getString("end_date")); %></td>
                                            <td><% out.println(status); %></td>
                                            <td><% out.println("<a class=\"click\" href=\"deadline_edit.jsp?id="+rs.getInt("did")+"&prog="+prog+"&branch="+branch+"&year="+year_in+ "&start_date="+rs.getString("start_date")+"&end_date="+rs.getString("end_date")+"\">Edit</a>");%></td> 
                                            <td><a class="click" onclick="deleteAlert(<% out.println(rs.getInt("did"));%>)" >Delete</a></td>
                                            </tr>
                                            
                                            
                                            
                                        
                                        <%
                                        }
                                        %>
                                        </table>
                                        <%
                                            
                                            if(count==0){
                                        %>
                                        <br><br><h1 style="color: red">No Deadline Records Found</h1>
                                        
                                        <%
                                            }
                                            
                                            con.close();
                                        }catch(Exception e){
                                            out.println("error.......<br>"+e);
                                        }
                                        
                                        %>
                                        
                                    
                                </div>
				
			</article>
    </div>
		
</body>
</html>

<footer><%@include file="footer2.jsp" %></footer>
