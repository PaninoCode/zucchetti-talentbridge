package hrport.project.main.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/user/profile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		String dataUser = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		
		try {
			
			Utente utente = UtenteService.getUserByIdUtenteWithProfile(idUtente);
			dataUser = gson.toJson(utente);
			
		} catch (Exception e) {

			String error = e.getMessage();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("data", error);
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			return;
		}
		
		request.setAttribute("dataUser", dataUser);
		request.getRequestDispatcher("/WEB-INF/view-user/profile.jsp").forward(request, response);
	}
}
