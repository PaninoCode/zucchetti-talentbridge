package hrport.project.main.pojo;

public class Candidatura {
	
	private Integer idCand;
	private Utente user;
	private Posizione position;
	private Integer stato;
	private Integer punteggioTot;
	
	
	
	public Candidatura(Integer idCand, Utente user, Posizione position, Integer stato, Integer punteggioTot) {
		this.idCand = idCand;
		this.user = user;
		this.position = position;
		this.stato = stato;
		this.punteggioTot = punteggioTot;
	}

	public Integer getPunteggioTot() {
		return punteggioTot;
	}

	public void setPunteggioTot(Integer punteggioTot) {
		this.punteggioTot = punteggioTot;
	}

	public Candidatura(Integer idCand, Utente user, Integer stato) {
		
		this.setIdCand(idCand);
		this.setUser(user);
		this.setStato(stato);
	}
	
	public Candidatura(Integer idCand, Posizione position, Integer stato, Integer punteggioTot) {
		
		this.setIdCand(idCand);
		this.setPosition(position);
		this.setStato(stato);
		this.setPunteggioTot(punteggioTot);
	}
	
	
	public Integer getIdCand() {
		return idCand;
	}
	public void setIdCand(Integer idCand) {
		this.idCand = idCand;
	}
	public Utente getUser() {
		return user;
	}
	public void setUser(Utente user) {
		this.user = user;
	}
	public Posizione getPosition() {
		return position;
	}
	public void setPosition(Posizione position) {
		this.position = position;
	}
	public Integer getStato() {
		return stato;
	}
	public void setStato(Integer stato) {
		this.stato = stato;
	}
}
