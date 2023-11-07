package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import hrport.project.main.pojo.Utente;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginUser")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			
			Utente utente = Utente.getUser(email, password);
			if(utente != null) {
				
				HttpSession session = request.getSession();
				session.setAttribute("user", email);
				request.setAttribute("data", session.getAttribute("user"));
				request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			}
		} catch (Exception e) {
			
			request.setAttribute("data", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
		}
	}
}
