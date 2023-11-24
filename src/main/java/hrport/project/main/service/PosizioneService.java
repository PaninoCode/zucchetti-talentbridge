package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.ProfiloUtente;
import hrport.project.main.pojo.Utente;

public class PosizioneService {
	
	public static List<Posizione> getAllPositions() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		ResultSet resultSetAllPositions = null;
		List<Posizione> positions = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz WHERE pz.aperta = 1";
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			
			resultSetAllPositions = UserPositions.executeQuery();
			
			while(resultSetAllPositions.next()) {
				
				positions.add(new Posizione(Integer.valueOf(resultSetAllPositions.getString("idPos")), resultSetAllPositions.getString("nome"), Boolean.valueOf((resultSetAllPositions.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"), resultSetAllPositions.getString("fotoUrl"), resultSetAllPositions.getString("descrizione")));
			}
			
			resultSetAllPositions.close();
			con.commit();
		} catch (Exception e) {
			
			resultSetAllPositions.close();
			con.rollback();
			positions = new ArrayList<>();
		} finally {
			
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
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz WHERE pz.aperta = 1";
			
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
			String sQLquery = "SELECT * from posizione";

			PreparedStatement posStatement = con.prepareStatement(sQLquery);
			
			//posStatement.setInt(1, idPosizione);

			resultSet = posStatement.executeQuery();
			
			resultSet.next();
				
				Posizione posizione = new Posizione(
						resultSet.getInt("idPos"),
						resultSet.getString("nome"),
						resultSet.getBoolean("aperta"),
						resultSet.getString("fotoUrl"),
						resultSet.getString("descrizione"));	
				
				System.out.println(posizione.getNome());
			
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
	
	
}
