package contactus;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/contactus")
public class contactusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the form parameters
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		// Log the received parameters for debugging
		System.out.println("Received: Name=" + name + ", Email=" + email + ", Message=" + message);

		// Process the form data
		boolean isInserted = contacusUtil.insertcontactus(name, email, message);

		// Forward to the success or failure page based on the result
		if (isInserted) {
			RequestDispatcher rd = request.getRequestDispatcher("successPage.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("unsuccessPage.jsp");
			rd.forward(request, response);
		}
	}
}
