package Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDAO {

    public boolean addPayment(Order order) {
        Connection conn = DBconnection.getConn();
        String query = "INSERT INTO orders (fullName, email, address, cardName, cardNumber, cvv) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, order.getFullName());
            pstmt.setString(2, order.getEmail());
            pstmt.setString(3, order.getAddress());
            pstmt.setString(4, order.getCardName());
            pstmt.setString(5, order.getCardNumber());
            pstmt.setString(6, order.getCvv());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}