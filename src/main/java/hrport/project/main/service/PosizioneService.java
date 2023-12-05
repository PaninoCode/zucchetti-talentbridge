package hrport.project.main.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.EspLavorativa;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Quiz;

public class PosizioneService {
	
	public static List<Posizione> getAllPositions(String nome, Boolean aperta) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		ResultSet resultSetAllPositions = null;
		List<Posizione> positions = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz \r\n";
			
			List<String> addedParameters = new ArrayList<>();
			String addNome = null;
			String addAperta = null;
			if(nome != null || aperta != null) {
				
				String addWHERE = "WHERE ";
				SQLUserPositions += addWHERE;
				if(nome != null) {
					
					addNome = "pz.nome LIKE ? ";
					addedParameters.add(addNome);
				}
				if(aperta != null) {
					
					addAperta = "pz.aperta = ? ";
					addedParameters.add(addAperta);
				}
			}
			
			for (Iterator<String> iterator = addedParameters.iterator(); iterator.hasNext();) {
				
				String element = iterator.next();
				
				if(iterator.hasNext()) {
					
					SQLUserPositions += element + "AND ";
				} else {
					
					SQLUserPositions += element;
				}
			}
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			
			Integer counter = 0;
			for (Iterator<String> iterator = addedParameters.iterator(); iterator.hasNext();) {
				
				String element = iterator.next();
				counter++;
				
				if(element.equalsIgnoreCase(addNome)) UserPositions.setString(counter, "%" + nome + "%");
				if(element.equalsIgnoreCase(addAperta)) UserPositions.setBoolean(counter, aperta);
			}
			
			resultSetAllPositions = UserPositions.executeQuery();
			
