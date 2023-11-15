package hrport.project.main.pojo;

public class Posizione {
	
	private Integer idPos;
	private String nome;
	private Boolean aperta;
	private String fotoUrl;
	private String descrizione;
	
	public Posizione(Integer idPos, String nome, Boolean aperta, String fotoUrl, String descrizione){
		
		setIdPos(idPos);
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
		setDescrizione(descrizione);
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
		return fotoUrl;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
}
