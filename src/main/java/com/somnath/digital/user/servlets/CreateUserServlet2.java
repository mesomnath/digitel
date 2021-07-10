package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;*/
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/addUserServlets")
public class CreateUserServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final String statement = null;
	//private Connection connection;
       
  /*public void init() {
    	
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }*/


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String number = request.getParameter("tel_number");
		String status = request.getParameter("step");
		
		PrintWriter out=response.getWriter();
		out.println("<html><body><h1>Your name= "+name+" and Your Telephone is= "+number+" Stage= "+status+"</h1></body></html>");

		
		
		/*String userid = request.getParameter("USER_ID");
		String username = request.getParameter("USER_NAME");
		String telnumber = request.getParameter("TEL_NUM");
		String status = request.getParameter("STATUS");
		
		try {
			Statement statement=connection.createStatement();
			int result = statement.executeUpdate("insert into digi values('"+userid+"','"+username+"','"+telnumber+"','"+status+"')");
			PrintWriter out = response.getWriter();
			if (result >0) {
				out.print("<h2>User created</h2>");
			}else {
				out.print("<h2>Error Found!</h2>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		
		
	}
	

	}
