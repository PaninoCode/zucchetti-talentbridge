package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Quiz;

public class QuizService {

	public static List<Quiz> getAllQuiz() throws Exception {
		
		List<Quiz> lista= new ArrayList<>();
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSet = null;
		try {
			
			con.setAutoCommit(false);
			String SQLUser = "SELECT q.idQuiz, q.nome\r\n"
							+ "FROM Quiz q\r\n"
							+ "LEFT JOIN posQuiz pq on q.idQuiz = pq.idQuiz\r\n";
			
			PreparedStatement Quiz = con.prepareStatement(SQLUser);
			
			resultSet = Quiz.executeQuery();
			
			con.commit();
			
			while(resultSet.next()){
				lista.add(new Quiz(resultSet.getInt("idQuiz"), resultSet.getString("nome")));
			}
			
			return lista;
		} catch (Exception e) {
			
			con.rollback();
			throw e;
			
		} finally {
			
			con.close();
		}
		
	}
}
