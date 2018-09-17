

import Implement.connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddRecordTnpDao 
{
 
 public static int[] insert(int date, int month, int year, String eventtype, String EventInfo, String username) throws SQLException 
 {
      int[] ans = new int[2];
      int flag = 0;      
      connection co = new connection();
      Connection con;
     con = co.establishConnection();
      
      System.out.println("IN ADDTNPRECORDDAO "+eventtype+" "+EventInfo);     
      System.out.println("IN ADDTNPRECORDHANDLER "+date+" "+month+" "+year);
      
      String SQL_QUERY = "insert into otherCalendar(date, month_, year_, eventtype, eventInfo)"
                   + " values(?,?,?,?,?)";
      
      try 
      {
      System.out.println("IN ADDTNPRECORDHANDLER BEFORE EXCECUTION");
         PreparedStatement pst = con.prepareStatement(SQL_QUERY);
         pst.setInt(1, date);
         pst.setInt(2, month);
         pst.setInt(3, year);
         pst.setString(4, eventtype);
         pst.setString(5, EventInfo);
         
         int rowCount = pst.executeUpdate();
         
      System.out.println("IN ADDTNPRECORDHANDLER AFTER EXCECUTION "+rowCount);
         
         if (rowCount > 0) 
         {
            flag = 1;//Entry in Log Table
            Statement st = (Statement)con.createStatement();
            
            java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Event Added in TNP Calendar";
                    String mess = "For Date : "+date+"/"+month+"/"+year+"<br>";
                    mess += "Event : "+eventtype+" "+EventInfo;
                    String sql = "insert into tnp.logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
         }          
         con.close();
      } 
      catch (Exception e) 
      {
      } 
      
      int id = latestInsertedRow();
      ans[0]=flag;
      ans[1]=id;
      
      return ans;
 }
 
    public static int latestInsertedRow() throws SQLException 
    {
        connection co = new connection();
        int ocalID=0;
     try  
     {   Connection con = co.establishConnection();
         String SQLQuery = "select max(ocalID) from otherCalendar";
         ocalID = 0; //not found
         ResultSet rs=null;
            try 
            {
                Statement st = con.createStatement();
                rs = st.executeQuery(SQLQuery);
                while(rs.next())
                {
                    ocalID = rs.getInt(1);
                }  
            }catch(Exception e)
            {
                
            }
         rs.close();
     }catch(Exception e)
     {
         
     }
        
        return ocalID;
    }
 
}   