			while(resultSetAllPositions.next()) {
				
				positions.add(new Posizione(Integer.valueOf(resultSetAllPositions.getString("idPos")), resultSetAllPositions.getString("nome"), Boolean.valueOf((resultSetAllPositions.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"), resultSetAllPositions.getString("fotoUrl"), resultSetAllPositions.getString("descrizione")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			positions = new ArrayList<>();
		} finally {
			
			if(resultSetAllPositions != null) resultSetAllPositions.close();
			con.close();
		}
		
		return positions;
	}
	
	public static List<Posizione> getAllPositions() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		ResultSet resultSetAllPositions = null;
		List<Posizione> positions = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz";
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			
			resultSetAllPositions = UserPositions.executeQuery();
			
			while(resultSetAllPositions.next()) {
				
				positions.add(new Posizione(Integer.valueOf(resultSetAllPositions.getString("idPos")), resultSetAllPositions.getString("nome"), Boolean.valueOf((resultSetAllPositions.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"), resultSetAllPositions.getString("fotoUrl"), resultSetAllPositions.getString("descrizione")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			positions = new ArrayList<>();
		} finally {
			
			if(resultSetAllPositions != null) resultSetAllPositions.close();
			con.close();
		}
		
		return positions;
	}
	
	public static List<Posizione> getAllPositionsWithApplications() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		List<Posizione> positions = new ArrayList<>();
		ResultSet resultSet = null;
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz";
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			
			resultSet = UserPositions.executeQuery();
			
			while(resultSet.next()) {
				
				Integer idPos = resultSet.getInt("idPos");
				List<Candidatura> applications = CandidaturaService.getApplicationsFromPosition(idPos);
				positions.add(new Posizione(
						idPos, 
						resultSet.getString("nome"), 
						Boolean.valueOf((resultSet.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"), 
						resultSet.getString("fotoUrl"), 
						resultSet.getString("descrizione"), 
						applications)
						);
			}
			
			resultSet.close();
			con.commit();
		} catch (Exception e) {
			
			resultSet.close();
			con.rollback();
			positions = new ArrayList<>();
		} finally {
			
			con.close();
		}
		
		return positions;
	}
	
	public static Posizione getPosizioneById(Integer idPosizione) throws Exception {

		Connection con = ConnectDatabase.getConnection();
		ResultSet resultSet = null;
		
		
		try {

			con.setAutoCommit(false);
			String sQLquery = "SELECT * from posizione WHERE idPos = ?";

			PreparedStatement posStatement = con.prepareStatement(sQLquery);
			
			posStatement.setInt(1, idPosizione);

			resultSet = posStatement.executeQuery();
			
			resultSet.next();
				
				List <Candidatura> candidatura = CandidaturaService.getApplicationsFromPosition(idPosizione);
				
				Posizione posizione = new Posizione(
						resultSet.getInt("idPos"),
						resultSet.getString("nome"),
						resultSet.getBoolean("aperta"),
						resultSet.getString("fotoUrl"),
						resultSet.getString("descrizione"),
						candidatura);	
				
				//System.out.println(candidatura);
			
			con.commit();
			return posizione;
			
		} catch (Exception e) {

			resultSet.close();
			con.rollback();
			throw e;
		} finally {
			resultSet.close();
			con.close();
		}
		
	}
	
	public static void updatePosizione(Posizione posizione) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		

		try {
			
			con.setAutoCommit(false);
			
					
			String SQL = "UPDATE Posizione\r\n"
					+ "SET nome = ?, aperta = ?, fotoUrl = ?, descrizione = ?\r\n"
					+ "WHERE idPos = ?;";
			
			PreparedStatement updatePosizione = con.prepareStatement(SQL);
			
			
			updatePosizione.setString(1, posizione.getNome());
			updatePosizione.setBoolean(2, posizione.getAperta());
			updatePosizione.setString(3, posizione.getFotoUrl());
			updatePosizione.setString(4, posizione.getDescrizione());
			updatePosizione.setInt(5, posizione.getIdPos());
			
			updatePosizione.executeUpdate();
				
			con.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void insertNewPosition(Posizione posizione, Quiz[] quiz) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		try {
			
			con.setAutoCommit(false);
			
			String SQLPosition = "INSERT INTO \"Posizione\" (\"nome\", \"aperta\", \"fotoUrl\", \"descrizione\")\r\n"
					+ "VALUES (?, ?, ?, ?);"
					+ "SELECT SCOPE_IDENTITY() as 'lastId'";
			
			PreparedStatement statementPosition = con.prepareStatement(SQLPosition);
			
			statementPosition.setString(1, posizione.getNome());
			statementPosition.setBoolean(2, posizione.getAperta());
			statementPosition.setString(3, posizione.getFotoUrl());
			statementPosition.setString(4, posizione.getDescrizione());
			
			resultSet = statementPosition.executeQuery();
			
			String SQLposQuiz = "INSERT INTO \"posQuiz\" (\"idPos\", \"idQuiz\")\r\n"
					+ "VALUES (?, ?);";
			
			resultSet.next();
			Integer generatedId = resultSet.getInt("lastId");
			
			for (int i = 0; i < quiz.length; i++) {
				
				Integer idQuiz = quiz[i].getId();
				
				PreparedStatement insertQuiz = con.prepareStatement(SQLposQuiz);
				
				insertQuiz.setInt(1, generatedId);
				insertQuiz.setInt(2, idQuiz);
				
				insertQuiz.executeUpdate();
			}
			
			con.commit();
		} catch (Exception e) {
			// TODO: handle exception
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
		
	}
	
	public static void deletePosizione(Integer idPosizione) throws Exception {
	    Connection con = ConnectDatabase.getConnection();
	    try {
	        con.setAutoCommit(false);

	        // Separate DELETE statements for each table
	        String posQuizQuery = "DELETE FROM posQuiz WHERE idPos = ?";
	        String candidaturaQuery = "DELETE FROM Candidatura WHERE idPos = ?";
	        String posizioneQuery = "DELETE FROM Posizione WHERE idPos = ?";

	        // Prepare statements
	        try (PreparedStatement posQuizStatement = con.prepareStatement(posQuizQuery);
	             PreparedStatement candidaturaStatement = con.prepareStatement(candidaturaQuery);
	             PreparedStatement posizioneStatement = con.prepareStatement(posizioneQuery)) {

	            // Set parameters
	            posQuizStatement.setInt(1, idPosizione);
	            candidaturaStatement.setInt(1, idPosizione);
	            posizioneStatement.setInt(1, idPosizione);

	            // Execute the DELETE statements
	            posQuizStatement.executeUpdate();
	            candidaturaStatement.executeUpdate();
	            posizioneStatement.executeUpdate();

	            // Commit the transaction
	            con.commit();
	        } catch (SQLException e) {
	            // Rollback and rethrow the exception
	        	System.out.println(e.getMessage());
	            con.rollback();
	            throw e;
	        }
	    } finally {
	        con.close();
	    }
	}

}
