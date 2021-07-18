<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>

<style>
    *{
        font-family: 'Inter',sans-serif;
    }
</style>
<body style="background-color: #efefef;">

<%
 
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0");
	
	if(session.getAttribute("tel_number")==null)
		response.sendRedirect("login.jsp");

%>
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form method="post" action="updateUserServlet">
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #044068;"><i class="bi bi-person-fill"></i><b>&nbsp;Edit user</b></div>
                    <div class="card-body">
							 <%
							String id=request.getParameter("id");
							try{
							Class.forName("oracle.jdbc.OracleDriver");
							Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
							Statement st=conn.createStatement();
							String query = "SELECT * FROM digitnew WHERE user_id='"+id+"'";
							ResultSet rs =st.executeQuery(query);
							while(rs.next()){
							
							
							%>
                         
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name" value="<%= rs.getString("name")%>">
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="tel_number" value=<%=Long.parseLong(rs.getString("tel_number")) %>>
                            </div>
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage</b></label>
                                <p> <%=rs.getString("step") %></p>
                                <select name="step" class="form-control">
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                            
                            
                            <input type="hidden" name="user_id" value="<%=rs.getInt("user_id") %>">
                            <input type="hidden" name="pwd" value="<%=rs.getString("password") %>">
                            <input type="hidden" name="cdate" value="<%=rs.getDate("DATE_CREATED") %>">
                          
                    </div>
                    <div class="card-footer">
                        <span class="float-left">  
                        <a href="./Dashboard.jsp" class="btn bg-dark text-white"><i class="bi bi-arrow-left"></i>&nbsp;Back to Dashboard</a>
                        </span>
                        <button type="submit" class="btn btn-success float-right centered"><i class="bi bi-person-check-fill"></i>&nbsp;Update User</button>
                    </div>
                </div>
                
                <%

					}
					  		 
					}
					catch(Exception e)
					{
					out.print(e);
					}
					%>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        
    </div>
</body>
</html>