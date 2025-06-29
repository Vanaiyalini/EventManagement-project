package AdminUserPage;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userLoginName = request.getParameter("userLoginName");
        String userLoginPassword = request.getParameter("userLoginPassword");

        try (Connection conn = DBConnection.getConn()) {
            String query = "UPDATE user SET userName=?, userEmail=?, userPhone=?, userLoginName=?, userLoginPassword=? WHERE userID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, userEmail);
            ps.setString(3, userPhone);
            ps.setString(4, userLoginName);
            ps.setString(5, userLoginPassword);
            ps.setInt(6, userID);

            ps.executeUpdate();
            response.sendRedirect("listUser.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
