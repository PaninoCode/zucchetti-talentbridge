package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.EspLavorativa;

public class EspLavorativaService {

public static Set<EspLavorativa> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetEsp = null;
		Set<EspLavorativa> experiences = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT esp.* FROM Profilo pr INNER JOIN EspLavorativa esp ON pr.idCv = esp.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userExperiences = con.prepareStatement(SQLUserPositions);
			userExperiences.setString(1, idUtente);
			
			resultSetEsp = userExperiences.executeQuery();
			
			while(resultSetEsp.next()) {
				
				experiences.add(new EspLavorativa(Integer.valueOf(resultSetEsp.getString("idEL")), Integer.valueOf(resultSetEsp.getString("idCv")), resultSetEsp.getString("azienda"), LocalDate.parse(resultSetEsp.getString("dInizio")), LocalDate.parse(resultSetEsp.getString("dFine")), resultSetEsp.getString("posizione"), resultSetEsp.getString("funzione"), resultSetEsp.getString("indirizzo")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			experiences = new HashSet<>();
		} finally {
			
			resultSetEsp.close();
			con.close();
		}
		
		return experiences;
	}
}
