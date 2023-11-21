package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Posizione;

public class PosizioneService {
	
	public static List<Posizione> getAllPositions() throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetUserPositions = null;
		List<Posizione> positions = new ArrayList<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.* FROM Posizione pz";
			
			PreparedStatement UserPositions = con.prepareStatement(SQLUserPositions);
			
			resultSetUserPositions = UserPositions.executeQuery();
			
			while(resultSetUserPositions.next()) {
				
				positions.add(new Posizione(Integer.valueOf(resultSetUserPositions.getString("idPos")), resultSetUserPositions.getString("nome"), Boolean.valueOf((resultSetUserPositions.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"), resultSetUserPositions.getString("fotoUrl"), resultSetUserPositions.getString("descrizione")));
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
