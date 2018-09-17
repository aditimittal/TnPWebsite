/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UploadToDBServlet;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteDatabaseServlet")
public class DeleteDatabaseServlet extends HttpServlet {

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
 
            String year = request.getParameter("delyear");
                        
            // Validating whether year is null or empty
                if (year == null || year.equals("")) {
                    request.setAttribute("message", "Year required!");
                } 
                else {
                    
                    String username = (String)request.getSession().getAttribute("name");
                    System.out.println(username);
            
                    st = (Statement)con.createStatement();
                    dbname = "db_"+ year;

                    sql = "DROP DATABASE "+dbname+";";
                    st.executeUpdate(sql);
                    
                    String msg = "Database deleted ("+dbname+")";
                    request.setAttribute("message", "Database deleted!");
                    
                    //Entry in Log Table
                    java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
                    String formattedDate = df.format(new java.util.Date());
                    df = new java.text.SimpleDateFormat("HH:mm:ss");
                    String formattedTime = df.format(new java.util.Date());
                    String content = "Database deleted";
                    String mess = "Database deleted for year "+ year + " ("+dbname+") ";
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
