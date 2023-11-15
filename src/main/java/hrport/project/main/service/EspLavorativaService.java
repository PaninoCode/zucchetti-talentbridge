package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.EspLavorativa;

public class EspLavorativaService {

public static List<EspLavorativa> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetUserExperiences = null;
		List<EspLavorativa> experiences = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT is.* FROM Profilo pr INNER JOIN EspLavorativa esp is ON pr.idCv = esp.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement UserExperiences = con.prepareStatement(SQLUserPositions);
			UserExperiences.setString(1, idUtente);
			
			resultSetUserExperiences = UserExperiences.executeQuery();
			
			while(resultSetUserExperiences.next()) {
				
				experiences.add(new EspLavorativa(Integer.valueOf(resultSetUserExperiences.getString("idEL")), Integer.valueOf(resultSetUserExperiences.getString("idCv")), resultSetUserExperiences.getString("azienda"), LocalDate.parse(resultSetUserExperiences.getString("dInizio")), LocalDate.parse(resultSetUserExperiences.getString("dFine")), resultSetUserExperiences.getString("posizione"), resultSetUserExperiences.getString("funzione"), resultSetUserExperiences.getString("indirizzo")));
			}
			
			resultSetUserExperiences.close();
			con.commit();
		} catch (Exception e) {
			
			resultSetUserExperiences.close();
			con.rollback();
			experiences = new ArrayList<>();
		} finally {
			
			con.close();
		}
		
		return experiences;
	}
}
