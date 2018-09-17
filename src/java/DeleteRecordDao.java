

import Implement.connection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteRecordDao 
{
    
 public static int insert(int date, int month, int year, String id, String table, String username) throws SQLException 
 {
      int flag = 0;      
      connection co = new connection();
      Connection con;
     con = co.establishConnection();
      
      System.out.println("IN DELETERECORDHANDLER "+date+" "+month+" "+year);
      
      String SQL_QUERY = "", work = "";
      if(table.equalsIgnoreCase("calendar"))
      {
          SQL_QUERY = "delete from calendar where calID = "+Integer.parseInt(id);
          work = "Company Calendar";
      }
      else if(table.equalsIgnoreCase("otherCalendar"))
      {
          SQL_QUERY = "delete from otherCalendar where ocalID = "+Integer.parseInt(id);
          work = "TNP Calendar.";
      }
      
      try 
      {
      System.out.println("IN DELETERECORDHANDLER BEFORE EXCECUTION");
         Statement smt = con.createStatement();         
         int rowCount = smt.executeUpdate(SQL_QUERY);
         
      System.out.println("IN DELETERECORDHANDLER AFTER EXCECUTION "+rowCount);
         
         if (rowCount > 0) 
         {
            flag = 1;
            //Entry in Log Table
            Statement st = (Statement)con.createStatement();
            
            java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Calendar Event Deleted";
                    String mess = "For Date : "+date+"/"+month+"/"+year+" from "+work;
                    String sql = "insert into tnp.logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
         }          
         con.close();
      } 
      catch (Exception e) 
      {
      } 
      
      return flag;
 }
}   