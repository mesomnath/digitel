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
	String tel_number=request.getParameter("tel_number");
	
	String userid=request.getParameter("id");
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
                                <b><i class="bi bi-people-fill"></i>&nbsp;Users list</b>
                            </div>
                            <div class="col-3">
                                <form action="" method="get">
                                    <input type="text" name="search" placeholder="Search..." class="form-control"/>
                                </form> 
                            </div>
                        </div>
                    </div>
                    <div class="card-body overflow-scroll" style="max-height:480px;overflow-y:scroll">
                        <!-- -Exporting data table--- -->
                        
                        <div class="float-right">
                        <a href="./export.jsp?id=<%=userid%>" class="btn btn-success mb-2"><i class="bi bi-file-earmark-excel-fill"></i> Export Users List</a>
                        </div>
                        <!-- ---- -->
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
						     String id=request.getParameter("id");
						     try
						     {
						    	 
						    	// Class.forName("oracle.jdbc.driver.OracleDriver");
						    	 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
						    	 stmt=con.createStatement();
						    	 String search=request.getParameter("search");
						    	 String query;
						    
						    	 if(search!=null){
						    	  query = "SELECT * FROM digitnew WHERE user_id like '%"+search+"%' OR name like '%"+search+"%' OR tel_number like'%"+search+"%'";
						    	 }
						    	 else{
						    	   query="SELECT USER_ID, NAME,TEL_NUMBER,STEP,DATE_CREATED,DATE_UPDATED FROM Digitnew";
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
                    <%
                             Connection conn;
						     Statement stmt1;
						     ResultSet rs1;
						     String uid=request.getParameter("id");
						     try
						     {
						    	 
						    	 Class.forName("oracle.jdbc.driver.OracleDriver");
						    	 conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "SYSTEM", "Password1234");
						    	 stmt1=conn.createStatement();
						    	 // String tel_number=request.getParameter("tel_number");
						    	 String query="SELECT DATE_UPDATED FROM Digitnew where user_id="+uid;
						    	 
						    	 rs1=stmt1.executeQuery(query);
						    	 java.util.Date utilDate = new java.util.Date();
								 java.sql.Date date = new java.sql.Date(utilDate.getTime());
								 
						    	 while(rs1.next())
						    	 {

							    	 Date udate = rs1.getDate("date_updated");
						    		 long date1 = date.getTime();
							    	  long date2 = udate.getTime();
							    	  //long timediff = 0;
							    	  long timediff = date1 -date2;
							    	  int daysdiff =(int)(timediff /(1000*60*60*24));
							    	  int leftday = (int)(60-daysdiff);
							    	  System.out.println(leftday);
						   %>
						   <b>Password Will Expired <%=leftday %> in Days!</b>
						   <% 
						    	 }
						    	 conn.close();   		 
						    	 }
						    	 catch(Exception e)
						    	 {
						    	 out.print(e);
						    	 }
						         %>                    
                        <a href="./forget-password.jsp" class="text-warning font-weight-bold text-decoration-underline  "><u><i class="bi bi-key-fill"></i>&nbsp;Change Password</u></a>
                        <a href="./Logout" class="btn btn-danger  ml-2"><i class="bi bi-arrow-bar-left"></i>&nbsp;Logout</a>
                        <a href="./AddUser.jsp?id=<%=userid%>" class="btn btn-success float-right"><i class="bi bi-person-plus-fill"></i>&nbsp;Create New User</a>
                        
                    </div>
                    
                </div>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>
</html>