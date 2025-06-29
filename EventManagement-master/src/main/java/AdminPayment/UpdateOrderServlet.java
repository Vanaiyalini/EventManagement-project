package AdminPayment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String orderDate = request.getParameter("orderDate");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "UPDATE orders SET fullName=?, email=?, address=?, cardName=?, cardNumber=?, cvv=?, orderDate=? WHERE orderId=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, address);
            stmt.setString(4, cardName);
            stmt.setString(5, cardNumber);
            stmt.setString(6, cvv);
            stmt.setString(7, orderDate);
            stmt.setInt(8, orderId);
            
            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listPayment.jsp");
    }
}
