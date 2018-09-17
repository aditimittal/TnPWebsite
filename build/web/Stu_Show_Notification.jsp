<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<%@include file="connection.jsp" %>
<%@include file="dash.jsp" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <style>
            #display-box{
                margin-top:5%;
                margin-bottom:3%;
                background-color:#f5f5f0;    
                line-height:1.5em;
                width:45%;
            }
            #box{
                border:solid;
                width:70%;
                background-color:white;
                padding: 3% 3% 3% 3%;
                margin-top: 6%;
                margin-bottom: 9%;
            }
            @media screen and (max-width: 768px) {
                h1{
                    font-size: 5.5vw;
                }
                h2{
                    font-size: 4vw;
                }
                .notification{
                    font-size: 2vw;
                }
            }
        </style>
    </head>
    <body>
        <%! Statement st; %>
        <%! ResultSet res; %>
        
        <div class="container" id="display-box">
            <center>
                <h2 class="tnpheading"> NOTIFICATION </h2>
            </center>
            
        <div class="container" id="box">
        
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
              
            
            try{
                st = (Statement)con.createStatement();
                String sql = "SELECT * FROM notifications WHERE id = "+id;

                res = st.executeQuery(sql);
                while(res.next()){
        %>
        
        <center><h2> <%= res.getString("subject") %> </h2>
            <p class="notification"><b> DATED: <%= res.getString("postdate") %> </b></p>
            <br><br>
            <p class="notification"><i> <%= res.getString("info") %> </i> </p>
        
        <%
                String url = "DownloadAttachmentServlet?id="+id;
                if(res.getString("filename") != null){
        %>
            <a class="notification" href= <%= url %> >
                <b> <%= res.getString("filename") %> </b>
            </a></center>
            
        <%
                    }
                    
                }
                
            }catch( Exception e){
                out.println("Error: "+e);
            }
        %>
        
        
        </div>
        </div>
    </body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>