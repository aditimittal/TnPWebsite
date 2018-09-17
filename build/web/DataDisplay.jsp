<%-- 
    Document   : DataDisplay
    Created on : Jul 11, 2017, 6:41:03 PM
    Author     : shivangi
--%>

<%@page import="Implement.CalImpl"%>
<%@page import="model.OtherCalendarPOJO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CalendarPOJO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>

<!DOCTYPE html>
<%! 
    String currentdate="", eventInfo="";
    String[] date;
    int month = 1;
%>
<%
   currentdate = request.getParameter("currentdate");
   date = currentdate.split("-");
   
     String monthNames[] = {"January",
                         "February",
                         "March",
                         "April",
                         "May",
                         "June",
                         "July",
                         "August",
                         "September",
                         "October",
                         "November",
                         "December" };
     
     for(int i=0;i<12;i++)
     {
         if(date[1].equalsIgnoreCase(monthNames[i]))
         {
             month = i+1;
             break;
         }
     }
     
   CalImpl ci = new CalImpl();
   System.out.println("--> "+date[0]+" "+date[1]+" "+date[2]+" ");  
%>
<table width="240" cellspacing="0" cellpadding="0" id="infoTable" class="table table-condensed"><tbody>
    <thead>
        <tr>
            <th width="20"></th>
            <th width="80" style="text-align: center">Details</th>
            <th width="140" style="text-align: center">Event</th>
        </tr>
    </thead>
<%
     int ocalID = 0;
     String eventtype = "";
     eventInfo="";
     
     ArrayList<OtherCalendarPOJO> anso = ci.getotherCal(Integer.parseInt(date[0]), month, Integer.parseInt(date[2]));
     System.out.println("in otherCalendar 1");
     
    int osize = anso.size();
    System.out.println(osize);
    for(int i=0;i<osize;i++)
    {
       OtherCalendarPOJO ocp = anso.get(i);
       ocalID = ocp.getOcalID();
       eventtype = ocp.getEventtype();
       eventInfo = ocp.getEventInfo();
       
       %>
        <tr>
            <td  width="20"><input type="radio" name="cal" id="infoMetaData" value="<%out.print(ocalID);%>-otherCalendar"></td>
            <td  width="80"><%out.print(eventtype);%></td>
            <td  width="140"><%out.print(eventInfo);%></td>
        </tr>
        <%        
      }
%>
<%
   int calID = 0, companyID = 0, yearOfDegree = 0;
   eventInfo = "";
   String deptName, courseName;
   
   System.out.println("in data display -->\n");
   ArrayList<CalendarPOJO> ans = ci.getCal(Integer.parseInt(date[0]), month, Integer.parseInt(date[2]));
   
   int size = ans.size();
   System.out.println("in data display "+size+"-->\n");
   for(int i=0;i<size;i++)
   {
       CalendarPOJO cp = ans.get(i);
       calID = cp.getCalID();
       deptName = cp.getDeptName();
       courseName = cp.getCourseName();
       companyID = cp.getCompanyID();
       yearOfDegree = cp.getYearOfDegree();
       eventInfo = cp.getEventInfo();
   
        String companyName = ci.findCompanyName(companyID);         
     
        %>
        <tr>
            <td width="20"><input type="radio" name="cal" id="infoMetaData" value="<%out.print(calID);%>-calendar"></td>
            <td width="80"><%out.print(deptName+" "+courseName+" "+yearOfDegree);%></td>
            <td width="140"><%out.print(companyName+" "+eventInfo);%></td>
        </tr>
        <%
   }
%>
</tbody></table>