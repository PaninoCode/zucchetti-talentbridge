package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Posizione;
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
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString(1)), resultSetUser.getString(2), Boolean.valueOf(resultSetUser.getString(4)), resultSetUser.getString(5), resultSetUser.getString(6));
			
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
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString(1)), resultSetUser.getString(2), Boolean.valueOf(resultSetUser.getString(4)), resultSetUser.getString(5), resultSetUser.getString(6));
			
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
			
			List<Posizione> positions = PosizioneService.getPositionsByIdUtente(resultSetUser.getString(1));
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString(1)), resultSetUser.getString(2), Boolean.valueOf(resultSetUser.getString(4)), resultSetUser.getString(5), resultSetUser.getString(6), positions);
			
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
}
