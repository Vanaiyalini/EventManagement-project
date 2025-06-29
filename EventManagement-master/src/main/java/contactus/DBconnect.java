package contactus;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	
	private static String url = "jdbc:mysql://localhost:3306/event_management";
	private static String username = "root";
	private static String password = "1234";
	private static Connection con;

	public static Connection getConnection() {
		try {
			// Load the MySQL JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			// Establish the connection
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println("Database connection failed: " + e.getMessage());
			e.printStackTrace();
		}
		return con;
	}
}
