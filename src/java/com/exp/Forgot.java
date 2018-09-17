package com.exp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Forgot
 */
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Forgot() {
		super();
		// TODO Auto-generated constructor stub
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
		String cpass = request.getParameter("cpass");

		try {
			StudentDao dao = new StudentDao();
			Connection con = dao.getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("update login set pass=? where eno=?");
			ps.setString(1, pass);
			ps.setString(2, eno);
			ps.executeUpdate();
			con.close();
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
			out.print("enrollment number does not exsist");
		}
	}

}
