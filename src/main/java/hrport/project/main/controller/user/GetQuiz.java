package hrport.project.main.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.adaptergson.DomandaAdapter;
import hrport.project.main.adaptergson.QuizListAdapter;
import hrport.project.main.adaptergson.RispostaAdapter;
import hrport.project.main.pojo.Domanda;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.pojo.Risposta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/get-quiz")
public class GetQuiz extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Gson gson = new GsonBuilder()
				.registerTypeAdapter(Domanda.class, new DomandaAdapter())
				.registerTypeAdapter(Risposta.class, new RispostaAdapter())
				.create();
		
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
			int idQuiz = json.get("idQuiz").getAsInt();
			
			Quiz quiz= Quiz.initQuiz(idQuiz);

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
