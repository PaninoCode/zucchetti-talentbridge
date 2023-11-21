package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.EspLavorativa;
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.ProfiloUtente;

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

			Set<Istruzione> education = IstruzioneService
					.getEducationByIdUtente(resultSetProfile.getString("idUtente"));
			Set<EspLavorativa> experiences = EspLavorativaService
					.getEducationByIdUtente(resultSetProfile.getString("idUtente"));

			ProfiloUtente profiloUtente = new ProfiloUtente(Integer.valueOf(resultSetProfile.getString("idUtente")),
					Integer.valueOf(resultSetProfile.getString("idCv")), resultSetProfile.getString("fileUrl"),
					resultSetProfile.getString("fotoUrl"),
					Boolean.valueOf((resultSetProfile.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
					LocalDate.parse(resultSetProfile.getString("dNascita")), resultSetProfile.getString("indResidenza"),
					resultSetProfile.getString("indDomicilio"), resultSetProfile.getString("telefono"),
					resultSetProfile.getString("codiceFiscale"), resultSetProfile.getString("statoOrigine"),
					resultSetProfile.getString("comNascita"), experiences, education);

			con.commit();
			return profiloUtente;
		} catch (Exception e) {

			con.rollback();
			ProfiloUtente profiloUtente = null;
			return profiloUtente;
		} finally {

			resultSetProfile.close();
			con.close();
		}
	}

	public static List<ProfiloUtente> getProfiles() throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetProfile = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT p.idUtente , u.nome, u.cognome, p.fileUrl, p.fotoUrl, p.sesso, p.dNascita, p.indResidenza, p.indDomicilio, p.telefono, p.codiceFiscale, p.statoOrigine, p.comNascita FROM Profilo p JOIN Utenti u  ON u.idUtente = p.idUtente";

			PreparedStatement userProfile = con.prepareStatement(SQLUser);

			// userProfile.setString(1, idUtente.toString());

			resultSetProfile = userProfile.executeQuery();

			List<ProfiloUtente> profiles = new ArrayList<>();
			
			
			
			while (resultSetProfile.next()) {

				Set<Istruzione> education = IstruzioneService
						.getEducationByIdUtente(resultSetProfile.getString("idUtente"));
				Set<EspLavorativa> experiences = EspLavorativaService
						.getEducationByIdUtente(resultSetProfile.getString("idUtente"));

							
				
				ProfiloUtente profiloUtente = new ProfiloUtente(
						Integer.valueOf(resultSetProfile.getString("idUtente")),
						resultSetProfile.getString("nome"),
						resultSetProfile.getString("cognome"),
						resultSetProfile.getString("fileUrl"),
						resultSetProfile.getString("fotoUrl"),
						Boolean.valueOf((resultSetProfile.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
						LocalDate.parse(resultSetProfile.getString("dNascita")),
						resultSetProfile.getString("indResidenza"), resultSetProfile.getString("indDomicilio"),
						resultSetProfile.getString("telefono"), resultSetProfile.getString("codiceFiscale"),
						resultSetProfile.getString("statoOrigine"), resultSetProfile.getString("comNascita"),
						experiences, education);

				profiles.add(profiloUtente);
				
				

			}

			
			

			con.commit();
			return profiles;
		} catch (Exception e) {

			con.rollback();
			throw e;
		} finally {

			resultSetProfile.close();
			con.close();
		}
	}
}
