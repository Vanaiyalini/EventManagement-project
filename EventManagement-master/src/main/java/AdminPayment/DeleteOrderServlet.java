package AdminPayment;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "DELETE FROM orders WHERE orderId=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, orderId);
            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listPayment.jsp");
    }
}
