<%
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page errorPage="ErrorPage.jsp"%>
<%  
    String eno=(String)session.getAttribute("eno"); 
    ResultSet r = null;  
    String yr=eno.substring(7, 11);
    String db1="db_"+yr;
    String dr = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/"+db1;
    String id = "root";
    String pass = "";
    if(eno != null){  
        try {
        Class.forName(dr);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        try{
            Connection c = DriverManager.getConnection(url, id, pass);
            Statement s = c.createStatement();
            c.setCatalog(db1);
            String q = "SELECT Enrollment_Number FROM  " +db1+  "."+"personal_details WHERE Enrollment_Number="+eno;
            r = s.executeQuery(q);
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    else{
      response.sendRedirect("student_login.jsp");
    }
    
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
            <p style="font-size:1.3em; color:green;"> You are logged in as student</p>
        </center>
        </div>
        <div class="col-sm-3 profile">
          <div class="dropdown">
            <a href="#" class="dropdown-toggle nounderline" data-toggle="dropdown">
            <span class="glyphicon glyphicon-user" style="margin-right: -0.2em;"></span>
            <strong><%= eno %></strong>
            <span class="glyphicon glyphicon-chevron-down"></span>
        </a>
            <ul class="dropdown-menu">
              <li><a href="logout.jsp">Logout</a></li>
              <li><a href="student_change_password.jsp">Change Password</a></li>
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
            <ul class="nav navbar-nav">
              <li><a href="#">HOME</a></li>
              <li><a href="Stu_List_Notification.jsp">NOTIFICATION</a></li>
              <li><a href="calendarStudent.jsp">CALENDAR</a></li>
              <%
                if(r!=null && !r.isBeforeFirst()){
              %>
              <li><a href="personalInfo.jsp">REGISTER</a></li>
               <%
                }
                else if(r!=null && r.isBeforeFirst()){
               %>
                <li><a href="UpdateProfileStudent.jsp">UPDATE PROFILE</a></li>
            <%  }%>
                <li><a href="input_marks.jsp">ENTER MARKS</a></li>
                <%
                    try{
                    Connection c1 = DriverManager.getConnection(url, id, pass);
                    Statement s = c1.createStatement();
                    String course=eno.substring(3,5);
                    String sr1="select * from programme_codes where programme_code='"+course+"'";
                    ResultSet result=s.executeQuery(sr1);
                    result.next();
                    String pduration=result.getString("Programme_duration");
                    int year=Integer.parseInt(yr);
                    int pdur=Integer.parseInt(pduration);
                    Date date=new Date();
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(date);
                    int tyear = cal.get(Calendar.YEAR);
                    if(year+pdur==tyear||year+pdur==tyear+1)
                    {
                %>
                <!--<li><a href="student_offers.jsp">COMPANY OFFERS</a></li>-->
                <%}  }catch(Exception e){
                out.println(e+"   in dash");
}%>
              <li><a href="#">PLACEMENT POLICY</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
</body>
</html>