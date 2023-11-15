package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.pojo.EspLavorativa;

public class ProfiloUtenteService {

public static ProfiloUtente getProfileUserByIdUtenteWithExperiencesAndEducation(Integer idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.idUtente = ?";
			
			PreparedStatement userProfile = con.prepareStatement(SQLUser);
			userProfile.setString(1, idUtente.toString());
			
			resultSet = userProfile.executeQuery();
			
			resultSet.next();
			
			Set<Istruzione> education = IstruzioneService.getEducationByIdUtente(resultSet.getString("idUtente"));
			Set<EspLavorativa> experiences = EspLavorativaService.getEducationByIdUtente(resultSet.getString("idUtente"));
				
			ProfiloUtente profiloUtente = new ProfiloUtente(Integer.valueOf(resultSet.getString("idUtente")), 										Integer.valueOf(resultSet.getString("idCv")), 
										resultSet.getString("fileUrl"),
										resultSet.getString("foroUrl"),
										Boolean.valueOf((resultSet.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
										LocalDate.parse(resultSet.getString("dNascita")),
										resultSet.getString("indResidenza"),
										resultSet.getString("indDomicilio"),
										resultSet.getString("telefono"),
										resultSet.getString("codiceFiscale"),
										resultSet.getString("statoOrigine"),
										resultSet.getString("comNascita"),
										experiences, 
										education);
			
			resultSet.close();
			con.commit();
			return profiloUtente;
		} catch (Exception e) {
			
			resultSet.close();
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
}
