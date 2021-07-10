
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
String id=request.getParameter("id");
out.println(id);
//int id = Integer.parseInt(request.getParameter("user_id"));
//int u_id =Integer.parseInt(id);
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
Statement st=conn.createStatement();
int i = st.executeUpdate("DELETE FROM digitnew WHERE user_id='"+id+"'");
//st.executeUpdate("DELETE FROM digitnew WHERE user_id='"+Integer.valueOf(id)+"'");
//response.sendRedirect("./Dashboard.jsp");
if(i>0){
	out.println("<script type=\"text/javascript\">");
    out.println("alert('User has been deleted successfully!');");
    out.println("window.location.href = \"Dashboard.jsp\";");
    out.println("</script>");
	//response.sendRedirect("./Dashboard.jsp");
}
else{
	out.println("Error occured");
}

%>
</body>
</html>