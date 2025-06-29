package AdmiAdd;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/deleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int adminID = Integer.parseInt(request.getParameter("adminID"));

        try {
            Connection con = DatabaseConnect.getConnection();
            
            String query = "DELETE FROM admin WHERE adminID=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, adminID);
            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listAdmin.jsp");
    }
}
