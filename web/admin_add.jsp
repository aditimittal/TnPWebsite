<%-- 
    Document   : screen_admin_rights2_new.jsp
    Created on : 27 Jun, 2017, 7:24:54 PM
    Author     : ashima
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@include file="InsertLogs.jsp" %>
<%@page import="com.exp.HashPassword" %>
<%@page errorPage="ErrorPage.jsp"%>

    <%! String name,desig,dept,pass,conf,rights,email;
        String Text;
    %>
        <%
            try{
                
            name = request.getParameter("name");
            email = request.getParameter("email");
            desig = request.getParameter("designation");
            dept = request.getParameter("department");
            pass = request.getParameter("password");
            conf = request.getParameter("confirmed_password");
            rights = request.getParameter("rights");
            
            
//            out.println(name+" "+desig+" "+dept+" "+pass+" "+rights);
            if(!pass.equals(conf)){
                Text = "Passwords doesn't match";
            }
            else{
                String username = (String)session.getAttribute("name");
                
                out.println("<br><br>"+username);
                String sql = "select * from admins where name='"+name+"' and email='"+email+"' and designation='"+desig+"' and department='"+dept+"'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                int count=0;
                while(rs.next()){
                    count++; 
                }
                if(count!=0){
                    Text = "This user is already an admin!!";
                }
                else{
                    String hash_password = HashPassword.generateHash(pass);
//                    
                    if(rights.equals("full")){
                        String query = "insert into admins(name,email,designation,department,rights,password) values('"+name+"','"+email+"','"+desig+"','"+dept+"','"+rights+"','"+hash_password+"')";
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        String msg = "Rights added for "+email+" ("+desig+") "+"of "+dept+" dept";
                        insertLog(username, "Rights added for New Coordinator", msg );
                        response.sendRedirect("screen_admin_rights.jsp");;
                    }
                    else if(rights.equals("partial")){
                        String query = "insert into admins(name,email,designation,department,rights,password) values('"+name+"','"+email+"','"+desig+"','"+dept+"','"+rights+"','"+hash_password+"')";
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        String pages[] = request.getParameterValues("pages");
                        for(int i=0;i<pages.length;i++){
                            query = "insert into admin_rights values((select admin_id from admins where email='"+email+"'),'"+pages[i]+"')";
                            ps = con.prepareStatement(query);
                            ps.executeUpdate();
                        }
                        String msg = "Rights added for "+email+" ("+desig+") "+"of "+dept+" dept";
                        
                        insertLog(username, "Rights added for New Coordinator", msg );
                        response.sendRedirect("screen_admin_rights.jsp");
                    }
                }
            }

            }catch(Exception e){ 
                out.println("<br><br>error...<br>"+e);
            }
        %>
    