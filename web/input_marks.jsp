<%-- 
    Document   : input_marks
    Created on : Dec 4, 2017, 6:52:41 PM
    Author     : pallavisingh
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="dash.jsp" %> 
 <%  


    eno=(String)session.getAttribute("eno"); 
    session.setAttribute("count",0);
    session.setAttribute("deadline","");
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
  <title>IGDTUW</title>
  <style>
    #display-box{
        margin-top:1%;
        background-color:#f5f5f0;    
        line-height:1.5em;
        width:60%;
        padding-top: 2%;
        padding-bottom: 3%;
    }
    #box{
        border:solid;
        width:70%;
        background-color:white;
        padding: 3em;
    }
    input[type=text]{
        width: 12em;
        padding: 12px 20px;
        float: right;
        margin-right: 8em;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }   
    label{
        float:left;
        margin-left: 8em;
        font-size: 20px;
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
            session.setAttribute("deadline",end_date);
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
     <!-- /container -->
          <br>

          <center><div id="display-box" class="container">
              <center><h1 class="tnpheading">INPUT MARKS</h1></center><br><br>
          <div id="box">
        <%! Statement st,st4,st5,st6; %>
        <%! ResultSet res1; %>
        <%int sem=0;%>
          <%try{
              if(status.equals("active")){
              //Connection con2;
              Class.forName("com.mysql.jdbc.Driver");  
                String join_year=eno.substring(7);
                String str="jdbc:mysql://localhost:3306/db_"+join_year;
            Connection con1=DriverManager.getConnection(str,"root","");
                            st = (Statement)con1.createStatement();
                            st4 = (Statement)con1.createStatement();
                Date date=new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                int year = cal.get(Calendar.YEAR);
                   
                   int jyear=Integer.parseInt(join_year);
                   int num1=0;
                   int month = cal.get(Calendar.MONTH);
                  int num=year-jyear;
                    if(month<6&&month>=0)
                  sem=num*2;
                    else
                        sem=num*2+1;
                
                    if(sem%2==0)
                    {
                        num1=sem/2;
                    }
                    else
                    {
                        num1=sem/2+1;
                    }
        %>
        <b><h2>Enter marks for semester :
      <%out.println(sem);
      %></h2></b>
      <br>
  <%
          
        ResultSet res4;
        String department=eno.substring(5,7);
        String Course=eno.substring(3,5);
        String squery1="select * from db_"+join_year+".subject_codes where programme_code='"+Course+"' and branch_code='"+department+"' and sem='"+sem+"'";
        ResultSet res6=st4.executeQuery(squery1);        
        Statement st2=(Statement)con1.createStatement();
        ResultSet rs4=st2.executeQuery("Select * from marks where Eno_num='"+eno+"' and semester='"+sem+"'");
        Statement st1 = (Statement)con1.createStatement();
        Integer count1=(Integer)session.getAttribute("count");
        while(res6.next())
        {
            String sub_code=res6.getString("Subject_code");
            String squery2="select * from subjects where Semester='"+sem+"' and Subject_code='"+sub_code+"'";
            res4=st.executeQuery(squery2);
            res4.next();
      %>
      <div class="b">
          <form name="form" class="form-horizontal" action="MarksServlet" method="post" >
              <div id="subBox"><label class="control-label"> <% String sub=res4.getString("Subject_name"); out.println(sub);%></label>
          <div id="subsub">
              <% if(!rs4.next()){%>
              <input list="choose" class="form-control" type="text" name="tnp">
              <%  String insert="INSERT INTO `marks` (`subject_code`, `subject_name`,`marks`,`Eno_Num`, `programCode`, `branchCode`, `semester`) VALUES ('"+sub_code+"','"+sub+"',0,'"+eno+"','"+Course+"','"+department+"','"+sem+"')";
             st1.executeUpdate(insert);
             }else{%>
              <input list="choose" type="text" class="form-control" name="tnp" placeholder="<%=rs4.getString("marks")%>">
              <%}%>
              <datalist id="choose">
                <option value="Not Given">
              </datalist>
              <br><br>
          <input type="hidden" name="subj" value="<%=sub%>">
          </div>
        <%
         out.println("</h4>");
        count1++;
        session.setAttribute("count",count1);   
%>
</div>
      <%  }       
          String sql2="select * from backs where Eno='"+eno+"' and sem<'"+sem+"'";
            ResultSet rs3=st1.executeQuery(sql2);
            if(rs3.next())
            {
                %>
                <h2>Active Backs of:</h2><br>
         <% System.out.println("aaa");
            st5 = (Statement)con1.createStatement();
            String temp="select * from backs where Eno='"+eno+"' and program_code='"+Course+"' and branch_code='"+department+"' and sem<'"+sem+"' order by sem";
            ResultSet rs5=st5.executeQuery(temp);
            System.out.println(temp);
            while(rs5.next())
            {
                System.out.println("jajaja");
                String sub_code=rs5.getString("subject_code");
                String t1="select * from subjects where subject_code='"+sub_code+"'";
                System.out.println(t1);
                st6 = (Statement)con1.createStatement();
                ResultSet rs6=st6.executeQuery(t1);
                rs6.next();
                String si=rs6.getString("Semester");
                int sj=Integer.parseInt(si);
                
                out.println("<h4>");  String sub=rs6.getString("Subject_name"); out.println("Semester "+sj+" : "+sub);
                String t2="select * from db_"+join_year+".marks where subject_code='"+sub_code+"' and Eno_num='"+eno+"' and semester='"+sj+"' and programCode='"+Course+"' and branchCode='"+department+"'";
                Statement stmt=con.createStatement();
                ResultSet rs7=stmt.executeQuery(t2);
                rs7.next();
                String m=rs7.getString("marks");
                int marks=Integer.parseInt(m);
                %>
                <input type="text" class="form-control" name="back" value="<%=marks%>"><br><br>
                <input type="hidden" name="back_subj" value="<%=rs5.getString("subject_code")%>">
      <%
           out.println("</h4>");           
           }
        }
        con1.close();
          %>
          <br>
          <center><input type="submit" value="Submit" class="tnpbtn"></center>
          </form>
       </div>
      <% }
              else{
                  %>
                  <b> Status : <%= status %> </b> 
          
          <%
              }
          }catch( Exception e){
                out.println("Error: "+e);
            }
%>

                
              
       </div>
          </div></center>
  <br><br><br>
</body>
</html>
<footer><%@include file="footer2.jsp" %></footer>