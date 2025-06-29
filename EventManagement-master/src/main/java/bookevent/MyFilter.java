package bookevent;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;

public class MyFilter extends HttpFilter implements Filter {
       
    public MyFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		 if (request.getParameter("Action").equals("Add Event"))
		      chain.doFilter(request, response);
		    if (request.getParameter("Action").equals("Edit"))
		      chain.doFilter(request, response);
		    if (request.getParameter("Action").equals("Delete"))
		      chain.doFilter(request, response);
		  }
	

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
