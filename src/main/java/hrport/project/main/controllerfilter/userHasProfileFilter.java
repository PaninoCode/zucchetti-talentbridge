package hrport.project.main.controllerfilter;

import java.io.IOException;

import hrport.project.main.service.ProfiloUtenteService;
import hrport.project.main.service.UtenteService;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet Filter implementation class userHasProfileFilter
 */
@WebFilter(urlPatterns = {"/user/*"})
public class userHasProfileFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

		if (req instanceof HttpServletRequest) {
			
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) res;
			
			if(request.getRequestURI().contains("user") && !request.getRequestURI().contains("profile")) {
				
				boolean hasProfileInfo = false;
				
				try {
					Integer idUtente = (Integer) request.getSession(false).getAttribute("idUtente");
					hasProfileInfo = ProfiloUtenteService.hasProfileInfo(idUtente);				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				if (!hasProfileInfo) {
					response.sendRedirect(request.getContextPath() + "/user/profile");
					return;	
				}
				
			}
			
			chain.doFilter(request, response);
		}
	}

}
