package hrport.project.main.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

import com.google.gson.Gson;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/user/home")
public class UserHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		String role = (String) session.getAttribute("admin");
		String dataUser = null;
		Gson gson = new Gson();
		
		try {
			
			Utente utente = UtenteService.getUserByIdUtente(idUtente);
				
			dataUser = gson.toJson(utente);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("data", dataUser);
		request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
	}

}
