package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import hrport.project.main.connectdb.ConnectDatabase;

public class Utente {

	private Integer idUtente;
	private String email;
    private String password;
    private Boolean admin;
    private String nome;
    private String cognome;
    private List<Posizione> posizioni;
    private ProfiloUtente profile;
    
    public Utente(Integer idUtente, String email, Boolean admin, String nome, String cognome, ProfiloUtente profile) {
    	
    	this.setIdUtente(idUtente);
    	this.setEmail(email);
    	this.setAdmin(admin);
    	this.setNome(nome);
    	this.setCognome(cognome);
    	this.setProfile(profile);
    }
    
    public Utente(Integer idUtente, String email, Boolean admin, String nome, String cognome, List<Posizione> posizioni) {
    	
    	this.setIdUtente(idUtente);
    	this.setEmail(email);
    	this.setAdmin(admin);
    	this.setNome(nome);
    	this.setCognome(cognome);
    	this.setPosizioni(posizioni);
    }
    
    public Utente(Integer idUtente, String email, Boolean admin, String nome, String cognome) {
    	
    	this.setIdUtente(idUtente);
    	this.setEmail(email);
    	this.setAdmin(admin);
    	this.setNome(nome);
    	this.setCognome(cognome);
    }
    
    @JsonCreator(mode = JsonCreator.Mode.PROPERTIES)
    Utente(@JsonProperty("email") String email, @JsonProperty("password") String password, @JsonProperty("admin") Boolean admin, @JsonProperty("nome") String nome, @JsonProperty("cognome") String cognome) {
    	
    	this.setEmail(email);
    	this.setPassword(password);
    	this.setAdmin(admin);
    	this.setNome(nome);
    	this.setCognome(cognome);
    }
    
    public Integer getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(Integer idUtente) {
		this.idUtente = idUtente;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean isAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
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
	public List<Posizione> getPosizioni() {
		return posizioni;
	}
	public void setPosizioni(List<Posizione> posizioni) {
		this.posizioni = posizioni;
	}
	public String getProfile() {
		return cognome;
	}
	public void setProfile(ProfiloUtente profile) {
		this.profile = profile;
	}
	
	public void registerNewUser() throws Exception {
		
		//Connection and Insert in Database
		
		Connection con = ConnectDatabase.getConnection();
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "INSERT INTO \"Utenti\" (\"email\", \"password\", \"admin\", \"nome\", \"cognome\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?);";
			
			PreparedStatement newUser = con.prepareStatement(SQLUser);
			newUser.setString(1, getEmail());
			newUser.setString(2, getPassword());
			newUser.setBoolean(3, isAdmin());
			newUser.setString(4, getNome());
			newUser.setString(5, getCognome());
			
			newUser.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
	
	private Boolean authenticationOldPassword(String oldPassword) {
		
		return this.getPassword() == oldPassword ? true : false;
	}
	
	public void updatePassword(String oldPassword, String newPassword) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		if(authenticationOldPassword(oldPassword)) {
			
			try {
				
				con.setAutoCommit(false);
				String SQLUser = "UPDATE \"Utenti\" (\"password\")\r\n"
						+ "SET password = ?"
						+ "WHERE Utenti.idUtente = " + this.getIdUtente();
				
				PreparedStatement newUser = con.prepareStatement(SQLUser);
				newUser.setString(1, getPassword());
				
				newUser.executeUpdate();
				
				con.commit();
			} catch (Exception e) {
				
				con.rollback();
				throw e;
			} finally {
				
				con.close();
			}
		} else {
			
			throw new Exception("password precedente non corretta");
		}
	}
}
