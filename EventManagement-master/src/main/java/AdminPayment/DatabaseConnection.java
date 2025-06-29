package AdminPayment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        String dbURL = "jdbc:mysql://localhost:3306/event_management";
        String user = "root";
        String password = "1234";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL, user, password);
        return con;
    }
}
