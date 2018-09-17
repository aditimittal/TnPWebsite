<%@page import="java.sql.Statement"%>
<%@page errorPage="ErrorPage.jsp"%>
<%! Statement statement; %>

<%!
    public void insertLog(String user, String content, String msg){
        
        try{
            statement = (Statement) con.createStatement();

            java.text.DateFormat df = new java.text.SimpleDateFormat("YYYY-MM-dd");
            String formattedDate = df.format(new java.util.Date());
   
            df = new java.text.SimpleDateFormat("HH:mm:ss");
            String formattedTime = df.format(new java.util.Date());
 
            int i = statement.executeUpdate("insert into logtable(user,content,msg,update_date,update_time) values('"+user+"','"+content+"','"+msg+"','"+formattedDate+"','"+formattedTime+"')");
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
    }
%>