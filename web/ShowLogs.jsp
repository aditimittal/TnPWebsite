<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logs Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
  
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">       
        <style>
                table {
                    width: 100%;
                }

                td{
                    padding: 0.5em;
                }
                
                th {
                    padding: 10px;
                }      
        </style>
        
        
        
    </head>
    <body>
            
        <%
            
            Statement st;
            ResultSet res, r;
            int entry_per_page, limit, offset, numberRow=0, total_pages=0;
            int pageNO = Integer.parseInt(request.getParameter("page"));
            try {
                
                st = (Statement) con.createStatement();
                
                String sqlrow = "select count(*) from logtable";
                r = st.executeQuery(sqlrow);
                while(r.next()){
                    numberRow = r.getInt("count(*)");
                    //out.println(numberRow);
                }
                
                entry_per_page = 30;
                offset =(pageNO-1) * entry_per_page;
                total_pages = numberRow/entry_per_page;
                if(numberRow % entry_per_page != 0)
                    total_pages = total_pages+1;
                    
                //out.println("numberRow"+numberRow);
                //out.println("total_pages"+total_pages);
                String sql = "Select *from logtable order by update_date desc, update_time desc LIMIT "+offset+",30" ;
                res = st.executeQuery(sql);
                
        %>

        <div id="display" class="boxborder" style="overflow-x:auto;">
            <center><b><h3 class="tnpheading"> Date: <%= new java.util.Date()%></h3></b></center>

            <%
                java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                String formattedDate = df.format(new java.util.Date());
                //out.println(formattedDate);
            %>
            <br>
            <table>
                <tr >
                    <th style="width:5em"> S.NO. </th>
                    <th style="width:15em"> USER </th>
                    <th style="width:50em"> CONTENT </th>
                    <th style="width:15em"> DATE </th>
                    <th style="width:15em"> TIME </th>
                </tr>
                <%
                    int count = offset;
                    while (res.next()) {
                        //out.println(res.getString("name"));
%>
                <tr class="table_row" data-toggle="modal" data-target="#myModal">
                    <td> <%= (count+1) %> <input type="hidden" class="hidden-msg" name="msg" value="<%= res.getString("msg") %>" ></td>
                    <td class="row-user"> <%= res.getString("user")%> </td>
                    <td class="row-content"> <%= res.getString("content")%> </td>
                    <td> <%= res.getString("update_date")%> </td>
                     <td> <%= res.getString("update_time")%> </td>
                </tr>               
                

                <%
                        count++;
                    }
                %>
           
            </table>             
               
        </div>
        <%
                con.close();
                if(count == 0){
        %>
        <h4><center> NO DATA AVAILABLE  </center> </h4>
        <%
                }

            } catch (Exception e) {
                out.println("Error: " + e);
            }
       
            String prevURL = "ChangePage.jsp?link=prev&page="+request.getParameter("page"); 
            String nextURL = "ChangePage.jsp?link=next&page="+request.getParameter("page"); 
            //out.println(url);
        %> 
        <br>
        <% 
            if(pageNO != 1){
        %>
        <a style="float:left;margin-left:10%; font-size:20px;" href=<%= prevURL %> > <b>Prev</b> </a>
        <% 
            }
            if(pageNO != total_pages && total_pages > 1){
        %>
        <a style="float:right;margin-right:10%; font-size:20px;" href=<%= nextURL %> > <b>Next</b> </a>
        <% 
            }
        %>
        
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"></h4>
                    </div>
                <div class="modal-body">
                    <h3 id="content-heading" > </h3>
                    <i><p id="display-msg"></p></i>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                </div>
            </div>
        </div>
        <!--End of Modal -->
        <script>
            console.log($);
            $(function(){
                console.log("jquery");
                $('#myModal').on('show.bs.modal', function (event) {
                    var row = $(event.relatedTarget);
                    var modal = $(this);
                    //console.log("my content");
                    var name = row.find(".row-user").html();
                    modal.find(".modal-title").text(name);
                    var cont = row.find(".row-content").html();
                    modal.find('#content-heading').text(cont);
                    var msg = row.find(".hidden-msg").val();
                    //console.log(msg);
                    modal.find('#display-msg').text(msg);
                    
                });
            });
            
        </script>
        
    </body>
    <br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>