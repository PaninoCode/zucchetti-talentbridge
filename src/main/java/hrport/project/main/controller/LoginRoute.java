package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginRoute extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session != null && !Boolean.valueOf((String) session.getAttribute("admin"))) {
			
			response.sendRedirect(request.getContextPath() + "/user/home");
			return;
		} else if(session != null && Boolean.valueOf((String) session.getAttribute("admin"))) {
			
			/* inserisco la redirect per la /admin/home */
			return;
		}
		
	    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
}
