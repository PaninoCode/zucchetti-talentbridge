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
 * Servlet implementation class LoggedInFilter
 */
@WebFilter(urlPatterns = {"/user/*", "/app/*", "/admin/*"})
public class LoggedInFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

		if (req instanceof HttpServletRequest) {
			
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) res;
			
			if (!request.getRequestURI().contains("login") && (request.getSession(false) == null)) {
				
				response.sendRedirect(request.getContextPath() + "/login?returnTo=" + request.getRequestURL());
				return;
			} else if(request.getRequestURI().contains("app")) {
				//niente
			} else if(request.getRequestURI().contains("admin") && ((String) request.getSession(false).getAttribute("admin")).equalsIgnoreCase("false")) {
				
				response.sendRedirect(request.getContextPath() + "/login?returnTo=" + request.getRequestURL());
				return;
			} else if(request.getRequestURI().contains("user") && ((String) request.getSession(false).getAttribute("admin")).equalsIgnoreCase("true")) {
				
				response.sendRedirect(request.getContextPath() + "/login?returnTo=" + request.getRequestURL());
				return;
			}
			
			chain.doFilter(request, response);
		}
    }
}
