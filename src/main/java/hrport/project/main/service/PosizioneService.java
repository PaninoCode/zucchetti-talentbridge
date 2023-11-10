package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Posizione;

public class PosizioneService {
	
	public static List<Posizione> getPositionsByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetUserPositions = null;
		List<Posizione> positions = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz INNER JOIN Candidatura cn ON pz.idPos = cn.idPos WHERE cn.idUtente = ?";
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			UserPositions.setString(1, idUtente);
			
			resultSetUserPositions = UserPositions.executeQuery();
			
			while(resultSetUserPositions.next()) {
				
				positions.add(new Posizione(Integer.valueOf(resultSetUserPositions.getString(1)), resultSetUserPositions.getString(2), Boolean.valueOf(resultSetUserPositions.getString(3)), resultSetUserPositions.getString(4)));
			}
			
			resultSetUserPositions.close();
			con.commit();
		} catch (Exception e) {
			
			resultSetUserPositions.close();
			con.rollback();
			positions = new ArrayList<>();
		} finally {
			
			con.close();
		}
		
		return positions;
	}
}
