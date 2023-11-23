package hrport.project.main.pojo;

public class Skill {

	private Integer idCs;
	private Integer idSkill;
	private String nomeSkill;
	
	public Skill(Integer idCs, Integer idSkill, String nomeSkill) {
		
		this.idCs = idCs;
		this.idSkill = idSkill;
		this.nomeSkill = nomeSkill;
	}
	
	public Integer getIdCs() {
		return idCs;
	}
	public void setIdCs(Integer idCs) {
		this.idCs = idCs;
	}
	public Integer getIdSkill() {
		return idSkill;
	}
	public void setIdSkill(Integer idSkill) {
		this.idSkill = idSkill;
	}
	public String getNomeSkill() {
		return nomeSkill;
	}
	public void setNomeSkill(String nomeSkill) {
		this.nomeSkill = nomeSkill;
	}
	
}
