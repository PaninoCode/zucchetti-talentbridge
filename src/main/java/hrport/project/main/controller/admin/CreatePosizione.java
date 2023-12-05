package hrport.project.main.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import hrport.project.main.pojo.Quiz;
import hrport.project.main.service.QuizService;

/**
 * Servlet implementation class AdminGetAllQuiz
 */
@WebServlet("/admin/create-new-position")
public class CreatePosizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		
		try {
			List<Quiz> quiz = QuizService.getAllQuiz();
			String jsonQuiz = gson.toJson(quiz);
			request.setAttribute("data", jsonQuiz);
			request.getRequestDispatcher("/WEB-INF/view-admin/add_posizione.jsp").forward(request, response);
			
		} catch (Exception e) {
			String error = e.getMessage();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view-admin/add_posizione.jsp").forward(request, response);
		}
		
	}

}
