package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Implement.CalImpl;
import calendar.Month;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.HashMap;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Calendar;

public final class calendar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con; 
 Connection conn; 
 
    String rights1;
    String name1;
    String id2;
    String admin_name; 
    int id1;
    
  HashMap<String,Integer> hm1; 
 Connection con1; 
    String username; 
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/connection.jsp");
    _jspx_dependants.add("/common_header.jsp");
    _jspx_dependants.add("/connection_header.jsp");
    _jspx_dependants.add("/calendarCommon.jsp");
    _jspx_dependants.add("/footer2.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

        
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");
        
        
        

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
        
        
      out.write("\n");
      out.write("    ");
      out.write('\r');
      out.write('\n');

    try{
    
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>IGDTUW</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

        
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }
        
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/header.css\">\n");
      out.write("  <script>\n");
      out.write("    $(document).ready(function() {\n");
      out.write("      var url = window.location;\n");
      out.write("      // Will only work if string in href matches with location\n");
      out.write("      $('ul.nav a[href=\"' + url + '\"]').parent().addClass('active');\n");
      out.write("      // Will also work for relative and absolute hrefs\n");
      out.write("      $('ul.nav a').filter(function() {\n");
      out.write("        return this.href == url;\n");
      out.write("      }).parent().addClass('active').parent().parent().addClass('active');\n");
      out.write("    });\n");
      out.write("  </script>\n");
      out.write("  <style>\n");
      out.write("    a.nounderline {\n");
      out.write("      text-decoration: none !important;\n");
      out.write("      font-size: 1.4em;\n");
      out.write("      color: black;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    a.nounderline:hover {\n");
      out.write("      color: #39843c;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .profile>.dropdown>.dropdown-menu {\n");
      out.write("      background-color: #39843c;\n");
      out.write("      height: 4em;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .profile>.dropdown>.dropdown-menu>li>a {\n");
      out.write("      color: #ffffff;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .profile>.dropdown>.dropdown-menu>li>a:hover,\n");
      out.write("    .profile>.dropdown>.dropdown-menu>li>a:focus {\n");
      out.write("      color: #000000;\n");
      out.write("      background-color: #e7ffba;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    #logo {\n");
      out.write("      margin-left: 68%;\n");
      out.write("      margin-top: 2%;\n");
      out.write("      margin-bottom: 2%;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    #headings {\n");
      out.write("      line-height: 1.4em;\n");
      out.write("      margin-top: 1.2%;\n");
      out.write("\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .profile {\n");
      out.write("      margin-top: 1.5%;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    #igdtu{\n");
      out.write("        font-size:1.5em; \n");
      out.write("        color:green;\n");
      out.write("    }\n");
      out.write("    @media (max-width: 767px) {\n");
      out.write("        .desc {\n");
      out.write("            display: none;\n");
      out.write("        }\n");
      out.write("        #logo{\n");
      out.write("            width:18%;\n");
      out.write("            margin-left: 0em;\n");
      out.write("            margin-top: 0em;\n");
      out.write("            margin-bottom: 0em;\n");
      out.write("        }\n");
      out.write("        #igdtu{\n");
      out.write("            font-size: 1.2em;\n");
      out.write("        }\n");
      out.write("        .headings{\n");
      out.write("            margin-top: 0em;\n");
      out.write("        }\n");
      out.write("        .profile{\n");
      out.write("            margin-bottom: 1em;\n");
      out.write("            align:center;\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("    ");

    try{
    HttpSession session3=request.getSession(false);
    id1 =  (Integer)session3.getAttribute("idx");

    if(session3==null){ 
    	response.sendRedirect("student_login.jsp");
    }
//        id1 = 9;
 
    String sql = "select rights from admins where admin_id="+id1;
    Statement stm = conn.createStatement();
    ResultSet rs = stm.executeQuery(sql);
  
    while(rs.next()){
        rights1 = rs.getString("rights");
    }
    
    sql = "select name from admins where admin_id ="+id1;
    rs = stm.executeQuery(sql);
    
    while(rs.next()){
        admin_name = rs.getString(1);
    }
    
    stm.close();
    rs.close();

    }
    catch(NullPointerException ne){
        response.sendRedirect("admin_login.jsp");
    }
    catch(Exception e){
        out.println("error1...<br>"+e);
        response.sendRedirect("admin_login.jsp");
    }
    
    session.setAttribute("admin_name", admin_name);
    

      out.write("\n");
      out.write("<body>\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("      <span class=\"col-sm-2\">\n");
      out.write("          <center><img id=\"logo\" src=\"igdtuw.png\" width=\"50%\"></center>\n");
      out.write("    </span>\n");
      out.write("      <div class=\"col-sm-7\" id=\"headings\">\n");
      out.write("        <center>\n");
      out.write("          <p id=\"igdtu\" style=\"\"><b>INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN</b></p>\n");
      out.write("          <div class=\"desc\">\n");
      out.write("            <p style=\"font-size:1em;\"><b>(Established by Govt. of Delhi vide Act 9 of 2012)</b></p>\n");
      out.write("            <p style=\"font-size:1.3em; color:green;\"> You are logged in as admin</p>\n");
      out.write("        </center>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-sm-3 profile\">\n");
      out.write("          <div class=\"dropdown\">\n");
      out.write("            <a href=\"#\" class=\"dropdown-toggle nounderline\" data-toggle=\"dropdown\">\n");
      out.write("            <span class=\"glyphicon glyphicon-user\" style=\"margin-right: -0.2em;\"></span> \n");
      out.write("            <strong>Welcome ");
      out.print( admin_name );
      out.write("</strong>\n");
      out.write("            <span class=\"glyphicon glyphicon-chevron-down\"></span>\n");
      out.write("        </a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("              <li><a href=\"admin_logout.jsp\">Logout</a></li>\n");
      out.write("              <li><a href=\"admin_change_password.jsp\">Change Password</a></li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div id=\"navigation\">\n");
      out.write("      <nav class=\"navbar navbar-default\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("          <div class=\"navbar-header\">\n");
      out.write("            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("              <span class=\"icon-bar\"></span>\n");
      out.write("              <span class=\"icon-bar\"></span>\n");
      out.write("              <span class=\"icon-bar\"></span>                        \n");
      out.write("            </button>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");

                if(rights1.equals("full")){
            
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav\">\n");
      out.write("                <li><a  href=\"List_Notification.jsp\">NOTIFICATION BOARD</a></li>\n");
      out.write("                <li><a  href=\"admin_mailbox.jsp\">MAILBOX</a></li>\n");
      out.write("\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">DATABASE <b class=\"caret\"></b></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                      <li><a href=\"CreateDatabase.jsp\" >CREATE / DELETE DATABASE</a></li>\n");
      out.write("                      <li><a href=\"screen_admin_database.jsp\">DOWNLOAD DATABASE</a></li>\n");
      out.write("                      <li><a href=\"view_prog_code.jsp\">VIEW PROGRAMME CODE</a></li>\n");
      out.write("                      <li><a href=\"view_subjects.jsp\">VIEW SUBJECTS</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li><a href=\"calendar.jsp\">CALENDAR</a></li>\n");
      out.write("                <li><a href=\"screen_admin_rights.jsp\">RIGHTS</a></li>\n");
      out.write("                <li><a href=\"screen_admin_deadline.jsp\">DEADLINES</a></li>\n");
      out.write("\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">PLACEMENT RECORD <b class=\"caret\"></b></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                      <li><a href=\"view_placementstats.jsp\" >VIEW STATISTICS</a></li>\n");
      out.write("                      <li><a href=\"placement1.jsp\">UPDATE PLACEMENT RECORDS</a></li>\n");
      out.write("                      <li><a href=\"delete_placement.jsp\">DELETE PLACEMENT RECORDS</a></li>\n");
      out.write("                      <li><a href=\"view_placementDb.jsp\">PLACEMENTS</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"Placement_offer.jsp\">PLACEMENT OFFERS</a></li>\n");
      out.write("                <li><a href=\"ShowLogs.jsp?page=1\">LOGS</a></li>\n");
      out.write("                 ");

                }
                    else{
                        try{ 
                            String sql1 = "select rights from admin_rights where user_id="+id1;
                            Statement st1 = conn.createStatement();
                            ResultSet rs1 = st1.executeQuery(sql1);

                            hm1=new HashMap<String, Integer>();
                                                
                            while(rs1.next()){
                                hm1.put( rs1.getString("rights") , 0);

                            }
                
      out.write("\n");
      out.write("                ");


                    if( hm1.containsKey("Notifications") ){
                        out.println("<li><a href=\"List_Notification.jsp\">NOTIFICATION BOARD</a></li>");
                    }
                    if( hm1.containsKey("mail box") ){
                        out.println("<li><a href=\"admin_mailbox.jsp\">MAILBOX</a></li>");
                    }
                    if( hm1.containsKey("create_delete_database") || hm1.containsKey("view_database") || hm1.containsKey("view subjects") ){
                        out.println("<li class=\"dropdown\">"
                                + "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">DATABASE <b class=\"caret\"></b></a>"
                                + "<ul class=\"dropdown-menu\">");
                        if(hm1.containsKey("create_delete_database")){
                            out.println("<li><a href=\"CreateDatabase.jsp\" >CREATE / DELETE DATABASE</a></li>");
                            out.println("<li><a href=\"view_prog_code.jsp\">VIEW PROGRAMME CODE</a></li>");
                        }
                        if(hm1.containsKey("view_database")){
                            out.println("<li><a href=\"screen_admin_database.jsp\">DOWNLOAD DATABASE</a></li>");
                        }
                        if(hm1.containsKey("view subjects")){
                            out.println("<li><a href=\"view_subjects.jsp\">VIEW SUBJECTS</a></li>");
                        }
                        out.println("</ul>"
                                + "</li>");
                  
                    }
                    if( hm1.containsKey("calender") ){
                        out.println("<li><a href=\"calendar.jsp\">CALENDER</a></li>");
                    }
                    if( hm1.containsKey("Admin rights") ){
                        out.println("<li><a href=\"screen_admin_rights.jsp\">ADMINSTRATOR RIGHTS</a></li>");
                    }
                    if( hm1.containsKey("Set deadline") ){
                        out.println("<li><a href=\"screen_admin_deadline.jsp\">SET DEADLINES</a></li>");
                    }
                    if(hm1.containsKey("View Statistics")||hm1.containsKey("Update Statistics")||hm1.containsKey("View Placements")){
                        out.println("<li class=\"dropdown\">"+
                                "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">PLACEMENT STATISTICS <b class=\"caret\"></b></a>"+
                                "<ul class=\"dropdown-menu\">");
                        if(hm1.containsKey("View Statistics")){
                            out.println("<li><a href=\"view_placementstats.jsp\" >VIEW STATISTICS</a></li>");
                        }
                        if(hm1.containsKey("Update Statistics")){
                            out.println("<li><a href=\"placement1.jsp\">UPDATE STATISTICS</a></li>");
                        }
                        if(hm1.containsKey("View Placements")){
                            out.println("<li><a href=\"view_placementDb.jsp\">PLACEMENTS</a></li>");
                        }
                        out.println("</ul>"+
                            "</li>");
                    }
                    if( hm1.containsKey("Placement Offers") ){
                        out.println("<li><a class=\"navbar-brand\"href=\"Placement_offer.jsp\">PLACEMENT OFFERS</a></li>");
                    } 
                    if( hm1.containsKey("Logs") ){
                        out.println("<li><a href=\"ShowLogs.jsp?page=1\">LOGS</a></li>"); 
                    }
                                            
                
      out.write("\n");
      out.write("                ");
 
                        }catch(Exception e){ 
                            out.println("error....<br>"+e);
                        }
                    }
                
      out.write("\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </nav>\n");
      out.write("    </div>\n");
      out.write("        ");

            }
            catch(NullPointerException ne){
                response.sendRedirect("admin_login.jsp");
            }
            catch(Exception e){
                out.println("error last ..<br>"+e);
            }
        
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

  // get the current year/month/day
  Calendar theCal = Calendar.getInstance();
  int currentYearInt  = theCal.get(Calendar.YEAR);
  int currentMonthInt = theCal.get(Calendar.MONTH);
  int currentDayInt   = theCal.get(Calendar.DATE);
  String currentYearString  = new Integer(currentYearInt).toString();
  String currentMonthString = new Integer(currentMonthInt).toString();

  // get parameters the user might have sent by clicking fwd or back
  String newMonth = request.getParameter("month");
  String newYear  = request.getParameter("year");

  // reset the month and year if necessary
  if ( newMonth != null )
  {
    currentMonthString = newMonth;
  }
  if ( newYear != null )
  {
    currentYearString = newYear;
  }

  // determine the next/previous month and year
  int intMonth = new Integer(currentMonthString).intValue();
  int intYear  = new Integer(currentYearString).intValue();

  // determine the name of the current intMonth
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

  String monthName = monthNames[intMonth];

  // determine the next/previous month and year.
  // this is really only needed by calendar.jsp, but i moved it here
  // to simplify calendar.jsp.
  int nextYear = intYear;
  int prevYear = intYear;
  int prevMonth = intMonth-1;
  if ( prevMonth==-1 )
  {
    prevMonth=11;
    prevYear--;
  }
  int nextMonth = intMonth+1;
  if ( nextMonth==12 )
  {
    nextMonth = 0;
    nextYear++;
  }


      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title>calendar</title>\r\n");
      out.write("  <link rel=\"StyleSheet\" href=\"/blog/calendar.css\" type=\"text/css\" media=\"screen\" />\r\n");
      out.write("</head>\r\n");
      out.write("<style>\r\n");
      out.write("    table, td, th\r\n");
      out.write("    {\r\n");
      out.write("        border: 0px;\r\n");
      out.write("    }\r\n");
      out.write("    td{\r\n");
      out.write("        padding:25px;\r\n");
      out.write("        border-radius: 20px;\r\n");
      out.write("    }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
        
        username = (String)session.getAttribute("name");
        try{
        Class.forName("com.mysql.jdbc.Driver");  
        con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  

        }    
        catch(Exception e){
            out.println("error..... <br>"+e); 
        }


      out.write("\r\n");
      out.write("\r\n");
      out.write("<body id=\"regular_page\">\r\n");
      out.write("    <br><br>\r\n");
      out.write("     <h1 class=\"heading\" style=\"color: #008000; \">CALENDAR</h1>\r\n");
      out.write("     <br>\r\n");
      out.write("    <div id=\"calendar_main_div\" >\r\n");
      out.write("<table cellspacing=\"1\" cellpadding=\"5\" id=\"calendar_table\" style=\"margin-left: 33%; margin-top:0%;\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"100%\" colspan=\"7\" class=\"month_year_header\">\r\n");
      out.write("      ");
      out.print(monthName);
      out.write(',');
      out.write(' ');
      out.print(intYear);
      out.write("\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr class=\"week_header_row\">\r\n");
      out.write("      <th width=\"14%\" class=\"th_day_cell day\" style=\"text-align: center\">Sun</th>\r\n");
      out.write("    <th width=\"14%\" class=\"th_day_cell day\" style=\"text-align: center\">Mon</th>\r\n");
      out.write("    <th width=\"14%\" class=\"th_day_cell day\" style=\"text-align: center\">Tue</th>\r\n");
      out.write("    <th width=\"14%\" class=\"th_day_cell day\" style=\"text-align: center\">Wed</th>\r\n");
      out.write("    <th width=\"14%\" class=\"th_day_cell day\" style=\"text-align: center\">Thu</th>\r\n");
      out.write("    <th width=\"15%\" class=\"th_day_cell day\" style=\"text-align: center\">Fri</th>\r\n");
      out.write("    <th width=\"15%\" class=\"th_day_cell day\" style=\"text-align: center\">Sat</th>\r\n");
      out.write("  </tr>\r\n");

{
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ )
  {
    
      out.write("<tr class=\"week_data_row\">");

    for( int j=0; j<7; j++ )
    {
      if( days[i][j] == 0 )
      {
        
      out.write("<td class=\"empty_day_cell\">&nbsp;</td>");

      }
      else
      {
        // this is "today"        
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() )
        {
            System.out.println("current date = "+days[i][j]+" "+currentMonthInt+" "+currentYearInt+"\n");
            
      out.write("<td id=\"todayCell\">\r\n");
      out.write("                ");
      out.print(days[i][j]);
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                <script>\r\n");
      out.write("    document.getElementById(\"todayCell\").style.backgroundColor = \"rgb(153, 204, 0)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                \r\n");
      out.write("                        ");
                        
        String type = "";
        String SQLQuery1 = "select eventtype from otherCalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
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
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"todayCell\").style.backgroundColor = \"rgb(179, 179, 255)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

        }
        
        if(!type.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("holiday")||type.equalsIgnoreCase("exam"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"todayCell\").style.backgroundColor = \"rgba(153, 153, 102,0.4)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
            else if(type.equalsIgnoreCase("meeting"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"todayCell\").style.backgroundColor = \"rgba(255, 77, 77,0.5)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
            else if(type.equalsIgnoreCase("other"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"todayCell\").style.backgroundColor = \"rgb(255, 255, 204)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
        }
                        
      out.write("\r\n");
      out.write("              </td>");

        }
        else
        {
          
      out.write("<td id=\"dayCell");
      out.print(days[i][j]);
      out.write('-');
      out.print(monthName);
      out.write('-');
      out.print(intYear);
      out.write("\">\r\n");
      out.write("              ");
      out.print(days[i][j]);
      out.write("            \r\n");
      out.write("                    ");

        String type = "";
        String SQLQuery3 = "select eventtype from otherCalendar where date = "+days[i][j]+" and month_ = "+(aMonth.getMonth()+1)+" and year_ = "+aMonth.getYear();
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
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"dayCell");
      out.print(days[i][j]);
      out.write('-');
      out.print(monthName);
      out.write('-');
      out.print(intYear);
      out.write("\").style.backgroundColor = \"rgb(179, 179, 255)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

        }
        
        if(!type.equalsIgnoreCase(""))
        {
            if(type.equalsIgnoreCase("holiday")||type.equalsIgnoreCase("exam"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"dayCell");
      out.print(days[i][j]);
      out.write('-');
      out.print(monthName);
      out.write('-');
      out.print(intYear);
      out.write("\").style.backgroundColor = \"rgba(153, 153, 102,0.4)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
            else if(type.equalsIgnoreCase("meeting"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"dayCell");
      out.print(days[i][j]);
      out.write('-');
      out.print(monthName);
      out.write('-');
      out.print(intYear);
      out.write("\").style.backgroundColor = \"rgba(255, 77, 77,0.5)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
            else if(type.equalsIgnoreCase("other"))
            {
                
      out.write("\r\n");
      out.write("                <script>\r\n");
      out.write("                        document.getElementById(\"dayCell");
      out.print(days[i][j]);
      out.write('-');
      out.print(monthName);
      out.write('-');
      out.print(intYear);
      out.write("\").style.backgroundColor = \"rgb(255, 255, 204)\";\r\n");
      out.write("                </script>\r\n");
      out.write("                ");

            }
        }
                        
      out.write("\r\n");
      out.write("            </td>");

        }
      } // end outer if
    } // end for
    
      out.write("\r\n");
      out.write("    </tr>\r\n");
      out.write("  ");
}
}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!-- navigation links -->\r\n");
      out.write("\r\n");
      out.write("<table style=\"margin-left: 30.5%; width:40.3%\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td id=\"prev_link\">\r\n");
      out.write("      <form method=\"post\">\r\n");
      out.write("        <input type=\"submit\" name=\"PREV\" value=\" << \" class=\"btn btn-danger\">\r\n");
      out.write("        <input type=\"hidden\" name=\"month\" value=\"");
      out.print(prevMonth);
      out.write("\">\r\n");
      out.write("        <input type=\"hidden\" name=\"year\" value=\"");
      out.print(prevYear);
      out.write("\">\r\n");
      out.write("      </form>\r\n");
      out.write("    </td>\r\n");
      out.write("    <td id=\"link_to_month_view\">\r\n");
      out.write("      <form action=\"calendarMonthPrintView.jsp\" method=\"post\">\r\n");
      out.write("          <input type=\"submit\" value=\" Full-Screen Print View \" class=\"btn btn-success\" \r\n");
      out.write("                 style=\"background-color:#39843c;width: 90%;\" onclick=\"document.body.style.cursor='wait'\">\r\n");
      out.write("        <input type=\"hidden\" name=\"month\" value=\"");
      out.print(intMonth);
      out.write("\">\r\n");
      out.write("        <input type=\"hidden\" name=\"year\"  value=\"");
      out.print(intYear);
      out.write("\">\r\n");
      out.write("      </form>\r\n");
      out.write("    </td>\r\n");
      out.write("    <td id=\"next_link\">\r\n");
      out.write("      <form method=\"post\">\r\n");
      out.write("        <input type=\"submit\" name=\"NEXT\" value=\" >> \" class=\"btn btn-danger\">\r\n");
      out.write("        <input type=\"hidden\" name=\"month\" value=\"");
      out.print(nextMonth);
      out.write("\">\r\n");
      out.write("        <input type=\"hidden\" name=\"year\" value=\"");
      out.print(nextYear);
      out.write("\">\r\n");
      out.write("      </form>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("  <!-- navigation links end -->\r\n");
      out.write("  <br><br><br>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<footer>");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <style>\n");
      out.write("            .copyright \n");
      out.write("            {\n");
      out.write("                background-color:#39843c; \n");
      out.write("                margin-right: 0px; \n");
      out.write("                height: 3em; \n");
      out.write("                width:100%; \n");
      out.write("                margin-bottom: 0;\n");
      out.write("            }\n");
      out.write("            .copyright p \n");
      out.write("            {\n");
      out.write("                color:#FFF; \n");
      out.write("                padding:0.52em 0 0 0; \n");
      out.write("                margin-bottom:0px; \n");
      out.write("                font-family: 'Helvetica', sans-serif; \n");
      out.write("                font-size: 18px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"copyright\">\n");
      out.write("            <center><p>© Copyright IGDTUW</p></center>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("</footer>\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
