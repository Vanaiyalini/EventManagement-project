package adminPackage;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDelete")
public class deleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("aID");

        boolean isDeleted = DatabaseUtilization.deleteAdmin(id);

        if (isDeleted) {
            RequestDispatcher dis = request.getRequestDispatcher("addAdmin.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
