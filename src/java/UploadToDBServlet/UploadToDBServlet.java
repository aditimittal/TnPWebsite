package UploadToDBServlet;
 
import java.io.IOException;
import java.io.InputStream;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadToDBServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB (In Bytes)
        maxFileSize = 1024 * 1024 * 1024, // 1GB   
        maxRequestSize = 1024 * 1024 * 1024 * 2) // 2GB
public class UploadToDBServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/uploadToDB.jsp");
 
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection con = null;
        String result = null;
        int check = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
 
            String info = request.getParameter("info");
            String sub = request.getParameter("sub");
 
            // Part list (multi files).
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && fileName.length() > 0) {
                    // File data
                    check = 1;
                    InputStream is = part.getInputStream();
                    // Write to file
                    result = this.writeToDB(con, fileName, is, info, sub);
                }
            }
            if(check == 0)
                    result = this.writeToDBWithoutFile(con, info, sub);
               
            // Upload successfully!.
            HttpSession session  = request.getSession(true); 
            session.setAttribute("notifysub",sub);
            session.setAttribute("notifytext",info);
            request.setAttribute("Message", result);
            getServletContext().getRequestDispatcher("/notify_action.jsp").forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/uploadToDBResultsServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/notify.jsp");
            dispatcher.forward(request, response);
        } finally {
            this.closeQuietly(con);
        }
    }
 
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
 
    private Long getMaxAttachmentId(Connection conn) throws SQLException {
        String sql = "Select max(n.id) from notifications n";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            long max = rs.getLong(1);
            return max;
        }
        return 0L;
    }
 
    private String writeToDB(Connection conn, String fileName, InputStream is, String info, String sub) throws SQLException {
 
        java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
        String formattedDate = df.format(new java.util.Date());
   
        df = new java.text.SimpleDateFormat("HH:mm:ss");
        String formattedTime = df.format(new java.util.Date());
        
        String sql = "Insert into notifications(id, subject, info, filename,filedata,postdate, posttime) " //
                + " values (?,?,?,?,?,'"+formattedDate+"','"+formattedTime+"') ";
        PreparedStatement pstm = conn.prepareStatement(sql);    
            
        Long id = this.getMaxAttachmentId(conn) + 1;
        pstm.setLong(1, id);
        pstm.setString(2,sub);
        pstm.setString(3, info);
        pstm.setString(4, fileName);
        pstm.setBlob(5, is);
        int row = pstm.executeUpdate();
        String result;
        if (row > 0)
            result = "Notification Board updated successfully.";
        else
            result = "Notification Board not updated successfully.";
        return result;
    }
    
    private String writeToDBWithoutFile(Connection conn, String info, String sub) throws SQLException {
 
        java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
        String formattedDate = df.format(new java.util.Date());
   
        df = new java.text.SimpleDateFormat("HH:mm:ss");
        String formattedTime = df.format(new java.util.Date());
        
        String sql = "Insert into notifications(id, subject, info, postdate, posttime) " //
                + " values (?,?,?,'"+formattedDate+"','"+formattedTime+"') ";
        PreparedStatement pstm = conn.prepareStatement(sql);    
            
        Long id = this.getMaxAttachmentId(conn) + 1;
        pstm.setLong(1, id);
        pstm.setString(2,sub);
        pstm.setString(3, info);
        int row = pstm.executeUpdate();
        String result;
        if (row > 0)
            result = "Notification Board updated successfully.";
        else
            result = "Notification Board not updated successfully.";
        return result;
    }
 
    private void closeQuietly(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
        }
    }
 
}
