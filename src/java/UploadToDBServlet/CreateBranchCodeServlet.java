package UploadToDBServlet;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CreateBranchCodeServlet")
public class CreateBranchCodeServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
        Connection con = null;
        String sql, dbname;
        Statement st;
        
        try {
            
            String username = (String)request.getSession().getAttribute("name");
            System.out.println(username);
            
            //Set up the connection
            Class.forName("com.mysql.jdbc.Driver");  
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root","");  
 
            String Branch_Code= request.getParameter("Branch_Code");
            String Branch_Name = request.getParameter("Branch_Name");
            String Programme = request.getParameter("Programme");
            String Programme_Code = Programme.split("-")[0];
            String Programme_Name = Programme.split("-")[1];
            String year = request.getParameter("year");
            dbname = "db_"+ year;
            System.out.println(Programme_Code+" "+Branch_Code+" -- "+year);
                        
            // Validating whether inputs are null or empty
                if (Programme_Code == null || Programme_Code.equals("")) {
                    request.setAttribute("message", "Programme Code required!");
                } 
                else  if (Branch_Code == null || Branch_Code.equals("")) {
                    request.setAttribute("message", "Branch Code required!");
                } 
                else  if (Branch_Name == null || Branch_Name.equals("")) {
                    request.setAttribute("message", "Branch Name required!");
                } 
                else  if (year == null || year.equals("")) {
                    request.setAttribute("message", "Year required!");
                } 
                else {                    
                    int returnMessage = 0;
                    String SQLQuery = "select count(*) from "+dbname+".Branch_Codes where Programme_Name = '"+Programme_Name+"' and Branch_Code='"+Branch_Code+"'";
        
        int result = 0; //not found
         st = con.createStatement();
        ResultSet rs=st.executeQuery(SQLQuery);
         while(rs.next())
         {
             result = rs.getInt(1);             
         }
                    
        System.out.println("-->> result "+result+" . "+returnMessage);
        if(result==0)
        {           
            sql = "Insert into "+dbname+".Branch_Codes(Branch_Code, Branch_Name, Programme_Name) values('"+Branch_Code+"','"+Branch_Name+"','"+Programme_Name+"');";
                    
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
            returnMessage = 1;
                    
                    //Entry in Log Table
                    st =(Statement)con.createStatement();
                    java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Branch Added";
                    String mess = "Branch added for year "+ year ;
                    mess += "  Branch_Name : "+Branch_Name+", Branch_Code : "+Branch_Code;
                    mess += "  For Programme Code : "+Programme_Code+", Programme_Name : "+Programme_Name;
                    sql = "insert into logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
        }
                    
                    new Gson().toJson(returnMessage, response.getWriter());
        }
        } catch (Exception e) {
                request.setAttribute("message", e.getMessage());
                e.printStackTrace();
        }
    }
}