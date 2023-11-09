package hrport.project.main.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Utente;

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
		String token = (String) session.getAttribute("role");
		String dataUser = null;
		Gson gson = new Gson();
		
		try {
			
			Utente utente = Utente.getUser("utente1@example.com", "password123");
			if(utente != null) {
				
				String isAdmin = utente.isAdmin() ? "true" : "false";
				dataUser = gson.toJson(utente.getPosizioni());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("data", dataUser);
		request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
	}

}
