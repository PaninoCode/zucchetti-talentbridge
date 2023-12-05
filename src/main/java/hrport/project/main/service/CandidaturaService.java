package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;
import hrport.project.main.pojo.Utente;

public class CandidaturaService {

	public static List<Candidatura> getApplicationsFromPosition(Integer idPos) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetCandidati = null;
		List<Candidatura> candidaturaList = new ArrayList<>();

		try {

			con.setAutoCommit(false);
			String SQLquery = "SELECT can.*, u.* FROM Candidatura can INNER JOIN utenti u ON can.idUtente = u.idUtente WHERE can.idPos = ? ORDER BY can.punteggioTot DESC";

			PreparedStatement candidaturaStatement = con.prepareStatement(SQLquery);
			candidaturaStatement.setInt(1, idPos);

			resultSetCandidati = candidaturaStatement.executeQuery();

			while (resultSetCandidati.next()) {

				Utente utente = new Utente(Integer.valueOf(resultSetCandidati.getString("idUtente")),
						resultSetCandidati.getString("email"),
						Boolean.valueOf(
								(resultSetCandidati.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"),
						resultSetCandidati.getString("nome"), resultSetCandidati.getString("cognome"));
				candidaturaList.add(new Candidatura(resultSetCandidati.getInt("idCand"), utente,
						resultSetCandidati.getInt("stato")));
			}

			resultSetCandidati.close();
			con.commit();
		} catch (Exception e) {

			resultSetCandidati.close();
			con.rollback();
			candidaturaList = new ArrayList<>();
		} finally {

			con.close();
		}

		return candidaturaList;
	}

	public static List<Candidatura> getApplicationsByIdUtente(Integer idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetApplications = null;
		List<Candidatura> applications = new ArrayList<>();

		try {

			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.*, cn.* FROM Posizione pz INNER JOIN Candidatura cn ON pz.idPos = cn.idPos WHERE cn.idUtente = ?";

			PreparedStatement UserApplications = con.prepareStatement(SQLUserPositions);
			UserApplications.setInt(1, idUtente);

			resultSetApplications = UserApplications.executeQuery();

			while (resultSetApplications.next()) {

				Posizione posizione = new Posizione(Integer.valueOf(resultSetApplications.getString("idPos")),
						resultSetApplications.getString("nome"),
						Boolean.valueOf(
								(resultSetApplications.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"),
						resultSetApplications.getString("fotoUrl"), resultSetApplications.getString("descrizione"));

				applications.add(new Candidatura(resultSetApplications.getInt("idCand"), posizione,
						resultSetApplications.getInt("stato"), resultSetApplications.getInt("punteggioTot")));

			}

			resultSetApplications.close();
			con.commit();
		} catch (Exception e) {

			resultSetApplications.close();
			con.rollback();
			applications = new ArrayList<>();
		} finally {

			con.close();
		}

		return applications;
	}
	
	public static List<Candidatura> getCandidateList() throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetApplications = null;
		List<Candidatura> applications = new ArrayList<>();

		try {

			con.setAutoCommit(false);
			String SQLquery = "  SELECT can.idCand, u.idUtente, u.nome, u.cognome, pos.idPos, pos.nome as nomePosizione, pos.aperta, can.stato, can.punteggioTot from Candidatura can JOIN Utenti u ON u.idUtente = can.idUtente JOIN Posizione pos ON pos.idPos = can.idPos ORDER BY can.punteggioTot DESC";

			PreparedStatement candidateApplication = con.prepareStatement(SQLquery);
			//UserApplications.setInt(1, idUtente);

			resultSetApplications = candidateApplication.executeQuery();

			while (resultSetApplications.next()) {
				
				Utente utente = new Utente(resultSetApplications.getInt("idUtente"),
										   resultSetApplications.getString("nome"),
										   resultSetApplications.getString("cognome"));
				
										   
				Posizione posizione = new Posizione(resultSetApplications.getInt("idPos"),
													resultSetApplications.getString("nomePosizione"),
													resultSetApplications.getBoolean("aperta"));
				
				Candidatura candidato = new Candidatura(resultSetApplications.getInt("idCand"), 
														utente, 
														posizione, 
														resultSetApplications.getInt("stato"), 
														resultSetApplications.getInt("punteggioTot"));
				
				applications.add(candidato);	

			}

			resultSetApplications.close();
			con.commit();
		} catch (Exception e) {

			resultSetApplications.close();
			con.rollback();
			applications = new ArrayList<>();
		} finally {

			con.close();
		}

		return applications;
	}
	
	public static void insertCandidatura(Integer idPos, Integer idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		try {
			
			con.setAutoCommit(false);
					
			String SQL = "INSERT INTO \"Candidatura\" (\"idUtente\", \"idPos\", \"stato\")\r\n"
					+ "VALUES (?, ?, ?);";
			
			PreparedStatement insertCandidatura = con.prepareStatement(SQL);
			
			insertCandidatura.setInt(1, idUtente);
			insertCandidatura.setInt(2, idPos);
			insertCandidatura.setInt(3, 0);
			
			insertCandidatura.executeUpdate();
			
			con.commit();
			
			CandidaturaService.updateStatoCandidatura(idPos, idUtente);
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void deleteCandidatura(Integer idPos, Integer idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
			
		try {
			
			con.setAutoCommit(false);
					
			String SQL = "DELETE FROM Candidatura WHERE Candidatura.idUtente = ? AND Candidatura.idPos = ?;";
			
			PreparedStatement deleteCandidatura = con.prepareStatement(SQL);
			
			deleteCandidatura.setInt(1, idUtente);
			deleteCandidatura.setInt(2, idPos);
			
			deleteCandidatura.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void updateStatoCandidaturaAdmin(int idCand, int stato) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		List<Integer> allowed_states = new ArrayList<Integer>() {/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

		{
			add(2);
			add(3);
		}};
		
		if(!allowed_states.contains(stato)) throw new Exception("stato non consentito per la modifica");
		
		try {
			
			con.setAutoCommit(false);	
			String SQL = "UPDATE Candidatura \\r\\n\"\r\n"
					+ "SET stato = ? \r\n"
					+ "WHERE idCand = ?";
			
			PreparedStatement statement = con.prepareStatement(SQL);
			statement.setInt(1, stato);
			statement.setInt(1, idCand);
			
			statement.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
	
	public static void updateStatoCandidatura(int idPos, int idUtente) throws Exception{
		
		List<Quiz> quiz=Quiz.getQuizFromPosizioneUtente(idPos, idUtente);
		ResultSet result = null;
		
		for (Iterator<Quiz> iterator = quiz.iterator(); iterator.hasNext();) {
			Quiz quiz2 = iterator.next();
			if(!quiz2.isDone()) 
				return;
			
		}
		
		Connection con = ConnectDatabase.getConnection();
		try {
			con.setAutoCommit(false);	
			String SQL = "SELECT COALESCE(SUM(d.punteggio), 0) AS totPunteggio, u.idUtente, u.nome, u.cognome\r\n"
					+ "FROM Utenti u\r\n"
					+ "LEFT JOIN RispostaData rd ON u.idUtente = rd.idUtente\r\n"
					+ "LEFT JOIN Risposta r ON rd.idRisposta = r.idRisposta AND r.giusta = 1\r\n"
					+ "LEFT JOIN Domanda d ON r.idDomanda = d.idDomanda\r\n"
					+ "LEFT JOIN posQuiz pq ON d.idQuiz = pq.idQuiz AND pq.idPos = ?\r\n"
					+ "WHERE u.idUtente=?\r\n"
					+ "GROUP BY u.idUtente, u.nome, u.cognome;";
			
			PreparedStatement getPunteggioTot = con.prepareStatement(SQL);
			
			getPunteggioTot.setInt(1, idPos);
			getPunteggioTot.setInt(2, idUtente);
			
			result = getPunteggioTot.executeQuery();
			result.next();
			int punteggioTot= result.getInt(1);
			
			//SQL="UPDATE Candidatura \r\n"
			//		+ "SET stato='1', totPunteggio=?\r\n"
			//		+ "WHERE idPos=? AND idUtente=?";
			
			SQL="UPDATE Candidatura \r\n"
					+ "SET stato=1,\r\n"
					+ "punteggioTot = ?"
					+ "WHERE idPos=? AND idUtente=?";
			
			PreparedStatement updateCandidatura = con.prepareStatement(SQL);
			//updateCandidatura.setInt(1, punteggioTot);
			updateCandidatura.setInt(1, result.getInt("totPunteggio"));
			updateCandidatura.setInt(2, idPos);
			updateCandidatura.setInt(3, idUtente);
			
			updateCandidatura.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
		
		
	}

}
