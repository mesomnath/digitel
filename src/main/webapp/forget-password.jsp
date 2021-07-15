<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forget Password</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
</head>
<style>
    *{
        font-family: 'Lato',sans-serif;
        
    }
    .btn:focus{
    box-shadow:none !important;
     }
     input[type="text"], textarea, select,input[type="password"] {
       outline: none;
       box-shadow:none !important;
       border:1px solid #ccc !important;
       }
       .btn,  input[type="text"], textarea, select, .card, .card-body,.card-footer{
       border-radius:0px !important;
       }
       
</style>

<body style="background-color: #efefef;">
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row"style="margin-top:100px">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form action="forget" method="post" oninput='cpassword.setCustomValidity(password.value != cpassword.value ? "Passwords do not match." : "")'>
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #044068;"><b>Forget Password</b></div>
                    <div class="card-body">
                        
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Enter Mobile Number</b></label>
                              <input type="text" class="form-control mt-0" name="tel_number" required>
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Password</b></label>
                              <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Confirm Password</b></label>
                              <input type="password" class="form-control" name="cpassword" required>
                            </div>
                    </div>
                    <div class="card-footer">
                        <span class="float-left"><a href="login.jsp" class="text-dark float-right">Login</a>  </span>
                        <button type="submit" class="btn btn-success float-right">Update Password</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
        
    </div>
</body>

</html>  
