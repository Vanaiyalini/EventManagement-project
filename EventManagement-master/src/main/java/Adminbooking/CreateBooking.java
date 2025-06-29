package Adminbooking;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/createBook")
public class CreateBooking extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ename = request.getParameter("ename");
        String edate = request.getParameter("edate");
        String venue = request.getParameter("venue");
        int guests = Integer.parseInt(request.getParameter("guests"));
        String efood = request.getParameter("efood");
        String emeal = request.getParameter("emeal");
        String equp = request.getParameter("equp");

        try {
            Connection con = DBConnection.getConn();
            String query = "INSERT INTO eventbooking (ename, edate, venue, guests, efood, emeal, equp) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, ename);
            stmt.setString(2, edate);
            stmt.setString(3, venue);
            stmt.setInt(4, guests);
            stmt.setString(5, efood);
            stmt.setString(6, emeal);
            stmt.setString(7, equp);

            stmt.executeUpdate();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("listBooking.jsp");
    }
}
