package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;

public class CandidaturaService {
	
	
public static List<Candidatura> getAllCandiList() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetCandidati = null;
		List<Candidatura> candidaturaList = new ArrayList<>();
		
		try {
			
			
			con.setAutoCommit(false);
			String SQLquery = "SELECT can.idCand, can.idUtente, u.nome, u.cognome, pos.nome as posizione, can.stato FROM Candidatura can JOIN utenti u ON can.idUtente = u.idUtente JOIN Posizione pos ON can.idPos = pos.idPos";
			
			PreparedStatement candidaturaStatement = con.prepareStatement(SQLquery);
			
			resultSetCandidati = candidaturaStatement.executeQuery();
					
			while(resultSetCandidati.next()) {
						
				Candidatura candidato = new Candidatura(
						Integer.valueOf(resultSetCandidati.getInt("idCand")),
						Integer.valueOf(resultSetCandidati.getInt("idPos")),
						resultSetCandidati.getString("nome"),
						resultSetCandidati.getString("cognome"),
						resultSetCandidati.getString("posizione"),
						Boolean.valueOf((resultSetCandidati.getString("stato").equalsIgnoreCase("1")) ? "true" : "false")
					);
					

					candidaturaList.add(candidato);
								
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

	
	

}
