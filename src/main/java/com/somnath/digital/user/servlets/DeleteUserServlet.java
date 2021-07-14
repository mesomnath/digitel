package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection connection = ConnectionDb.getConnection();
		int id=Integer.parseInt(request.getParameter("id"));
		
		
		PreparedStatement ps=connection.prepareStatement("DELETE FROM digitnew WHERE user_id=?");
		//Statement st=connection.createStatement();
		//int i=st.executeUpdate("DELETE FROM digitnew WHERE user_id="+id);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		
		if (i>0){
			
			//out.println("Data Deleted Successfully!");
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('User has been deleted!');");
			pw.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("./Dashboard.jsp");
			rd.include(request, response);
		}
		
		else{
			response.sendRedirect("error.jsp");
		}
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
		
	}

}
