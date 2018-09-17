/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UploadToDBServlet;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteBranchCodeServlet")
public class DeleteBranchCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
        Connection con = null;
        Statement st;
        String sql, dbname;
        
        try {
            
            //Set up the connection
            Class.forName("com.mysql.jdbc.Driver");  
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
 
            String details = request.getParameter("details");
            String Branch_Code = details.split("-")[0];
            String Branch_Name = details.split("-")[1];
            String Programme_Code = details.split("-")[2];
            String Programme_Name = details.split("-")[3];
            String year = request.getParameter("year");
            
            System.out.println(" "+details+" -- >> "+year);
                        
            // Validating whether year is null or empty
                if (year == null || year.equals("")) {
                    request.setAttribute("message", "Year required!");
                } 
                else if (Branch_Code == null || Branch_Code.equals("")) {
                    request.setAttribute("message", "Branch Code required!");
                } 
                else {                    
                    String username = (String)request.getSession().getAttribute("name");
                    System.out.println(username);
            
                    st = (Statement)con.createStatement();
                    dbname = "db_"+ year;
                    
                    sql = "Delete from "+dbname+".Branch_Codes where Branch_Code = ? and Programme_Name = ?;";
                    
                    PreparedStatement pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, Branch_Code);
                    pstmt.setString(2, Programme_Name);
                    pstmt.executeUpdate();
                    
                    request.setAttribute("message", Branch_Code);
                    
                    //Entry in Log Table
                    java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Branch Deleted";
                    String mess = "Branch added for year "+ year ;
                    mess += "  Branch_Name : "+Branch_Name+", Branch_Code : "+Branch_Code;
                    mess += "  For Programme Code : "+Programme_Code+", Programme_Name : "+Programme_Name;
                    sql = "insert into logtable(user,content,msg,update_date,update_time) values('"+username+"','"+content+"','"+mess+"','"+formattedDate+"','"+formattedTime+"')";
                    int i = st.executeUpdate(sql);
                    
                }
        } catch (Exception e) {
                request.setAttribute("message", e.getMessage());
                e.printStackTrace();
        }
        
       //new Gson().toJson(returnMessage, response.getWriter());   
        request.getRequestDispatcher("CreateDropDBResult.jsp").forward(request, response);
    }
}