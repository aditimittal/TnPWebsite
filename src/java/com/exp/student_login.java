package com.exp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Statement;

import java.sql.DriverManager;

@WebServlet("/student_login")
public class student_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public student_login() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
                
		String eno = request.getParameter("eno");
		String pass = request.getParameter("pass");

 
 String year_inroll=  eno.substring(eno.length() - 4); 
 
 String db_name = "db_"+year_inroll;
 
 
                   
			
                        
		try {
			StudentDao dao=new StudentDao();
			Connection conn=dao.getConnection();
                        
			Statement stmt = (Statement) conn.createStatement();
                        String sql = "select pass from login where eno='" + eno + "'";
			ResultSet rs = stmt.executeQuery(sql);
                        
                        
                        Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = (com.mysql.jdbc.Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name+"", "root", "");
                     
			
                        
                        String word = null;
			while (rs.next()) 
                        {
                            word = rs.getString("pass");
                           
			}
                        
                        
                        Statement st = con.createStatement();
                        String sq = "select * from personal_details where Enrollment_Number='" + eno + "'  ";
                        
                        ResultSet rs1 = st.executeQuery(sq);                        
                        String First_Name = null, Last_Name = null, Programme_Code = null, Branch_Code = null;                         
			while (rs1.next()) 
                        {
                            First_Name = rs1.getString("First_Name");
                            Last_Name = rs1.getString("Last_Name");
                            Programme_Code = rs1.getString("Programme_Code");
                            Branch_Code = rs1.getString("Branch_Code");				
			}
                        
                        String hashPass = HashPassword.generateHash(pass);
                        
                      
                        
                        if (hashPass.equals(word)) {
                                        out.println(hashPass);
                                        out.println(word);
					HttpSession session=request.getSession();  
				        session.setAttribute("eno",eno); 
                                        
				        session.setAttribute("First_Name",First_Name); 
				        session.setAttribute("Last_Name",Last_Name); 
				        session.setAttribute("Programme_Code",Programme_Code); 
				        session.setAttribute("Branch_Code",Branch_Code); 
                                        
                                        session.setAttribute("valid", "yes");
					RequestDispatcher rDispatcher = request.getRequestDispatcher("dash.jsp");
					rDispatcher.forward(request, response); 
					 
			}
			else {
                                        String txt = "username or password incorrect";
					RequestDispatcher rDispatcher = request.getRequestDispatcher("student_login.jsp?txt="+txt);
					rDispatcher.forward(request, response);
					out.println("<script>");
					out.println("alert('You have entered a wrong initials')");
					out.println("n</script>");
			}
                        
			rs.close();
			conn.close();
		} catch (Exception e) {
                        out.println("error1....<br>"+e);
			out.print("oops! some error occured");
			System.out.println(e);
		}

	}

}