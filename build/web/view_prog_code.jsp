<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">  
        <style>
            .body-wrapper{
                min-height:50vh;
            }
        </style>
    </head>
    <body>
        <div class="body-wrapper boxborder" style="overflow-x: auto; margin-bottom:4%;">
            <center><h2 class="tnpheading">PROGRAMME & BRANCH CODES</h2></center>
        <%! Connection con1; %>
        <%! String sql, sql2; %>
        <%! Statement stm, stm2; %>
        <%! ResultSet res, res2; %>
        
        <%
        try{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_2014","root","");
            
            stm = (Statement)con1.createStatement();
            sql = "select *from programme_codes order by Programme_Code;";
            res = stm.executeQuery(sql);
            
        %>
        
        <table class="table" style="margin-top:5em;margin-left:9em;width:80%">
            <thead class="thead-dark">
                <tr>
                    <th>PROGRAMME CODE</th>
                    <th>BRANCH CODE</th>
                    <th>PROGRAMME NAME</th>
                    <th>TYPE</th>
                </tr>
            </thead>
            <tbody>
                
        <%
            while(res.next()){
                String prog_code = res.getString("Programme_Code");
                String prog_name = res.getString("Programme_Name");
                String prog_type = res.getString("Programme_Type");
                int count = 0;
                stm2 = (Statement)con1.createStatement();
                sql2 = "select * from branch_codes where Programme_Name = '"+ prog_name +"';";
                System.out.println(sql2);
                res2 = stm2.executeQuery(sql2);
                while(res2.next()){
                    count++;
                    String branch_code = res2.getString("Branch_Code");
                    String full_prog_name = prog_name+" - "+res2.getString("Branch_Name");
        %>
                <tr>
                    <td> <%=prog_code%> </td>
                    <td> <%=branch_code%> </td>
                    <td> <%=full_prog_name%> </td>
                    <td> <%=prog_type%> </td>
                </tr>
        <%
                }

                if(count == 0){
        %>
        
                <tr>
                    <td> <%=prog_code%> </td>
                    <td> --- </td>
                    <td> <%=prog_name%> </td>
                    <td> <%=prog_type%> </td>
                </tr>
                
        <%

                }
            }
        
        }    
        catch(Exception e){
            System.out.println("Error "+e);
        }
        
        %>
        
            </tbody>
        </table>
        </div>
    </body>
</html>
<footer><%@include file="footer2.jsp" %></footer>