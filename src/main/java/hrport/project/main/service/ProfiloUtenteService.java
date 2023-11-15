package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.EspLavorativa;

public class ProfiloUtenteService {

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
				
			Utente utente = new Utente(Integer.valueOf(resultSetUser.getString("idUtente")), resultSetUser.getString("email"), Boolean.valueOf((resultSetUser.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUser.getString("nome"), resultSetUser.getString("cognome"), positions);
			
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
