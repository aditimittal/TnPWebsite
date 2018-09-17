<%@page errorPage="ErrorPage.jsp"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>



<%-- 
    Document   : screen_admin_rights2
    Created on : 27 Jun, 2017, 6:19:55 PM
    Author     : ashima
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style_one.css">
<link rel="stylesheet" href="css/commonCSS.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Training and Placement Cell,IGDTUW</title>

<style>
    select{
        width: 90%;    
        padding: 2px 20px;
        margin-left: 2em;
        margin-top: 1em;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    *{
        text-align: center;
        margin: 0px;
        margin-top: 0%;
        margin-left: 0%;
        font-family: 'Helvetica', 'Arial', sans-serif;
        text-decoration: none;
        padding: 0px;
        list-style-type: none;
    }
    .logo
    {
        width: 140px;
        margin-left: 25%;
        float: left;
    }
    input[type=text], input[type=password], input[type=email]{
        width: 90%;
        padding: 2px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

/*    input[type=submit] {
        width: 40%;
        background-color: #7BA566;
        background: url(images/grad1-mask.png) repeat-x top #7BA566;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }*/
/*    input[type=submit]:hover {
        background-color: #666666;
    }
    */
    input[type=checkbox]{
        float: left;
        margin-left: 25%;
        padding: 20%;
    }
    .check{
        float: left;
        margin-left: 100%;
    }
    .box{
        margin-top: -7.3%;
    }
</style>
</head>

<body>
    <%! String id;
        String name,desig,dept,rights,pass,email;
    %>
    <%
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
    
    
		<div class="clear"> </div>
                <br><br><br><br><br><br><br><br>
		<section>
			<article class="box">
				<h1 style="color:#008000;">EDIT ADMIN</h1>
                                
				<br>
                                <div>
                                    <form action="admin_edit.jsp?id=<% out.println(id); %>" method="post">
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="name">User Name</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="name" id="name" style=" text-align: left;" value="<% out.println(name); %>"  >
                                            </div></div>
                                            <br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="email">Email</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="email" name="email" id="email" style=" text-align: left;" value="<% out.println(email); %>"  >
                                            </div></div>
                                            <br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="designation">Designation</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="designation" id="desig" value="<% out.println(desig); %>" style=" text-align: left;" required >
                                            </div></div>
                                            <br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="department">Department</label>
                                        </div>
                                            <div class="col-sm-1 col-md-6">
                                        <input class="box_one" type="text" name="department" id="department" value="<% out.println(dept); %>" style=" text-align: left;" required >
                                            </div>
                                        </div>
                                        <br>

                                        <br>
                                        <div class="row">
                                            <div class="col-sm-0 col-md-1"></div>
                                            <div class="col-sm-1 col-md-2">
                                        <label for="rights" >Rights</label>
                                            </div>
                                        <%
                                        if(rights.equals("full")){
                                        %>
                                       
                                            <div class="col-sm-2 col-md-3">
                                            <input type="radio" name="rights" onclick="disp()" id="full" value="full" id="r2" style=" text-align: left;" checked> Full
                                            </div>
                                        <div class="col-sm-2 col-md-3">
                                            <input type="radio" name="rights"  onclick="disp()" id="partial"  value="partial" style=" text-align: left;"> Partial<br>
                                            </div></div>
                                        <%    
                                        }
                                        else{
                                            %>
                                        <input type="radio" name="rights" onclick="disp()" id="full" value="full" id="r2" style="margin-left: 7em; text-align: left;"> Full
                                        <input type="radio" name="rights"  onclick="disp()" id="partial"  value="partial" style="margin-left: 9em; text-align: left;" checked> Partial<br>
                                            <%
                                        }
                                        %>
                                        <%! HashMap<String,Integer> hm; %>
                                        <%
                                        if(rights.equals("partial")){
                                            
                                            try{ 
                                                String sql1 = "select rights from admin_rights where user_id="+id;
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery(sql1);
    
                                                hm=new HashMap<String, Integer>();
                                                
                                                while(rs1.next()){
                                                    hm.put( rs1.getString("rights") , 0);

                                                }
                        
                                                
                                            }catch(Exception e){ 
                                                out.println("error....<br>"+e);
                                            }
                                        %>
                                            
                                        <br>
                                        
                                        <div id="partial_option" style="display:  block; ">
                                            <br>
                                            <label for="pages" style="float: left;margin-left:21%;">Provide Rights For</label>
                                            <br><br>
                                            <input class="check" type="checkbox" name="pages" value="Notifications" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Notifications") ){out.println("checked");}%>><span style="margin-left: -45%">Notifications</span><br> 
                                            <input class="check" type="checkbox" name="pages" value="mail box" style="float: left; padding-left: 7px;" <% if( hm.containsKey("mail box") ){out.println("checked");}%>><span style="margin-left: -48%">Mail Box</span><br>
                                            <input class="check" type="checkbox" name="pages" value="create_delete_database" style="float: left; padding-left: 7px;" <% if( hm.containsKey("create_delete_database") ){out.println("checked");}%>><span style="margin-left: -34%">Create & Delete Database</span><br>
                                            <input class="check" type="checkbox" name="pages" value="view_database" style="float: left; padding-left: 7px;" <% if( hm.containsKey("view_database") ){out.println("checked");}%>><span style="margin-left: -43%">View Database</span><br>
                                            <input class="check" type="checkbox" name="pages" value="view subjects" style="float: left; padding-left: 7px;" <% if( hm.containsKey("view subjects") ){out.println("checked");}%>><span style="margin-left: -43%">View Subjects</span><br>
                                            <input class="check" type="checkbox" name="pages" value="View Statistics" style="float: left; padding-left: 7px;" <% if( hm.containsKey("View Statistics") ){out.println("checked");}%>><span style="margin-left: -43%">View Statistics</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Update Statistics" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Update Statistics") ){out.println("checked");}%>><span style="margin-left: -41%">Update Statistics</span><br>                                            
                                            <input class="check" type="checkbox" name="pages" value="Logs" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Logs") ){out.println("checked");}%>><span style="margin-left: -50%">Logs</span><br>
                                            <input class="check" type="checkbox" name="pages" value="calender" style="float: left; padding-left: 7px;" <% if( hm.containsKey("calender") ){out.println("checked");}%>><span style="margin-left: -47%">Calender</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Admin rights" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Admin rights") ){out.println("checked");}%>><span style="margin-left: -44%">Admin rights</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Set deadline" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Set deadline") ){out.println("checked");}%>><span style="margin-left: -44%">Set deadline</span><br>
                                            <input class="check" type="checkbox" name="pages" value="View Placements" style="float: left; padding-left: 7px;" <% if( hm.containsKey("View Placements") ){out.println("checked");}%>><span style="margin-left: -41%">View Placements</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Placement Offers" style="float: left; padding-left: 7px;" <% if( hm.containsKey("Placement Offers") ){out.println("checked");}%>><span style="margin-left: -41%">Placement Offers</span><br>
                                        </div>
                                        
                                        
                                        <%    
                                        }
                                        else{
                                        %>
                                        
                                        <br>
                                        
                                        <div id="partial_option" style="display:  none;">
                                            <br>
                                            <label for="pages" style="float: left;margin-left:21%;">Provide Rights For</label>
                                            <br><br>
                                            <input class="check" type="checkbox" name="pages" value="Notifications"  ><span style="float: left; padding-left: 7px;">Notifications</span><br> 
                                            <input class="check" type="checkbox" name="pages" value="mail box" ><span style="float: left; padding-left: 7px;">Mail Box</span><br>
                                            <input class="check" type="checkbox" name="pages" value="create_delete_database" ><span style="float: left; padding-left: 7px;">Create & Delete Database</span><br>
                                            
                                            <input class="check" type="checkbox" name="pages" value="view_database"  ><span style="float: left; padding-left: 7px;">View Database</span><br>
                                            <input class="check" type="checkbox" name="pages" value="view subjects" ><span style="float: left; padding-left: 7px;">View Subjects</span><br>
                                            <input class="check" type="checkbox" name="pages" value="View Statistics"  ><span style="float: left; padding-left: 7px;">View Statistics</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Update Statistics"  ><span style="float: left; padding-left: 7px;">Update Statistics</span><br>                                            
                                            <input class="check" type="checkbox" name="pages" value="Logs" ><span style="float: left; padding-left: 7px;">Logs</span><br>
                                            <input class="check" type="checkbox" name="pages" value="calender"  ><span style="float: left; padding-left: 7px;">Calender</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Admin rights" ><span style="float: left; padding-left: 7px;">Admin rights</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Set deadline"  ><span style="float: left; padding-left: 7px;">Set deadline</span><br>
                                            <input class="check" type="checkbox" name="pages" value="View Placements"  ><span style="float: left; padding-left: 7px;">View Placements</span><br>
                                            <input class="check" type="checkbox" name="pages" value="Placement Offers" ><span style="float: left; padding-left: 7px;">Placement Offers</span><br>
                                        </div>
                                            
                                        
                                        <%    
                                        }
                                        
                                        
                                        %>
                                        
                                        <input type="submit" value="Submit" class="tnpbtn" >
                                        <script>
                                            function disp(){
                                                if(document.getElementById('partial').checked){
                                                     document.getElementById('partial_option').style.display = 'block';
                                                }
                                                else if(document.getElementById('full').checked){
                                                     document.getElementById('partial_option').style.display = 'none';
                                                }
                                            }
                                        </script>
                                        
                                      </form>
                                </div>
				
			</article>


</body>
<br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>
