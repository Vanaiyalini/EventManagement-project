package feedback;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/feedback")
public class feedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
      
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String review = request.getParameter("Comments");

        System.out.println("Received: Name=" + name + ", Email=" + email + ", Review=" + review);

        boolean isInserted = feedbackUtil.insertFeedback(name, email, review);

        if (isInserted) {
            RequestDispatcher rd = request.getRequestDispatcher("feedbackSuccess.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("feedbackFailure.jsp");
            rd.forward(request, response);
        }
    }
}
