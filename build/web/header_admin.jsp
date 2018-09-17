<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style_one.css">
	<title>IGDTUW</title>
	<style>
		*{text-align:center;}
		.navbar-default{ background-color: white; border-width:0px}
		<!--.navbar-inverse{ border-width:1% ;height:3%;}-->
		li{padding-left:1% ; font-size:1.2em;}
	</style>
	
</head>

<body>
    <%! String rights;
    int id;
    %>
    <%
    try{
    id = 9;
    
    String sql = "select rights from admins where admin_id="+id;
    Statement stm = con.createStatement();
    ResultSet rs = stm.executeQuery(sql);
    
    while(rs.next()){
        rights = rs.getString("rights");
    }
    
//    out.println(rights);
    }catch(Exception e){
        out.println("error...<br>"+e);
    }
    
    %>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="#" class="navbar-left"><img src="logo.jpg" class="img-responsive" alt="logo" width="120"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav" style="margin-left:150px;">
					<center><h3>Indira Gandhi Delhi Technical University for Women</h3>
					<h4>(Established by Govt. of Delhi vide Act 9 of 2012) <br>(Formerly Indira Gandhi Institute of Technology)
					</h4></center>	
					</ul>
							
				</div><!--/.nav-collapse -->
			</div><!--/.container-fluid -->
		</nav>
	</div> <!-- /container -->
	<nav class="navbar navbar-inverse" >
		<div class="container-fluid">    
			<ul class="nav navbar-nav navbar">
                            <%
                                if(rights.equals("full")){
                                    %>
                            
                            	<li><a href="screen_admin_home.html">NOTIFICATION BOARD</a></li>
				<li><a href="screen_admin_mailbox.html">MAILBOX</a></li>
				<li><a href="screen_admin_database.html">DATABASE</a></li>
				<li><a href="screen_admin_stats.html">STATISTICS</a></li>
				<li><a href="screen_admin_logs.html">LOGS</a></li>
				<li><a href="screen_admin_rights.html">ADMIN RIGHTS</a></li>
				<li><a href="screen_admin_deadlines.html">SET DEADLINES</a></li>
                                <%! HashMap<String,Integer> hm; %>
                            <%
                                }
                                else{
                                    try{ 
                                                String sql1 = "select rights from admin_rights where user_id="+id;
                                                Statement st1 = con.createStatement();
                                                ResultSet rs1 = st1.executeQuery(sql1);
                                                
                                                hm=new HashMap<String, Integer>();
                                                
                                                while(rs1.next()){
                                                    hm.put( rs1.getString("rights") , 0);
                                                    
                                                }
                                                
                                                if( hm.containsKey("notifications") ){
                                                    out.println("<li><a href=\"screen_admin_home.html\">NOTIFICATION BOARD</a></li>");
                                                }
                                                if( hm.containsKey("mail box") ){
                                                    out.println("<li><a href=\"screen_admin_mailbox.html\">MAILBOX</a></li>");
                                                }
                                                if( hm.containsKey("database") ){
                                                    out.println("<li><a href=\"screen_admin_database.html\">DATABASE</a></li>");
                                                }
                                                if( hm.containsKey("Statistics") ){out.println("<li><a href=\"screen_admin_stats.html\">STATISTICS</a></li>");}
                                                if( hm.containsKey("Logs") ){out.println("<li><a href=\"screen_admin_logs.html\">LOGS</a></li>");}
                                                if( hm.containsKey("Admin rights") ){out.println("<li><a href=\"screen_admin_rights.html\">ADMIN RIGHTS</a></li>");}
                                                if( hm.containsKey("Set deadline") ){out.println("<li><a href=\"screen_admin_deadlines.html\">SET DEADLINES</a></li>");}
                                            }catch(Exception e){ 
                                                out.println("error....<br>"+e);
                                            }
                                }
                            %>
				
			</ul>
		</div>
	</nav>
  </body>
</html>