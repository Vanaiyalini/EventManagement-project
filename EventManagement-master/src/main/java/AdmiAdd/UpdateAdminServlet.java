package AdmiAdd;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet("/updateAdmin")
public class UpdateAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int adminID = Integer.parseInt(request.getParameter("adminID"));
        String adminName = request.getParameter("adminName");
        String adminRole = request.getParameter("adminRole");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnect.getConnection();
            
            String query = "UPDATE admin SET adminName=?, adminRole=?, userName=?, password=? WHERE adminID=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, adminName);
            stmt.setString(2, adminRole);
            stmt.setString(3, userName);
            stmt.setString(4, password);
            stmt.setInt(5, adminID);

            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listAdmin.jsp");
    }
}
