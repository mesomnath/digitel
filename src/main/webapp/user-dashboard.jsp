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
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
</head>
<style>
    *{
        font-family: 'Lato',sans-serif;
        
    }
    .btn:focus{
    box-shadow:none !important;
     }
     input[type="text"], textarea, select {
       outline: none;
       box-shadow:none !important;
       border:1px solid #ccc !important;
       }
       .btn,  input[type="text"], textarea, select, .card, .card-body,.card-footer{
       border-radius:0px !important;
       }
       
</style>

<body style="background-color: #F4F1EA;">
<%
 
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires","0");
	
	String uid1 = request.getParameter("user_id");
	
	 System.out.println(uid1);
	 String tel_number=request.getParameter("tel_number");
	
	if(session.getAttribute("tel_number")==null)
		response.sendRedirect("login.jsp");

%>
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-1"></div>
            <div class="col-md-12">
               
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #232F3E;">
                     <div class="row">
                            <div class="col-9">
                                <b><i class="bi bi-people-fill"></i>&nbsp;User Information</b>
                            </div>
                            <div class="col-3">
                                
                            </div>
                        </div>
                    </div>
                    <div class="card-body overflow-scroll" style="max-height:480px;overflow-y:scroll">
                        
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">Name </th>
                                <th scope="col">Telephone Number</th>
                                <th scope="col">Status</th>
                                <th scope="col">Created On</th>
                                <th scope="col">Last Updated On</th>
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
						    	 String uid=request.getParameter("uid");
						    	 System.out.println(uid);
						    	 String query;
						    	 
						    	  //String userid = (String)request.getAttribute("user_id");
						    	  //int uid = Integer.parseInt(userid);
						    	  //String password = (String)request.getAttribute("password");
						    	  //session.setAttribute("user_id", userid);
						    	  //session.setAttribute("Password", password);
						    	 if(search!=null){
						    	  query = "SELECT * FROM digitnew WHERE user_id like '%"+search+"%' OR name like '%"+search+"%' OR tel_number like'%"+search+"%'";
						    	 }
						    	 else{
						    	   query="SELECT USER_ID, NAME,TEL_NUMBER,STEP,DATE_CREATED,DATE_UPDATED FROM Digitnew where tel_number='"+tel_number+"'";
						    	 }
						    	 rs=stmt.executeQuery(query);
						    	 while(rs.next())
						    	 {
						   %>
						              <tr>
						                <td scope="row"> <%=rs.getString("name") %></td>
						                <td> <%=Long.parseLong(rs.getString("tel_number")) %></td>						                
						                <td style="text-transform:uppercase"> <%=rs.getString("step") %></td>
						                <td> <%=rs.getDate("DATE_CREATED") %></td>
						                <td> <%=rs.getDate("DATE_UPDATED") %></td>
						               
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
                        
                        <a href="./forget-password.jsp" class="btn btn-warning float-left  ml-2"><i class="bi bi-key-fill"></i>&nbsp; Change Password</a>
                        <a href="./Logout" class="btn btn-danger float-right"><i class="bi bi-arrow-bar-left"></i>&nbsp;Logout</a>
                        
                    </div>
                    
                </div>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>
</html>