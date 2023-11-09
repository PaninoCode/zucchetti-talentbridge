package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import hrport.project.main.connectdb.ConnectDatabase;

public class Utente {

	private String email;
    private String password;
    private Boolean admin;
    private String nome;
    private String cognome;
    
    @JsonCreator(mode = JsonCreator.Mode.PROPERTIES)
    Utente(@JsonProperty("email") String email, @JsonProperty("password") String password, @JsonProperty("admin") Boolean admin, @JsonProperty("nome") String nome, @JsonProperty("cognome") String cognome) {
    	
    	this.setEmail(email);
    	this.setPassword(password);
    	this.setAdmin(admin);
    	this.setNome(nome);
    	this.setCognome(cognome);
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
	public Boolean getAdmin() {
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
			newUser.setBoolean(3, getAdmin());
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
	
	public static Utente getUser(String user, String password) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.email = ? AND u.password = ?";
			
			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setString(1, user);
			User.setString(2, password);
			
			resultSet = User.executeQuery();
			
			con.commit();
			
			resultSet.next();
			Utente utente = new Utente(resultSet.getString(2), resultSet.getString(3), Boolean.valueOf(resultSet.getString(4)), resultSet.getString(5), resultSet.getString(6));
			
			return utente;
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
}
