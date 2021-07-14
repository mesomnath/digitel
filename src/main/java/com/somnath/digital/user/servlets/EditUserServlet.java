package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.annotation.WebServlet;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/updateUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
		Connection connection = ConnectionDb.getConnection();
		String name = request.getParameter("name");
		long tel_number = Long.parseLong(request.getParameter("tel_number"));
		String step = request.getParameter("step");
		String user_id = request.getParameter("user_id");
		int u_id = Integer.parseInt(user_id);
		String pwd = request.getParameter("pwd");
		String current_Date = request.getParameter("c_date");
		DateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
		java.util.Date cdate = formatter.parse(current_Date);
		//Date date = new Date();
		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date udate = new java.sql.Date(utilDate.getTime());
		
		
		//String password = "C1234";
		//RandomPwdGenerator pwd = new RandomPwdGenerator();
		//String password = RandomPwdGenerator.randomPWD;
		
		/**
		 * Random password function from RandomPwdGenerator class
		 *
		 
		RandomPwdGenerator pwd = new RandomPwdGenerator();
		String password = pwd.generateRandomChars("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz#$%!@*()^",8);
		
		**
		 * 
		 * Random userid creation field
		 *
		
		
		//Random u=new Random();
		//int user_id=100+u.nextInt(899);
		
		int user_id=1000; 
		
		
		**
		 * Incrementing User id sending data to database.
		 *
		PreparedStatement pi=connection.prepareStatement("select max(user_id) from digitnew");
		
		*/
		String query = "Update users set user_id=?,name=?,tel_number=?,step=?,password=?, date_created=?,date_updated=? where id="+u_id;
	    PreparedStatement ps=connection.prepareStatement(query);
	    //ResultSet rs=ps.executeQuery();
		
			//user_id=rs.getInt(1);
			//user_id++;
			
			
			ps.setInt(1, u_id);
			ps.setString(2, name);
			ps.setLong(3, tel_number);
			ps.setString(4, step);
			ps.setString(5, pwd);
			ps.setDate(6, (java.sql.Date) cdate);
			ps.setDate(7, (java.sql.Date) udate);
			
			int i=ps.executeUpdate();
			
			if(i>0) {
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('User has been updated Successfully!');");
				pw.println("window.location.href = \"Dashboard.jsp\";");
				pw.println("</script>");
				//RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
				//rd.include(request, response);
				//request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
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
