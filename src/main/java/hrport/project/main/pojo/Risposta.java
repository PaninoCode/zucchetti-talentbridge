package hrport.project.main.pojo;

public class Risposta {
	private int id;
	private String testo;
	private boolean giusta;
	
	public Risposta(int id, String testo, boolean giusta) {
		this.setTesto(testo);
		this.setGiusta(giusta);
	}
	
	public int getId() {
		return id;
	}
	
	public String getTesto() {
		return testo;
	}
	
	public boolean isGiusta() {
		return giusta;
	}
	
	public void setId(int id) {
		this.id=id;
	}
	
	public void setTesto(String testo) {
		this.testo=testo;
	}
	
	public void setGiusta(boolean giusta) {
		this.giusta=giusta;
	}
}
