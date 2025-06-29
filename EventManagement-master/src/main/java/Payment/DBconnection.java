package Payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

    public static Connection getConn() {
        String loadDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/event_management"; // Make sure this matches your database name
        String dbUSERNAME = "root"; // Replace with your MySQL username
        String dbPASSWORD = "1234"; // Replace with your MySQL password

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


