<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<style>
    *{
        font-family: 'Inter',sans-serif;
    }
</style>

<body style="background-color: #efefef;">
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-1"></div>
            <div class="col-md-10">
               
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #044068;">
                     <div class="row">
                            <div class="col-6">
                                <b>Users list</b>
                            </div>
                            <div class="col-6">
                                <form action="" method="get">
                                    <input type="text" name="search" placeholder="Search..." class="form-control"/>
                                </form> 
                            </div>
                        </div>
                    </div>
                    <div class="card-body overflow-scroll" style="max-height:480px;overflow-y:scroll">
                        
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Telephone Number</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                            <%
                             Connection con;
						     Statement stmt;
						     ResultSet rs;
						     try
						     {
						    	 
						    	 Class.forName("oracle.jdbc.driver.OracleDriver");
						    	 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
						    	 stmt=con.createStatement();
						    	 String search=request.getParameter("search");
						    	 String query;
						    	 if(search!=null){
						    	  query = "SELECT * FROM digitnew WHERE user_id like '%"+search+"%' OR name like '%"+search+"%' OR tel_number like'%"+search+"%'";
						    	 }
						    	 else{
						    	   query="SELECT USER_ID,NAME,TEL_NUMBER,STEP FROM Digitnew";
						    	 }
						    	 rs=stmt.executeQuery(query);
						    	 while(rs.next())
						    	 {
						   %>
						              <tr>
						                <td scope="row"> <%=Integer.parseInt(rs.getString("user_id"))%></td>
						                <td> <%=rs.getString("name") %></td>
						                <td> <%=Long.parseLong(rs.getString("tel_number")) %></td>
						                <td style="text-transform:uppercase"> <%=rs.getString("step") %></td>
						                <td>
		                                    <a href="#" class="btn btn-sm bg-warning text-dark">Edit</a>
		                                    <a href="./deleteuser.jsp?id=<%=rs.getInt("user_id")%>" class="btn btn-sm bg-danger text-white">Delete</a>
		                                </td>
						               </tr>
						         <% 
						    	 }
						    	 con.close();   		 
						    	 }
						    	 catch(Exception e)
						    	 {
						    	 out.print(e);
						    	 }
						         %>
                              
                          </table>
                          
                    </div>
                    <div class="card-footer">
                       
                        <a href="./AddUser.jsp" class="btn btn-success float-right">Add New User</a>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>
</html>