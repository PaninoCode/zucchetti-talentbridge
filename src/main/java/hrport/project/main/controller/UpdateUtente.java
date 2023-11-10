package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.google.gson.Gson;

import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class UpdateUtente
 */
@WebServlet("/app/update-info-user")
public class UpdateUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		String oldPassword = (String) request.getAttribute("oldPassword");
		String newPassword = (String) request.getAttribute("newPassword");
		Gson gson = new Gson();
		
		try {
			
			Utente utente = UtenteService.getUserByIdUtente(idUtente);
			utente.updatePassword(oldPassword, newPassword);
		} catch (Exception e) {
			
			String error = gson.toJson(e);
			request.setAttribute("data", error);
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			return;
		}
		
		request.setAttribute("data", "success");
		request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
	}
}
