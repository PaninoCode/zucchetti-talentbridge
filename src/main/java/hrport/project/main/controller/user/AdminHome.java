package hrport.project.main.controller.user;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.service.CandidaturaService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserHome
 */
@WebServlet("/admin/home")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String candidatiJson = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		

		try {

			List<Candidatura> candidati = CandidaturaService.getAllCandiList();
			
			
			
			candidati.forEach((c)-> System.out.println(c.getNome()));
			
			candidatiJson = gson.toJson(candidati);

		} catch (Exception e) {

			System.out.println("erro");
			String error = gson.toJson(e);
			System.out.println(e);
			request.setAttribute("data", error);
			request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
			return;
		}

		request.setAttribute("candidati", candidatiJson);

		request.getRequestDispatcher("/temp-admin/candidati.jsp").forward(request, response);

	}
}
