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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
            <div class="col-md-12">
               
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #044068;">
                     <div class="row">
                            <div class="col-6">
                                <b><i class="bi bi-people-fill"></i>&nbsp;Users list</b>
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
                                <th scope="col">Created On</th>
                                <th scope="col">Last Updated On</th>
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
						    	   query="SELECT USER_ID,NAME,TEL_NUMBER,STEP,DATE_CREATED,DATE_UPDATED FROM Digitnew";
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
						                <td> <%=rs.getDate("DATE_CREATED") %></td>
						                <td> <%=rs.getDate("DATE_UPDATED") %></td>
						                <td>
		                                    <a href="./edituser.jsp?id=<%=rs.getInt("user_id")%>" class="btn btn-sm bg-warning text-dark"><i class="bi bi-pencil-square"></i>&nbsp;Edit</a>
		                                    <a href="./deleteuser.jsp?id=<%=rs.getInt("user_id")%>" class="btn btn-sm bg-danger text-white"><i class="bi bi-trash-fill"></i>&nbsp;Delete</a>
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
                       <a href="./Logout" class="btn btn-danger float-left"><i class="bi bi-arrow-bar-left"></i></i>&nbsp;Logout</a>
                        <a href="./AddUser.jsp" class="btn btn-success float-right"><i class="bi bi-person-plus-fill"></i>&nbsp;Create New User</a>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>
</html>