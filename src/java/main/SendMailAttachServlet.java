package main;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dell
 */
 

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;
 
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server. The e-mail message may contain attachments which
 * are the files uploaded from client.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/SendMailAttachServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
                maxFileSize = 1024 * 1024 * 10,         // 10MB
                maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class SendMailAttachServlet extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
    private String recipient;
    private String content;
    private String subject;
    int  enrollment_no= 4956;
 String email = "ashima.wadhwa.1996@gmail.com" ;  
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    /**
     * handles form submission
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        List<File> uploadedFiles = saveUploadedFiles(request);
        HttpSession session3  =request.getSession(true); 
        recipient = request.getParameter("recipient");
        session3.setAttribute("sendto",recipient);
        subject = request.getParameter("subject");
        session3.setAttribute("LogSub",subject);
        content = request.getParameter("content");
        session3.setAttribute("LogContent",content);
        String resultMessage = "";
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date mydate= new java.util.Date();
        String dates=formatter.format(mydate);
    
    
     SimpleDateFormat formatt= new SimpleDateFormat("h:mm a");
    java.util.Date mytime= new java.util.Date();
    String time=formatt.format(mytime);

 try{
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp","root",""); 
Statement st= con.createStatement(); 
 
 
 String sql="insert into admin_sentbox(content , subject , recipient , postdate , time) values('"+content+"','"+subject+"','"+recipient+"' , '"+dates+"' , '"+time+"')";
int i=st.executeUpdate(sql);
System.out.println("added successfully");
con.close();
} catch(Exception e)
 {
 System.out.println("errorr");    
 }
        try {
            EmailUtility.sendEmailWithAttachment(host, port, user, pass,
                    recipient, subject, content, uploadedFiles);
             
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            deleteUploadFiles(uploadedFiles);
            request.setAttribute("message", resultMessage);
            getServletContext().getRequestDispatcher("/result.jsp").forward(
                    request, response);
        }
    }
 
    /**
     * Saves files uploaded from the client and return a list of these files
     * which will be attached to the e-mail message.
     */
    private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {
        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }
                 
                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
                 
                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }
 
    /**
     * Retrieves file name of a upload part from its HTTP header
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
     
    /**
     * Deletes all uploaded files, should be called after the e-mail was sent.
     */
    private void deleteUploadFiles(List<File> listFiles) {
        if (listFiles != null && listFiles.size() > 0) {
            for (File aFile : listFiles) {
                aFile.delete();
            }
        }
    }
    
    
}