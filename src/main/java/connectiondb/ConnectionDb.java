package connectiondb;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionDb {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String url = "jdbc:oracle:SYSTEM:@//localhost:1521/XE";
		String user ="SYSTEM";
		String password="Password1234";
		
		
		try {
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("Driver is loaded Successfully");
		Connection con=DriverManager.getConnection(url, user, password);
		System.out.println("Connnection is successfull with"+" "+con);
		}
		
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
