package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Domanda {
	private String testo;
	private int punteggio;
	private Risposta r[]= new Risposta[4];

	
	public Domanda(int id, String testo, int punteggio) {
		this.setTesto(testo);
		this.setPunteggio(punteggio);
	}
	
	
	
	public String getTesto() {
		return testo;
	}
	
	public int getPunteggio() {
		return punteggio;
	}
	
	public Object[] getRisposte() {
		return r;
	}
	
	public Risposta rispostaIndex(int index) {
		return r[index];
	}
	
	public void setTesto(String testo) {
		this.testo=testo;
	}
	
	public void setPunteggio(int punteggio) {
		this.punteggio=punteggio;
	}
	
	public void setRisposte(Connection con, int id) {
		try {
			String SQLUser = "SELECT r.* FROM Domanda d JOIN Risposta r on d.idDomanda=r.idDomanda WHERE d.idDomanda= ?";
			
			PreparedStatement Ris = con.prepareStatement(SQLUser);
			Ris.setInt(1, id);
			ResultSet resultSet = null;
			
			resultSet = Ris.executeQuery();
			
			for(int i=0;resultSet.next(); i++) {
				String testo=resultSet.getString(3);
				boolean giusta=resultSet.getBoolean(4);
				r[i]= new Risposta(testo, giusta);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
