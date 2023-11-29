package hrport.project.main;

import java.time.LocalDate;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.service.CandidaturaService;
import hrport.project.main.service.PosizioneService;
import hrport.project.main.utilities.UtilitiesFile;

public class App {
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		Gson gson = new GsonBuilder().create();
//		try {
//			System.out.println(gson.toJson(Quiz.quizAnswers(1, 1)));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
//		String jsonString="{\"quiz_id\":1,\"user_id\":1,\"answers\":[{\"question_id\":1,\"selected_option_id\":null},{\"question_id\":2,\"selected_option_id\":2},{\"question_id\":3,\"selected_option_id\":null},{\"question_id\":4,\"selected_option_id\":1}]}";
//		JsonObject json = (JsonObject) JsonParser.parseString(jsonString);
//		int quizId = json.get("quiz_id").getAsInt();
//
//	    JsonArray answersArray = json.getAsJsonArray("answers");
//	    List<JsonObject> answersList = new ArrayList<>();
//	    answersArray.forEach(answer -> answersList.add(answer.getAsJsonObject()));
//
//	    Collections.sort(answersList, Comparator.comparingInt(o -> o.get("question_id").getAsInt()));
//
//	    Integer[] selectedOptionIds = new Integer[answersList.size()];
//	    for (int i = 0; i < answersList.size(); i++) {
//	    	try {
//				selectedOptionIds[i] = answersList.get(i).get("selected_option_id").getAsInt();
//			} catch (Exception e) {
//				selectedOptionIds[i]=null;
//			}
//	    }
//		
		try {
//			Quiz q= Quiz.initQuiz(1);
//			
//			System.out.println("Nome: "+q.getNome()+
//					"\nPunteggio domanda 1: "+q.domandaIndex(0).getPunteggio()+
//					"\nTesto risposta n2: "+q.domandaIndex(0).rispostaIndex(1).getTesto());
//			System.out.println(((Domanda)q.getDomande()[0]).getTesto());
//			
//			String error = "{\"data\" : \"success\"}";
			
			String originalFileName = "example.txt";
	        String uniqueFileName = UtilitiesFile.generateUniqueFileName(originalFileName);
	        System.out.println("Original File Name: " + originalFileName);
	        System.out.println("Unique File Name: " + uniqueFileName);
        	
			List <Candidatura> candidatura = CandidaturaService.getApplicationsFromPosition(1);
        	//Set<CategoriaSkills> category = CategorySkillsService.getCategoriesByIdCvWithSkills(1);
        	//CategorySkillsService.insertCategoryWithSkills("{\"idCv\":2,\"skills\":[{\"nomeSkill\":\"Skill5\"}],\"nomeCategoria\":\"Categoria5\"}", 2);
        	// "{\"idCv\":1,\"skills\":[{\"nomeSkill\":\"Skill1\"}],\"nomeCategoria\":\"Categoria1\"}"
        	// "{\"idUtente\":1,\"email\":\"utente1@example.com\",\"admin\":false,\"nome\":\"Nome1\",\"cognome\":\"Cognome1\",\"posizioni\":[{\"idCand\":1,\"position\":{\"idPos\":1,\"nome\":\"Posizione1\",\"aperta\":true,\"fotoUrl\":\"FotoPosizione1\",\"descrizione\":\"Descrizione1\u003c3\"},\"stato\":0},{\"idCand\":2,\"position\":{\"idPos\":2,\"nome\":\"Posizione2\",\"aperta\":true,\"fotoUrl\":\"FotoPosizione2\",\"descrizione\":\"Descrizione2\u003e:(((((\"},\"stato\":1}]}"
        	// "{\"idUtente\":1,\"email\":\"utente1@example.com\",\"admin\":false,\"nome\":\"Nome1\",\"cognome\":\"Cognome1\"}"
        	Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
        	String json = gson.toJson(candidatura);
        	//System.out.println(json);
        	
        } catch (Exception e) {
            e.printStackTrace();
        };
	}
}


