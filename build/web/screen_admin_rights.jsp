<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    padding: 6px;
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

.click:hover{
    background-color: #d9d9d9;
    color: black;
    text-decoration: none;
    
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
      var url="admin_delete.jsp?id="+id;
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
          <br><br>
		
                    
			<article class="boxborder">
                            <h2 class="tnpheading">CURRENT ADMINS</h2>
                            <a class="tnpbtn" href="screen_admin_rights2.jsp" style="float: right;margin-top:-5.2%;margin-right: 0%;">Add Admin</a>
                            <br><br>
                            <div style="overflow-x:auto;">
                                <table id="table_div">
					  <tr>
						<th>NAME</th>
                                                <th>EMAIL</th>
						<th>DESIGNATION</th> 
                                                <th>DEPARTMENT</th> 
						<th>RIGHTS</th>
                                                <th></th>
                                                <th></th>
						
					  </tr>
                                          <%
                                          try{
                                                    Statement stmt= con.createStatement();  
                                                    int id2 =  (Integer)session.getAttribute("idx");
                                                    ResultSet rs=stmt.executeQuery("select * from admins where admin_id not in ("+id2+") ");
                                                    int count=0; 
                                                    while(rs.next()){
                                                        count++;
                                                        int id = rs.getInt(1);
                                                        String name = rs.getString("name");
                                                        String email = rs.getString("email");
                                                        String desig = rs.getString("designation");
                                                        String dept = rs.getString("department");
                                                        String rights = rs.getString("rights");
                                                        out.println("<tr>");
                                                        out.println("<td>"+name+"</td>");
                                                        out.println("<td>"+email+"</td>");
                                                        out.println("<td>"+desig+"</td>");
                                                        out.println("<td>"+dept+"</td>");
                                                        out.println("<td>"+rights+"</td>");
                                                        %>
                                                        <td><a class="click" href="screen_admin_edit.jsp?id=<% out.println(id);%>">Edit</a></td>
                                                        <td><a class="click" onclick="deleteAlert(<% out.println(id);%>)" >Delete</a></td>
                                                        <%
                                                        out.println("</tr>");
                                                        
                                                    }  
                                                    
                                                    out.println("</table>");
                                                    if(count==0){
                                                        out.println("<br><h3>No Admins Found!!</h3>");
                                                    }

                                                    con.close();  
                                          }
                                          catch(Exception e){
                                              out.println("error.... <br>"+e);
                                          }
                                          %>			
                                </table>
                            </div>
			</article>
                
                        
		
</body>
<br><br><br>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>
