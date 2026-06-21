package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection connection;
	
	public static Connection getConnect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); //Name for MYSQL drivers
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/eveda-app","root","root"); //url for db, username, password
		}catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
