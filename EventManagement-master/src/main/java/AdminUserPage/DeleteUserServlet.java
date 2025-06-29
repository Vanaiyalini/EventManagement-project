package AdminUserPage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));

        try (Connection conn = DBConnection.getConn()) {
            String query = "DELETE FROM user WHERE userID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.executeUpdate();
            response.sendRedirect("listUser.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
