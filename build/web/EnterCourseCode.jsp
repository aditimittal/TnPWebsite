<%-- 
    Document   : EnterCourseCode
    Created on : 1 Dec, 2017, 10:04:20 PM
    Author     : ashim
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>

<%!
   String year = "", SQLQuery="", dbname ="";
   PreparedStatement pst=null;
%>
<%
year = request.getParameter("year");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IGDTUW</title>
        
        <style>
            .heads{
                margin-top: 1%;
            }
            
            input[type=text], select{
                width: 12em;
                padding: 12px 6px;
                
                margin-left: 2%;
                
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
                form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 60%;
        /*margin-left: 20%;*/
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 0;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
    
    table tr td, input[type="radio"], select
    { 
        cursor: pointer;
    }
    
    #bTable{
        width: 90%;
        margin-left: 5%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    #bTable, th, td{
        border: 0;
    }
    #bTable th, #bTable td{
        padding: 10px;
        text-align: left;
    }   
    .custom-btn{
        background-color:#39843c;
/*        border: none;
        color: white;
        padding: 1em 2em;
        text-decoration: none;
        font-size: 1em;
        margin: 4px 2px;
        cursor: pointer;*/
    }
    .tnpbtn, .tnpbtn:hover{
    background-color: #39843c;
    border: none;
    color: white;
    padding: 0.6em 0.7em;
    text-decoration: none;
    font-size: 1em;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 0;
    display: inline-block;
    
}
     @media (max-width: 390px) {
         .heads{
             font-size:20px;
         }
                  
                }
        </style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/t1.js"></script>
<script type="text/javascript" src="js/bootstrap1.js"></script>
  
