<%
    try{
    
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);

%>
<%@page import="java.util.HashMap"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page language="java" contentType="text/html" %>
<%@include file="connection_header.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/header.css">
  <script>
    $(document).ready(function() {
      var url = window.location;
      // Will only work if string in href matches with location
      $('ul.nav a[href="' + url + '"]').parent().addClass('active');
      // Will also work for relative and absolute hrefs
      $('ul.nav a').filter(function() {
        return this.href == url;
      }).parent().addClass('active').parent().parent().addClass('active');
    });
  </script>
  <style>
    a.nounderline {
      text-decoration: none !important;
      font-size: 1.4em;
      color: black;
    }

    a.nounderline:hover {
      color: #39843c;
    }

    .profile>.dropdown>.dropdown-menu {
      background-color: #39843c;
      height: 4em;
    }

    .profile>.dropdown>.dropdown-menu>li>a {
      color: #ffffff;
    }

    .profile>.dropdown>.dropdown-menu>li>a:hover,
    .profile>.dropdown>.dropdown-menu>li>a:focus {
      color: #000000;
      background-color: #e7ffba;
    }

    #logo {
      margin-left: 68%;
      margin-top: 2%;
      margin-bottom: 2%;
    }

    #headings {
      line-height: 1.4em;
      margin-top: 1.2%;

    }

    .profile {
      margin-top: 1.5%;
    }
    
    #igdtu{
        font-size:1.5em; 
        color:green;
    }
    @media (max-width: 767px) {
        .desc {
            display: none;
        }
        #logo{
            width:18%;
            margin-left: 0em;
            margin-top: 0em;
            margin-bottom: 0em;
        }
        #igdtu{
            font-size: 1.2em;
        }
        .headings{
            margin-top: 0em;
        }
        .profile{
            margin-bottom: 1em;
            align:center;
        }
    }
  </style>
</head>
<%! 
    String rights1;
    String name1;
    String id2;
    String admin_name; 
    int id1;
    %>
    <%
    try{
    HttpSession session3=request.getSession(false);
    id1 =  (Integer)session3.getAttribute("idx");

    if(session3==null){ 
    	response.sendRedirect("student_login.jsp");
    }
//        id1 = 9;
 
    String sql = "select rights from admins where admin_id="+id1;
    Statement stm = conn.createStatement();
    ResultSet rs = stm.executeQuery(sql);
  
    while(rs.next()){
        rights1 = rs.getString("rights");
    }
    
    sql = "select name from admins where admin_id ="+id1;
    rs = stm.executeQuery(sql);
    
    while(rs.next()){
        admin_name = rs.getString(1);
    }
    
    stm.close();
    rs.close();

    }
    catch(NullPointerException ne){
        response.sendRedirect("admin_login.jsp");
    }
    catch(Exception e){
        out.println("error1...<br>"+e);
        response.sendRedirect("admin_login.jsp");
    }
    
    session.setAttribute("admin_name", admin_name);
    
