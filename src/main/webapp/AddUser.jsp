<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
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
	String id=request.getParameter("id");
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
                <form method="post" action="addUserServlet">
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #232F3E;"><i class="bi bi-person-fill"></i><b>&nbsp;Add user</b></div>
                    <div class="card-body">
                        
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name" required>
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="number" class="form-control" name="tel_number" pattern="^\d{10}$" title="Must contain 10 digit number" required>
                            </div>
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage</b></label>
                                <select name="step" class="form-control" required>
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                            
                          
                    </div>
                    <div class="card-footer">
                        <span class="float-left">  
                        <a href="./Dashboard.jsp?id=<%=id%>" class="btn bg-dark text-white"><i class="bi bi-arrow-left"></i>&nbsp;Back to Dashboard</a>
                        </span>
                        <button type="submit" class="btn btn-success float-right"><i class="bi bi-person-plus-fill"></i>&nbsp;Add User</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        
    </div>
</body>
</html>