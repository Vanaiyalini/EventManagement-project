package adminPackage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminUpdate")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("aID");
        String name = request.getParameter("aName");
        String role = request.getParameter("aRole");
        String userName = request.getParameter("aUserName");
        String password = request.getParameter("aPassword");

        boolean isUpdated = DatabaseUtilization.updateAdminDetails(id, name, role, userName, password);

        if (isUpdated) {
            List<Admin> adminDetails = DatabaseUtilization.getAdminDetails(userName);
            request.setAttribute("adminDetails", adminDetails);
            RequestDispatcher dis = request.getRequestDispatcher("ProfileAdmin.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
