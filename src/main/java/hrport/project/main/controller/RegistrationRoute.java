package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class RegistrationRoute
 */
@WebServlet("/register")
public class RegistrationRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session != null && !Boolean.valueOf((String) session.getAttribute("admin"))) {
			
			response.sendRedirect(request.getContextPath() + "/user/home");
			return;
		} else if(session != null && Boolean.valueOf((String) session.getAttribute("admin"))) {
			
			response.sendRedirect(request.getContextPath() + "/admin/home");
			return;
		}
		
	    request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
	}
}
