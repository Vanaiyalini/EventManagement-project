package feedback;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditFeedback")  

public class EditFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String review = request.getParameter("review");  
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
           
            conn = FeedbackDBConnect.getConnection();
            
           
            String query = "UPDATE feedback SET Name=?, Email=?, Review=? WHERE ID=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, review); 
            ps.setInt(4, id);
            ps.executeUpdate();
            
           
            response.sendRedirect("Adminfeedback,jsp.jsp");  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
         
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}
