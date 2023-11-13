package hrport.project.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.*;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("HelloWorld");
		
		try {
			Quiz q= Quiz.initQuiz(1);
			
			System.out.println("Nome: "+q.getNome()+
					"\nPunteggio domanda 1: "+q.domandaIndex(0).getPunteggio()+
					"\nTesto risposta n2: "+q.domandaIndex(0).rispostaIndex(1).getTesto());
			System.out.println(((Domanda)q.getDomande()[0]).getTesto());
			
			int[] array= {1,2,3,4};
			Quiz.risposteDate(2, 1, array);
			
			System.out.println(Quiz.getPunteggio(1, 1));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//        try {
//        	Connection connection = ConnectDatabase.getConnection();
//        	String query = "";
//            Statement statement = connection.createStatement();
//            query = "SELECT * FROM Utenti";
//            ResultSet resultSet = statement.executeQuery(query);
//            ResultSetMetaData rsmd = resultSet.getMetaData();
//            int columnsNumber = rsmd.getColumnCount();
//            while (resultSet.next()) {
//                for (int i = 1; i <= columnsNumber; i++) {
//                    if (i > 1) System.out.print(",  ");
//                    String columnValue = resultSet.getString(i);
//                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
//                }
//                System.out.println("");
//            }
//            resultSet.close();
//            statement.close();
//            connection.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
	}

}