%>
<body>
  <div class="container-fluid">
    <div class="row">
      <span class="col-sm-2">
          <center><img id="logo" src="igdtuw.png" width="50%"></center>
    </span>
      <div class="col-sm-7" id="headings">
        <center>
          <p id="igdtu" style=""><b>INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN</b></p>
          <div class="desc">
            <p style="font-size:1em;"><b>(Established by Govt. of Delhi vide Act 9 of 2012)</b></p>
            <p style="font-size:1.3em; color:green;"> You are logged in as admin</p>
        </center>
        </div>
        <div class="col-sm-3 profile">
          <div class="dropdown">
            <a href="#" class="dropdown-toggle nounderline" data-toggle="dropdown">
            <span class="glyphicon glyphicon-user" style="margin-right: -0.2em;"></span> 
            <strong>Welcome <%= admin_name %></strong>
            <span class="glyphicon glyphicon-chevron-down"></span>
        </a>
            <ul class="dropdown-menu">
              <li><a href="admin_logout.jsp">Logout</a></li>
              <li><a href="admin_change_password.jsp">Change Password</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div id="navigation">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <%!  HashMap<String,Integer> hm1; %>
            <%
                if(rights1.equals("full")){
            %>
            <ul class="nav navbar-nav">
                <li><a  href="List_Notification.jsp">NOTIFICATION BOARD</a></li>
                <li><a  href="admin_mailbox.jsp">MAILBOX</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">DATABASE <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="CreateDatabase.jsp" >CREATE / DELETE DATABASE</a></li>
                      <li><a href="screen_admin_database.jsp">DOWNLOAD DATABASE</a></li>
                      <li><a href="view_prog_code.jsp">VIEW PROGRAMME CODE</a></li>
                      <li><a href="view_subjects.jsp">VIEW SUBJECTS</a></li>
                    </ul>
                </li>

                <li><a href="calendar.jsp">CALENDAR</a></li>
                <li><a href="screen_admin_rights.jsp">RIGHTS</a></li>
                <li><a href="screen_admin_deadline.jsp">DEADLINES</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">PLACEMENT RECORD <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="view_placementstats.jsp" >VIEW STATISTICS</a></li>
                      <li><a href="placement1.jsp">UPDATE PLACEMENT RECORDS</a></li>
                      <li><a href="delete_placement.jsp">DELETE PLACEMENT RECORDS</a></li>
                      <li><a href="view_placementDb.jsp">PLACEMENTS</a></li>
                    </ul>
                </li>
                <li><a href="Placement_offer.jsp">PLACEMENT OFFERS</a></li>
                <li><a href="ShowLogs.jsp?page=1">LOGS</a></li>
                 <%
                }
                    else{
                        try{ 
                            String sql1 = "select rights from admin_rights where user_id="+id1;
                            Statement st1 = conn.createStatement();
                            ResultSet rs1 = st1.executeQuery(sql1);

                            hm1=new HashMap<String, Integer>();
                                                
                            while(rs1.next()){
                                hm1.put( rs1.getString("rights") , 0);

                            }
                %>
                <%

                    if( hm1.containsKey("Notifications") ){
                        out.println("<li><a href=\"List_Notification.jsp\">NOTIFICATION BOARD</a></li>");
                    }
                    if( hm1.containsKey("mail box") ){
                        out.println("<li><a href=\"admin_mailbox.jsp\">MAILBOX</a></li>");
                    }
                    if( hm1.containsKey("create_delete_database") || hm1.containsKey("view_database") || hm1.containsKey("view subjects") ){
                        out.println("<li class=\"dropdown\">"
                                + "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">DATABASE <b class=\"caret\"></b></a>"
                                + "<ul class=\"dropdown-menu\">");
                        if(hm1.containsKey("create_delete_database")){
                            out.println("<li><a href=\"CreateDatabase.jsp\" >CREATE / DELETE DATABASE</a></li>");
                            out.println("<li><a href=\"view_prog_code.jsp\">VIEW PROGRAMME CODE</a></li>");
                        }
                        if(hm1.containsKey("view_database")){
                            out.println("<li><a href=\"screen_admin_database.jsp\">DOWNLOAD DATABASE</a></li>");
                        }
                        if(hm1.containsKey("view subjects")){
                            out.println("<li><a href=\"view_subjects.jsp\">VIEW SUBJECTS</a></li>");
                        }
                        out.println("</ul>"
                                + "</li>");
                  
                    }
                    if( hm1.containsKey("calender") ){
                        out.println("<li><a href=\"calendar.jsp\">CALENDER</a></li>");
                    }
                    if( hm1.containsKey("Admin rights") ){
                        out.println("<li><a href=\"screen_admin_rights.jsp\">ADMINSTRATOR RIGHTS</a></li>");
                    }
                    if( hm1.containsKey("Set deadline") ){
                        out.println("<li><a href=\"screen_admin_deadline.jsp\">SET DEADLINES</a></li>");
                    }
                    if(hm1.containsKey("View Statistics")||hm1.containsKey("Update Statistics")||hm1.containsKey("View Placements")){
                        out.println("<li class=\"dropdown\">"+
                                "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">PLACEMENT STATISTICS <b class=\"caret\"></b></a>"+
                                "<ul class=\"dropdown-menu\">");
                        if(hm1.containsKey("View Statistics")){
                            out.println("<li><a href=\"view_placementstats.jsp\" >VIEW STATISTICS</a></li>");
                        }
                        if(hm1.containsKey("Update Statistics")){
                            out.println("<li><a href=\"placement1.jsp\">UPDATE STATISTICS</a></li>");
                        }
                        if(hm1.containsKey("View Placements")){
                            out.println("<li><a href=\"view_placementDb.jsp\">PLACEMENTS</a></li>");
                        }
                        out.println("</ul>"+
                            "</li>");
                    }
                    if( hm1.containsKey("Placement Offers") ){
                        out.println("<li><a class=\"navbar-brand\"href=\"Placement_offer.jsp\">PLACEMENT OFFERS</a></li>");
                    } 
                    if( hm1.containsKey("Logs") ){
                        out.println("<li><a href=\"ShowLogs.jsp?page=1\">LOGS</a></li>"); 
                    }
                                            
                %>
                <% 
                        }catch(Exception e){ 
                            out.println("error....<br>"+e);
                        }
                    }
                %>
            </ul>
          </div>
        </div>
      </nav>
    </div>
        <%
            }
            catch(NullPointerException ne){
                response.sendRedirect("admin_login.jsp");
            }
            catch(Exception e){
                out.println("error last ..<br>"+e);
            }
        %>
</body>
</html>