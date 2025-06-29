package adminPackage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uName = request.getParameter("aID");
        String uPassword = request.getParameter("aPass");

        HttpSession session = request.getSession();

        boolean isTrue = DatabaseUtilization.validateAdminLogin(session, uName, uPassword);

        if (isTrue) {
            List<Admin> adminDetails = DatabaseUtilization.getAdminDetails(uName);
            request.setAttribute("adminDetails", adminDetails);

            RequestDispatcher dis = request.getRequestDispatcher("ProfileAdmin.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password.");
            RequestDispatcher dis = request.getRequestDispatcher("loginAdmin.jsp");
            dis.forward(request, response);
        }
    }
}
