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

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.PosizioneService;
import hrport.project.main.service.UtenteService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
		String dataUser = null;
		String dataPositions = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		
		try {
			
			List<Posizione> positions = PosizioneService.getAllPositions();
			Utente utente = UtenteService.getUserByIdUtenteWithPositions(idUtente);
				
			dataUser = gson.toJson(utente);
			dataPositions = gson.toJson(positions);
		} catch (Exception e) {

			String error = e.getMessage();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("data", error);
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			return;
		}
		
		request.setAttribute("dataUser", dataUser);
		request.setAttribute("dataAllPositions", dataPositions);
		//request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/view-user/home.jsp").forward(request, response);
	}
}
