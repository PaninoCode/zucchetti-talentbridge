package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Domanda {
	private int id;
	private String testo;
	private int punteggio;
	private Risposta risposte[]= new Risposta[4];
	private int idRispostaUtente;

	
	public Domanda(int id, String testo, int punteggio) {
		this.setId(id);
		this.setTesto(testo);
		this.setPunteggio(punteggio);
	}
	
	public int getId() {
		return id;
	}
	
	public String getTesto() {
		return testo;
	}
	
	public int getPunteggio() {
		return punteggio;
	}
	
	public Risposta[] getRisposte() {
		return risposte;
	}
	
	public Risposta rispostaIndex(int index) {
		return risposte[index];
	}
	
	public void setId(int id) {
		this.id=id;
	}
	
	public void setTesto(String testo) {
		this.testo=testo;
	}
	
	public void setPunteggio(int punteggio) {
		this.punteggio=punteggio;
	}
	
	public void setRisposte(Risposta[] risposte) {
		this.risposte = risposte;
	}
	
	public void setRisposte(Connection con) {
		try {
			String SQLUser = "SELECT r.* FROM Domanda d JOIN Risposta r on d.idDomanda=r.idDomanda WHERE d.idDomanda= ?";
			
			PreparedStatement Ris = con.prepareStatement(SQLUser);
			Ris.setInt(1, id);
			ResultSet resultSet = null;
			
			resultSet = Ris.executeQuery();
			
			for(int i=0;resultSet.next(); i++) {
				int rispostaId=resultSet.getInt(2);
				String testo=resultSet.getString(3);
				boolean giusta=resultSet.getBoolean(4);
				risposte[i]= new Risposta(rispostaId, testo, giusta);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getIdRispostaUtente() {
		return idRispostaUtente;
	}

	public void setIdRispostaUtente(int rispostaUtente) {
		this.idRispostaUtente = rispostaUtente;
	}
	
	public void setIdRispostaUtente(Connection con, int idUtente) {
		try {
			String SQLUser = "SELECT * FROM Domanda d "
							+ "JOIN Risposta r on d.idDomanda=r.idDomanda "
							+ "JOIN RispostaData rd on r.idRisposta = rd.idRisposta "
							+ "WHERE d.idDomanda= ? AND rd.idUtente = ?";
			
			PreparedStatement Ris = con.prepareStatement(SQLUser);
			Ris.setInt(1, id);
			Ris.setInt(2, idUtente);
			ResultSet resultSet = null;
			
			resultSet = Ris.executeQuery();
			resultSet.next();
			idRispostaUtente = resultSet.getInt(1);
			
		} catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	
}
