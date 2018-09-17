<%-- 
    Author     : shivangi
--%>
<%@page import="Implement.CalImpl"%>
<%@page import="calendar.Month,java.util.*,java.io.*,java.sql.*"  %>
<%@include file="calendarCommon.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<html>
<head>
  <title>calendar :: month view</title>
  <link rel="StyleSheet" href="css/calendar.css" type="text/css" media="screen" />
  <script type="text/javascript" src="js/t1.js"></script>
  <script type="text/javascript" src="js/bootstrap1.js"></script>
  <script type="text/javascript" src="js/Record.js"></script>
  <link rel="stylesheet" type="text/css" href="css/bootstrap1.css">
 
<%! Connection con1; 
    String username, containeryear=null, datemonthYear=null, dbname="", SQLQuery="";
    PreparedStatement pst=null;
    Enumeration parameter = null;
    Map<String, String> Programs = null;
    Map<String, String> Company = null;
%>
<%        
        username = (String)session.getAttribute("name");
        Programs = new HashMap<String, String>();
        Company = new HashMap<String, String>();
        
        parameter = request.getParameterNames();
        int count = 0;
        while(parameter.hasMoreElements())
        {
            parameter.nextElement();
            count++;
        }
        
        if(count>0)
        {
            containeryear = (String) request.getParameter("containeryearDB");
            datemonthYear = (String) request.getParameter("datemonthYear");
        }
        
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  
        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
%>
  
<script type='text/javascript'>    

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

function oncloseModal()
{
    document.body.style.cursor='wait';
    window.location="calendarMonthPrintView.jsp";
};

   $(document).ready(function ()
   {           
//       // query string: ?foo=lorem&bar=&baz
//var foo = getParameterByName('foo'); // "lorem"
//var bar = getParameterByName('bar'); // "" (present with empty value)
//var baz = getParameterByName('baz'); // "" (present with no value)
//var qux = getParameterByName('qux'); // null (absent)

       var containeryear = getParameterByName('containeryearDB');
       var datemonthYear = getParameterByName('datemonthYear');
       var username = getParameterByName('username');
       
       if(containeryear!==null)
       {
           $("#datemonthYear").text(datemonthYear);
           $("#username").text(username).hide();
           $("#containeryear").val(containeryear);
           
           $("#myModal").modal("show");  
           $("#addTable").html('');
           $.get("DataDisplay.jsp",{currentdate:datemonthYear},function(data)
           {            
               $("#addTable").html(data);
           });     
       }
   });      
    
    
    //<![CDATA[
$(window).load(function(){
$('table tbody tr td').on('click',function(){
    var details = $(this).data('id');
    
    var date = details.split('-')[0];
    var month = details.split('-')[1];
    var year = details.split('-')[2];
    var username = details.split('-')[3];
    
    var currentdate = date+"-"+month+"-"+year;
    
    $("#datemonthYear").text(currentdate);
    $("#username").text(username).hide();
    if(currentdate!=='0')
    {
        $("#myModal").modal("show");  
        $("#addTable").html('');
        $.get("DataDisplay.jsp",{currentdate:currentdate},function(data)
        {            
            $("#addTable").html(data);
        });
    }
});
});//]]> 

    var showForm = function() {
    var allForms = document.getElementsByTagName('form');
    var dropdown = document.getElementById("dropdown");
//    if (dropdown.value != "-1") {
        var form = document.getElementById(dropdown.value);
        for (var i = 0; i < allForms.length; i++) {
            allForms[i].setAttribute("class", "display-none");
//        }
        form.setAttribute("class", "");
    }
};

$(document).ready(function() {
    $('#dept').bind('change', function() {
        var elements = $('div.containerCourse').children().hide(); // hide all the elements
        var value = $(this).val();
        if (value.length) { // if somethings' selected
            elements.filter('.' + value).show(); // show the ones we want
            $('div.containerCompany').children().hide();
        }         
    }).trigger('change');
    
    $('.course').bind('change', function() {
        var elements = $('div.containerCompany').children().hide(); // hide all the elements
        var value = $(this).val();

        if (value.length) { // if somethings' selected
            elements.filter('.' + value).show(); // show the ones we want
        }
    }).trigger('change');
    
    $('.EventInfoDD').bind('change', function() {
        var elements = $('#EventInfo').hide(); // hide all the elements
        var value = $(this).val();

        if (value==="Others") { // if somethings' selected
            elements.show(); // show the ones we want
        }
        
    }).trigger('change');
});
</script>

