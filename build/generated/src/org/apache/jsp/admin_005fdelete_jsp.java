package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.concurrent.TimeUnit;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

public final class admin_005fdelete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con; 
 Statement statement; 

    public void insertLog(String user, String content, String msg){
        
        try{
            statement = (Statement) con.createStatement();

            java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
            String formattedDate = df.format(new java.util.Date());
   
            df = new java.text.SimpleDateFormat("HH:mm:ss");
            String formattedTime = df.format(new java.util.Date());
 
            int i = statement.executeUpdate("insert into logtable(user,content,msg,update_date,update_time) values('"+user+"','"+content+"','"+msg+"','"+formattedDate+"','"+formattedTime+"')");
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
    }

 String id;
    String name;
    String desig;
    String dept;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/connection.jsp");
    _jspx_dependants.add("/InsertLogs.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

id = request.getParameter("id");
String query = "select * from admins where admin_id="+id+"";
Statement stm = con.createStatement();
ResultSet result = stm.executeQuery(query);
        
while(result.next()){
    name = result.getString("name");
    desig = result.getString("designation");
    dept = result.getString("department");
}



String sql = "delete from admins where admin_id="+id+"";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.executeUpdate();
        sql = "delete from admin_rights where user_id="+id;
                        ps = con.prepareStatement(sql);
                        ps.executeUpdate();

String username = (String)session.getAttribute("name");
String msg = "Rights Deleted for "+name+" ("+desig+") "+"of "+dept+" dept";
insertLog(username, "Rights Updated", msg );


        String ans ;
        ans = "<tr>"+
            "<th>NAME</th>"+
            "<th>EMAIL</th>"+
            "<th>DESIGNATION</th>"+
            "<th>DEPARTMENT</th>"+
            "<th>RIGHTS</th>"+
            "<th></th>"+
            "<th></th>"+
            "</tr>";
        
try{
    Statement stmt= con.createStatement();  
    int id2 =  (Integer)session.getAttribute("idx");
    ResultSet rs=stmt.executeQuery("select * from admins where admin_id not in ("+id2+") ");
    int count=0; 
    while(rs.next()){
        count++;
        int id = rs.getInt(1);
        String name = rs.getString("name");
        String email = rs.getString("email");
        String desig = rs.getString("designation");
        String dept = rs.getString("department");
        String rights = rs.getString("rights");
        ans+="<tr>";
        ans+="<td>"+name+"</td>";
        ans+="<td>"+email+"</td>";
        ans+="<td>"+desig+"</td>";
        ans+="<td>"+dept+"</td>";
        ans+="<td>"+rights+"</td>";
        ans+="<td><a class=\"click\" href=\"screen_admin_edit.jsp?id= "+id+" \">Edit</a></td>";
        ans+="<td><a class=\"click\" onclick=\"deleteAlert("+id+")\" >Delete</a></td>";
        ans+="</tr>";
        

    }  

    ans+="</table>";
    if(count==0){
        ans = "<br><h3>No Admins Found!!</h3>";
    }

    response.getWriter().println(ans); 
    con.close();  
    
}
catch(Exception e){
out.println("error.... <br>"+e);
}      
        


      out.write('\n');
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
