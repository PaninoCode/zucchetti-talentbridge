package hrport.project.main.controller.user;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hrport.project.main.pojo.Quiz;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class RegistrationRoute
 */

/*
 FORMATO DEL FILE JSON:
 {
  "quiz_id": 1,
  "user_id": 1,
  "answers": [
    {
      "question_id": 1,
      "selected_option_id": null
    },
    {
      "question_id": 2,
      "selected_option_id": null
    },
    {
      "question_id": 3,
      "selected_option_id": null
    },
    {
      "question_id": 4,
      "selected_option_id": null
    }
  ]
}

user_id non serve per la sessione
question_id:			si riferisce non all'id della domanda rispettiva del database, ma un indice. serve per determinare l'ordine delle domande
selected_option_id:		si riferisce al n della risposta rispetto alla domanda (indice). Quiz.insertRisposteDate dall'indice poi ne ricava l'id della risposta e fa la insert correttamente


 */
@WebServlet("/user/sendAnswers")
public class SendAnswers {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false); 
		Integer idUtente = (Integer) session.getAttribute("idUtente");
		
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
		
        // parse the json String and take the attributes
		try {
			
			JsonObject json = (JsonObject) JsonParser.parseString(jsonContent.toString());
			int quizId = json.get("quiz_id").getAsInt();

		    JsonArray answersArray = json.getAsJsonArray("answers");
		    List<JsonObject> answersList = new ArrayList<>();
		    answersArray.forEach(answer -> answersList.add(answer.getAsJsonObject()));

		    Collections.sort(answersList, Comparator.comparingInt(o -> o.get("question_id").getAsInt()));

		    Integer[] selectedOptionIds = new Integer[answersList.size()];
		    for (int i = 0; i < answersList.size(); i++) {
		    	
		        try {
					selectedOptionIds[i] = answersList.get(i).get("selected_option_id").getAsInt();
				} catch (Exception e) {
					selectedOptionIds[i]=null;
				}
		    }
			
			Quiz.insertRisposteDate(idUtente, quizId, selectedOptionIds);
			
			String error = "{\"data\" : \"success\"}";
        	
        	PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(error);
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
