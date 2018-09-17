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
    String eno, First_Name, Last_Name, Programme_Code, Branch_Code;%>
<%        
        eno=(String)session.getAttribute("eno"); 
        First_Name=(String)session.getAttribute("First_Name"); 
        Last_Name=(String)session.getAttribute("Last_Name"); 
        Programme_Code=(String)session.getAttribute("Programme_Code"); 
        Branch_Code=(String)session.getAttribute("Branch_Code"); 
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  
        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
%>
  
<script type='text/javascript'>    
    //<![CDATA[
$(window).load(function(){
$('table tbody tr td').on('click',function(){
    $("#date").val($(this).closest('tr').children()[0].textContent);
    $("#monthAndYear").val($(this).data('id'));
    $("#datemonthYear").text($(this).data('id'));
    var currentdate= $("#datemonthYear").text();
    if(currentdate!=='0')
    {
        $("#myModal").modal("show");
    }
});
});//]]> 
</script>
  
</head>

<body id="print_view_page">

<div id="calendar_print_view_main_div" align="center">
<table border="1" cellspacing="0" cellpadding=4 width="90%" height="90%" id="calendar_table">
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
            System.out.println("current date = "+days[i][j]+" "+currentMonthInt+" "+currentYearInt+"\n");
            %><td data-id="<%=days[i][j]%>-<%=monthName%>-<%=intYear%>"  align="right" valign="top" id="todayCell">
                <%=days[i][j]%>
                
                <script>
    document.getElementById("todayCell").style.backgroundColor = "rgb(153, 204, 0)";
                </script>
                
                <center>
                    <div id="data">                        
                        <%                                
        int compID=0;
        String Info = "";
        String SQLQuery2 = "select companyID, eventInfo from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st2 = con1.createStatement();
        ResultSet rs2 = st2.executeQuery(SQLQuery2);
        
        while(rs2.next())
        {
           compID = rs2.getInt(1);
           Info = rs2.getString(2);
//           System.out.print(type+" "+Info);
           
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
                        %>
                    </div>
                </center>
              </td><%
        }
        else
        {
          %><td data-id="<%=days[i][j]%>-<%=monthName%>-<%=intYear%>" align="right" valign="top" id="dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>">
              <%=days[i][j]%>              
                <center>
                    <div id="data">    
                    <%        
        int compID=0;
        String Info = "";
        String SQLQuery4 = "select companyID, eventInfo from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st4 = con1.createStatement();
        ResultSet rs4 = st4.executeQuery(SQLQuery4);
        
           System.out.print(compID+" 1-"+Info);
        while(rs4.next())
        {
           compID = rs4.getInt(1);
           Info = rs4.getString(2);
           System.out.print(compID+" 2-"+Info);
           out.println(cimpl.findCompanyName(compID)+" ");
           out.println(Info);
           %><br><%
        }
        
           System.out.print(compID+" 3- "+Info);
        st4.close();
        rs4.close();
        
        if(compID>0)
        {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>").style.backgroundColor = "rgb(179, 179, 255)";
                </script>
                <%
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">
             <p id="datemonthYear"></p>
        </h4>
      </div>
        
      <div class="modal-body">
          hi Bro
      </div>
        
        <div class="modal-footer">
            <p id="message" class="text-center text-success text-uppercase"></p>
        </div>
        
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<form action="calendarStudent.jsp" method="post" >
    <input type="submit" value=" GO BACK " class="bg-info" class="submit_button" style="width: 300px; height: 30px; font-size:18px">
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