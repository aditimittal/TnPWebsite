<%-- 
    Document   : view_subjects
    Created on : Jan 13, 2018, 7:37:00 PM
    Author     : pallavisingh
--%>
<%@page errorPage="ErrorPage.jsp"%>
<%@include file="common_header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IGDTUW</title>
    </head>
    <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
 .container{
                margin-top:8%;
                margin-left: 5%;
                background-color:#f5f5f0;    
                line-height:1.5em;
                width:90%;
                padding: 3% 3% 3% 3%;
                display: inline-block;
            }
                #box{
                border:solid;
                width:81%;
                padding:3em;
                
                margin: 0 auto;
                background-color:white;
            }
            #t_course,#t_branch,#year1,#branch1,#branch2,#branch3,#sem1,#course1{
                display: inline-block;
            }
            .DynamicTable{
                margin: 0 auto;
            }
            .add{
                padding: 2%;
            }
            a{
                border-bottom: none;
            }
            </style>
<script type="text/javascript" src="js/min.js"></script>
    <body>
        <br>
        <div class="container" >

                
                        
                        <h3 style="color:#008000;"><center>VIEW SUBJECTS</center></h3>
                        <br>
                        <center>
                        <div id="year1">
                                 <select name='year'id="year" onchange="selectCourse(this.value)">

                                <%  
                                     Date date=new Date();
                                    Calendar cal = Calendar.getInstance();
                                    cal.setTime(date);
                                    int year = cal.get(Calendar.YEAR);
                                    int month = cal.get(Calendar.MONTH);
                                     for(int j=year;j>=2013;j--)
                                     {
                                         if(month>=0&&month<6&&j==year)
                                         {j--; year--;
                                            %>
                                         <option value='<%=j%>' selected><%=j%></option>
                                         <% 
                                         }
                                        else if(month>=6&&j==year)
                                        {
                                             %>
                                         <option value='<%=j%>' selected><%=j%></option>
                                         <% 
                                        }
                                        else{
                                         %>
                                         <option value='<%=j%>'><%=j%></option>
                                         <%}
                                     }
                                %>

                                </select>
                        </div>
                
                        <div id="t_course">
                            <div id="course1">
                                <select name='course' id="course" onchange="selectBranch(this.value)">  
                                    <%
                                        String course="";
                                        String branch="";
                                        System.out.println(branch.length()+"palpalapla");
                                        try{
                                        Class.forName("com.mysql.jdbc.Driver");  
                                        String str="jdbc:mysql://localhost:3306/db_"+year;
                                        Connection con1=DriverManager.getConnection(str,"root","");
                                        Statement st2=con1.createStatement();
                                        ResultSet result = st2.executeQuery("Select * from programme_codes");
                                        String st3="";
                                        int h=0;
                                        while(result.next())
                                        {
                                            String st1=result.getString("Programme_Name");
                                            System.out.println(st1);
                                            if(h==0)
                                            {System.out.println(st1+st1);
                                            st3=st1;
                                            course=st1;
                                                %>
                                                <option selected value="<%=st1%>"><%=st1%></option>
                                                <%
                                            }else
                                            {   
                                            %>
                                            <option value="<%=st1%>"><%=st1%></option>
                                    <%   }
                                        h++;
                                        }
                                        String program=st3;
                                System.out.println(program);
                                Statement stmt5 = con1.createStatement(); 
                                ResultSet rss = stmt5.executeQuery("Select  * from branch_codes where Programme_Name='"+program+"'");

                                %>
                                </select> 
                            </div>
                            <div id="t_branch">
                                <div id="branch2"></div>
                                <div id="branch3"></div>
                                <%         
                                        if(rss.next()){
                                    String branch_name=rss.getString("Branch_Name");

                                    if(!branch_name.equals("null")){ %>
                                <div id="branch1" >

                                    <select name='branch'id="branch">  
                                <%

                                int l=0;
                                do
                                {

                                    String t=rss.getString("Branch_Name");
                                    System.out.println(t+" bbbbbbbbb");
                                    if(l==0)
                                    {
                                        branch=t;
                                       %>
                                      <option  selected value='<%=t%>'><%=t%></option> 
                                <% 
                                    }
                                    else
                                    {
                                       %>
                                      <option  value='<%=t%>'><%=t%></option> 
                                <% 

                                    }
                                    l++;
                                }while(rss.next());

                                %>

                                </select> 

                        </div>
                               <% }

        }
                                %>
                        <div id="sem1">
                            <select name="sem" id="sem" >

                                    <%

                                        Statement stmt = con1.createStatement();  
                                        ResultSet rs1 = stmt.executeQuery("Select  * from programme_codes where Programme_Name='"+program+"'");
                                        rs1.next();
                                        String str1=rs1.getString("Programme_Duration");
                                        int s=Integer.parseInt(str1);
                                        int i=1;
                                        while(i<=s*2)
                                        {
                                            if(i==1)
                                            {%>

                                                <option selected value="<%=i%>"><%=i%></option>  
                                                <%
                                            } else
                                                {
                                                       %> <option value="<%=i%>"><%=i%></option>  <%
                                                        } 
                                                        %>
                                         <%i++;
                                        }                   

                                    }
                                    catch(Exception e)
                                    {
                                        System.out.println(e);
                                    }
                                    %>
                                </select>
                        </div>
                    </div>
                </div>
                &nbsp;&nbsp;
        <a onclick="showTable()" style="border-bottom: none;">
            <span  class="glyphicon glyphicon-circle-arrow-right" style="color:green;font-size: 25px;"></span>
        </a></center>
                <script>
                    var xmlHttp;
                      function showTable()
                        {
                            console.log("Show Table");
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
                              var year=document.getElementById("year").value;
                              var course=document.getElementById("course").value;
                              var sem=document.getElementById("sem").value;
                                    var branch="null";
                                    
                              if ($('#branch').length > 0) 
                                { 
                                           branch=document.getElementById("branch").value;
                                }
                                
                                
                              var url="state_change_data.jsp";
                              url+="?year="+year+"&course="+course+"&branch="+branch+"&sem="+sem;
                              
                              console.log(url);
                               xmlHttp.onreadystatechange = stateChangeData;
                              xmlHttp.open("GET", url, true);
                              xmlHttp.send(null);

                        }


                        function stateChangeData()
                        {
                           if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
                        document.getElementById("DynamicTable").innerHTML=xmlHttp.responseText;
                        console.log(xmlHttp.responseText);
                        }
                        }  

                </script>
                        <br><br><br>
            <div class="table-responsive">          
            <table class="DynamicTable">
              
            <tr>
                <th>SUBJECT CODE</th>
                <th>SUBJECT NAME</th>
                <th>CREDITS</th>
                <th></th>
            </tr>
           
                
                <%
                    try{
                           System.out.println("aaaaaaqqqqqq");
                            Class.forName("com.mysql.jdbc.Driver");  
                        String str="jdbc:mysql://localhost:3306/db_"+year;
                        Connection con1=DriverManager.getConnection(str,"root","");
                           Statement st = (Statement)con1.createStatement();
                           int sem=1;
                           %>
                                <input type="hidden" id="year2" name="year1" value="<%=year%>">
                               <input type="hidden"id="sem2" name="sem1" value="<%=sem%>">
            <%
                           String course_code="";
                           if(course.length()!=0)
                           {
                               String query="select * from programme_codes where Programme_Name='"+course+"'";
                               System.out.println(query);
                               ResultSet r=st.executeQuery(query);
                               r.next();
                                course_code=r.getString("Programme_Code"); 
                                System.out.println(course_code);
                           }
                           String sql="";
                            String query="select * from branch_codes where Programme_Name='"+course+"'";
                                System.out.println(query);
                            ResultSet r=st.executeQuery(query);
                               r.next();
                               String sqly="";
                               if(r.next())
                               {String b_code=r.getString("Branch_Code");
                               sql="select * from subject_codes where sem='"+sem+"' and programme_code='"+course_code+"' and branch_code='"+b_code+"'";
                             sqly="select count(subject_code) from subject_codes where sem='"+sem+"' and programme_code='"+course_code+"' and branch_code='"+b_code+"'";
                               }
                               else
                               {
                                   sql="select * from subject_codes where sem='"+sem+"' and programme_code='"+course_code+"' and branch_code='null'";
                             sqly="select count(subject_code) from subject_codes where sem='"+sem+"' and programme_code='"+course_code+"'";
                               }
                            ResultSet rr=st.executeQuery(sqly);
                            rr.next();
                            System.out.println(rr.getString("count(subject_code)")+"count");
                           
                           String h=rr.getString("count(subject_code)");
                           ResultSet rs=st.executeQuery(sql);
                           int i=0;
                           int count=Integer.parseInt(h);
                           System.out.println(sql);
                           String []arr=new String[count];
                           int idx1=0;
                           while(rs.next())
                           {
                               arr[idx1]=rs.getString("subject_code");
                               System.out.println(arr[idx1]);
                               idx1++;
                           }
                                           idx1=0;
                           while(idx1<count)
                           { i=i+1;
                           String sql1="select * from subjects where Subject_Code ='"+arr[idx1]+"' and semester='"+sem+"'";
                ResultSet rsr=st.executeQuery(sql1);
                System.out.println(sql1);
                            if(rsr.next()){
                                System.out.println(idx1+" "+count+"first");
                           String tr="row"+i;
                           String td2="name_row"+i;
                           String td1="code_row"+i;
                           String td3="credit_row"+i;
                           String eb="edit_button"+i;
                           String sb="save_button"+i;
                           String icon="icon"+i;
                           System.out.println(year+"year");
                               %>
                              
            <tr id="<%=tr%>">    <td id="<%=td1%>"><%=arr[idx1]%></td> 
                                  <td id="<%=td2%>"><%=rsr.getString("Subject_name")%></td>
                    <td id="<%=td3%>"><%=rsr.getString("credits")%></td>
                    <td id="<%=icon%>">
                    
                        <a onclick="save_row('<%=i%>')" style="border-bottom: none;">
                    <span id="<%=sb%>"class="glyphicon glyphicon-save-file" style="color:green;font-size: 20px;border-bottom: none;display:none;"></span>
                    </a>
                    <a  onclick="edit_row('<%=i%>')" style="border-bottom: none;">
                    <span id="<%=eb%>" class="glyphicon glyphicon-edit" style="color:#6c9dc6;font-size: 20px;"></span>
                   </a>&nbsp;&nbsp;
                   <a onclick="delete_row('<%=i%>')" style="border-bottom: none;">
            <span  class="glyphicon glyphicon-trash" style="color:#A0522D;font-size: 20px;"></span>
        </a>
                    </td>
            </tr>
            
                               <%}idx1++;
                           }
               
                    }catch( Exception e){
                out.println("Error: "+e);
            }
                %>
                <tr id="-1">
<td><input type="text" id="new_country"></td>
<td><input type="text" id="new_name"></td>
<td><input type="text" id="new_age"></td>
<td><input type="button" class="add" onclick="add_row();" value="Add Subject"></td>
</tr>
        </table> 
               
            </div>
        
    </body>
</html>