<script type="text/javascript">     
    var openModal = function(){
        var details = $(this).data('id');

        var Programme_Code = details.split('-')[0];
        var Programme_Name = details.split('-')[1];
        var year = details.split('-')[2];

        var current= Programme_Code+"-"+Programme_Name;    
        $("#title").text(current);

        $("#myModal").modal("show");  
            $("#addTable").html('');
            $.get("DataDisplayBranch.jsp",{current:current, year: year},function(data)
            {            
                $("#addTable").html(data);
            });
    };
    
    $(window).load(function(){  
        $('table tbody tr').on('click',openModal);   
    });
    
    $(function() {
    $('#add-row').click(function() 
     {
            var Programme_Code = $("#Programme_Code").val();
            var Programme_Name = $("#Programme_Name").val();
            var Programme_Duration = $("#Programme_Duration").val();
            var Programme_Type = $("#Programme_Type").val();
            var year = $("#year").text();
    
    if(Programme_Code===null||Programme_Code==="")
    {
        text = "Enter a valid Programme Code";
        $("#message").removeClass("alert-success");
        $("#message").text(text).show();
        $("#message").addClass("alert-danger");
        
        event.preventDefault();
        return false;
    }
    
    if(Programme_Name===null||Programme_Name==="")
    {
        text = "Enter a valid Programme Name";
        $("#message").removeClass("alert-success");
        $("#message").text(text).show();
        $("#message").addClass("alert-danger");
        
        event.preventDefault();
        return false;
    }
    
    if (Programme_Duration===null||Programme_Duration===""||isNaN(Programme_Duration)) 
    {
        text = "Enter a valid Programme Duration";
        $("#message").removeClass("alert-success");
        $("#message").text(text).show();
        $("#message").addClass("alert-danger");
        
        event.preventDefault();
        return false;
    } 
    
    Programme_Code = Programme_Code.replace (/(^\s*)|(\s*$)/gi, "").replace (/[ ]{2,}/gi," ").replace (/\n +/,"\n");
    Programme_Name = Programme_Name.replace (/(^\s*)|(\s*$)/gi, "").replace (/[ ]{2,}/gi," ").replace (/\n +/,"\n");
    Programme_Duration = Programme_Duration.replace (/(^\s*)|(\s*$)/gi, "").replace (/[ ]{2,}/gi," ").replace (/\n +/,"\n");
            
                    event.preventDefault();
                    $.ajax({
                        url : "./CreateCodeServlet",
                        type : "Post",
                        data : {
                            'Programme_Code' : Programme_Code,
                            'Programme_Name' : Programme_Name,
                            'Programme_Duration' : Programme_Duration,
                            'Programme_Type' : Programme_Type,
                            'year' : year
                        },
                        success : function(result)
                        {     
                            if(result==="0")
                            {
                            $("#message").removeClass("alert-success");
                                $("#message").text(Programme_Code+"-"+Programme_Name+" already exists").show();
                                $("#message").addClass("alert-danger");
                            setTimeout(function(){
                            $("#message").fadeOut('slow');
                            }, 1000);
                            }
                            else
                            {
                            $("#message").removeClass("alert-danger");
                            $("#message").text(Programme_Code+"-"+Programme_Name+" successfully inserted").show();
                            $("#message").addClass("alert-success");
                            setTimeout(function(){
                            $("#message").fadeOut('slow');
                            }, 1000);
                                               
            var markup = "<tr data-id='"+Programme_Code+"-"+Programme_Name+"-"+year+"'><td><center><input type='radio' id='infoMetaData' value='"+Programme_Code+"-"+Programme_Name+"'></center></td><td><center>" + Programme_Code + "</center></td><td><center>" + Programme_Name + "</center></td><td><center>" + Programme_Duration + "</center></td><td><center>" + Programme_Type + "</center></td></tr>";
            $("table tbody").append(markup);
            
            $("table tbody").find("[data-id='" +Programme_Code+"-"+Programme_Name+"-"+year+"']").on('click',openModal);
            
            $("#Programme_Code").val('');
            $("#Programme_Name").val('');
            $("#Programme_Duration").val('');
            $("#Programme_Type").val('UNDERGRADUATE');
                            }
                        },
                        error: function(response) {
                            $("#message").html(response);
                            $("#message").html("Error Occured! Try Again");
                            //console.log("err", response);
                        }
                    });
                });
              
        $('#delete-row').click(function() 
        {
            var Programme = $('#infoMetaData:checked').val();
            var year = $("#year").text();
            
                    event.preventDefault();
                    $.ajax({
                        url : "./DeleteCodeServlet",
                        type : "Post",
                        data : {
                            'Programme' : Programme,
                            'year' : year
                        },
                        success : function(result)
                        {
                            $("#message").removeClass("alert-danger");
                            $('#infoMetaData:checked').parents("tr").remove();
                            $("#message").text(Programme+" successfully deleted").show();
                            $("#message").addClass("alert-success");
                            setTimeout(function(){
                            $("#message").fadeOut('slow');
                            }, 1000);
                        },
                        error: function(response) {
                            $("#message").html(response);
                            $("#message").html("Error Occured! Try Again");
                            //console.log("err", response);
                        }
                    });
                });
            });
            
            
    $(function() {
    $('#add-brow').click(function() 
     {
            var Branch_Code = $("#Branch_Code").val();
            var Branch_Name = $("#Branch_Name").val();
            var Programme = $("#title").text();
            var year = $("#year").text();
            
            
    if(Branch_Code===null||Branch_Code==="")
    {
        text = "Enter a valid Branch Code";
        $("#Bmessage").removeClass("alert-success");
        $("#Bmessage").text(text).show();
        $("#Bmessage").addClass("alert-danger");
        
        event.preventDefault();
        return false;
    }
    
    if(Branch_Name===null||Branch_Name==="")
    {
        text = "Enter a valid Branch Name";
        $("#Bmessage").removeClass("alert-success");
        $("#Bmessage").text(text).show();
        $("#Bmessage").addClass("alert-danger");
        
        event.preventDefault();
        return false;
    }
    
    Branch_Code = Branch_Code.replace (/(^\s*)|(\s*$)/gi, "").replace (/[ ]{2,}/gi," ").replace (/\n +/,"\n");
    Branch_Name = Branch_Name.replace (/(^\s*)|(\s*$)/gi, "").replace (/[ ]{2,}/gi," ").replace (/\n +/,"\n");     
                
            
                    event.preventDefault();
                    $.ajax({
                        url : "./CreateBranchCodeServlet",
                        type : "Post",
                        data : {
                            'Programme' : Programme,
                            'Branch_Code' : Branch_Code,
                            'Branch_Name' : Branch_Name,
                            'year' : year
                        },
                        success : function(result)
                        {     
                            if(result==="0")
                            {
                            $("#Bmessage").removeClass("alert-success");
                                $("#Bmessage").text(Branch_Code+"-"+Branch_Name+" already exists for Programme "+Programme).show();
                                $("#Bmessage").addClass("alert-danger");
                            setTimeout(function(){
                            $("#Bmessage").fadeOut('slow');
                            }, 1000);
                            }
                            else
                            {
                            $("#Bmessage").removeClass("alert-danger");
                            $("#Bmessage").text(Branch_Code+"-"+Branch_Name+" successfully inserted").show();
                            $("#Bmessage").addClass("alert-success");
                            setTimeout(function(){
                            $("#Bmessage").fadeOut('slow');
                            }, 1000);
                                               
            var markup = "<tr><td><center><input type='radio' id='infoMetaDataB' value='"+Branch_Code+"-"+Branch_Name+"-"+Programme+"'></center></td><td><center>" + Branch_Code + "</center></td><td><center>" + Branch_Name + "</center></td></tr>";
            $("#addTable tbody").append(markup);
            $("#Branch_Code").val('');
            $("#Branch_Name").val('');
                            }
                        },
                        error: function(response) {
                            $("#Bmessage").html(response);
                            $("#Bmessage").html("Error Occured! Try Again");
                            //console.log("err", response);
                        }
                    });
                });
              
        $('#delete-brow').click(function() 
        {
            var details = $('#infoMetaDataB:checked').val();
            var year = $("#year").text();
            
                    event.preventDefault();
                    $.ajax({
                        url : "./DeleteBranchCodeServlet",
                        type : "Post",
                        data : {
                            'details' : details,
                            'year' : year
                        },
                        success : function(result)
                        {
                            $("#Bmessage").removeClass("alert-danger");
                            $('#infoMetaDataB:checked').parents("tr").remove();
                            $("#Bmessage").text(details+" successfully deleted").show();
                            $("#Bmessage").addClass("alert-success");
                            setTimeout(function(){
                            $("#Bmessage").fadeOut('slow');
                            }, 1000);
                        },
                        error: function(response) {
                            $("#Bmessage").html(response);
                            $("#Bmessage").html("Error Occured! Try Again");
                            //console.log("err", response);
                        }
                    });
                });
            });

