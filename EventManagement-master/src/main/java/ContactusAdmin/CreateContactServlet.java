package ContactusAdmin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;

@WebServlet("/createContact")
public class CreateContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
        	
            Connection con = DBconnection.getConn();
            String query = "INSERT INTO contactus (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement stmt = (PreparedStatement) con.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);

            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listUser.jsp");
    }
}