<script>
function myFunctionToggle()
{
    var x = document.getElementById("informationForm");
    if (x.style.display === "none") 
    {
        x.style.display = "block";
        document.getElementById("informationBoard").style.display = "none";
    } 
    else 
    {
        x.style.display = "none";
        document.getElementById("informationBoard").style.display = "block";
        
        var currentdate= $("#datemonthYear").text();
        $("#addTable").html('');
        $.get("DataDisplay.jsp",{currentdate:currentdate},function(data)
        {            
            $("#addTable").html(data);
        });
    }
}

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

<body id="print_view_page">

<div id="calendar_print_view_main_div" align="center">
<table border="1" cellspacing="0" cellpadding=4 width="90%" height="90%" class="calendar_table">
  <tr>
    <td colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row">
    <th width="14.2%" class="th_day_cell day">Sun</th>
    <th width="14.2%" class="th_day_cell day">Mon</th>
    <th width="14.2%" class="th_day_cell day">Tue</th>
    <th width="14.2%" class="th_day_cell day">Wed</th>
    <th width="14.2%" class="th_day_cell day">Thu</th>
    <th width="14.2%" class="th_day_cell day">Fri</th>
    <th width="14.2%" class="th_day_cell day">Sat</th>
  </tr>
<%
{
  CalImpl cimpl = new CalImpl();
 
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {%>
    <tr>
    <%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {%>
        <td data-id="0" class="empty_day_cell">&nbsp;</td>
      <%}
      else
      {          
        // this is "today"
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
      %><td data-id="<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>"  align="right" valign="top" id="todayCell">
                <%=days[i][j]%>
                
                <script>
    document.getElementById("todayCell").style.backgroundColor = "rgb(153, 204, 0)";
                </script>
                
                <center>
                    <div id="data">                        
                        <%                        
        String type = "", Info= "";
        String SQLQuery1 = "select eventtype, eventInfo from othercalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st1 = con1.createStatement();
        ResultSet rs1 = st1.executeQuery(SQLQuery1);
        
        while(rs1.next())
        {
           type = rs1.getString(1);
           Info = rs1.getString(2);
           
           out.println(type+" ");
           out.println(Info);
           %><br><%
        }
        
        st1.close();
        rs1.close();
        
        int compID=0;
        Info = "";
        String SQLQuery2 = "select companyID, eventInfo from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st2 = con1.createStatement();
        ResultSet rs2 = st2.executeQuery(SQLQuery2);
        
        while(rs2.next())
        {
           compID = rs2.getInt(1);
           Info = rs2.getString(2);
           
           out.println(cimpl.findCompanyName(compID)+" ");
           out.println(Info);
           
           %><br><%
        }
        
        st2.close();
        rs2.close();
        
        if(compID>0)
        {
                %>
                <script>
                        document.getElementById("todayCell").style.backgroundColor = "rgb(179, 179, 255)";
                </script>
                <%
        }
        
        if(!type.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("holiday")||type.equalsIgnoreCase("exam"))
            {
                %>
                <script>
                        document.getElementById("todayCell").style.backgroundColor = "rgba(153, 153, 102,0.4)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("meeting"))
            {
                %>
                <script>
                        document.getElementById("todayCell").style.backgroundColor = "rgba(255, 77, 77,0.5)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("other"))
            {
                %>
                <script>
                        document.getElementById("todayCell").style.backgroundColor = "rgb(255, 255, 204)";
                </script>
                <%
            }
        }
                        %>
                    </div>
                </center>
              </td><%
        }
        else
        {
          %><td data-id="<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>" align="right" valign="top" id="dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>">
              <%=days[i][j]%>              
                <center>
                    <div id="data">    
                    <%
        String type = "", Info= "";
        String SQLQuery3 = "select eventtype, eventInfo from othercalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st3 = con1.createStatement();
        ResultSet rs3 = st3.executeQuery(SQLQuery3);
        
        while(rs3.next())
        {
           type = rs3.getString(1);
           Info = rs3.getString(2);
           
           out.println(type+" ");
           out.println(Info);
           %><br><%
        }
        
        st3.close();
        rs3.close();
        
        int compID=0;
        Info = "";
        String SQLQuery4 = "select companyID, eventInfo from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st4 = con1.createStatement();
        ResultSet rs4 = st4.executeQuery(SQLQuery4);
        
        while(rs4.next())
        {
           compID = rs4.getInt(1);
           Info = rs4.getString(2);
           
           out.println(cimpl.findCompanyName(compID)+" ");
           out.println(Info);
           %><br><%
        }
        
        st4.close();
        rs4.close();
        
        if(compID>0)
        {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>").style.backgroundColor = "rgb(179, 179, 255)";
                </script>
                <%
        }
        
        if(!type.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("holiday")||type.equalsIgnoreCase("exam"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>").style.backgroundColor = "rgba(153, 153, 102,0.4)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("meeting"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>").style.backgroundColor = "rgba(255, 77, 77,0.5)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("other"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>-<%=username%>").style.backgroundColor = "rgb(255, 255, 204)";
                </script>
                <%
            }
        }
                        %>
                    </div>
                </center>
            </td><%
        } //end of if
      }
    } // end for %>
    </tr>
  <%}
}
%>
</table>
</div>

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
        
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="oncloseModal()">
            <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">
             <p id="datemonthYear"></p>
             <p id="username"></p>
        </h4>
      </div>
        
      <div class="modal-body">         
          
          <div id="informationBoard" style="font-size: 190%; text-align: left;display: none">
              <legend align="center" style="margin-top:2%">
                <table border="0" style="width: 100%">
                    <thead>
                        <tr>
                            <th style="padding-left: 5%; text-align: left">EVENT INFORMATION BOARD</th>
                            <th style="text-align: right"><button onclick="myFunctionToggle()" class="btn btn-link">Go To Form</button></th>
                        </tr>
                    </thead>
                </table>
              </legend>
              
              <center><div id="addTable"></div>
              <button type="button" class="btn btn-primary" id="delete-row">Delete Row</button></center>          
          </div>   
          
        <div id="informationForm">
	    <legend align="center" style="margin-top:2%;">
                    <table border="0" style="width: 100%">
                    <thead>
                        <tr>
                            <th style="padding-left: 5%; text-align: left">EVENT INFORMATION FORM</th>
                            <th style="text-align: right"><button onclick="myFunctionToggle()" class="btn btn-link">Go To Board</button></th>
                        </tr>
                    </thead>
                </table>
            </legend>
            <select id="dropdown" onchange="showForm()">
	       <option selected value="company">Company Info</option>
	       <option value="tnp">TNP</option>
           </select>
            
            <form id="company" action="#" method="post">    
                
            Year (Joining year of batch)<br>
            <input type="text" class="year" id="containeryear" maxlength="4" placeholder=" Example : 2014"/>
            <div id="error-msg" style="color: red"></div>
            
            Programme <br>
            <select required size="1" id="dept">
                <option value="default">-Select Programme-</option>                
                <%
                    if(containeryear!=null&&!containeryear.isEmpty())
                    {
                    dbname="db_"+containeryear;
                    SQLQuery = "select * from "+dbname+".Programme_Codes";
                    pst = con1.prepareStatement(SQLQuery); 
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next())
                    {
                    String Programme_Code = rs.getString("Programme_Code"), 
                            Programme_Name = rs.getString("Programme_Name");
                    Programs.put(Programme_Code, Programme_Name);
                %>
                <option value="<%=Programme_Code%>-<%=Programme_Name%>"><%=Programme_Name%></option>
                <%
            }
            rs.close();
            pst.close();
                    }
                %>
            </select>
            <div id="error-msg-p" style="color: red"></div>
              
            <div class="containerCourse">
                 <%
                    for(Map.Entry<String, String> m : Programs.entrySet())
                    {
                        String Programme_Code = m.getKey();
                        String Programme_Name = m.getValue();
                        System.out.println(Programme_Code+"--"+Programme_Name);
                %>
                <div class="<%=Programme_Code%>-<%=Programme_Name%>">
                    Branch
                    <select required class="course" id="courseChange" style="height: 23px;">
                        <option value="default">-Select Branch-</option>                       
                                   
                <%
                    if(containeryear!=null&&!containeryear.isEmpty())
                    {
                    dbname="db_"+containeryear;
            SQLQuery = "select Branch_Code, Branch_Name from "+dbname+".branch_codes where programme_name = '"+Programme_Name+"'";
            pst = con1.prepareStatement(SQLQuery);
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next())
                    {
                        String Branch_Code = rs.getString("branch_code"), 
                            Branch_Name = rs.getString("branch_Name");
                        Company.put(Programme_Code+"-"+Branch_Code, Programme_Name+"-"+Branch_Name);
                %>
                        
                        <option value="<%=Programme_Code%>-<%=Programme_Name%>-<%=Branch_Code%>-<%=Branch_Name%>"><%=Branch_Name%></option>
                          <%
            }
            rs.close();
            pst.close();
                    }
                %>
                    </select> 
                <br>
                </div>
                <%}%>
            </div>
            <div id="error-msg-b" style="color: red"></div>
            
            <div class="containerCompany">
                 <%
                    for(Map.Entry<String, String> m : Company.entrySet())
                    {
                        String Programme_Code = m.getKey().split("-")[0], Branch_Code = m.getKey().split("-")[1];
                        String Programme_Name = m.getValue().split("-")[0], Branch_Name = m.getValue().split("-")[1];
                        System.out.println(m.getKey()+",   "+m.getValue());
                %>
                <div class="<%=Programme_Code%>-<%=Programme_Name%>-<%=Branch_Code%>-<%=Branch_Name%>">
                    Company
                    <select required id="companyName" class="companyName-<%=Programme_Code%>-<%=Programme_Name%>-<%=Branch_Code%>-<%=Branch_Name%>" style="height: 23px;">
                        <option value="default">- Select Company -</option>
                        <%
                        if(datemonthYear!=null&&!datemonthYear.isEmpty())
                    {
                    dbname="db_"+datemonthYear.split("-")[2];
                    SQLQuery = " select "+dbname+".company_details.company_name, "+dbname+".company_details.profile, "+dbname+".company_branch.company_id from "+dbname+".company_branch, "+dbname+".company_details "
                             + " where "+dbname+".company_branch.company_id = "+dbname+".company_details.company_id "
                             + " AND "+dbname+".company_branch.department ='"+Programme_Code+"' AND "+dbname+".company_branch.course ='"+Branch_Code+"' "
                             + " AND "+dbname+".company_branch.batch ="+containeryear;
                    
                    pst = con1.prepareStatement(SQLQuery); 
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next())
                    {
                        String Company_Code = rs.getInt("company_id")+"", 
                            Company_Name = rs.getString("company_name"),
                            profile = rs.getString("profile");
                %>
                <option value="<%=Company_Code%>-<%=Company_Name%>"><%=Company_Name%>-<%=profile%></option>
                          <%
            }
            rs.close();
            pst.close();
                    }
                %>
                    </select> 
                <br>
                </div>
                    <br>
                <%}%>
            </div>
            <div id="error-msg-c" style="color: red"></div>
                
                Event Information <br>
                <select required class="EventInfoDD" style="height: 23px;">
                        <option value="Online Test">Online Test</option>
                        <option value="Written Test">Written Test</option>
                        <option value="Interview">Interview</option>
                        <option value="Talk">Talk</option>
                        <option value="Workshop">Workshop</option>
                        <option value="Seminar">Seminar</option>
                        <option value="Others">Others</option>
                </select>
                <textarea id="EventInfo" placeholder="Some information about the event..."></textarea>
                <div id="error-msg-e" style="color: red"></div>
                <center><input type="button" value="ADD EVENT" id="addEventcompany" class="btn btn-primary" /></center>
            
            </form>
            <form id="tnp" class="display-none" action="#" method="post">
                <input type="radio" name="work" id="eventtype" value="holiday"> Holiday<br>
                <input type="radio" name="work" id="eventtype" value="exam"> Exam<br>
                <input type="radio" name="work" id="eventtype" value="meeting"> Meeting<br>
                <input type="radio" name="work" id="eventtype" value="other"> Other<br><br>
                Event Information <br><textarea id="EventInfoTnp" placeholder="Some information about the event..."></textarea><br><br>
                <center><input type="button" value="ADD EVENT" id="addEventtnp" class="btn btn-primary" /></center>
            </form>
        </div>
      </div>
        
        <div class="modal-footer">
            <p id="message" class="text-center text-success text-uppercase"></p>
        </div>
        
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<form action="calendar.jsp" method="post" style="margin-top: 15px">
    <input type="submit" value=" GO BACK " class="btn btn-danger" style=" background-color: #39843c;border-color: #39843c;">
    <input type="hidden" name="month" value="<%=intMonth%>">
    <input type="hidden" name="year"  value="<%=intYear%>">
</form>

  <script>
  // tell the embed parent frame the height of the content
  if (window.parent && window.parent.parent){
    window.parent.parent.postMessage(["resultsFrame", {
      height: document.body.getBoundingClientRect().height,
      slug: "ooexfj26"
    }], "*");
  }
</script>

</body>
</html>