package UploadToDBServlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


class Attachment{
    Long id;
    String filename, info;
    Blob filedata;
    Attachment(Long id, String filename, Blob filedata, String info){
        this.id = id;
        this.filename = filename;
        this.filedata = filedata;
        this.info = info;
    }
    
    public Blob getFileData(){
        return filedata;
    }
    
    public String getFileName(){
        return filename;
    }
}

@WebServlet("/DownloadAttachmentServlet")
public class DownloadAttachmentServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection con = null;
       try {
           // Get Database Connection.
           // (See more in JDBC Tutorial).
           Class.forName("com.mysql.jdbc.Driver");  
           con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
 
           Long id = null;
           try {
               id = Long.parseLong(request.getParameter("id"));
           } catch (Exception e) {
 
           }
           Attachment attachment = getAttachmentFromDB(con, id);
 
           if (attachment == null) {
               // No record found.
               System.out.println("Attachment null id= " + id);
               response.getWriter().write("No data found");
               return;
           }
 
           // file1.zip, file2.zip
           String fileName = attachment.getFileName();
           System.out.println("File Name: " + fileName);
 
           // abc.txt => text/plain
           // abc.zip => application/zip
           // abc.pdf => application/pdf
           String contentType = this.getServletContext().getMimeType(fileName);
           System.out.println("Content Type: " + contentType);
 
           response.setHeader("Content-Type", contentType);
 
           response.setHeader("Content-Length", String.valueOf(attachment.getFileData().length()));
 
           response.setHeader("Content-Disposition", "inline; filename=\"" + attachment.getFileName() + "\"");
 
           // For big BLOB data.
           Blob fileData = attachment.getFileData();
           InputStream is = fileData.getBinaryStream();
 
           byte[] bytes = new byte[1024];
           int bytesRead;
 
           while ((bytesRead = is.read(bytes)) != -1) {
               // Write image data to Response.
               response.getOutputStream().write(bytes, 0, bytesRead);
           }
           is.close();
 
       } catch (Exception e) {
           throw new ServletException(e);
       } finally {
           this.closeQuietly(con);
       }
   }
 
   private Attachment getAttachmentFromDB(Connection conn, Long id) throws SQLException {
       String sql = "Select a.id,a.filename,a.filedata,a.info "//
               + " from notifications a where a.id = "+id;
       PreparedStatement pstm = conn.prepareStatement(sql);
       //pstm.setLong(1, id);
       ResultSet rs = pstm.executeQuery();
       System.out.println(sql);
       if (rs.next()) {
           String fileName = rs.getString("filename");
           Blob fileData = rs.getBlob("filedata");
           String description = rs.getString("info");
           System.out.println(fileName);
           return new Attachment(id, fileName, fileData, description);
       }
       return null;
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