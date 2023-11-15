package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Istruzione;

public class IstruzioneService {

public static List<Istruzione> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetUserEducation = null;
		List<Istruzione> education = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT is.* FROM Profilo pr INNER JOIN Istruzione is ON pr.idCv = is.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement UserEducation = con.prepareStatement(SQLUserPositions);
			UserEducation.setString(1, idUtente);
			
			resultSetUserEducation = UserEducation.executeQuery();
			
			while(resultSetUserEducation.next()) {
				
				education.add(new Istruzione(Integer.valueOf(resultSetUserEducation.getString("idIst")), Integer.valueOf(resultSetUserEducation.getString("idCv")), resultSetUserEducation.getString("titoloIstruzione"), resultSetUserEducation.getString("istituto"), resultSetUserEducation.getString("indirizzo"), Integer.valueOf(resultSetUserEducation.getString("voto")), LocalDate.parse(resultSetUserEducation.getString("dInizio")), LocalDate.parse(resultSetUserEducation.getString("dFine"))));
			}
			
			resultSetUserEducation.close();
			con.commit();
		} catch (Exception e) {
			
			resultSetUserEducation.close();
			con.rollback();
			education = new ArrayList<>();
		} finally {
			
			con.close();
		}
		
		return education;
	}
}
