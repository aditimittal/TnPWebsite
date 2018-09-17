<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>


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
            .tnpbtn{
                margin-left: 32%;
                margin-bottom: 4%; 
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
                .tnpbtn{
                    margin-left: 15%;
                }
            }
        </style>
        
        <script>
        function deleteConfirm() {
            var r = confirm("Do you really want to delete the notification?");
            if (r == true) {
                var id = document.getElementById("del_id").value;
                var subject = document.getElementById("subject").value;
                var url = "Delete_Notification.jsp?id="+id+"&subject="+subject;
                window.location = url;
            } 
        }
        </script>
        
    </head>
    <body>
        <%! Statement st; %>
        <%! ResultSet res; %>
        <%! String sub; %>
        
        <div class="container" id="display-box">
            <center>
                <h1 class="tnpheading"> NOTIFICATION </h1>
            </center>
            
        <div class="container" id="box">
        
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
              
            
            try{
                st = (Statement)con.createStatement();
                String sql = "SELECT * FROM notifications WHERE id = "+id;
                res = st.executeQuery(sql);
                while(res.next()){
                    sub = res.getString("subject");
        %>
        
            <h2> <%= sub %> </h2>
            <p><b> DATED: <%= res.getString("postdate") %> </b></p>
            <br><br>
            <p><i> <%= res.getString("info") %> </i> </p>
        
        <%
                String url = "DownloadAttachmentServlet?id="+id;
                if(res.getString("filename") != null){
        %>
            <a href= <%= url %> >
                <b> <%= res.getString("filename") %> </b>
            </a>
            
        <%
                    }
                    
                }     
            }catch( Exception e){
                out.println("Error: "+e);
            }
        %>
        
        </div>
 
        <form>
            <input type ="hidden" id="del_id" name="id" value='<%=id%>' >
            <input type='hidden' id="subject" name='subject' value='<%=sub%>' >
            <input id="del-notifcation" class="tnpbtn" type="button" value="Delete Notification" onclick="deleteConfirm()">
        </form>
        </div>
            <br><br><br>
    </body>
</html>
<footer><%@include file="footer2.jsp" %></footer>