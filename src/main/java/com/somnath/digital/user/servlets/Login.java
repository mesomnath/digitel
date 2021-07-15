package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String tel_number = request.getParameter("tel_number");
		    String password = request.getParameter("password");	
		    //int user_id = 0;
		    try {
		      Connection con = ConnectionDb.getConnection();		    
		      PreparedStatement pi=con.prepareStatement("select user_id,tel_number,password from digitnew where tel_number='"+tel_number+"' and password='"+password+"'");
		      ResultSet rs = pi.executeQuery();
		      
		      if(rs.next()) {
		    	  //if(tel_number.equals(tel_number)&& password.equals(password))
		    	  //{
		    		  /*response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Logged in Successfully');");
						pw.println("window.location.href = \"Dashboard.jsp\";");
						pw.println("</script>"); */
		    	  response.sendRedirect("Dashboard.jsp");
		    	  HttpSession session = request.getSession();
		    	  session.setAttribute("tel_number", tel_number);
		    	  //}
		    	 /* else {
    		  
		    		    response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Invalid Username or Passwordjbbh!');");
						pw.println("window.location.href = \"login.jsp\";");
						pw.println("</script>");
		    	  }	*/        
		      }
		      
		      else {
		    	  response.setContentType("text/html");
					PrintWriter pw=response.getWriter();
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Invalid Username or Password!');");
					pw.println("window.location.href = \"login.jsp\";");
					pw.println("</script>");
		      }
		      
		    } catch (SQLException e) {
		      e.printStackTrace();
		    }
	}

}
