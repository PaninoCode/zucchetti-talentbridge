package hrport.project.main.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.EspLavorativa;

public class EspLavorativaService {

	public static Set<EspLavorativa> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetEsp = null;
		Set<EspLavorativa> experiences = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT esp.* FROM Profilo pr INNER JOIN EspLavorativa esp ON pr.idCv = esp.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userExperiences = con.prepareStatement(SQLUserPositions);
			userExperiences.setString(1, idUtente);
			
			resultSetEsp = userExperiences.executeQuery();
			
			while(resultSetEsp.next()) {
				
				experiences.add(new EspLavorativa(Integer.valueOf(resultSetEsp.getString("idEL")), Integer.valueOf(resultSetEsp.getString("idCv")), resultSetEsp.getString("azienda"), LocalDate.parse(resultSetEsp.getString("dInizio")), LocalDate.parse(resultSetEsp.getString("dFine")), resultSetEsp.getString("posizione"), resultSetEsp.getString("funzione"), resultSetEsp.getString("indirizzo")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			experiences = new HashSet<>();
		} finally {
			
			resultSetEsp.close();
			con.close();
		}
		
		return experiences;
	}
	
	public static void insertEsperienza(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		EspLavorativa experience = null;

		try {
			
			con.setAutoCommit(false);
			
			experience = gson.fromJson(json, EspLavorativa.class);
					
			String SQL = "INSERT INTO \"EspLavorativa\" (\"idCv\", \"azienda\", \"dInizio\", \"dFine\", \"posizione\", \"funzione\", \"indirizzo\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?);";
			
			PreparedStatement insertEsperienza = con.prepareStatement(SQL);
			
			insertEsperienza.setInt(1, idCv);
			insertEsperienza.setString(2, experience.getAzienda());
			insertEsperienza.setDate(3, Date.valueOf(experience.getdInizio()));
			insertEsperienza.setDate(4, Date.valueOf(experience.getdFine()));
			insertEsperienza.setString(5, experience.getPosizione());
			insertEsperienza.setString(6, experience.getFunzione());
			insertEsperienza.setString(7, experience.getIndirizzo());
			
			insertEsperienza.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void updateEsperienza(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		EspLavorativa experience = null;
			
		try {
			
			con.setAutoCommit(false);
			
			experience = gson.fromJson(json, EspLavorativa.class);
					
			String SQL = "UPDATE \"EspLavorativa\""
					+ "SET azienda = ?,"
					+ "dInizio = ?,"
					+ "dFine = ?,"
					+ "posizione = ?,"
					+ "funzione = ?,"
					+ "indirizzo = ?"
					+ "WHERE EspLavorativa.idEL = ?"
					+ "AND EspLavorativa.idCv = ?";
			
			PreparedStatement updateEsperienza = con.prepareStatement(SQL);
			
			updateEsperienza.setString(1, experience.getAzienda());
			updateEsperienza.setDate(2, Date.valueOf(experience.getdInizio()));
			updateEsperienza.setDate(3, Date.valueOf(experience.getdFine()));
			updateEsperienza.setString(4, experience.getPosizione());
			updateEsperienza.setString(5, experience.getFunzione());
			updateEsperienza.setString(6, experience.getIndirizzo());
			updateEsperienza.setInt(7, experience.getIdEl());
			updateEsperienza.setInt(8, idCv);
			
			updateEsperienza.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void deleteEsperienza(Integer idTable, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
			
		try {
			
			con.setAutoCommit(false);
					
			String SQL = "DELETE FROM EspLavorativa WHERE EspLavorativa.idEL = ? AND EspLavorativa.idCv = ?;";
			
			PreparedStatement deleteExperience = con.prepareStatement(SQL);
			
			deleteExperience.setInt(1, idTable);
			deleteExperience.setInt(2, idCv);
			
			deleteExperience.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
}
