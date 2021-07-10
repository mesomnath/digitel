package connectiondb;

import java.sql.*;
public class ConnectionDb {

	public static Connection connection;
		
		
		static {
		try {
		Class.forName("oracle.jdbc.OracleDriver");		
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
		System.out.println("Driver is connected");
		//Statement statement = connection .createStatement();
		//int result = statement.executeUpdate("INSERT INTO digitnew values (11, 'S.Kumar', 9876543218, 'ACTIVE','Cr3r')");
		//System.out.println(result+" rows got inserted");
		
		}
				
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		}
	public static Connection getConnection() {
		return connection;
	}

}

/*package connectiondb;

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
		
		
		Connection connection = DriverManager.getConnection(url, user, password);
		System.out.println("Driver is connected");
		Statement statement = connection .createStatement();
		int result = statement.executeUpdate("INSERT INTO digitnew values (11, 'S.Kumar', 9876543218, 'ACTIVE', 'psw')");
		System.out.println(result+" rows got inserted");
		
		}
		
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

}*/
