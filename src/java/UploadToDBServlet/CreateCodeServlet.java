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


@WebServlet("/CreateCodeServlet")
public class CreateCodeServlet extends HttpServlet {
    
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
 
            String Programme_Name = request.getParameter("Programme_Name");
            String Programme_Code = request.getParameter("Programme_Code");
            String Programme_Type = request.getParameter("Programme_Type");
            String Programme_Duration = request.getParameter("Programme_Duration");
            String year = request.getParameter("year");
            dbname = "db_"+ year;
            System.out.println(Programme_Code+" "+Programme_Name+" -- "+year);
            
            int flag = 0;            
            // Validating whether inputs are null or empty
                if (Programme_Code == null || Programme_Code.equals("")) {
                    request.setAttribute("message", "Programme Code required!");
                    flag = 1;
                } 
                if (Programme_Name == null || Programme_Name.equals("")) {
                    request.setAttribute("message", "Programme Name required!");
                    flag = 1;
                } 
                if (Programme_Code == null || Programme_Code.equals("")) {
                    request.setAttribute("message", "Programme Code required!");
                    flag = 1;
                } 
                if (Programme_Name == null || Programme_Name.equals("")) {
                    request.setAttribute("message", "Programme Name required!");
                    flag = 1;
                } 
                if (year == null || year.equals("")) {
                    request.setAttribute("message", "Year required!");
                    flag = 1;
                } 
                
                if(flag==0)
                {                    
                    int returnMessage = 0;
                    String SQLQuery = "select count(Programme_Name) from "+dbname+".Programme_Codes where Programme_Name = '"+Programme_Name+"'";
        
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
            sql = "Insert into "+dbname+".Programme_Codes values('"+Programme_Name+"','"+Programme_Code+"','"+Programme_Type+"',"+Programme_Duration+");";
                    
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
            returnMessage = 1;
                    
                    //Entry in Log Table
                    st =(Statement)con.createStatement();
                    java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Programme Added";
                    String mess = "Prgramme added for year "+ year ;
                    mess += "  Programme_Name : "+Programme_Name+", Programme_Code : "+Programme_Code;
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