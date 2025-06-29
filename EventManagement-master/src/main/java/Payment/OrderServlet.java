package Payment;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Order order1;

    public OrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Instantiate the order object
        order1 = new Order();

        // Set order details from the request parameters
        order1.setFullName(request.getParameter("full_name"));
        order1.setEmail(request.getParameter("email"));
        order1.setAddress(request.getParameter("address"));
        order1.setCardName(request.getParameter("card_name"));
        order1.setCardNumber(request.getParameter("card_number"));
        order1.setCvv(request.getParameter("cvv"));

        // Create DAO object and call addPayment
        OrderDAO dao = new OrderDAO();
        boolean result = dao.addPayment(order1);

        // Write the result to the response (for testing)
        PrintWriter out = response.getWriter();
        if(result) {
            out.println("Payment processed successfully.");
        } else {
            out.println("Failed to process payment.");
        }
    }
}
