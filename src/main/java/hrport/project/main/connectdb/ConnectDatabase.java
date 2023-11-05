package hrport.project.main.connectdb;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class ConnectDatabase {
    public static Connection getConnection() throws Exception {
        	
    	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=hrport;encrypt=false;trustServerCertificate=false";
    	
        String user = "hrport";
        String password = "Project1234";
        
        Connection connection = DriverManager.getConnection(url, user, password);

        return connection;
    }
}
