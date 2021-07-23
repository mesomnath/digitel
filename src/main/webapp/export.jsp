<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Export File</title>
</head>
<body>
<%
 
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0");
	String uid=request.getParameter("id");
	String tel_number=request.getParameter("tel_number");
	if(session.getAttribute("tel_number")==null)
		response.sendRedirect("login.jsp");

%>
		<%
			String filename = "c:\\csv\\csv_file.csv";
			Statement stmt;
			try
			{
			FileWriter fw = new FileWriter(filename);
			fw.append("ID");
			fw.append(',');
			fw.append("Name");
			fw.append(',');
			fw.append("Telephone Number");
			fw.append(',');
			fw.append("Current Stage");
			fw.append(',');
			fw.append("Date Created");
			fw.append(',');
			fw.append("Date Updated");
			fw.append('\n');
			
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
			String query = "select * from digitnew";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
			fw.append(rs.getString(1));
			fw.append(',');
			fw.append(rs.getString(2));
			fw.append(',');
			fw.append(rs.getString(3));
			fw.append(',');
			fw.append(rs.getString(4));
			fw.append(',');
			fw.append(rs.getString(6));
			fw.append(',');
			fw.append(rs.getString(7));
			fw.append(',');
			fw.append('\n');
			}
			fw.flush();
			fw.close();
			conn.close();
			
			//response.sendRedirect("c:\\csv\\csv_file.csv");
			 //response.sendRedirect("Dashboard.jsp?id="+uid);
			 out.println("Successfully Created CSV file.");
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
		
</body>
</html>