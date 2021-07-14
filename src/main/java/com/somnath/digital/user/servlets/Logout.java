package com.somnath.digital.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
        PrintWriter pw=response.getWriter();  
          
        //request.getRequestDispatcher("link.html").include(request, response);  
          
        HttpSession session=request.getSession();  
        session.invalidate();  
          
        pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Logged out Successfully');");
		pw.println("window.location.href = \"index.jsp\";");
		pw.println("</script>"); 
        pw.close();  
	}

}
