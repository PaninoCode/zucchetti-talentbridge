package hrport.project.main.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.adaptergson.QuizListAdapter;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/get-quiz-from-posizione-utente")
public class GetQuizFromPositioneUtente extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		Gson gson = new GsonBuilder().registerTypeAdapter(Quiz.class, new QuizListAdapter()).create();
		
		//algoritmo per prendere JSON 
		StringBuilder jsonContent = new StringBuilder();
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }
        }catch(Exception e) {
        	
        	String error = "{\"data\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(error);
            out.flush();
        }
        //fine algoritmo		
		
		try {
			
			JsonObject json = (JsonObject) JsonParser.parseString(jsonContent.toString());
			int idPosizione = json.get("idPosizione").getAsInt();
			
			List<Quiz> quiz= Quiz.getQuizFromPosizioneUtente(idPosizione, idUtente);

			String success = gson.toJson(quiz);
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(success);
            out.flush();
		} catch (Exception e) {
			
        	
        	String error = "{\"data\" : " + "\"" + e.getMessage() + "\"" + "}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(error);
            out.flush();
		}
	}
}
