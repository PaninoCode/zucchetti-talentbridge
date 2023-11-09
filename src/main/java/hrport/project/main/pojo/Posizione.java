package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;

public class Posizione {
	
	private Integer idPos;
	private String nome;
	private Boolean aperta;
	private String fotoUrl;
	
	Posizione(Integer idPos, String nome, Boolean aperta, String fotoUrl){
		
		setIdPos(idPos);
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
	}

	public Integer getIdPos() {
		return idPos;
	}

	public void setIdPos(Integer idPos) {
		this.idPos = idPos;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getAperta() {
		return aperta;
	}

	public void setAperta(Boolean aperta) {
		this.aperta = aperta;
	}

	public String getFotoUrl() {
		return fotoUrl;
	}

	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}
	
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
