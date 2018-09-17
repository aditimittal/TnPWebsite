

import java.io.IOException;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteRecordHandler")
public class DeleteRecordHandler extends HttpServlet 
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
     String infoMetaData = request.getParameter("infoMetaData");
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
     
     System.out.println("infoMetaData "+infoMetaData);
     String[] IdTable = infoMetaData.split("-");
     try 
     {
           if (operation.equalsIgnoreCase("delete")) 
           {
               System.out.println("IN DELETERECORDHANDLER "+IdTable[0]+" "+IdTable[1]+" ");
               cnt = DeleteRecordDao.insert(date, month, year, IdTable[0], IdTable[1], username);
           }
             if (cnt==1) 
             {
               returnMessage = "Record Deleted Successfully.";
             } 
             else if(cnt==0) 
             {
               returnMessage = "Record deletion failed.";
             }
             else
             {
                returnMessage = "Error occurred, try again !";
             }
             System.out.println("IN DELETERECORDHANDLER "+returnMessage);
             
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