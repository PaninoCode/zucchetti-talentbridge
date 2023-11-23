package hrport.project.main.pojo;

import java.util.Set;

public class CategoriaSkills {

	private Integer idCv;
	private Integer idCs;
	private Set<Skill> skills;
	private String nomeCategoria;
	
	public CategoriaSkills(Integer idCv, Integer idCs, Set<Skill> skills, String nomeCategoria) {
		
		this.idCv = idCv;
		this.idCs = idCs;
		this.skills = skills;
		this.nomeCategoria = nomeCategoria;
	}
	
	public Integer getIdCv() {
		return idCv;
	}
	public void setIdCv(Integer idCv) {
		this.idCv = idCv;
	}
	public Set<Skill> getSkills() {
		return skills;
	}
	public void setSkills(Set<Skill> skills) {
		this.skills = skills;
	}
	public String getNomeCategoria() {
		return nomeCategoria;
	}
	public void setNomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}
	public Integer getIdCs() {
		return idCs;
	}
	public void setIdCs(Integer idCs) {
		this.idCs = idCs;
	}
	
}
