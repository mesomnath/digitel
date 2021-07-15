package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connectiondb.ConnectionDb;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgetPasswordServlet
 */
@WebServlet("/forget")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {			
			Connection con = ConnectionDb.getConnection();
			long tel_number= Long.parseLong(request.getParameter("tel_number"));
			String password = request.getParameter("password");
			PreparedStatement ps = con.prepareStatement("update digitnew  set password=? where tel_number=?");
			ps.setLong(2,tel_number);
			ps.setString(1, password);
			int i = ps.executeUpdate();
			if(i>0) {
				
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Password Updated Successfully!');");
				pw.println("window.location.href = \"login.jsp\";");
				pw.println("</script>"); 
			}
			else {
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Kindly Provide Registered Mobile Number!');");
				pw.println("window.location.href = \"forget-password.jsp\";");
				pw.println("</script>"); 
			}
					
			
			
		}
		
		catch (SQLException e) {
		      e.printStackTrace();
		 }
		
		
	}

}
