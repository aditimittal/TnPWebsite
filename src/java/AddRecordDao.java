import Implement.connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddRecordDao 
{
    
 public static int[] insert(int date, int month, int year, String deptName, String courseName, int yearOfDegree, String companyName, String EventInfo, String username) throws SQLException 
 {
      int[] ans = new int[2];
      int flag = 0;  
      connection co = new connection();    
      Connection con = co.establishConnection();
      
      int companyID = Integer.parseInt(companyName.split("-")[0]);
      
      System.out.println("IN ADDRECORDDAO "+deptName+" "+courseName+" "+yearOfDegree+" "+companyName+" "+EventInfo);
      System.out.println("IN ADDRECORDDAO "+companyID+" "+deptName+" "+courseName);
      
      
      System.out.println("IN ADDRECORDHANDLER "+date+" "+month+" "+year);
      
      String SQL_QUERY = "insert into calendar(date, month_, year_, deptName, courseName, yearOfDegree, companyID, eventInfo)"
                   + " values(?,?,?,?,?,?,?,?)";
      
      try 
      {
      System.out.println("IN ADDRECORDHANDLER BEFORE EXCECUTION");
         PreparedStatement pst = con.prepareStatement(SQL_QUERY);
         pst.setInt(1, date);
         pst.setInt(2, month);
         pst.setInt(3, year);
         pst.setString(4, deptName);
         pst.setString(5, courseName);
         pst.setInt(6, yearOfDegree);
         pst.setInt(7, companyID);
         pst.setString(8, EventInfo);
         
         int rowCount = pst.executeUpdate();
         
      System.out.println("IN ADDRECORDHANDLER AFTER EXCECUTION "+rowCount);
         
         if (rowCount > 0) 
         {
            flag = 1;
            //Entry in Log Table
            Statement st = (Statement)con.createStatement();
            
            java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Event Added in Comapny Calendar";
                    String mess = "For Date : "+date+"/"+month+"/"+year+"<br>";
                    mess += "For Batch : "+deptName+" "+courseName+" "+yearOfDegree+" year<br>";
                    mess += "Event : "+companyName.split("-")[1]+" "+EventInfo;
                    String sql = "insert into tnp.logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
         }       
         con.close();
      } 
      catch (Exception e) 
      {
          System.err.println("Error while inserting Calendar Database : "+e);
      } 
      
      int id = latestInsertedRow();
      ans[0]=flag;
      ans[1]=id;
      
      return ans;
 }

    public static int latestInsertedRow() throws SQLException 
    {
        connection co = new connection();
        int calID=0;
     try {
         Connection con = co.establishConnection();
         String SQLQuery = "select max(calID) from calendar";
         calID = 0; //not found
         ResultSet rs=null;
            try 
            {
                Statement st = con.createStatement();
                rs = st.executeQuery(SQLQuery);
                while(rs.next())
                {
                    calID = rs.getInt(1);
                }  
            }catch(Exception e)
            {
                
            }
         rs.close();
     }catch(Exception e)
     {
         
     }
        
        return calID;
    }
}   