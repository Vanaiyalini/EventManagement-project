package addEventPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CreateEventServlet")
public class CreateEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventType = request.getParameter("eventType");
        String venue = request.getParameter("venue");
        String hallCapacity = request.getParameter("hallCapacity");
        String cateringType = request.getParameter("cateringType");
        String mealType = request.getParameter("mealType");
        String eventFacilities = request.getParameter("eventFacilities");

        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = DBConnection.getConn();
            String query = "INSERT INTO eventform (eventType, venue, hallCapacity, cateringType, mealType, eventFacilities) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, eventType);
            ps.setString(2, venue);
            ps.setString(3, hallCapacity);
            ps.setString(4, cateringType);
            ps.setString(5, mealType);
            ps.setString(6, eventFacilities);
            ps.executeUpdate();
            
            response.sendRedirect("listEvents.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
