/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author dell
 */
package com.exp;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.mysql.jdbc.Statement;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Ajax_profile extends HttpServlet {

     private static final long serialVersionUID = 1L;
        
      
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

               String companyName = request.getParameter("company");
              String year = request.getParameter("year");
                List<String> list = new ArrayList<String>();
                String json = null;
                String db_name = "db_"+year;
  
 
              com.mysql.jdbc.Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"", "root", "");
		} catch (Exception e) {
			System.out.println("Connection failed" + e);
		}
                 
              
               
			try{
                       Statement stmt;
                        
                       stmt = (Statement) conn.createStatement();
                      
         
                        String sql = "select profile from company_details where company_name = '"+companyName+"'  ";
       
         
			ResultSet rs = stmt.executeQuery(sql);
                        String word; 
                       // list.add("uo");
                        
			while (rs.next()) {

				word = rs.getString("profile");
                               
                                list.add(word);
                        }
              }
              catch(Exception e){
                   
                   out.println("error.....<br>"+e);
                   System.out.println(e);
              }
              
                json = new Gson().toJson(list);
               response.setContentType("application/json");
                response.getWriter().write(json); 
        }
}