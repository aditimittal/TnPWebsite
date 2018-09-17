package com.exp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
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
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");

		try {
			StudentDao dao=new StudentDao();
                        Connection conn=dao.getConnection();
                        Statement stmt = (Statement) conn.createStatement();
                        String sql = "select password,admin_id from admins where email='"+user+"'";
			ResultSet rs = stmt.executeQuery(sql);

			out.println(user + " Pass: " + pass);
                        String word = null;
                        int id =0;
			while (rs.next()) {

				word = rs.getString("password");
                                id = rs.getInt("admin_id");
                                System.out.println("<br>password = "+word);
                        }
                        
                        String hashPass = HashPassword.generateHash(pass);
                        System.out.println("<br>password = "+hashPass);
				if (hashPass.equals(word)) { 
					HttpSession session3  =request.getSession(true);  
////                                        out.print(user);
				        session3.setAttribute("name",user); 
                                        String rn="sd";
////				        out.println("admin id"+id);
				        session3.setAttribute("idx",id); 
                                        session3.setAttribute("ran" , rn);
////                                        out.println("ran"+rn);
//
//                                        
                                        out.println("password matched");
                                       response.sendRedirect("List_Notification.jsp");

					 
				}
				else {
                                    out.println("password did not match");
                                    String txt = "Incorrect username or password";
                                    response.sendRedirect("admin_login.jsp?txt="+txt);
					
				}
			
			rs.close();
			conn.close();
		} catch (Exception e) {
                    out.println("error.....<br>"+e);
			out.print("oops! some error occured blaaa");
			System.out.println(e);
		}

	}

}
