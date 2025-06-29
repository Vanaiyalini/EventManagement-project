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

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("eventID"));
        
        try {
            Connection conn = DBConnection.getConn();
            String query = "DELETE FROM eventform WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, eventID);
            ps.executeUpdate();
            
            response.sendRedirect("listEvents.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
