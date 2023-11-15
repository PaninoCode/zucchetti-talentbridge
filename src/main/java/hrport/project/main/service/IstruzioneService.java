package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Istruzione;

public class IstruzioneService {

public static Set<Istruzione> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		Set<Istruzione> education = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT is.* FROM Profilo pr INNER JOIN Istruzione is ON pr.idCv = is.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setString(1, idUtente);
			
			resultSet = userEducation.executeQuery();
			
			while(resultSet.next()) {
				
				education.add(new Istruzione(Integer.valueOf(resultSet.getString("idIst")), Integer.valueOf(resultSet.getString("idCv")), resultSet.getString("titoloIstruzione"), resultSet.getString("istituto"), resultSet.getString("indirizzo"), Integer.valueOf(resultSet.getString("voto")), LocalDate.parse(resultSet.getString("dInizio")), LocalDate.parse(resultSet.getString("dFine"))));
			}
			
			resultSet.close();
			con.commit();
		} catch (Exception e) {
			
			resultSet.close();
			con.rollback();
			education = new HashSet<>();
		} finally {
			
			con.close();
		}
		
		return education;
	}
}
