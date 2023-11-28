package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.pojo.Utente;

public class UtenteService {

	public static Utente getUserByEmailAndPassword(String email, String password) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.email = ? AND u.password = ?";

			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setString(1, email);
			User.setString(2, password);

			resultSetUser = User.executeQuery();

			resultSetUser.next();

			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")),
					resultSetUser.getString("email"),
					Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
					resultSetUser.getString("nome"), resultSetUser.getString("cognome"));

			resultSetUser.close();
			con.commit();
			return utente;
		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}

	public static Utente getUserByIdUtente(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.idUtente = ?";

			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setInt(1, idUtente);

			resultSetUser = User.executeQuery();

			resultSetUser.next();

			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")),
					resultSetUser.getString("email"),
					Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
					resultSetUser.getString("nome"), resultSetUser.getString("cognome"));

			resultSetUser.close();
			con.commit();
			return utente;
		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}
	
	public static Utente getUserByIdUtenteWithPassword(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.idUtente = ?";

			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setInt(1, idUtente);

			resultSetUser = User.executeQuery();

			resultSetUser.next();

			Utente utente = new Utente(resultSetUser.getInt("idUtente"),
					resultSetUser.getString("email"),
					resultSetUser.getString("password"),
					Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
					resultSetUser.getString("nome"), resultSetUser.getString("cognome"));

			resultSetUser.close();
			con.commit();
			return utente;
		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}

	public static Utente getUserByIdUtenteWithPositions(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.idUtente = ?";

			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setInt(1, idUtente);

			resultSetUser = User.executeQuery();

			resultSetUser.next();

			List<Candidatura> applications = CandidaturaService
					.getApplicationsByIdUtente(resultSetUser.getInt("idUtente"));

			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")),
					resultSetUser.getString("email"),
					Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
					resultSetUser.getString("nome"), resultSetUser.getString("cognome"), applications);

			resultSetUser.close();
			con.commit();
			return utente;
		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}

	public static Utente getUserByIdUtenteWithProfile(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		try {

			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.idUtente = ?";

			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setInt(1, idUtente);

			resultSetUser = User.executeQuery();

			resultSetUser.next();

			ProfiloUtente userProfile = ProfiloUtenteService.getProfileUserByIdUtenteWithExperiencesAndEducation(
					Integer.valueOf(resultSetUser.getString("idUtente")));

			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")),
					resultSetUser.getString("email"),
					Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
					resultSetUser.getString("nome"), resultSetUser.getString("cognome"), userProfile);

			resultSetUser.close();
			con.commit();
			return utente;
		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
	}

	
	public static List<Utente> getUtentiCandidati() throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetUser = null;
		List<Utente> candidati = new ArrayList<Utente>();
		try {

			con.setAutoCommit(false);
			String SQLUser = "select u.idUtente, u.email, u.admin, u.nome, u.cognome from Utenti u where u.admin != 1";

			PreparedStatement User = con.prepareStatement(SQLUser);

			resultSetUser = User.executeQuery();

			while (resultSetUser.next()) {

				List<Candidatura> posizioni = CandidaturaService
						.getApplicationsByIdUtente(resultSetUser.getInt("idUtente"));
				
				Utente utente = new Utente(resultSetUser.getInt("idUtente"), resultSetUser.getString("email"),
						Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
						resultSetUser.getString("nome"), resultSetUser.getString("cognome"), posizioni);

				candidati.add(utente);

			}

			resultSetUser.close();
			con.commit();

		} catch (Exception e) {

			resultSetUser.close();
			con.rollback();
			throw e;
		} finally {

			con.close();
		}
		return candidati;
	}
	
	public static void updateUtenteInfo(Utente utente, String json) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		Utente newDatiUtente = null;
			//System.out.println("test");
		try {
			
			con.setAutoCommit(false);
			
			newDatiUtente = gson.fromJson(json, Utente.class);
					
			String SQL = "UPDATE \"Utenti\""
					+ "SET email = ?,"
					+ "nome = ?,"
					+ "cognome = ?"
					+ "WHERE Utenti.idUtente = ?";
			
			PreparedStatement updateUser = con.prepareStatement(SQL);
			updateUser.setString(1, newDatiUtente.getEmail());
			updateUser.setString(2, newDatiUtente.getNome());
			updateUser.setString(3, newDatiUtente.getCognome());
			updateUser.setInt(4, utente.getIdUtente());
			
			updateUser.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}

}
