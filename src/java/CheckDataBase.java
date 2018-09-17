
import Implement.connection;
import java.io.IOException;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckDataBase")
public class CheckDataBase extends HttpServlet 
{
 int cnt;
 String returnMessage = null;

 @Override
 protected void service(HttpServletRequest request,
 HttpServletResponse response) throws ServletException, IOException 
 {
     response.setContentType("application/json");
     
     String yearVal = request.getParameter("yearVal");
     returnMessage = "Failure";
     
     try 
     {
         connection co = new connection();    
         Connection con = co.establishConnection();
         
         Statement st = (Statement)con.createStatement();
         String sql = "SHOW DATABASES LIKE 'db_"+yearVal+"' ";
         
         ResultSet res = st.executeQuery(sql);
         while(res.next())
         {
             String db_name = res.getString(1);
             System.out.println(db_name);
             db_name = db_name.replace("db_", "");
             
             if(db_name.equals(yearVal))
             {
                 returnMessage = "Success";
                 break;
             }
         }
             
           new Gson().toJson(returnMessage, response.getWriter());    
     } 
     catch (Exception e) 
     {
         e.printStackTrace();
     }
 }

 @Override
 protected void doGet(HttpServletRequest request,
 HttpServletResponse response) throws ServletException, IOException {
 service(request, response);
 }

 @Override
 protected void doPost(HttpServletRequest request,
 HttpServletResponse response) throws ServletException, IOException {
 service(request, response);
 }

}