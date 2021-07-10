package com.somnath.digital.user.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.annotation.WebServlet;

import java.sql.*;
import java.util.Random;
/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/addUserServlet")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Connection connection = ConnectionDb.getConnection();
		String name = request.getParameter("name");
		int tel_number = Integer.parseInt(request.getParameter("tel_number"));
		String step = request.getParameter("step");
		//String password = "C1234";
		//RandomPwdGenerator pwd = new RandomPwdGenerator();
		//String password = RandomPwdGenerator.randomPWD;
		
		/**
		 * Random password function from RandomPwdGenerator class
		 *
		 */
		RandomPwdGenerator pwd = new RandomPwdGenerator();
		String password = pwd.generateRandomChars("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz#$%!@*()^",8);
		
		/**
		 * 
		 * Random userid creation field
		 */
		
		
		Random u=new Random();
		int user_id=100+u.nextInt(899);
		
		
		/**
		 * Incrementing User id sending data to database.
		 *
		PreparedStatement pi=connection.prepareStatement("select max(user_id) from diginew");
		ResultSet rs=pi.executeQuery();*/
		
		
		
		/**if(rs.next()) {
			user_id=rs.getInt(1);
			user_id++;*/
			
			PreparedStatement ps=connection.prepareStatement("insert into digitnew values(?,?,?,?,?)");
			ps.setInt(1, user_id);
			ps.setString(2, name);
			ps.setInt(3, tel_number);
			ps.setString(4, step);
			ps.setString(5, password);
			
			int i=ps.executeUpdate();
			
			if(i>0) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("error.jsp");
			}
		
		
		
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}

}
