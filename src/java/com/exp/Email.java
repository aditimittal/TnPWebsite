package com.exp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Email extends HttpServlet {

    public Email() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		Dao d=new Dao();
		if(d.getUserByEmail(email)){
			String subject="Reset Password";
			String message="blahh";
			String user="meghabagri12@gmail.com";
			String pass="Naman@1234";
			SendMail.send(email,subject, message, user, pass);
	        out.println("Mail send successfully");
		}
		else{
			out.print("This email id does not exsist in our records. Please enter the registered email id");

		}
	}

}
