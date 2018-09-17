package com.exp;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Dao {
StudentDao con;
Connection conn=con.getConnection();

public boolean getUserByEmail(String email) {
	try {
		Statement stmt = (Statement) conn.createStatement();
		ResultSet rs = stmt.executeQuery("select EmailID from student where EmailID='" + email+ "'");
		if(rs!=null){
			System.out.println("stupid");
			return true;
		}
	} catch (SQLException e) {
		System.out.println("Error retrieving email id in forgot password ");
		e.printStackTrace();
	}
	return false;
			
}

}
