package hrport.project.main.pojo;

public class Risposta {
	private String testo;
	private boolean giusta;
	
	public Risposta(String testo, boolean giusta) {
		this.setTesto(testo);
		this.setGiusta(giusta);
	}
	
	public String getTesto() {
		return testo;
	}
	
	public boolean isGiusta() {
		return giusta;
	}
	
	public void setTesto(String testo) {
		this.testo=testo;
	}
	
	public void setGiusta(boolean giusta) {
		this.giusta=giusta;
	}
}
