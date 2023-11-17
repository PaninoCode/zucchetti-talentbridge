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
		
		ResultSet resultSetProfile = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT pr.* FROM Profilo pr WHERE pr.idUtente = ?";
			
			PreparedStatement userProfile = con.prepareStatement(SQLUser);
			userProfile.setString(1, idUtente.toString());
			
			resultSetProfile = userProfile.executeQuery();
			
			resultSetProfile.next();
			
			Set<Istruzione> education = IstruzioneService.getEducationByIdUtente(resultSetProfile.getString("idUtente"));
			Set<EspLavorativa> experiences = EspLavorativaService.getEducationByIdUtente(resultSetProfile.getString("idUtente"));
				
			ProfiloUtente profiloUtente = new ProfiloUtente(Integer.valueOf(resultSetProfile.getString("idUtente")), 										Integer.valueOf(resultSetProfile.getString("idCv")), 
										resultSetProfile.getString("fileUrl"),
										resultSetProfile.getString("fotoUrl"),
										Boolean.valueOf((resultSetProfile.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
										LocalDate.parse(resultSetProfile.getString("dNascita")),
										resultSetProfile.getString("indResidenza"),
										resultSetProfile.getString("indDomicilio"),
										resultSetProfile.getString("telefono"),
										resultSetProfile.getString("codiceFiscale"),
										resultSetProfile.getString("statoOrigine"),
										resultSetProfile.getString("comNascita"),
										experiences, 
										education);
			
			con.commit();
			return profiloUtente;
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			resultSetProfile.close();
			con.close();
		}
	}
}
