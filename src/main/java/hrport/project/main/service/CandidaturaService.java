package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Candidatura;
import hrport.project.main.pojo.Posizione;
import hrport.project.main.pojo.Utente;

public class CandidaturaService {

	public static List<Candidatura> getApplicationsFromPosition(Integer idPos) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetCandidati = null;
		List<Candidatura> candidaturaList = new ArrayList<>();

		try {

			con.setAutoCommit(false);
			String SQLquery = "SELECT can.*, u.* FROM Candidatura can INNER JOIN utenti u ON can.idUtente = u.idUtente WHERE can.idPos = ?";

			PreparedStatement candidaturaStatement = con.prepareStatement(SQLquery);
			candidaturaStatement.setInt(1, idPos);

			resultSetCandidati = candidaturaStatement.executeQuery();

			while (resultSetCandidati.next()) {

				Utente utente = new Utente(Integer.valueOf(resultSetCandidati.getString("idUtente")), resultSetCandidati.getString("email"), Boolean.valueOf((resultSetCandidati.getString("admin").equalsIgnoreCase("1")) ? "true" : "false"), resultSetCandidati.getString("nome"), resultSetCandidati.getString("cognome"));
				candidaturaList.add(new Candidatura(resultSetCandidati.getInt("idCand"), utente, resultSetCandidati.getInt("stato")));
			}

			resultSetCandidati.close();
			con.commit();
		} catch (Exception e) {

			resultSetCandidati.close();
			con.rollback();
			candidaturaList = new ArrayList<>();
		} finally {

			con.close();
		}

		return candidaturaList;
	}

	public static List<Candidatura> getApplicationsByIdUtente(String idUtente) throws Exception {

		Connection con = ConnectDatabase.getConnection();

		ResultSet resultSetApplications = null;
		List<Candidatura> applications = new ArrayList<>();

		try {

			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT pz.*, cn.* FROM Posizione pz INNER JOIN Candidatura cn ON pz.idPos = cn.idPos WHERE cn.idUtente = ?";

			PreparedStatement UserApplications = con.prepareStatement(SQLUserPositions);
			UserApplications.setString(1, idUtente);

			resultSetApplications = UserApplications.executeQuery();

			while (resultSetApplications.next()) {

				Posizione posizione = new Posizione(Integer.valueOf(resultSetApplications.getString("idPos")),
						resultSetApplications.getString("nome"),
						Boolean.valueOf(
								(resultSetApplications.getString("aperta").equalsIgnoreCase("1")) ? "true" : "false"),
						resultSetApplications.getString("fotoUrl"), resultSetApplications.getString("descrizione"));

				applications.add(new Candidatura(resultSetApplications.getInt("idCand"), posizione,
						resultSetApplications.getInt("stato")));

			}

			resultSetApplications.close();
			con.commit();
		} catch (Exception e) {

			resultSetApplications.close();
			con.rollback();
			applications = new ArrayList<>();
		} finally {

			con.close();
		}

		return applications;
	}

}