$(document).ajaxStart(function() {
    $(document.body).css({'cursor' : 'wait'});
}).ajaxStop(function() {
    $(document.body).css({'cursor' : 'default'});
});

    //Set the cursor ASAP to "Wait"
    document.body.style.cursor='wait';

    //When the window has finished loading, set it back to default...
    window.onload=function(){document.body.style.cursor='default';};
</script>

    </head>
    <body>
        <h2 class="heads"><center>Enter the codes for the Program and Branch for year <div id ="year"><%=year%></div></center></h2>
        <div class="divs">   
            <center>
    <form id="pbForm">
        <input type="text" id="Programme_Code" placeholder="Programme Code">
        <input type="text" id="Programme_Name" placeholder="Programme Name">
        <input type="text" maxlength="2" id="Programme_Duration" placeholder="Programme Duration">
        <select required id="Programme_Type" name="Programme_Type">
            <option selected value="UNDERGRADUATE">UNDERGRADUATE</option>
            <option value="POSTGRADUATE">POSTGRADUATE</option>
        </select>
        <br><br>
        <input type="button" id="add-row" value="Add Programme" class="btn tnpbtn" style="margin-left: 2%;">
        <br>
        <center><p id = "message" style="width: 50%; margin-left: 28%;"></p></center>
    </form>
            </center>
            
            <center>
               <div class="table-responsive">  
            <table class="table-striped">
        <thead>
            <tr>
                <th><center>Select</center></th>
                <th><center>Programme Code</center></th>
                <th><center>Programme Name</center></th>
                <th><center>Programme Duration</center></th>
                <th><center>Programme Type</center></th>
                <th><center><button type="button" id="delete-row" class="btn tnpbtn">Delete Row</button></center></th>
            </tr>
        </thead>
        <tbody>
        <%
            dbname="db_"+year;
            SQLQuery = "select * from "+dbname+".Programme_Codes";
            pst = con.prepareStatement(SQLQuery); 
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                String Programme_Code = rs.getString("Programme_Code"), 
                       Programme_Name = rs.getString("Programme_Name"),
                       Programme_Type = rs.getString("Programme_Type");
                int Programme_Duration = rs.getInt("Programme_Duration");
        %>
        <tr data-id="<%out.print(Programme_Code);%>-<%out.print(Programme_Name);%>-<%out.print(year);%>">
            <td><center><input type="radio" id="infoMetaData" value="<%out.print(Programme_Code);%>-<%out.print(Programme_Name);%>"></center></td>
            <td><center><%out.print(Programme_Code);%></center></td>
            <td><center><%out.print(Programme_Name);%></center></td>
            <td><center><%out.print(Programme_Duration);%></center></td>
            <td><center><%out.print(Programme_Type);%></center></td>
        </tr>
        <%
            }
            rs.close();
            pst.close();
        %>
        </tbody>
            </table></div></center>
        </div>
        <br><br>
        
    <center><a class="btn btn-success custom-btn" href="CreateDatabase.jsp?successNo=1" onclick="document.body.style.cursor='wait'">DONE</a></center>
    </body>
    
    
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
        
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">
             <p id="title"></p>
        </h4>
      </div>
        
      <div class="modal-body">
          <center>
    <form>
        <input type="text" id="Branch_Code" placeholder="Branch Code">
        <input type="text" id="Branch_Name" placeholder="Branch Name">
        <input type="button" id="add-brow" value="Add Branch" class="btn tnpbtn" style="margin-left: 2%;">
        <br>
        <center><p id = "Bmessage" style="width: 50%; margin-left: 18%;"></p></center>
    </form>
          </center>
          <center><table class="table-striped" id="bTable">
        <thead>
            <tr>
                <th><center>Select</center></th>
                <th><center>Branch Code</center></th>
                <th><center>Branch Name</center></th>
                <!--<th><center><button type="button" id="delete-brow" class="btn btn-danger">Delete Row</button></center></th>-->
            </tr>
        </thead>
              </table>
              
              <div id="addTable"></div><br><br>      
              <center><button type="button" id="delete-brow" class="btn tnpbtn">Delete Row</button></center>
      </div>
        
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
    
</html>
<footer style="margin-top:8%;"><%@include file="footer2.jsp" %></footer>