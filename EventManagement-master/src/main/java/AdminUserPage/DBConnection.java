package AdminUserPage;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConn() {
        String loadDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/event_management";
        String dbUSERNAME = "root";
        String dbPASSWORD = "1234";
        
        Connection con = null;
        try {
            Class.forName(loadDriver);
            con = DriverManager.getConnection(dbURL, dbUSERNAME, dbPASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
