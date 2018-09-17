package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/admin_login_header.jsp");
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
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
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
      out.write("    }\n");
      out.write("  </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("      <span class=\"col-sm-2\">\n");
      out.write("          <center><img id=\"logo\" src=\"igdtuw.png\" width=\"50%\"></center>\n");
      out.write("    </span>\n");
      out.write("      <div class=\"col-sm-8\" id=\"headings\">\n");
      out.write("        <center>\n");
      out.write("          <p id=\"igdtu\" style=\"\"><b>INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN</b></p>\n");
      out.write("          <div class=\"desc\">\n");
      out.write("            <p style=\"font-size:1em;\"><b>(Established by Govt. of Delhi vide Act 9 of 2012)</b></p>\n");
      out.write("            <p style=\"font-size:1.3em; color:black;\"><b>TRAINING AND PLACEMENT PORTAL</b></p>\n");
      out.write("        </center>\n");
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
      out.write("            <ul class=\"nav navbar-nav\">\n");
      out.write("                <li id=\"home\"><a href=\"admin_login.jsp\">HOME</a></li>\n");
      out.write("                <li id=\"why_igdtuw\" ><a href=\"screen_why.jsp?page=admin\">WHY IGDTUW</a></li>\n");
      out.write("                <li id=\"stats\" ><a href=\"screen.stats.jsp?page=admin\">PLACEMENT STATS</a></li>\n");
      out.write("                <li id=\"placements\" ><a href=\"screen.placements.jsp?page=admin\">PLACEMENTS</a></li>\n");
      out.write("                <li id=\"contact_us\" ><a href=\"contact.jsp?page=admin\">CONTACT US</a></li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </nav>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/commonCSS.css\">\n");
      out.write("  \n");
      out.write("<style type=\"text/css\">\n");
      out.write("      .login{ \n");
      out.write("        margin-left: 30px;\n");
      out.write("        width:40%;\n");
      out.write("        margin-top:50px;\n");
      out.write("        background-color: #F5F5F5;\n");
      out.write("        padding: 30px;\n");
      out.write("        border: 2px solid #39843c;\n");
      out.write("    }  \n");
      out.write("</style>\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    \n");
      out.write("\n");
      out.write("<!-- login div-->\n");
      out.write("<div class=\"login\">\n");
      out.write("    <center><h2 class=\"tnpheading\">ADMIN LOGIN</h3></center><br>\n");
      out.write("  ");

      if(request.getParameter("txt") == null){
//                out.println("<center><h5 style=\"color:red\">no text</h5></center>");
      }
      else{
                out.println("<center><h5 style=\"color:red\">"+request.getParameter("txt")+"</h5></center>");
      }
  
      out.write("\n");
      out.write("<form name=\"myform\" align=\"center\" class=\"form-horizontal\" role=\"form\" action=\"Login\" method=\"post\"\n");
      out.write(" style=\"margin-top:20px;\">\n");
      out.write("<div class=\"form-group\">\n");
      out.write("      <label class=\"col-sm-4 control-label\">Username:</label>\n");
      out.write("      <div class=\"col-sm-6\">\n");
      out.write("        <input class=\"form-control\" id=\"eno\" type=\"text\" name=\"user\" required=\"required\">\n");
      out.write("      </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("      <label class=\"col-sm-4 control-label\">Password:</label>\n");
      out.write("      <div class=\"col-sm-6\">\n");
      out.write("        <input class=\"form-control\" id=\"pass\" type=\"password\" name=\"pass\" required=\"required\">\n");
      out.write("        <!--<a href=\"#\">forgot password?</a>-->\n");
      out.write("      </div>\n");
      out.write("</div>\n");
      out.write("<br>\n");
      out.write("<div class=\"form-group\"> \n");
      out.write("    <div class=\"col-sm-offset-4 col-sm-2\">\n");
      out.write("      <button type=\"submit\" id=\"submit\" name=\"submit\" class=\"btn btn-success btn-lg tnpbtn\">Login</button>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("In case of <b>Forgot password</b> send mail to abc@gmail.com\n");
      out.write("         </form>\n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("  </body>\n");
      out.write("  <br><br><br>\n");
      out.write("</html>\n");
      out.write("<footer class=\"tnpfooter\">");
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
      out.write("</footer>\n");
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
