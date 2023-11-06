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
    private String telefono;
    
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public void registerNewUser() throws Exception {
		
		//Connection and Insert in Database
		
		Connection con = ConnectDatabase.getConnection();
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "INSERT INTO \"Utenti\" (\"email\", \"password\", \"admin\", \"nome\", \"cognome\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?);"
					+ "SELECT TOP 1 Utenti.idUtente FROM Utenti ORDER BY Utenti.idUtente";
			
			PreparedStatement newUser = con.prepareStatement(SQLUser);
			newUser.setString(1, getEmail());
			newUser.setString(2, getPassword());
			newUser.setBoolean(3, getAdmin());
			newUser.setString(4, getNome());
			newUser.setString(5, getCognome());
			
			ResultSet resultSet = newUser.executeQuery();
			
			// definire bene cosa è not null e cosa è nullable
			
			// manca registrazione profilo numero di telefono perché ci sono campi not nullable
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
}
