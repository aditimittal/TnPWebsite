<%@page import="Implement.CalImpl"%>
<%@ page import="calendar.Month,java.util.*,java.io.*,java.sql.*"  %>
<%-- TODO: CLEAN UP THE PAGE TAG ABOVE --%>
<%@include file="connection.jsp" %>
<%@include file="dash.jsp" %>
<%@ include file="calendarCommon.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<html>
<head>
  <title>calendar</title>
  <link rel="StyleSheet" href="/blog/calendar.css" type="text/css" media="screen" />
  <style>
      footer {
        position:absolute;
        bottom:0;
        width:100%;
        overflow-x:hidden;
        overflow-y:hidden;
      }
  </style>
</head>

<%! Connection con1; 
    String eno, First_Name, Last_Name, Programme_Code, Branch_Code;%>
<%        
        eno=(String)session.getAttribute("eno"); 
        First_Name=(String)session.getAttribute("First_Name"); 
        Last_Name=(String)session.getAttribute("Last_Name"); 
        Programme_Code=(String)session.getAttribute("Programme_Code"); 
        Branch_Code=(String)session.getAttribute("Branch_Code"); 
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");  
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
        }    
        catch(Exception e)
        {
            out.println("error..... <br>"+e); 
        }
%>

<body id="regular_page">
    <br><br><br><br><br><br>
    
    <div id="calendar_main_div" >
    <table border="1" cellspacing="0" cellpadding="4" id="calendar_table" style="margin-left: 40%;margin-top: -8%">
  <tr>
    <td width="100%" colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row">
    <th width="14%" class="th_day_cell day">Sun</th>
    <th width="14%" class="th_day_cell day">Mon</th>
    <th width="14%" class="th_day_cell day">Tue</th>
    <th width="14%" class="th_day_cell day">Wed</th>
    <th width="14%" class="th_day_cell day">Thu</th>
    <th width="15%" class="th_day_cell day">Fri</th>
    <th width="15%" class="th_day_cell day">Sat</th>
  </tr>
<%
{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    %><tr class="week_data_row"><%
    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        %><td class="empty_day_cell">&nbsp;</td><%
      }
      else
      {
        // this is "today"        
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
            System.out.println("current date = "+days[i][j]+" "+currentMonthInt+" "+currentYearInt+"\n");
            %><td id="todayCell">
                <%=days[i][j]%>
                
                <script>
    document.getElementById("todayCell").style.backgroundColor = "rgb(153, 204, 0)";
                </script>
                
                        <%                                
        int compID=0;
        String SQLQuery2 = "select companyID from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st2 = con1.createStatement();
        ResultSet rs2 = st2.executeQuery(SQLQuery2);
        
        while(rs2.next())
        {
           compID = rs2.getInt(1);
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
              </td><%
        }
        else
        {
          %><td id="dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>">
              <%=days[i][j]%>            
                    <%        
        int compID=0;
        String SQLQuery4 = "select companyID from calendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st4 = con1.createStatement();
        ResultSet rs4 = st4.executeQuery(SQLQuery4);
        
        while(rs4.next())
        {
           compID = rs4.getInt(1);
        }
        
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
            </td><%
        }
      } // end outer if
    } // end for
    %>
    </tr>
  <%}
}
%>
</table>

<%-- end of "calendar_div" --%>
</div>

<!-- navigation links -->
<%-- sorry, i don't know how to get this look without a table --%>
<table id="calendar_nav_table" border="0" style="margin-left: 39%;margin-top: 0.8%;">
  <tr>
    <td id="prev_link">
      <form method="post">
        <input type="submit" name="PREV" value=" << ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    <td id="link_to_month_view">
      <form action="calendarMonthPrintViewStudent.jsp" method="post">
        <input type="submit" value="  Full-Screen Print View  " class="submit_button">
        <input type="hidden" name="month" value="<%=intMonth%>">
        <input type="hidden" name="year"  value="<%=intYear%>">
      </form>
    </td>
    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>
  <!-- navigation links end -->
  <br><br><br>
</body>
</html>
<footer><%@include file="footer2.jsp" %></footer>


