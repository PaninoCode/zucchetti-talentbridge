package hrport.project.main.pojo;

import java.time.LocalDate;

public class Istruzione {

	private Integer idIst;
	private Integer idCv;
	private String titoloIstruzione;
	private String istituto;
	private String indirizzo;
	private Integer voto;
	private LocalDate dInizio;
	private LocalDate dFine;
	
	public Istruzione(Integer idIst, Integer idCv, String titoloIstruzione, String istituto, String indirizzo,
			Integer voto, LocalDate dInizio, LocalDate dFine) {
		
		setIdIst(idIst);
		setIdCv(idCv);
		setTitoloIstruzione(titoloIstruzione);
		setIstituto(istituto);
		setIndirizzo(indirizzo);
		setVoto(voto);
		setdInizio(dInizio);
		setdFine(dFine);
	}
	
	public Integer getIdIst() {
		return idIst;
	}
	public void setIdIst(Integer idIst) {
		this.idIst = idIst;
	}
	public Integer getIdCv() {
		return idCv;
	}
	public void setIdCv(Integer idCv) {
		this.idCv = idCv;
	}
	public String getTitoloIstruzione() {
		return titoloIstruzione;
	}
	public void setTitoloIstruzione(String titoloIstruzione) {
		this.titoloIstruzione = titoloIstruzione;
	}
	public String getIstituto() {
		return istituto;
	}
	public void setIstituto(String istituto) {
		this.istituto = istituto;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public Integer getVoto() {
		return voto;
	}
	public void setVoto(Integer voto) {
		this.voto = voto;
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
}
