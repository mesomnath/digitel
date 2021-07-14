<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<style>
    * {
        font-family: 'Inter', sans-serif;
    }
</style>

<body style="background-color: #efefef;">
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row"style="margin-top:100px">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form action="login" method="post">
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #044068;"><b>Login</b></div>
                    <div class="card-body">
                        
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Username/Mobile Number</b></label>
                              <input type="text" class="form-control mt-0" name="tel_number">
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Password</b></label>
                              <input type="password" class="form-control" name="password">
                            </div>
                    </div>
                    <div class="card-footer">
                        <span class="float-left"><a href="#" class="text-dark float-right">Forget Password?</a>  </span>
                        <button type="submit" class="btn btn-success float-right">Login</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
        

</body>

</html>  
