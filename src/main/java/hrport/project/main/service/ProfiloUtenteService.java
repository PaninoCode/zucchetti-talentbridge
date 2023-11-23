package hrport.project.main.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.CategoriaSkills;
import hrport.project.main.pojo.EspLavorativa;
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.pojo.Utente;

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
			
			Set<CategoriaSkills> category = CategorySkillsService.getCategoriesByIdCvWithSkills(resultSetProfile.getInt("idCv"));

			ProfiloUtente profiloUtente = new ProfiloUtente(Integer.valueOf(resultSetProfile.getString("idUtente")),
					Integer.valueOf(resultSetProfile.getString("idCv")), resultSetProfile.getString("fileUrl"),
					resultSetProfile.getString("fotoUrl"),
					Boolean.valueOf((resultSetProfile.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
					LocalDate.parse(resultSetProfile.getString("dNascita")), resultSetProfile.getString("indResidenza"),
					resultSetProfile.getString("indDomicilio"), resultSetProfile.getString("telefono"),
					resultSetProfile.getString("codiceFiscale"), resultSetProfile.getString("statoOrigine"),
					resultSetProfile.getString("comNascita"), experiences, education, category);

			con.commit();
			return profiloUtente;
		} catch (Exception e) {

			// throw e;
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
	
	public static void updateProfileInfo(String json) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		ProfiloUtente profilo = null;
			System.out.println("test");
		try {
			
			con.setAutoCommit(false);
			
			profilo = gson.fromJson(json, ProfiloUtente.class);
					
			String SQL = "UPDATE \"Profilo\""
					+ "SET sesso = ?"
					+ "SET dNascita = ?"
					+ "SET indResidenza = ?"
					+ "SET indDomicilio = ?"
					+ "SET telefono = ?"
					+ "SET codiceFiscale = ?"
					+ "SET statoOrigine = ?"
					+ "SET comNascita = ?"
					+ "WHERE Profilo.idUtente = ?";
			
			PreparedStatement updateProfilo = con.prepareStatement(SQL);
			
			updateProfilo.setInt(1, (profilo.isGender() ? 1 : 0));
			updateProfilo.setDate(2, Date.valueOf(profilo.getdNascita()));
			updateProfilo.setString(3, profilo.getIndResidenza());
			updateProfilo.setString(4, profilo.getInDomicilio());
			updateProfilo.setString(5, profilo.getTelefono());
			updateProfilo.setString(6, profilo.getCodiceFiscale());
			updateProfilo.setString(7, profilo.getStatoOrigine());
			updateProfilo.setString(8, profilo.getComNascita());
			updateProfilo.setInt(9, profilo.getIdUtente());
			
			updateProfilo.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void insertProfileInfo(String json) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		ProfiloUtente profilo = null;
			System.out.println("test");
		try {
			
			con.setAutoCommit(false);
			
			profilo = gson.fromJson(json, ProfiloUtente.class);
					
			String SQL = "INSERT INTO \"Profile\" (\"sesso\", \"dNascita\", \"indResidenza\", \"indDomicilio\", \"codiceFiscale\", \"statoOrigine\", \"comNascita\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			
			PreparedStatement insertProfilo = con.prepareStatement(SQL);
			
			insertProfilo.setInt(1, (profilo.isGender() ? 1 : 0));
			insertProfilo.setDate(2, Date.valueOf(profilo.getdNascita()));
			insertProfilo.setString(3, profilo.getIndResidenza());
			insertProfilo.setString(4, profilo.getInDomicilio());
			insertProfilo.setString(5, profilo.getTelefono());
			insertProfilo.setString(6, profilo.getCodiceFiscale());
			insertProfilo.setString(7, profilo.getStatoOrigine());
			insertProfilo.setString(8, profilo.getComNascita());
			
			insertProfilo.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
}
