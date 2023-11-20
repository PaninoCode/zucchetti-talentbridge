package hrport.project.main.pojo;

public class Candidatura {
	
	private Integer idCand;
	private Integer idPos;
	private String nome;
	private String cognome;
	private String posizione;
	private boolean stato;
	
	
	public Candidatura(Integer idCand, Integer idPos, String nome, String cognome, String posizione, boolean stato) {
		this.idCand = idCand;
		this.idPos = idPos;
		this.setNome(nome);
		this.cognome = cognome;
		this.posizione = posizione;
		this.stato = stato;
	}
	
	
	public Integer getIdCand() {
		return idCand;
	}
	public void setIdCand(Integer idCand) {
		this.idCand = idCand;
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
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPosizione() {
		return posizione;
	}
	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}
	public boolean isStato() {
		return stato;
	}
	public void setStato(boolean stato) {
		this.stato = stato;
	}
	
	
	

}
