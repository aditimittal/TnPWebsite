

import java.io.IOException;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddRecordTnpHandler")
public class AddRecordTnpHandler extends HttpServlet 
{
 int cnt;
 String returnMessage = null;

 @Override
 protected void service(HttpServletRequest request,
 HttpServletResponse response) throws ServletException, IOException 
 {
     response.setContentType("application/json");
     
     String operation = request.getParameter("operation");
     int date = Integer.parseInt(request.getParameter("date"));
     String mon = request.getParameter("month");
     int year = Integer.parseInt(request.getParameter("year"));
     String eventtype = request.getParameter("eventtype"); 
     String EventInfo = request.getParameter("EventInfo");
     String username = request.getParameter("username");
     
     int month = 1;
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
         if(mon.equalsIgnoreCase(monthNames[i]))
         {
             month = i+1;
             break;
         }
     }
     
     try 
     {
         int[] ans = new int[2];
           if (operation.equalsIgnoreCase("insert")) 
           {
               System.out.println("IN ADDTNPRECORDHANDLER  "+eventtype+" "+EventInfo);
               ans = AddRecordTnpDao.insert(date, month, year, eventtype, EventInfo, username);
           }
             cnt = ans[0];
             if (cnt==1) 
             {
               returnMessage = "Record Inserted Successfully.-"+ans[1];
             } 
             else if(cnt==0) 
             {
               returnMessage = "Record insertion failed.";
             }
             else
             {
                returnMessage = "Error occurred, try again !";
             }
             System.out.println("IN ADDTNPRECORDHANDLER "+returnMessage);
             
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