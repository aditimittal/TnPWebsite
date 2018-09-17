<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="connection.jsp" %>
<%@include file="dash.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<html>
    <head>
        <title> NOTIFICATIONS </title>
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <style>
            #noticelink:link, #noticelink:visited {
                color:black;
                background-color: transparent;
                text-decoration: none;
            }
            #noticelink:hover{
                color:#39843c;
                font-weight: 700;
                background-color: transparent;
                text-decoration: none;
                cursor: pointer;
            }
            #display-area{
                margin-top:5%;
                background-color:#f5f5f0;    
                line-height:1.5em;
                width:65%;
                padding-top: 1%;
            }
            #linking{
                width:50%;
                font-size:1.2em; 
                padding-left:5%;
                text-align:left;
            }
            #dateof{
                width:25%; 
                padding: 5px; 
                text-align:left;
            }
            @media screen and (max-width: 768px) {
                h2{
                    font-size: 6vw;
                }
            }
        </style>
    </head>
    <body>
        <div class="container" id="display-area">
            <center>
                <h2 class="tnpheading"> NOTIFICATION BOARD </h2>
            </center>
            <br>
                    
            <%! Statement st; %>
            <%! ResultSet res; %>
            <%! String url; %>
            <%! int check = 0; %>
        
            <% 
                try{
                    st = (Statement)con.createStatement();
                    String sql = "SELECT * FROM notifications ORDER BY postdate desc, posttime desc";
                    res = st.executeQuery(sql);
            %>
            <div class="row text-center" style="margin:1% 10% 7% 16%; overflow-x:auto;">
                <table style="width:90%;">
                    <tr>
                        <th>NOTIFICATION</th>
                        <th>DATE</th>

                    </tr>
            <%
                    while (res.next()){
                        check = 1;
                        url = "Stu_Show_Notification.jsp?id="+res.getString("id");
            %>
           
                
                <tr>
                    <td id="linking"> <a id="noticelink" href= <%= url %> > 
                            <%= res.getString("subject")%> </a> 
                    </td>
                    <td id="dateof"> <%= res.getString("postdate")%> </td>
                </tr>
            
        
            <%
                    }
                    if(check == 0){

            %>
            <td><b><i> NO NOTIFICATION AVAILABLE </i></b> </td>
            
            <%

                    }
                }catch(Exception e){
                    out.println("Error: "+e);
                }
            %>
                </table>
            </div>
        </div>
                <br><br><br><br>
    </body>
</html>

<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>
