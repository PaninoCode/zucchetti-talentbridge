package hrport.project.main.controllerfilter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResourceFilter
 */
@WebFilter("/resources/*")
public class ResourceFilter implements Filter {
	
	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Check the request URL
        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            String requestURI = httpRequest.getRequestURI();

            if (requestURI.startsWith("/hrport/resources")) {
                // Deny access to the resources directory
            	httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
            } else {
                // Allow access to other resources
                chain.doFilter(request, response);
            }
        }
    }
}
