package hrport.project.main.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;

public class Quiz {
	private int id;
	private String nome;
	private List<Domanda> listaDomande= new ArrayList<>();
	
	public Quiz(int id, String nome, List<Domanda> listaDomande) {
		this.setId(id);
		this.setNome(nome);
		this.setListaDomande(listaDomande);
	}
	
	public int getId() {
		return id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public Object[] getDomande() {
		return listaDomande.toArray();
	}
	
	public Domanda domandaIndex(int index) {
		return listaDomande.get(index);
	}
	
	public void setId(int id) {
		this.id=id;
	}
	
	public void setNome(String nome) {
		this.nome=nome;
	}
	
	public void setListaDomande(List<Domanda> listaDomande){
		
		this.listaDomande= listaDomande;
	}
	
	public static int getPunteggio(int idQuiz, int idUtente) throws Exception{
		Connection con = ConnectDatabase.getConnection();
		try {
			con.setAutoCommit(false);
			ResultSet resultSet= null;
			Quiz q= Quiz.initQuiz(idQuiz);
			String SQLUser="SELECT SUM(d.punteggio) as totale\r\n"
					+ "FROM RispostaData rd\r\n"
					+ "JOIN Risposta r ON rd.idRisposta = r.idRisposta\r\n"
					+ "JOIN Domanda d ON r.idDomanda = d.idDomanda\r\n"
					+ "WHERE r.giusta=1 AND d.idQuiz=? AND idUtente = ?";
			
			PreparedStatement RispDate = con.prepareStatement(SQLUser);
			
			RispDate.setInt(1, idQuiz);
			RispDate.setInt(2, idUtente);
			
			
			resultSet = RispDate.executeQuery();
			con.commit();
			resultSet.next();
			return resultSet.getInt(1);
			
		} catch(Exception e) {
			con.rollback();
			throw e;
		} finally {
			con.close();
		}
		
	}
	
	public static void insertRisposteDate(int idUtente, int idQuiz, int risUtente[]) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		try {
			int idRisposte[]= new int[risUtente.length];
			Quiz q= Quiz.initQuiz(idQuiz);
			
			for(int i=0; i<risUtente.length; i++) {
				idRisposte[i]=q.domandaIndex(i).rispostaIndex(risUtente[i]-1).getId(); //TOGLIERE IL "-1" SE L'INDEX è DA 0 A 3
				System.out.println(idRisposte[i]);
			}
			
			con.setAutoCommit(false);
			String SQLUser="INSERT INTO \"RispostaData\" (\"idUtente\", \"idRisposta\") VALUES (?,?)";
			PreparedStatement newRisp = con.prepareStatement(SQLUser);
			for (int idRisposta : idRisposte) {
			    newRisp.setInt(1, idUtente);
			    newRisp.setInt(2, idRisposta);
			    newRisp.addBatch();
			}
			newRisp.executeBatch();
			con.commit();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
	}
	
	public static Quiz initQuiz(int id) throws Exception {
		List<Domanda> lista= new ArrayList<>();
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT q.* FROM Quiz q WHERE q.idQuiz= ?";
			
			PreparedStatement Quiz = con.prepareStatement(SQLUser);
			Quiz.setInt(1, id);
			
			resultSet = Quiz.executeQuery();
			
			con.commit();
			
			if (resultSet.next()) {
	            
	            // Ora, esegui la query per ottenere le domande associate al quiz
	            String SQLDomande = "SELECT d.* FROM Quiz q JOIN Domanda d ON q.idQuiz = d.idQuiz WHERE q.idQuiz = ?";
	            PreparedStatement domandeStatement = con.prepareStatement(SQLDomande);
	            domandeStatement.setInt(1, id);
	            ResultSet domandeResultSet = domandeStatement.executeQuery();

	            while (domandeResultSet.next()) {
	                int domandaId = domandeResultSet.getInt(2);
	                String testoDomanda = domandeResultSet.getString(3);
	                int punteggioDomanda = domandeResultSet.getInt(4);
	                Domanda domanda= new Domanda(domandaId, testoDomanda, punteggioDomanda);
	                
	                domanda.setRisposte(con, domandaId);
	                
	                lista.add(domanda);
	            }

	            Quiz quiz = new Quiz(resultSet.getInt(1), resultSet.getString(2), lista);
	            return quiz;
	        } else {
	            // Restituisci null o lancia un'eccezione se il quiz non è stato trovato
	            return null; // oppure gestisci l'eccezione
	        }
		} catch (Exception e) {
			
			con.rollback();
			throw e;
			
		} finally {
			
			con.close();
		}
		
	}
	
	
		
}
