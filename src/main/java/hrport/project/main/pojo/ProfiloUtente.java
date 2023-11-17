package hrport.project.main.pojo;

import java.time.LocalDate;
import java.util.Set;

public class ProfiloUtente {

	private Integer idUtente;
	private Integer idCv;
	private String fileUrl;
	private String fotoUrl;
	private Boolean gender;
	private LocalDate dNascita;
	private String indResidenza;
	private String inDomicilio;
	private String telefono;
	private String codiceFiscale;
	private String statoOrigine;
	private String comNascita;
	private Set<EspLavorativa> experiences;
	private Set<Istruzione> education;
	
	public ProfiloUtente(Integer idUtente, Integer idCv, String fileUrl, String fotoUrl, Boolean gender,
			LocalDate dNascita, String indResidenza, String inDomicilio, String telefono, String codiceFiscale,
			String statoOrigine, String comNascita, Set<EspLavorativa> experiences, Set<Istruzione> education) {
		
		setIdUtente(idUtente);
		setIdCv(idCv);
		setFileUrl(fileUrl);
		setFotoUrl(fotoUrl);
		setGender(gender);
		setdNascita(dNascita);
		setIndResidenza(indResidenza);
		setInDomicilio(inDomicilio);
		setTelefono(telefono);
		setCodiceFiscale(codiceFiscale);
		setStatoOrigine(statoOrigine);
		setComNascita(comNascita);
		setExperiences(experiences);
		setEducation(education);
	}
	
	public Integer getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(Integer idUtente) {
		this.idUtente = idUtente;
	}
	public Integer getIdCv() {
		return idCv;
	}
	public void setIdCv(Integer idCv) {
		this.idCv = idCv;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getFotoUrl() {
		return fotoUrl;
	}
	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}
	public Boolean isGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public LocalDate getdNascita() {
		return dNascita;
	}
	public void setdNascita(LocalDate dNascita) {
		this.dNascita = dNascita;
	}
	public String getIndResidenza() {
		return indResidenza;
	}
	public void setIndResidenza(String indResidenza) {
		this.indResidenza = indResidenza;
	}
	public String getInDomicilio() {
		return inDomicilio;
	}
	public void setInDomicilio(String inDomicilio) {
		this.inDomicilio = inDomicilio;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCodiceFiscale() {
		return codiceFiscale;
	}
	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}
	public String getStatoOrigine() {
		return statoOrigine;
	}
	public void setStatoOrigine(String statoOrigine) {
		this.statoOrigine = statoOrigine;
	}
	public String getComNascita() {
		return comNascita;
	}
	public void setComNascita(String comNascita) {
		this.comNascita = comNascita;
	}
	public Set<EspLavorativa> getExperiences() {
		return experiences;
	}
	public void setExperiences(Set<EspLavorativa> experiences) {
		this.experiences = experiences;
	}
	public Set<Istruzione> getEducation() {
		return education;
	}
	public void setEducation(Set<Istruzione> education) {
		this.education = education;
	}
}
