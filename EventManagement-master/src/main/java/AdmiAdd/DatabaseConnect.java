package AdmiAdd;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnect {
    private static String url = "jdbc:mysql://localhost:3306/event_management";
    private static String username = "root";
    private static String password = "1234";

    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); //loading the JDBC driver
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
