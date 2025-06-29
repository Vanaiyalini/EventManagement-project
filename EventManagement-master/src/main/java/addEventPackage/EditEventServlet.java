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

@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("eventID"));
        String eventType = request.getParameter("eventType");
        String venue = request.getParameter("venue");
        String hallCapacity = request.getParameter("hallCapacity");
        String cateringType = request.getParameter("cateringType");
        String mealType = request.getParameter("mealType");
        String eventFacilities = request.getParameter("eventFacilities");

        try {
            Connection conn = DBConnection.getConn();
            String query = "UPDATE eventform SET eventType = ?, venue = ?, hallCapacity = ?, cateringType = ?, mealType = ?, eventFacilities = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, eventType);
            ps.setString(2, venue);
            ps.setString(3, hallCapacity); 
            ps.setString(4, cateringType);
            ps.setString(5, mealType);
            ps.setString(6, eventFacilities);
            ps.setInt(7, eventID);

            ps.executeUpdate();

            response.sendRedirect("listEvents.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
