package hrport.project.main.service;

import java.sql.Array;
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
			userProfile.setInt(1, idUtente);

			resultSetProfile = userProfile.executeQuery();

			resultSetProfile.next();

			Set<Istruzione> education = IstruzioneService
					.getEducationByIdUtente(resultSetProfile.getString("idUtente"));
			Set<EspLavorativa> experiences = EspLavorativaService
					.getEducationByIdUtente(resultSetProfile.getString("idUtente"));

			Set<CategoriaSkills> category = CategorySkillsService
					.getCategoriesByIdCvWithSkills(resultSetProfile.getInt("idCv"));

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

	public static ProfiloUtente getProfileUserByIdUtente(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetProfile = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT pr.* FROM Profilo pr WHERE pr.idUtente = ?";

			PreparedStatement userProfile = con.prepareStatement(SQLUser);
			userProfile.setInt(1, idUtente);

			resultSetProfile = userProfile.executeQuery();

			resultSetProfile.next();

			ProfiloUtente profiloUtente = new ProfiloUtente(Integer.valueOf(resultSetProfile.getString("idUtente")),
					Integer.valueOf(resultSetProfile.getString("idCv")), resultSetProfile.getString("fileUrl"),
					resultSetProfile.getString("fotoUrl"),
					Boolean.valueOf((resultSetProfile.getString("sesso").equalsIgnoreCase("1")) ? "true" : "false"),
					LocalDate.parse(resultSetProfile.getString("dNascita")), resultSetProfile.getString("indResidenza"),
					resultSetProfile.getString("indDomicilio"), resultSetProfile.getString("telefono"),
					resultSetProfile.getString("codiceFiscale"), resultSetProfile.getString("statoOrigine"),
					resultSetProfile.getString("comNascita"));

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

	public static void updateProfileInfo(Utente utente, String json) throws Exception {

		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		ProfiloUtente profilo = null;

		try {

			con.setAutoCommit(false);

			profilo = gson.fromJson(json, ProfiloUtente.class);

			String SQLFind = "SELECT COUNT(*) FROM Profilo WHERE Profilo.idUtente = ?;";

			PreparedStatement findProfilo = con.prepareStatement(SQLFind);

			findProfilo.setInt(1, utente.getIdUtente());

			ResultSet findProfiloResultSet = findProfilo.executeQuery();

			findProfiloResultSet.next();
			
			//System.out.println(findProfiloResultSet.getInt(1));

			String SQLUpdate = "UPDATE \"Profilo\""
					+ "SET sesso = ?,"
					+ "dNascita = ?,"
					+ "indResidenza = ?,"
					+ "indDomicilio = ?,"
					+ "telefono = ?,"
					+ "codiceFiscale = ?,"
					+ "statoOrigine = ?,"
					+ "comNascita = ?"
					+ "WHERE Profilo.idUtente = ?";

			String SQLInsert = "INSERT INTO \"Profilo\" (sesso, dNascita, indResidenza, indDomicilio, telefono, codiceFiscale, statoOrigine, comNascita, idUtente)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement updateProfilo = null;

			if (findProfiloResultSet.getInt(1) > 0) {
				updateProfilo = con.prepareStatement(SQLUpdate);
			}else{
				updateProfilo = con.prepareStatement(SQLInsert);
			}

			updateProfilo.setInt(1, (profilo.isGender() ? 1 : 0));
			updateProfilo.setDate(2, Date.valueOf(profilo.getdNascita()));
			updateProfilo.setString(3, profilo.getIndResidenza());
			updateProfilo.setString(4, profilo.getInDomicilio());
			updateProfilo.setString(5, profilo.getTelefono());
			updateProfilo.setString(6, profilo.getCodiceFiscale());
			updateProfilo.setString(7, profilo.getStatoOrigine());
			updateProfilo.setString(8, profilo.getComNascita());
			updateProfilo.setInt(9, utente.getIdUtente());

			updateProfilo.executeUpdate();

			con.commit();
		} catch (Exception e) {

			con.rollback();
			throw e;
		} finally {

			con.close();
		}

	}

	public static void insertProfileInfo(String json, Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		ProfiloUtente profilo = null;

		try {

			con.setAutoCommit(false);

			profilo = gson.fromJson(json, ProfiloUtente.class);

			String SQL = "INSERT INTO \"Profile\" (\"idUtente\", \"sesso\", \"dNascita\", \"indResidenza\", \"indDomicilio\", \"codiceFiscale\", \"statoOrigine\", \"comNascita\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement insertProfilo = con.prepareStatement(SQL);

			insertProfilo.setInt(1, (profilo.isGender() ? 1 : 0));
			insertProfilo.setInt(2, (profilo.isGender() ? 1 : 0));
			insertProfilo.setDate(3, Date.valueOf(profilo.getdNascita()));
			insertProfilo.setString(4, profilo.getIndResidenza());
			insertProfilo.setString(5, profilo.getInDomicilio());
			insertProfilo.setString(6, profilo.getTelefono());
			insertProfilo.setString(7, profilo.getCodiceFiscale());
			insertProfilo.setString(8, profilo.getStatoOrigine());
			insertProfilo.setString(9, profilo.getComNascita());

			insertProfilo.executeUpdate();

			con.commit();
		} catch (Exception e) {

			con.rollback();
			throw e;
		} finally {

			con.close();
		}

	}
	
	public static void insertProfilePdf(String fileName, Integer idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		ProfiloUtente profilo = null;

		try {

			con.setAutoCommit(false);

			String SQLUpdate = "UPDATE \"Profilo\""
					+ "SET fileUrl = ?"
					+ "WHERE Profilo.idUtente = ?";

			PreparedStatement updateProfilo = con.prepareStatement(SQLUpdate);

			updateProfilo.setString(1, fileName);
			updateProfilo.setInt(2, idUtente);

			updateProfilo.executeUpdate();

			con.commit();
		} catch (Exception e) {

			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}
}
