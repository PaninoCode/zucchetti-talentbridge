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
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.CandidaturaService;
import hrport.project.main.service.PosizioneService;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class UserPosizione
 */
@WebServlet("/user/posizione/*")
public class UserPosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPosizione() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession(false);
		String dataPosizione = null;
		String dataQuiz = null;
		String dataUser = null;
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();

		String pathInfo = request.getPathInfo();
		if (pathInfo != null) {
			String[] pathParts = pathInfo.split("/");
			if (pathParts.length > 1) {
				String posizioneId = pathParts[1];
				
				System.out.println(posizioneId);

				try {
					Posizione posizione = PosizioneService.getPosizioneById(Integer.parseInt(posizioneId));
					List<Quiz> quiz= Quiz.getQuizFromPosizioneUtente(Integer.parseInt(posizioneId), idUtente);
					Utente utente = UtenteService.getUserByIdUtenteWithProfile(idUtente);
					
					dataPosizione = gson.toJson(posizione);
					dataQuiz = gson.toJson(quiz);
					dataUser = gson.toJson(utente);					
				
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("dataPos", dataPosizione);
				request.setAttribute("dataQuiz", dataQuiz);
				request.setAttribute("dataUser", dataUser);
				
				request.getRequestDispatcher("/WEB-INF/view-user/posizione.jsp").forward(request, response);
				return;
			}
		}

		response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User id not specified in the path");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
