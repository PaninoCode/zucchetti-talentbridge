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
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.ProfiloUtente;

public class IstruzioneService {

	public static Set<Istruzione> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetIstr = null;
		Set<Istruzione> education = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT istr.* FROM Profilo pr INNER JOIN Istruzione istr ON pr.idCv = istr.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setString(1, idUtente);
			
			resultSetIstr = userEducation.executeQuery();
			
			while(resultSetIstr.next()) {
				
				education.add(new Istruzione(Integer.valueOf(resultSetIstr.getString("idIst")), Integer.valueOf(resultSetIstr.getString("idCv")), resultSetIstr.getString("titoloIstruzione"), resultSetIstr.getString("istituto"), resultSetIstr.getString("indirizzo"), Integer.valueOf(resultSetIstr.getString("voto")), LocalDate.parse(resultSetIstr.getString("dInizio")), LocalDate.parse(resultSetIstr.getString("dFine"))));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			education = new HashSet<>();
		} finally {
			
			resultSetIstr.close();
			con.close();
		}
		
		return education;
	}
	
	public static void insertIstruzInfo(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		Istruzione education = null;

		try {
			
			con.setAutoCommit(false);
			
			education = gson.fromJson(json, Istruzione.class);
					
			String SQL = "INSERT INTO \"Istruzione\" (\"idCv\", \"titoloIstruzione\", \"istituto\", \"indirizzo\", \"voto\", \"dInizio\", \"dFine\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?);";
			
			PreparedStatement insertIstruz = con.prepareStatement(SQL);
			
			insertIstruz.setInt(1, idCv);
			insertIstruz.setString(2, education.getTitoloIstruzione());
			insertIstruz.setString(3, education.getIstituto());
			insertIstruz.setString(4, education.getIndirizzo());
			insertIstruz.setInt(5, education.getVoto());
			insertIstruz.setDate(6, Date.valueOf(education.getdInizio()));
			insertIstruz.setDate(6, Date.valueOf(education.getdFine()));
			
			insertIstruz.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void updateIstruzInfo(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		Istruzione education = null;
			
		try {
			
			con.setAutoCommit(false);
			
			education = gson.fromJson(json, Istruzione.class);
					
			String SQL = "UPDATE \"Istruzione\""
					+ "SET titoloIstruzione = ?"
					+ "SET istituto = ?"
					+ "SET indirizzo = ?"
					+ "SET voto = ?"
					+ "SET dInizio = ?"
					+ "SET dFine = ?"
					+ "WHERE Istruzione.idIst = ?"
					+ "AND Istruzione.idCv = ?";
			
			PreparedStatement updateProfilo = con.prepareStatement(SQL);
			
			updateProfilo.setString(1, education.getTitoloIstruzione());
			updateProfilo.setString(2, education.getIstituto());
			updateProfilo.setString(3, education.getIndirizzo());
			updateProfilo.setInt(4, education.getVoto());
			updateProfilo.setDate(5, Date.valueOf(education.getdInizio()));
			updateProfilo.setDate(6, Date.valueOf(education.getdFine()));
			updateProfilo.setInt(7, education.getIdIst());
			updateProfilo.setInt(8, idCv);
			
			updateProfilo.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
}
