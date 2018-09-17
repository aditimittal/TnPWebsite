package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.HashMap;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public final class view_005fprog_005fcode_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 String sql, sql2; 
 Statement stm, stm2; 
 ResultSet res, res2; 
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/connection.jsp");
    _jspx_dependants.add("/common_header.jsp");
    _jspx_dependants.add("/connection_header.jsp");
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/commonCSS.css\">  \r\n");
      out.write("        <style>\r\n");
      out.write("            .body-wrapper{\r\n");
      out.write("                min-height:50vh;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("        <script>\r\n");
      out.write("            var xmlHttp;\r\n");
      out.write("            function showTable(year){\r\n");
      out.write("                if(typeof  XMLHttpRequest !== \"undefined\"){\r\n");
      out.write("                    xmlHttp = new XMLHttpRequest();\r\n");
      out.write("                }\r\n");
      out.write("                else if(window.ActiveXObject){\r\n");
      out.write("                    xmlHttp = new ActiveXObject(\"Microsoft.XMLHTTP\");\r\n");
      out.write("                }\r\n");
      out.write("                \r\n");
      out.write("                if(xmlHttp === null){\r\n");
      out.write("                    alert(\"Browser does not support XMLHTTP Request\");\r\n");
      out.write("                    return;\r\n");
      out.write("                }\r\n");
      out.write("                var url = \"Show_PB_codes.jsp\";\r\n");
      out.write("                url+=\"?year_db=\"+year;\r\n");
      out.write("                \r\n");
      out.write("                xmlHttp.onreadystatechange = stateChange;\r\n");
      out.write("                xmlHttp.open(\"GET\", url, true);\r\n");
      out.write("                xmlHttp.send(null);\r\n");
      out.write("            }\r\n");
      out.write("            function stateChange(){   \r\n");
      out.write("                if (xmlHttp.readyState===4 || xmlHttp.readyState===\"complete\"){   \r\n");
      out.write("                document.getElementById(\"rows\").innerHTML=xmlHttp.responseText   ;\r\n");
      out.write("                }   \r\n");
      out.write("            } \r\n");
      out.write("            </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"body-wrapper boxborder\" style=\"overflow-x: auto; margin-bottom:4%;\">\r\n");
      out.write("            <center><h2 class=\"tnpheading\">PROGRAMME & BRANCH CODES</h2></center>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        ");

        try{
            
            Class.forName("com.mysql.jdbc.Driver");  
            System.out.println("kkkk");
            
            Date date=new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH);
             con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_"+year,"root","");
             stm = (Statement)con1.createStatement();
            sql = "select *from programme_codes order by Programme_Code;";
            res = stm.executeQuery(sql);
             System.out.println(year+"lllllll");
      out.write("\r\n");
      out.write("             <br><center><div id=\"my\">\r\n");
      out.write("                     <select name='year1'id=\"year1\" onchange=\"showTable(this.value)\">");

                             for(int j=year;j>=2013;j--)
                             {
                                 if(month>=0&&month<6&&j==year)
                                 {j--; year--;
                                    
      out.write("\r\n");
      out.write("                                 <option value='");
      out.print(j);
      out.write("' selected>");
      out.print(j);
      out.write("</option>\r\n");
      out.write("                                 ");
 
                                 }
                                else if(month>=6&&j==year)
                                {
                                     
      out.write("\r\n");
      out.write("                                 <option value='");
      out.print(j);
      out.write("' selected>");
      out.print(j);
      out.write("</option>\r\n");
      out.write("                                 ");
 
                                }
                                else{
                                 
      out.write("\r\n");
      out.write("                                 <option value='");
      out.print(j);
      out.write('\'');
      out.write('>');
      out.print(j);
      out.write("</option>\r\n");
      out.write("                                 ");
}
                             }
            
        
      out.write("\r\n");
      out.write("                         </select></center>\r\n");
      out.write("                <div id=\"rows\">          \r\n");
      out.write("        <table class=\"table\" style=\"margin-top:2em;margin-left:9em;width:80%\">\r\n");
      out.write("            <thead class=\"thead-dark\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th>PROGRAMME CODE</th>\r\n");
      out.write("                    <th>BRANCH CODE</th>\r\n");
      out.write("                    <th>PROGRAMME NAME</th>\r\n");
      out.write("                    <th>TYPE</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            <tbody>\r\n");
      out.write("        ");

            while(res.next()){
                String prog_code = res.getString("Programme_Code");
                String prog_name = res.getString("Programme_Name");
                String prog_type = res.getString("Programme_Type");
                int count = 0;
                stm2 = (Statement)con1.createStatement();
                sql2 = "select * from branch_codes where Programme_Name = '"+ prog_name +"';";
                System.out.println(sql2);
                res2 = stm2.executeQuery(sql2);
                while(res2.next()){
                    count++;
                    String branch_code = res2.getString("Branch_Code");
                    String full_prog_name = prog_name+" - "+res2.getString("Branch_Name");
        
      out.write("\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td> ");
      out.print(prog_code);
      out.write(" </td>\r\n");
      out.write("                    <td> ");
      out.print(branch_code);
      out.write(" </td>\r\n");
      out.write("                    <td> ");
      out.print(full_prog_name);
      out.write(" </td>\r\n");
      out.write("                    <td> ");
      out.print(prog_type);
      out.write(" </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("        ");

                }

                if(count == 0){
        
      out.write("\r\n");
      out.write("        \r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td> ");
      out.print(prog_code);
      out.write(" </td>\r\n");
      out.write("                    <td> --- </td>\r\n");
      out.write("                    <td> ");
      out.print(prog_name);
      out.write(" </td>\r\n");
      out.write("                    <td> ");
      out.print(prog_type);
      out.write(" </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                \r\n");
      out.write("        ");


                }
            }
        
        }    
        catch(Exception e){
            System.out.println("Error "+e);
        }
        
        
      out.write("\r\n");
      out.write("        \r\n");
      out.write("            </tbody>\r\n");
      out.write("        </table></div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
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
      out.write("</footer>");
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
