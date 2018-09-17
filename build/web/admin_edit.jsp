<%-- 
    Document   : admin_edit
    Created on : 10 Jul, 2017, 11:41:22 PM
    Author     : Ashima
--%>


<%@page import="java.util.HashMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@include file="InsertLogs.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style_one.css">
<title>IGDTUW</title>

<style>
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
    
    input[type=text], input[type=password]{
        width: 20%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    }

    input[type=submit] {
        width: 40%;
        background-color: #333333;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #666666;
    }
    
    input[type=checkbox]{
        float: left;
        margin-left: 40%;
    }

</style>
</head>

<body>
    <%! String id;
        String name,desig,dept,rights,pass, email;
        String Text;
    %>
    
    <%
    //for verification of data and updating the data in database
        id = request.getParameter("id");
        email = request.getParameter("email");
         name = request.getParameter("name");
            desig = request.getParameter("designation");
            dept = request.getParameter("department");
            rights = request.getParameter("rights");
           
                
                    
                    if(rights.equals("full")){
                        String query = "update admins set name='"+name+"',email='"+email+"', designation='"+desig+"', department='"+dept+"', rights='"+rights+"' where admin_id="+id;
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        query = "delete from admin_rights where user_id="+id;
                        ps = con.prepareStatement(query);
                        ps.executeUpdate();
                  
                        String username = (String)session.getAttribute("name");
                        String msg = "Rights Edited for "+email+" ("+desig+") "+"of "+dept+" dept";
                        insertLog(username, "Rights Edited", msg );
                
                        response.sendRedirect("screen_admin_rights.jsp");;
                    }
                    else if(rights.equals("partial")){
                        String query = "update admins set name='"+name+"',email='"+email+"', designation='"+desig+"', department='"+dept+"', rights='"+rights+"' where admin_id="+id;
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        query = "delete from admin_rights where user_id="+id;
                        ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        
                        String pages[] = request.getParameterValues("pages");
                        for(int i=0;i<pages.length;i++){
                            query = "insert into admin_rights values("+id+",'"+pages[i]+"')";
                            ps = con.prepareStatement(query);
                            ps.executeUpdate();
                        }
                        String username = (String)session.getAttribute("name");
                        String msg = "Rights Edited for "+email+" ("+desig+") "+"of "+dept+" dept";
                        insertLog(username, "Rights Edited", msg );
                        response.sendRedirect("screen_admin_rights.jsp");
                    }
                
            
            
    %>
    
    
    
    <%
    //for fetching the data and filling up the fields.
    try{
        id = request.getParameter("id");
        String sql = "select * from admins where admin_id ="+id;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        
        while(rs.next()){
            name = rs.getString("name");
            email = rs.getString("email");
            desig = rs.getString("designation");
            dept = rs.getString("department");
            rights = rs.getString("rights");
            pass = rs.getString("password");
        }
        
        
    }catch(Exception e){
        out.println("error...<br>"+e);
    }
    %>
    
    
        <br><br><br><br><br><br><br>
		<div class="clear"> </div>
		<section>
			<article class="box">
				<h1 class="heading">ADD ADMIN</h1>
                                <h5 class="heading" style="color: red"><% out.println(Text); %></h5>
                                
				<br>
                                <div>
                                    <form action="admin_edit.jsp" method="post">
                                        
                                        <label for="name">User Name</label>
                                        <input class="box_one" type="text" name="name" id="name" style="margin-left: 4.6em;" value="<% out.println(name); %>"  disabled>
                                        <br>
                                        <label for="email">User Name</label>
                                        <input class="box_one" type="email" name="email" id="email" style="margin-left: 6.6em;" value="<% out.println(email); %>"  disabled>
                                        <br>
                                        <label for="designation">Designation</label>
                                        <input class="box_one" type="text" name="designation" id="desig" value="<% out.println(desig); %>" style="margin-left: 4.5em;" required >
                                        <br>
                                        <label for="department">Department</label>
                                        <select id="country" name="department" style="margin-left: 7.5em;">
                                            <option value="IT" <% if(dept.equals("IT")){out.println("selected");}%>>IT</option>
                                          <option value="CSE" <% if(dept.equals("CSE")){out.println("selected");}%>>CSE</option>
                                          <option value="ECE" <% if(dept.equals("ECE")){out.println("selected");}%>>ECE</option>
                                          <option value="MAE" <% if(dept.equals("MAE")){out.println("selected");}%>>MAE</option>
                                          <option value="Arch" <% if(dept.equals("Arch")){out.println("selected");}%>>Arch</option>
                                        </select>
                                        
                                        <br><br>
                                        <label for="rights">Rights</label>
                                        <%
                                        if(rights.equals("full")){
                                        %>
                                            <input type="radio" name="rights" onclick="disp()" id="full" value="full" id="r2" style="margin-left: 9.7em;" checked> Full
                                            <input type="radio" name="rights"  onclick="disp()" id="partial"  value="partial" style="margin-left: 1em;"> Partial<br>
                                        <%    
                                        }
                                        else{
                                            %>
                                        <input type="radio" name="rights" onclick="disp()" id="full" value="full" id="r2" style="margin-left: 9.7em;"> Full
                                        <input type="radio" name="rights"  onclick="disp()" id="partial"  value="partial" style="margin-left: 1em;" checked> Partial<br>
                                            <%
                                        }
                                        %>
                                        <%! HashMap<String,Integer> hm=new HashMap<String, Integer>(); %>
                                        <%
                                        if(rights.equals("partial")){
                                            
                                            try{ 
                                                String sql1 = "select rights from admin_rights where user_id="+id;
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery(sql1);
                                                
                                                
                                                
                                                while(rs1.next()){
                                                    hm.put( rs1.getString("rights") , 0);
                                                }
                                                
                                            }catch(Exception e){ 
                                                out.println("error....<br>"+e);
                                            }
                                        %>
                                            
                                        <br>
                                        <input type="submit" value="Submit" id="above" style="visibility: hidden">
                                        <div id="partial_option" style="visibility: visible; margin-top: -5%">
                                            
                                            <label for="pages" style="float: left;margin-left: 30%;">Provide Rights For</label>
                                            <br>
                                            <input type="checkbox" name="pages" value="Notifications" <% if( hm.containsKey("Notifications") ){out.println("checked");}%>><span style="margin-left: -40%">Notifications</span><br> 
                                            <input type="checkbox" name="pages" value="mail box" <% if( hm.containsKey("mail box") ){out.println("checked");}%>><span style="margin-left: -40%">Mail Box</span><br> 
                                            <input type="checkbox" name="pages" value="database" <% if( hm.containsKey("database") ){out.println("checked");}%>><span style="margin-left: -40%">Database</span><br>
                                            <input type="checkbox" name="pages" value="View Statistics" <% if( hm.containsKey("View Statistics") ){out.println("checked");}%>><span style="margin-left: -40%">View Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Update Statistics" <% if( hm.containsKey("Update Statistics") ){out.println("checked");}%>><span style="margin-left: -40%">Update Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Logs" <% if( hm.containsKey("Logs") ){out.println("checked");}%>><span style="margin-left: -40%">Logs</span><br>
                                            <input type="checkbox" name="pages" value="Admin rights" <% if( hm.containsKey("Admin rights") ){out.println("checked");}%>><span style="margin-left: -40%">Admin rights</span><br>
                                            <input type="checkbox" name="pages" value="Set deadline" <% if( hm.containsKey("Set deadline") ){out.println("checked");}%>><span style="margin-left: -40%">Set deadline</span><br>
                                        
                                            
                                        </div>
                                        <input type="submit" value="Submit" id="below" style="visibility: visible">    
                                        
                                        <%    
                                        }
                                        else{
                                        %>
                                        
                                        <br>
                                        <input type="submit" value="Submit" id="above">
                                        <div id="partial_option" style="visibility: hidden; margin-top: -5%">
                                            
                                            <label for="pages" style="float: left;margin-left: 30%;">Provide Rights For</label>
                                            <br><br>
                                            <input type="checkbox" name="pages" value="Notifications"><span style="margin-left: -40%">Notifications</span><br>
                                            <input type="checkbox" name="pages" value="mail box"><span style="margin-left: -40%">Mail Box</span><br>
                                            <input type="checkbox" name="pages" value="database"><span style="margin-left: -40%">Database</span><br>
                                            <input type="checkbox" name="pages" value="View Statistics"><span style="margin-left: -40%">View Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Update Statistics"><span style="margin-left: -40%">Update Statistics</span><br>
                                            <input type="checkbox" name="pages" value="Logs"><span style="margin-left: -40%">Logs</span><br>
                                            <input type="checkbox" name="pages" value="Admin rights"><span style="margin-left: -40%">Admin rights</span><br>
                                            <input type="checkbox" name="pages" value="Set deadline" ><span style="margin-left: -40%">Set deadline</span><br>
                                            
                                        </div>
                                        <input type="submit" value="Submit" id="below" style="visibility: hidden">    
                                        
                                        <%    
                                        }
                                        
                                        
                                        %>
                                        
                                        
                                        <script>
                                            function disp(){
                                                if(document.getElementById('partial').checked){
                                                     document.getElementById('partial_option').style.visibility = 'visible';
                                                     document.getElementById('below').style.visibility = 'visible';
                                                     document.getElementById('above').style.visibility = 'hidden';
                                                }
                                                else if(document.getElementById('full').checked){
                                                     document.getElementById('partial_option').style.visibility = 'hidden';
                                                     document.getElementById('below').style.visibility = 'hidden';
                                                     document.getElementById('above').style.visibility = 'visible';
                                                }
                                            }
                                        </script>
                                        
                                      </form>
                                </div>
				
			</article>
	

</body>

</html>