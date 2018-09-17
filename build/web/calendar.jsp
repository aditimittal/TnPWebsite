<%@page import="Implement.CalImpl"%>
<%@ page import="calendar.Month,java.util.*,java.io.*,java.sql.*"  %>
<%-- TODO: CLEAN UP THE PAGE TAG ABOVE --%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@ include file="calendarCommon.jsp" %>

<html>
<head>
  <title>calendar</title>
  <link rel="StyleSheet" href="/blog/calendar.css" type="text/css" media="screen" />
</head>
<style>
    table, td, th
    {
        border: 0px;
    }
    td{
        padding:25px;
        border-radius: 20px;
    }
</style>

<%! Connection con1; 
    String username; %>
<%        
        username = (String)session.getAttribute("name");
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }

%>

<body id="regular_page">
    <br><br>
    <h1 class="heading" style="color: #008000; "><center>CALENDAR</center></h1>
     <br>
    <div id="calendar_main_div" >
<table cellspacing="1" cellpadding="5" id="calendar_table" style="margin-left: 33%; margin-top:0%;">
  <tr>
    <td width="100%" colspan="7" class="month_year_header">
      <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row">
      <th width="14%" class="th_day_cell day" style="text-align: center">Sun</th>
    <th width="14%" class="th_day_cell day" style="text-align: center">Mon</th>
    <th width="14%" class="th_day_cell day" style="text-align: center">Tue</th>
    <th width="14%" class="th_day_cell day" style="text-align: center">Wed</th>
    <th width="14%" class="th_day_cell day" style="text-align: center">Thu</th>
    <th width="15%" class="th_day_cell day" style="text-align: center">Fri</th>
    <th width="15%" class="th_day_cell day" style="text-align: center">Sat</th>
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
        String type = "";
        String SQLQuery1 = "select eventtype from othercalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st1 = con1.createStatement();
        ResultSet rs1 = st1.executeQuery(SQLQuery1);
        
        while(rs1.next())
        {
           type = rs1.getString(1);
        }
        
        st1.close();
        rs1.close();
        
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
              </td><%
        }
        else
        {
          %><td id="dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>">
              <%=days[i][j]%>            
                    <%
        String type = "";
        String SQLQuery3 = "select eventtype from othercalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
        Statement st3 = con1.createStatement();
        ResultSet rs3 = st3.executeQuery(SQLQuery3);
        
        while(rs3.next())
        {
           type = rs3.getString(1);
        }
        
        st3.close();
        rs3.close();
        
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
        
        if(!type.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("holiday")||type.equalsIgnoreCase("exam"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>").style.backgroundColor = "rgba(153, 153, 102,0.4)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("meeting"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>").style.backgroundColor = "rgba(255, 77, 77,0.5)";
                </script>
                <%
            }
            else if(type.equalsIgnoreCase("other"))
            {
                %>
                <script>
                        document.getElementById("dayCell<%=days[i][j]%>-<%=monthName%>-<%=intYear%>").style.backgroundColor = "rgb(255, 255, 204)";
                </script>
                <%
            }
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

<table style="margin-left: 30.5%; width:40.3%">
  <tr>
    <td id="prev_link">
      <form method="post">
          <input type="submit" name="PREV" value=" << " class="btn btn-danger" style=" background-color: #39843c;border-color: #39843c;">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    <td id="link_to_month_view">
      <form action="calendarMonthPrintView.jsp" method="post">
          <input type="submit" value=" Full-Screen Print View " class="btn btn-success" 
                 style="background-color:#39843c;width: 90%;" onclick="document.body.style.cursor='wait'">
        <input type="hidden" name="month" value="<%=intMonth%>">
        <input type="hidden" name="year"  value="<%=intYear%>">
      </form>
    </td>
    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> " class="btn btn-danger" style=" background-color: #39843c;border-color: #39843c;">
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


