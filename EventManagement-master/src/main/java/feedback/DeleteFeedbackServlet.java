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

@WebServlet("/DeleteFeedback")

public class DeleteFeedbackServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = FeedbackDBConnect.getConnection(); 

       
            String query = "DELETE FROM feedback WHERE ID = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            
           
            response.sendRedirect("Adminfeedback,jsp.jsp");
        } catch (Exception e) {
            e.printStackTrace();
          
            request.setAttribute("errorMessage", "Error deleting feedback: " + e.getMessage());
            request.getRequestDispatcher("Adminfeedback,jsp.jsp").forward(request, response);
        } finally {
          
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        doPost(request, response);
    }
}
