package connectiondb;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

public class ConnectionDb {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521/XE";
		String user ="SYSTEM";
		String password="Password1234";
		
		
		try {
		Class.forName("oracle.jdbc.OracleDriver");
		//System.out.println("Driver is loaded Successfully");
		//Connection con=DriverManager.getConnection(url, user, password);
		//System.out.println("Connnection is successfull with"+" "+con);
		
		System.out.println("Driver is connected");
		Connection connection = DriverManager.getConnection(url, user, password) ;
		Statement statement = connection .createStatement();
		int result = statement.executeUpdate("INSERT INTO digi values (11, 'S.Kumar', 9876543218, 'ACTIVE')");
		System.out.println(result+" rows got inserted");
		
		}
		
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
