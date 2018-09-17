<%@ page language="java" contentType="text/html; charset=ISO-8859-1"                                                                        
    pageEncoding="ISO-8859-1"%>                                                                                                             
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                      
<%@page import="java.util.Properties"%>                                                                                                     
<%@page import="javax.mail.Session"%>                                                                                                       
<%@page import="javax.mail.Authenticator"%>                                                                                                 
<%@page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@page import="javax.mail.Message"%>                                                                                                       
<%@page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@page import="javax.mail.Transport"%>    
<%@page errorPage="ErrorPage.jsp"%>
<html>                                                                                                                                      
<head>                                                                                                                                      
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">                                                                    
<title>Email Test</title>                                                                                                                   
</head>                                                                                                                                     
<body>                                                                                                                                      
<%                                                                                                                                          
String smtpServer = null;                                                                                                                   
String smtpPort = null;                                                                                                                     
final String authAddress = request.getParameter("auth_add");                                                                                
final String authPassword = request.getParameter("auth_pass");                                                                              
String subject = null;                                                                                                                      
String email = null;                                                                                                                        
String message = null;                                                                                                                      
String send = request.getParameter("send");                                                                                                 
String siteName=request.getServerName();                                                                                                    
siteName=siteName.replaceAll("www.","");                                                                                                    

if(send!=null){
        smtpServer = request.getParameter("smtp_server");
        smtpPort = request.getParameter("smtp_port");    
        subject = request.getParameter("subject");       
        email = request.getParameter("email");           
        message = request.getParameter("message");       
        try{                                             
                Properties props = new Properties();     
                props.put("mail.smtp.host", smtpServer); 
                props.put("mail.smtp.port", smtpPort);   
            props.put("mail.smtp.auth", "true");         
                                                         
            // create some properties and get the default Session
            Session sessionMail = Session.getInstance(props, new Authenticator() {
                 public PasswordAuthentication getPasswordAuthentication() {      
                         return new PasswordAuthentication(authAddress, authPassword);
                 }                                                                    
                });                                                                   
                                                                                      
            sessionMail.setDebug(true);

            // create a message
            Message msg = new MimeMessage(sessionMail);

            // set the from and to address
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);

            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(email);
            msg.setRecipients(Message.RecipientType.TO, addressTo);


            // Optional : You can also set your custom headers in the Email if you Want
            msg.addHeader("site", siteName);

            // Setting the Subject and Content Type
            msg.setSubject(subject);
            msg.setContent(message, "text/plain");
            Transport.send(msg);
        }catch(Exception e){
                e.printStackTrace(response.getWriter());
        }
}
%>
<form name="emailForm" action="email-test.jsp" method="post">
        SMTP Server: <input type="text" name="smtp_server" value="mail.<%out.print(siteName);%>"><br>
        SMTP Port: <input type="text" name="smtp_port" value="2525"><br>
        Username: <input type="text" name="auth_add" value="anjaliverma471@<%out.print(siteName);%>"><br>
        Password: <input type="password" name="auth_pass"><br>
        Subject: <input type="text" name="subject" value="Test SMTP Server."><br>
        Recipient: <input type="text" name="email" value=""><br>
        Message Body : <input type="text" name="message" value="Test"><br>
        <input type="submit" name="send" value="send">&nbsp;
        <input type="Reset" name="reset" value="reset"><br>

</form>
</body>
</html> 



