package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hrport.project.main.connectdb.ConnectDatabase;

public class Registration {

	private String email;
    private String password;
    private Boolean admin;
    private String nome;
    private String cognome;
    
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
	
	public static ResultSet getUser(String user, String password) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT u.* FROM Utenti u WHERE u.email = ? AND u.password = ?";
			
			PreparedStatement User = con.prepareStatement(SQLUser);
			User.setString(1, user);
			User.setString(2, password);
			
			ResultSet resultSet = User.executeQuery();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
		
		return null;
	}
}
