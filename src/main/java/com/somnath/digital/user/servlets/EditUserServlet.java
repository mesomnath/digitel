package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.annotation.WebServlet;

import java.sql.*;


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
		//String pwd = request.getParameter("pwd");
		//String current_Date = request.getParameter("c_date");
		//DateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
		//java.util.Date cdate = formatter.parse(current_Date);
		//Date date = new Date();
		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date udate = new java.sql.Date(utilDate.getTime());
	    System.out.println(udate);
		
	    String query = "Update digitnew set name=?,tel_number=?,step=?, date_updated=? where user_id="+u_id;
	    PreparedStatement ps=connection.prepareStatement(query);
	    
			ps.setString(1, name);
			ps.setLong(2, tel_number);
			ps.setString(3, step);
			//ps.setString(5, pwd);
			//ps.setDate(6, (java.sql.Date) cdate);
			ps.setDate(4, (java.sql.Date) udate);
			 System.out.println(udate + "" +name +""+tel_number+""+step);
			
			int i=ps.executeUpdate();
			
			if(i>0) {
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('User has been updated Successfully!');");
				pw.println("window.location.href = \"Dashboard.jsp\";");
				pw.println("</script>");
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
