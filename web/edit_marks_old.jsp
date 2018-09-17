<%-- 
    Document   : Edit Marks
    Created on : Dec 7, 2017, 2:55:44 PM
    Author     : pallavisingh
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@include file="dash.jsp" %>
 <%  

    eno=(String)session.getAttribute("eno");  
    session.setAttribute("count",0);

  
    
 if(eno==null){
      response.sendRedirect("student_login.jsp");
    }
    %>

<%
    
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
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
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <%@include file="css/bootstrap.min.css" %>
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

                #display-box{
                margin-top:8%;
                margin-left:9%;
                background-color:#f5f5f0;    
                line-height:1.5em;
                width:81%;
                padding: 3% 3% 3% 9%;
            }
                #box{
                border: solid;
                border-color:#29582D;
                width:70%;
                padding: 3em;
                margin-left:12%;
                background-color:white;
            }
            #subBox{
                text-align:right;
            }
            
            h2, .h2 {
    font-size: 30px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

            h4, .h4 {
    font-size: 18px;
    font-family: 'Helvetica', 'Arial', sans-serif;
    text-align: center;
}
            
            button{
             font-size:20pt;
             background-color:#7BA566;border:2px greenyellow;border-radius: 8px;padding-top: 20px;
  padding-left: 15px; margin:20px; padding-right: 15px;color: white;
  padding-bottom: 20px; font-family: 'Helvetica', 'Arial', sans-serif;
            }
            
            .button {
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}

.button:hover {
    background-color: #29582D;
    color:white; 
}

.newclass{
    
    width: 40%;
    height: 34px;
    
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

footer {
        clear: both;
        position: relative;
        z-index: 10;
        height: 3em;
        bottom:0;
}
    
  </style>
  
</head>
  
  <body>
      <%
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");

        String course, branch, student_year, start_date = null, end_date = null; 
        String status = null;
        course = eno.substring(3, 5);
        branch = eno.substring(5,7);
        student_year = eno.substring(7);
        Calendar now = Calendar.getInstance();   // Gets the current date and time
        int current_year = now.get(Calendar.YEAR); 
        int y = current_year - Integer.parseInt(student_year);
        
        String query = "select * from deadline where course = '"+course+"' and Department = '"+branch+"' and year='"+Integer.toString(y)+"'";
        Statement stm1 = con.createStatement();
        ResultSet rs1 = stm1.executeQuery(query);
        if(rs1.next()){
            start_date = rs1.getString("start_date");
            end_date = rs1.getString("end_date");
            
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
        }
        else{
            status = "Marks cannot be updated!!";
        }
        
        
                  
        
      %>
          <br>

        
          <div id="display-box">
          <div id="box"><center>
          <%! Statement st; %>
        <%! ResultSet res1; %>
        <%int sem=0;%>
          <%try{
              if(status.equals("active")){
                  Class.forName("com.mysql.jdbc.Driver"); 
                  String join_year=eno.substring(7);
                  String str="jdbc:mysql://localhost:3306/db_"+join_year;
                  Connection con1=DriverManager.getConnection(str,"root","");
                st = (Statement)con1.createStatement();
                Date date=new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                int year = cal.get(Calendar.YEAR);
                   
                   int jyear=Integer.parseInt(join_year);
                   
                   int month = cal.get(Calendar.MONTH);
                  int num=year-jyear;
                    if(month<6&&month>=0)
                  sem=num*2;
                    else
                        sem=num*2+1;
                int num1=0;
                if(sem%2==0)
                {
                    num1=sem/2;
                }
                else
                {
                    num1=sem/2+1;
                }
        %>
        <b><h2>Edit marks for semester:
      <%out.println(sem);
      %></h2></b>
      <br>
      <%
          
         
        ResultSet res4;
        String department=eno.substring(5,7);
        String Course=eno.substring(3,5);
        String squery2="select * from db_"+join_year+".subjects where Semester='"+sem+"' and programme_code='"+Course+"' and branch_code='"+department+"'";
        res4=st.executeQuery(squery2);
                    res4.next();
        String squery3="select * from db_"+join_year+".marks where Eno_num='"+eno+"'and semester='"+sem+"' and programCode='"+Course+"' and branchCode='"+department+"'";
        Statement st2=(Statement)con1.createStatement();

        ResultSet rs4=st2.executeQuery(squery3);
ResultSet rs;
Statement st1 = (Statement)con1.createStatement();
 Integer count1=(Integer)session.getAttribute("count");
        while(rs4.next())
        {

      %>
      <div class="b">
          <form name="form" action="MarksServlet" method="post" >
              <div id="subBox"> <%  out.println("<h4>");  String sub=rs4.getString("subject_name"); out.println(sub);
//%>
             <input class = "newclass" type="text" name="tnp" value="<%=rs4.getString("marks")%>"><br><br>
          <input type="hidden" name="subj" value="<%=sub%>">
        <%
         out.println("</h4>");
        count1++;
        session.setAttribute("count",count1);
        %>
        
</div>
      <%  } %>
      <center><button class="button">Submit</button></center>
       </div>
      </form>
       
      <%  }
          else{
                  %>
                  <b> Status : <%= status %> </b> 
          
          <%
              }
          }catch( Exception e){
                out.println("Error: "+e);
            }
%>
              </center>
       </div>
          </div>
        <br><br><br>
</body>
</html>
<footer><%@include file="footer2.jsp" %></footer>