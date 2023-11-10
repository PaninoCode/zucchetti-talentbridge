package hrport.project.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("HelloWorld");
		
        try {
        	/*
        	Connection connection = ConnectDatabase.getConnection();
        	String query = "";
            Statement statement = connection.createStatement();
            query = "SELECT * FROM Utenti";
            ResultSet resultSet = statement.executeQuery(query);
            ResultSetMetaData rsmd = resultSet.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while (resultSet.next()) {
                for (int i = 1; i <= columnsNumber; i++) {
                    if (i > 1) System.out.print(",  ");
                    String columnValue = resultSet.getString(i);
                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
                }
                System.out.println("");
            }
            resultSet.close();
            statement.close();
            connection.close();
            */
        	Utente utente = UtenteService.getUserByEmailAndPassword("utente1@example.com", "password123");
        	System.out.println(utente.getPosizioni());
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
