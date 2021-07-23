package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connectiondb.ConnectionDb;
import jakarta.servlet.http.HttpSession;

/*import org.apache.log4j.Appender;
import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Layout;
import org.apache.log4j.PatternLayout;*/
//import org.apache.logging.log4j.LogManager;
//import org.apache.log4j.Logger;

/**
 * Servlet implementation class Login
 */

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private static final Logger logger = Logger.getLogger(Login.class);
	
	/*public static void main(String[] args) {
		
		
		logger.debug("Login page Accessed");
		logger.info("Login page Accessed");
		logger.warn("Wrong usernane password");
		logger.error("Wrong usernane password1");
		logger.fatal("Fatal Error");
		
	}*/
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String tel_number = request.getParameter("tel_number");
		    String password = request.getParameter("password");
		    java.util.Date utilDate = new java.util.Date();
		    java.sql.Date date = new java.sql.Date(utilDate.getTime());
		    /*logger.debug("Login page Accessed");
			logger.info("Login page Accessed");
			logger.warn("Wrong usernane password");
			logger.error("Wrong usernane password1");
			logger.fatal("Fatal Error");
			
			System.out.println("DONE");*/
		    //int uid = 0;
		    //int user_id = 0;
		    try {
		      Connection con = ConnectionDb.getConnection();		    
		      PreparedStatement pi=con.prepareStatement("select user_id,tel_number,password, date_updated,access_id from digitnew where tel_number='"+tel_number+"' and password='"+password+"'");
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
		    	  //response.sendRedirect("Dashboard.jsp");
		    	  HttpSession session = request.getSession();
		    	  session.setAttribute("tel_number", tel_number);
		    	  
		    	  int accessid = rs.getInt("access_id");
		    	  int uid = rs.getInt("user_id");
		    	  Date udate = rs.getDate("date_updated");
		    	  //Date udate = SimpleDateFormat.parse(udate1);
		    	  System.out.println(udate);
		    	  System.out.println(accessid +""+ uid);
		    	  session.setAttribute("user_id", uid);
		    	  
		    	  /***date duration**/
		    	  
		    	  long date1 = date.getTime();
		    	  long date2 = udate.getTime();
		    	  //long timediff = 0;
		    	  long timediff = date1 -date2;
		    	  int daysdiff =(int)(timediff /(1000*60*60*24));
		    	  System.out.println(daysdiff);
		    	  if (daysdiff <= 60) {
		    	  if(accessid == 2) {
		    		  response.sendRedirect("user-dashboard.jsp?id="+uid);
		    		  request.setAttribute("user_id",uid);
		    		  request.setAttribute("daysdiff", daysdiff);
		    
		    		  System.out.println(daysdiff);
		    		  //RequestDispatcher rd = request.getRequestDispatcher("user-dashboard.jsp");
		    		  //rd.forward(request,response);
		    	  }
		    	  if(accessid == 1) {
		    		  response.sendRedirect("Dashboard.jsp?id="+uid);
		    		  // RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
		    		  //rd.forward(request,response);
		    	  }
		    	  } else {
		    		  response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Your Password has expired! Reset Now');");
						pw.println("window.location.href = \"forget-password.jsp\";");
						pw.println("</script>");
		    	  }
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
