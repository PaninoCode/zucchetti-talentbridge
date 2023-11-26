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
		
		
//		Set<EspLavorativa> esp = new HashSet<>();
//		Set<Istruzione> ist = new HashSet<>();
//		
//		//ProfiloUtente profiloUtente = new ProfiloUtente(2, "test", "test", null, "test", "test", true, LocalDate.of(2023, 11, 19), "test", "test", "123", "test", "test", "test", esp, ist);
//		
//		// TODO Auto-generated method stub
//		/*System.out.println("HelloWorld");
//		 * 
//		 *
//		 
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


