<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
<%@page errorPage="ErrorPage.jsp"%>
<%  
    String eno=(String)session.getAttribute("eno"); 
    //String eno = "02201032014";
    ResultSet r = null;    
    if(eno != null){
        String yr=eno.substring(7, 11);
        String db1="db_"+yr;
        String dr = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/"+db1;
        String id = "root";
        String pass = "";
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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="no_logo.ico" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>IGDTUW</title>
    <style>    
                .logo{
                    max-width: 70%;
                    height: auto;
                    margin-left: 5%;
                    margin-top: 7%;
                    float: left;
                }
                
                .p1{
                    max-width: 20%;
                }
                
                @media only screen and (max-width: 720px) {
                    .desc {
                        display: none;
                    }
                    .logo{
                        max-width: 60%;
                        height: auto;
                        margin-left: 5%;
                        margin-top: 7%;
                        float: left;
                    }
                    
                    .navbar li a, .navbar .navbar-brand{
                        color: white !important;
                    }
                    .p2{
                        text-align: left;
                        width:78%;
                    }

                    .p3{
                        min-width: 18%;
                    }
                    
                    .head1{
                        margin-top: 32%;
                        margin-left: 35%;
                    } 
                    
                    .main{
                        font-size: 0.5em;
                        font-weight: bold;
                        line-height: 97%;
                    }
                    
                    .menu1{
                        text-align:center;
                        margin: 0px;
                        margin-top:0.1%;
                        margin-left:0%;
                        text-decoration:none;
                        font-weight:bold;
                        padding: 0px;
                        list-style-type:none;
                    }
                    
                }
                
                .x{
                    list-style: none;
                    text-align: center;
                    list-style-position: inside;
                }
                
                li.dropdown:hover > .dropdown-menu 
                {
                    display: block;
                }
                

                .navbar {
                    margin-bottom: 0;
                    background-color: #7BA566 !important;
                    border-color: black;
                    font-size: 12px !important;
                    min-height: 42px;
                    font-weight: bold;
                    cursor: pointer;
                    line-height: 1;
                }

                .navbar li a, .navbar .navbar-brand { 
                    color: white !important;
                }

                .touch .navbar {
                    font-size: 1.25em;
                }

                .dropdown-menu li{
                        background-color:  #7BA566;
                        width:200px;
                }

                .navbar-nav li a:hover {
                    color: #008000 !important;
                }

                .navbar-nav li:hover {
                      background-color: #2db92d;
                }

                .navbar-default .navbar-toggle {
                    border-color: black;
                }

                .navbar li{
                    font-size:11.3px; 
                }

                .wrapper{
                    clear: right;
                    float: right;
                    color: white;
                    padding: 0.01em;
                    margin-top: -7em;
                    width: 15em;
                    background: #FFF;
                    box-shadow: 0 2px 0 rgba(255,255,255,.1) inset;
                }

                .head1{
                    display: inline-block;
                    margin-bottom: 0.005em;
                    font-size: 1em;
                    letter-spacing: 2px;
                    font-weight: 200;
                    color: #21292D;
                }
                
                .class_ul{
                    display: block;
                    font-size: .9em;
                    text-align: justify;
                    margin-top: 1%;
                    color: #748792;
                    height: 0;
                    opacity: 0;
                    transition: .4s ease-in-out;
                }
                
                a{
                    color: black !important;
                }
                
                a:hover {
                    color: #008000 !important;
                }
                
                .li_class{
                    padding-top: 1.2em;
                    font-size: 1.5em;
                }

                .content2{
                    overflow: hidden;
                }

                /* Arrow Indicator */
                
                .arrow{
                        cursor: pointer;
                        color: black;
                        position: relative;
                        top: -12px;
                        visibility: hidden;
                }

                /* :Arrow Symbol */
                .arrow::after{
                    content: '  ';
                    color: black;
                    background-color: #21292D;
                    position: absolute;
                    top: 6px; 
                    visibility: visible;
                     width: 1em; 
                    height: 1em;
                    transition: .4s ease-in-out;

                    /* Arrow is Pure CSS meaning it is sizable and you can change its colour! */
                    border-top: 8px solid transparent;
                    border-bottom: 8px solid transparent;
                    border-left: 8px solid white;
                }

                /* :Rotate Arrow */
                .arrow:checked::after{
                    transform: rotate(90deg);
                }

                /* :Show the Hidden Content */
                .arrow:checked + .class_ul{
                    opacity: 1;
                    height: 4em;
                }


  </style>
</head>
  
  <body>
    <div class="container" style="min-height: 15%;">
        <div class="row">
            <div class="col-lg-2 p1">
                <center><img class="logo" src="logo.jpg" class="img-responsive" alt="logo"></center>
            </div>
            <div class="col-lg-7 p2"> 
                <center><p class="main" style="color: green; font-size: 1.3em; margin-top:1%;"><b>INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN</b></p>
                   <div class="desc">
                        <p style="font-size: 15px;"><b>(Established by Govt. of Delhi vide Act 9 of 2012)</b></p>
                        <p><i>(Formerly Indira Gandhi Institute of Technology)</i></p>
                        <h5> You are logged in as student</h5></center>
                   </div>
            </div>
        </div>

        <div class="wrapper p3">
            <div class="content2">
                <!-- The Arrow Indicator is a Checkbox Element -->
                <h1 class="head1"><%= eno %></h1><input class="arrow" type="checkbox">

                <ul class="class_ul" >
                    <li class="x"><a href="logout.jsp">Logout</a></li>
                    <li class="x"><a href="student_change_password.jsp">Change Password</a></li>
                </ul>
            </div>
        </div>
    </div>

          <br>
          <%try{
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");
          Statement st3 = (Statement)con.createStatement();
          Statement st1 = (Statement)con.createStatement();
          Statement st2 = (Statement)con.createStatement();
          ResultSet res;
                String join_year=eno.substring(7);
                //String sql = "SELECT * FROM db_"+join_year+".personal_details WHERE Enrollment_Number = "+eno;

               // res = st3.executeQuery(sql);
              //  out.println(res);
                //if(res.next()){
                  //  String foundType = res.getString(1);
                    //}
                Date date=new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                int year = cal.get(Calendar.YEAR);
                   
          int num2=0,sem=0;
          int jyear=Integer.parseInt(join_year);
                   int month = cal.get(Calendar.MONTH);
                  int num=year-jyear;
                    if(month<6&&month>=0)
                  sem=num*2;
                    else
                        sem=num*2+1;
                    if(sem%2==0)
                    {
                        num2=sem/2;
                    }
                    else
                    {
                        num2=sem/2+1;
                    }
                    String course1=eno.substring(3,5);
                    String dept1=eno.substring(5,7);
                    String squery2="select * from db_"+join_year+".subjects where Semester='"+sem+"' and programme_code='"+course1+"' and branch_code='"+dept1+"'";
                    ResultSet res4=st3.executeQuery(squery2);
                    res4.next();
                    String sub=res4.getString("Subject_name");
                    String squery3="select * from db_"+join_year+".Marks where Eno_num='"+eno+"'and semester='"+sem+"' and programCode='"+course1+"' and branchCode='"+dept1+"' and subject_name='"+sub+"'";
                    ResultSet res5=st3.executeQuery(squery3);
                    //res5.next();
                   // String marks=res5.getString("marks");
                    //int m=Integer.parseInt("marks");
                   %>

<div class="row menu1">
    <nav class="navbar navbar-inverse" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">            
        <ul class="nav navbar-nav">
            <li><a href="#"><b>HOME</b></a></li>
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
            <%  }  %>
            <% if( !res5.next() ) { %>
                <li><a href="input_marks.jsp">ENTER MARKS</a></li>
            <% } else { %>
                <li><a href="edit_marks.jsp">UPDATE MARKS</a></li>
            <% } %> 
            <% } catch(Exception e)
            {
                out.println("error2..."+e);
            }
            %>
                <li><a href="#">PLACEMENT POLICY</a></li>
        </ul>          
    </div>   
    </nav>
</div>

</body>
</html>