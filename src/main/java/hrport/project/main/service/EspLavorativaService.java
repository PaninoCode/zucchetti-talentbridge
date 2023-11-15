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
		
		ResultSet resultSet = null;
		Set<EspLavorativa> experiences = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT is.* FROM Profilo pr INNER JOIN EspLavorativa esp is ON pr.idCv = esp.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userExperiences = con.prepareStatement(SQLUserPositions);
			userExperiences.setString(1, idUtente);
			
			resultSet = userExperiences.executeQuery();
			
			while(resultSet.next()) {
				
				experiences.add(new EspLavorativa(Integer.valueOf(resultSet.getString("idEL")), Integer.valueOf(resultSet.getString("idCv")), resultSet.getString("azienda"), LocalDate.parse(resultSet.getString("dInizio")), LocalDate.parse(resultSet.getString("dFine")), resultSet.getString("posizione"), resultSet.getString("funzione"), resultSet.getString("indirizzo")));
			}
			
			resultSet.close();
			con.commit();
		} catch (Exception e) {
			
			resultSet.close();
			con.rollback();
			experiences = new HashSet<>();
		} finally {
			
			con.close();
		}
		
		return experiences;
	}
}
