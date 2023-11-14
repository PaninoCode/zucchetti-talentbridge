package hrport.project.main.pojo;

import java.time.LocalDate;

public class EspLavorativa {
	
	private Integer idEl;
	private Integer idCv;
	private String azienda;
	private LocalDate dInizio;
	private LocalDate dFine;
	private String posizione;
	private String funzione;
	private String indirizzo;
	
	public EspLavorativa(Integer idEl, Integer idCv, String azienda, LocalDate dInizio, LocalDate dFine,
			String posizione, String funzione, String indirizzo) {
		
		setIdEl(idEl);
		setIdCv(idCv);
		setAzienda(azienda);
		setdInizio(dInizio);
		setdFine(dFine);
		setPosizione(posizione);
		setFunzione(funzione);
		setIndirizzo(indirizzo);
	}
	
	public Integer getIdEl() {
		return idEl;
	}
	public void setIdEl(Integer idEl) {
		this.idEl = idEl;
	}
	public Integer getIdCv() {
		return idCv;
	}
	public void setIdCv(Integer idCv) {
		this.idCv = idCv;
	}
	public String getAzienda() {
		return azienda;
	}
	public void setAzienda(String azienda) {
		this.azienda = azienda;
	}
	public LocalDate getdInizio() {
		return dInizio;
	}
	public void setdInizio(LocalDate dInizio) {
		this.dInizio = dInizio;
	}
	public LocalDate getdFine() {
		return dFine;
	}
	public void setdFine(LocalDate dFine) {
		this.dFine = dFine;
	}
	public String getPosizione() {
		return posizione;
	}
	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}
	public String getFunzione() {
		return funzione;
	}
	public void setFunzione(String funzione) {
		this.funzione = funzione;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
}
