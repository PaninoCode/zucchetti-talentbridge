package hrport.project.main.pojo;

import java.util.List;

public class Posizione {
	
	private Integer idPos;
	private String nome;
	private Boolean aperta;
	private String fotoUrl;
	private String descrizione;
	private List<Candidatura> applications;
	
	public Posizione(Integer idPos, String nome, Boolean aperta, String fotoUrl, String descrizione){
		
		setIdPos(idPos);
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
		setDescrizione(descrizione);
	}
	
	public Posizione(Integer idPos, String nome, Boolean aperta, String fotoUrl, String descrizione, List<Candidatura> applications){
		
		setIdPos(idPos);
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
		setDescrizione(descrizione);
		setApplications(applications);
	}
	
	public Posizione(String nome, Boolean aperta, String fotoUrl, String descrizione){
		
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
		setDescrizione(descrizione);
	}

	public Posizione(Integer idPos, String nome, Boolean aperta) {
		super();
		this.idPos = idPos;
		this.nome = nome;
		this.aperta = aperta;
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
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public List<Candidatura> getApplications() {
		return applications;
	}
	public void setApplications(List<Candidatura> applications) {
		this.applications = applications;
	}
}
