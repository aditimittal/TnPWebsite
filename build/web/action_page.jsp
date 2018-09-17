<%-- 
    Document   : action_page
    Created on : Jun 23, 2017, 10:13:44 PM
    Author     : dell
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page errorPage="ErrorPage.jsp"%>
<%
 String result;

 int  enrollment_no= 4956;
 String email = "anjaliverma471@gmail.com" ;   
   // final String to = request.getParameter("recipient");
    final String subject = request.getParameter("subject");
    final String messg = request.getParameter("content");
    
    SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date mydate= new java.util.Date();
    String dates=formatter.format(mydate);
    
    
    
    SimpleDateFormat formatt= new SimpleDateFormat("h:mm a");
    java.util.Date mytime= new java.util.Date();
    String time=formatt.format(mytime);

     
//    try{
//Statement statement = con.createStatement();
//
////query = "CREATE TABLE IF NOT EXISTS stu_mail (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, subject VARCHAR(100) , message VARCHAR(1000),  postdate date, time VARCHAR(20) ,  stu_enrollment int , stu_email VARCHAR(50));";
//statement.executeUpdate(query);
//}
//catch (Exception e) {
//                       System.out.println("Tables already created, skipping table creation process");
//                  }
    Statement st= con.createStatement(); 
    int res = st.executeUpdate("INSERT INTO stu_mail(subject,message, postdate,time ,enrollmentno, email) VALUES('"+subject+"' ,'"+messg+"', '"+dates+"' , '"+time+"' , '"+enrollment_no+"' , '"+email+"' )");
    
    
   if(res==1)
   result = "Notification Board updated successfully." ; 
else
   result = "Notification Board not updated successfully..." ;
    con.close();
    
//
//
//
//    
//    
//    
  
    // Get recipient's email-ID, message & subject-line from index.html page
    
    
 
    // Sender's email ID and password needs to be mentioned
//    final String from = "anjaliverma471@gmail.com";
//    final String pass ="anjaliverma2";
// 
//    // Defining the gmail host
//    String host = "smtp.gmail.com";
// 
//    // Creating Properties object
//    Properties props = new Properties();
// 
//    // Defining properties
//    props.put("mail.smtp.host", host);
//    props.put("mail.transport.protocol", "smtp");
//    props.put("mail.smtp.auth", "true");
//    props.put("mail.smtp.starttls.enable", "true");
//    props.put("mail.user", from);
//    props.put("mail.password", pass);
//    props.put("mail.port", "465");
// 
//    // Authorized the Session object.
//    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
//        @Override
//        protected PasswordAuthentication getPasswordAuthentication() {
//            return new PasswordAuthentication(from, pass);
//        }
//    });
// 
//    try {
//        // Create a default MimeMessage object.
//        MimeMessage message = new MimeMessage(mailSession);
//        // Set From: header field of the header.
//        message.setFrom(new InternetAddress(from));
//        // Set To: header field of the header.
//        message.addRecipient(Message.RecipientType.TO,
//                new InternetAddress(to));
//        // Set Subject: header field
//        message.setSubject(subject);
//        // Now set the actual message
//        message.setText(messg);
//        // Send message
//        Transport.send(message);
//        result = "Your mail sent successfully....";
//    } catch (MessagingException mex) {
//        mex.printStackTrace();
//        result = "Error: unable to send mail....";
//    }


%>

<html>
<title>Sending Mail in JSP</title>
<head>
    <link rel="stylesheet" type="text/css"  href="css/style_one.css">
</head>
<body>
     
        <div class="container"
            
            
            
<br>
<br>
            
             
<h1><center><font color="blue">Sending Mail Using JSP</font></h1>
<b><center><font color="red"><% out.println(result);%></b>  

        </body>
        </html>