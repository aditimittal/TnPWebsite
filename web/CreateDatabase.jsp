<%-- 
    Document   : CreateDatabase
    Created on : 19 Nov, 2017, 8:35:21 PM
    Author     : aashi
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common_header.jsp" %>
<%@include file="connection.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/commonCSS.css">        
        <style>
            #part-1{
                margin-top: 7em;
                width:50%;
                height: 50%;
                float: left;
            }
            #part-2{
                margin-top: 7em;
                width:50%;
                height: 50%;
                float: right;
            }
            .styled-select {
                background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
                height: 29px;
                overflow: hidden;
                width: 3em;
             }
             .styled-select select {
                background: transparent;
                border: none;
                font-size: 14px;
                height: 29px;
                padding: 5px; /* If you add too much padding here, the options won't show in IE */
                width: 268px;
             }

             .styled-select.slate {
                background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
                height: 45px;
                width: 300px;
                padding:5px;
                text-align-last: center;
                font-size: 1.5em;
                
             }

             .styled-select.slate select {
                border: 1px solid #ccc;
                font-size: 16px;
                height: 45px;
                width: 300px;
             }
             
             #create-db-button, #delete-db-button{
                margin-top:6%;
             }
             
             #select-year{
                 background-color: white;
                 border: 1px solid #ccc;
                 text-align: center;
                 font-size: 1.5em;
                 height: 45px;
                 width: 300px;
             }
             
             #result-msg
             {
                color: red;
             }

        </style>
        
        <script>
function getParameterByName(name, url) 
{
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}  

 $(document).ready(function ()
   {    
       var successNo = getParameterByName('successNo');
       
       if(successNo!==null&&successNo==="1")
       {
           $("#result-msg").html("Programmes and Branchs successfully added");
       }
   });      
            
            
            var isCreate = false;
            var isDelete = false;
            
            $(function() {
                $('#create-db-button').click(function(){
                    var modal = $('#CreateDeleteModal');
                    var year = $("#create-db-form").find("#select-year").val();
                    modal.find(".modal-title").text("Do you want to CREATE DATABASE db_"+year);
                    $('#CreateDeleteModal').modal('show'); 
                    isCreate = true;
                    isDelete = false;
                });
                
                
                $('#CreateDeleteModal').on('hidden.bs.modal', function (event) {
                    isCreate = false;
                    isDelete = false;
                    $("#modal-continue").prop('disabled', false);
                });
                
                
                $('#delete-db-button').click(function(){
                    var modal = $('#CreateDeleteModal');
                    var year = $("#delete-db-form").find("#del-select-year").val();
                    modal.find(".modal-title").text("Do you want to DELETE DATABASE db_"+year);
                    $('#CreateDeleteModal').modal('show'); 
                    isCreate = false;
                    isDelete = true;
                });
                
                $("#modal-continue").click(function(event){
                    event.preventDefault();
                    $(this).attr("disabled", "disabled");
                    if(isCreate){
                        createDb();
                    }
                    else if(isDelete){
                        deleteDb();
                    }
                    else{
                        //do nothing
                    }
                     
                });
                
                var createDb = function(){
                    var yr = $("#select-year").val();
                    console.log("year...."+yr);
                    //event.preventDefault();
                    $.ajax({
                        url : "./CreateDatabaseServlet",
                        type : "Post",
                        data : {
                            'dbyear' : yr
                        },
                        success : function(result){
                            $("#result-msg").html(result);
                            console.log(result);
                            if(result.includes("Database created"))
                            {
                                document.body.style.cursor='wait';
                                window.location="EnterCourseCode.jsp?year="+yr;
                            }
                            $('#CreateDeleteModal').modal('hide');
                        },
                        error: function(response) {
                            $("#result-msg").html("Error Occured! Try Again");
                            //console.log("err", response);
                            $('#CreateDeleteModal').modal('hide');
                        }
                    });
                };
                
                var deleteDb = function(){
                    var yr = $("#del-select-year").val();
                    console.log("year...."+yr);
                    //event.preventDefault();
                    $.ajax({
                        url : "./DeleteDatabaseServlet",
                        type : "Post",
                        data : {
                            'delyear' : yr
                        },
                        success : function(result){
                            $("#del-result-msg").html(result);
                            $('#CreateDeleteModal').modal('hide');
                        },
                        error: function(response) {
                            $("#del-result-msg").html("Error Occured! Try Again");
                            $('#CreateDeleteModal').modal('hide');
                            //console.log("err", response);
                        }
                    });
                };
                
            });
            
            
    //Set the cursor ASAP to "Wait"
    document.body.style.cursor='wait';

    //When the window has finished loading, set it back to default...
    window.onload=function(){document.body.style.cursor='default';};
    
        </script>
    </head>
    <body>
        <div id="body-part">
        <center>
            <%! int year; %>
            <%! int start_year; %>
            <div id="part-1">
                <h2 class="tnpheading"> CREATE DATABASE </h2>
                <%
                    year = Calendar.getInstance().get(Calendar.YEAR);
                %>
                <form id="create-db-form" action="" method="POST">
                    <input type="text" id='select-year' name="dbyear" value="<%=year%>" disabled><br>
                    <input type="button" class="tnpbtn" id="create-db-button" name="create_DB" value="CREATE">

                </form>
                <div id='result-msg'></div>
            </div>
            
            <div id="part-2">
                <h2 class="tnpheading"> DELETE DATABASE </h2>

                <form id="delete-db-form" action="" method="POST">
                    <select id='del-select-year' name="delyear" class="styled-select slate" required>
                      
                <%! Statement st; %>
                <%! ResultSet res; %>
                <%! String db_name; %>
                <%
                    //System.out.println("DELETE");
                    try{
                        st = (Statement)con.createStatement();
                        String sql = "SHOW DATABASES LIKE 'db_%' ";
                        
                        res = st.executeQuery(sql);
                        while(res.next()){
                            db_name = res.getString(1);
                            System.out.println(db_name);
                            db_name = db_name.replace("db_", "");
                            //System.out.println(db_name);
                %>
                <option> <%=db_name %> </option>
                <%
                        }
                    }catch(Exception e){
                        System.out.println(e);
                    }
                    
                %>
      
                    </select><br>
                    <input type="button" class="tnpbtn" id="delete-db-button" name="delete_DB" value="DELETE">

                </form>
                <div id='del-result-msg'></div>
            </div>
        </center>
        </div>
                
        <!-- Modal -->
        <div class="modal fade" id="CreateDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel"> </h3>
                        <br><br>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="modal-continue">Yes, Continue</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Modal -->
    </body>
</html>
<footer class="tnpfooter"><%@include file="footer2.jsp" %></footer>