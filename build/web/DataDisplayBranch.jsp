<%-- 
    Document   : DataDisplay
    Created on : Jul 11, 2017, 6:41:03 PM
    Author     : shivangi
--%>

<%@include file="connection.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>

<!DOCTYPE html>
<%! 
    String Programme_Name="", year="", dbname="", SQLQuery="", current = "";
    PreparedStatement pst=null;
%>
<%
   current = request.getParameter("current");
   Programme_Name = current.split("-")[1];
   year = request.getParameter("year");  
%> 
        <style>
            .heads{
                margin-top: 1%;
            }
            
            input[type=text]{
                width: 12em;
                padding: 12px 20px;
                
                margin-left: 2%;
                
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
                form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    
    #innerTable{
        width: 90%;
        margin-left: 5%;
        margin-top: -2%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    #innerTable, th, td{
        border: 0;
    }
    #innerTable th, #innerTable td{
        padding: 10px;
        text-align: left;
    }
        </style>

<center><table class="table-striped" id="innerTable">
        <tbody>
        <%
            dbname="db_"+year;
            System.out.println(dbname);
            SQLQuery = "select Branch_Code, Branch_Name from "+dbname+".Branch_Codes where Programme_Name = '"+Programme_Name+"'";
            pst = con.prepareStatement(SQLQuery); 
            
            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                String Branch_Code = rs.getString("Branch_Code"), 
                       Branch_Name = rs.getString("Branch_Name");
        %>
        <tr>
            <td><center><input type="radio" id="infoMetaDataB" value="<%out.print(Branch_Code);%>-<%out.print(Branch_Name);%>-<%out.print(current);%>"></center></td>
            <td><center><%out.print(Branch_Code);%></center></td>
            <td><center><%out.print(Branch_Name);%></center></td>
        </tr>
        <%
            }
            rs.close();
            pst.close();
        %>
        </tbody>
    </table></center>