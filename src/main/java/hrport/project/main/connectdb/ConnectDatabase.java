package hrport.project.main.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class ConnectDatabase {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=hrport;encrypt=false;trustServerCertificate=false";
        	
            String user = "hrport";
            String password = "Project1234";
            
            connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
