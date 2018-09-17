<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <title> NOTIFICATIONS </title>
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">
        <style>
            #noticelink:link, #noticelink:visited {
                color: black;
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
            .tnpbtn{
                max-width:25%;
                width:100%;
            }
            
            @media screen and (max-width: 768px) {
                h2{
                    font-size: 6vw;
                }
                .tnpbtn{
                    min-width:60%;
                    margin-left: 20%;
                    text-align:center;
                }
            }
        </style>
    </head>

    <body>
  
    <div class="container" id="display-area">
        <div class="row">       
        <h2 class="tnpheading col-sm-7" align="center"> NOTIFICATION BOARD </h2>
        <form action="notify.jsp">
            <input id="new-notifcation" class="tnpbtn col-sm-4" type="submit" value="Post New Notification">
        </form>
<!--        <a href="notify.jsp" class="tnpbtn col-sm-4" style="float:left; width:30%;">Post New Notification</a>-->
        </div><br>
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
        
        <div class="row text-center" style="margin:1% 7% 7% 12%; overflow: auto;">
            <table style="width:90%;">
                    <tr>
                        <th>NOTIFICATION</th>
                        <th>DATE</th>

                    </tr>
                                          
                
        <%
                while (res.next()){
                    check = 1;
                    url = "Show_Notification.jsp?id="+res.getString("id");
        %>
            
                <tr>
                    <td id="linking" > <a id="noticelink"  href= <%= url %> > 
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
    <br><br>
</body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>