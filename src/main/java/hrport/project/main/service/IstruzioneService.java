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
		
		ResultSet resultSetIstr = null;
		Set<Istruzione> education = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT istr.* FROM Profilo pr INNER JOIN Istruzione istr ON pr.idCv = istr.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setString(1, idUtente);
			
			resultSetIstr = userEducation.executeQuery();
			
			while(resultSetIstr.next()) {
				
				education.add(new Istruzione(Integer.valueOf(resultSetIstr.getString("idIst")), Integer.valueOf(resultSetIstr.getString("idCv")), resultSetIstr.getString("titoloIstruzione"), resultSetIstr.getString("istituto"), resultSetIstr.getString("indirizzo"), Integer.valueOf(resultSetIstr.getString("voto")), LocalDate.parse(resultSetIstr.getString("dInizio")), LocalDate.parse(resultSetIstr.getString("dFine"))));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			education = new HashSet<>();
		} finally {
			
			resultSetIstr.close();
			con.close();
		}
		
		return education;
	}
}
