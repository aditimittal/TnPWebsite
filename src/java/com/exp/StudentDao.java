package com.exp;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class StudentDao {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/tnp", "root", "");
		} catch (Exception e) {
			System.out.println("Connection failed" + e);
		}
		return conn;
	}
}
