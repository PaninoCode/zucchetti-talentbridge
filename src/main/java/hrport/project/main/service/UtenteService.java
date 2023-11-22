package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

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
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"));
			
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
			User.setString(1, idUtente.toString());
			
			resultSetUser = User.executeQuery();
			
			resultSetUser.next();
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"));
			
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
			User.setString(1, idUtente.toString());
			
			resultSetUser = User.executeQuery();
			
			resultSetUser.next();
			
			List<Candidatura> applications = CandidaturaService.getApplicationsByIdUtente(resultSetUser.getString("idUtente"));
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"), applications);
			
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
			User.setString(1, idUtente.toString());
			
			resultSetUser = User.executeQuery();
			
			resultSetUser.next();
			
			ProfiloUtente userProfile = ProfiloUtenteService.getProfileUserByIdUtenteWithExperiencesAndEducation(Integer.valueOf(resultSetUser.getString("idUtente")));
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"), userProfile);
			
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
	
/*public static Utente getUserList() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetUser = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT p.idUtente,u.nome, u.cognome, p.idCv, p.fileUrl, p.fotoUrl, p.sesso FROM profilo p JOIN utenti u on p.idUtente = u.idUtente";
			
			PreparedStatement User = con.prepareStatement(SQLUser);
			//User.setString(1, idUtente.toString());
			
			resultSetUser = User.executeQuery();
			
			resultSetUser.next();
			
			ProfiloUtente userProfile = ProfiloUtenteService.getProfileUserByIdUtenteWithExperiencesAndEducation(Integer.valueOf(resultSetUser.getString("idUtente")));
			
			final Integer id = Integer.valueOf(resultSetUser.getString("idUtente"));
			final String nome = String.valueOf(resultSetUser.getString("nome"));
			final String cognome = String.valueOf(resultSetUser.getString("cognome"));
			final Integer idCv = Integer.valueOf(resultSetUser.getString("idCv"));
			final String fileUrl = String.valueOf(resultSetUser.getString("fileUrl"));
			final Integer sesso = Integer.valueOf(resultSetUser.getString("sesso"));
			
			Utente utente = new Utente(id, nome, cognome, idCv, fileUrl, sesso);
			
			//Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"), userProfile);
			
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
	}*/
}
