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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
       
       .invalid {
		  color: red;
		}
		.valid{
		color: green;
		}
       
</style>


<body style="background-color: #F4F1EA;">
    <nav class="navbar navbar-expand-lg navbar-dark justify-content-center" style="background-color: #044068;">
        <a class="navbar-brand" style="font-size: 38px; font-weight: bold;" href="#">DigiTel</a>
    </nav>
    <div class="container p-4">
        <div class="row"style="margin-top:100px">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form action="forget" method="post" oninput='cpassword.setCustomValidity(password.value != cpassword.value ? "Passwords do not match." : "")'>
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #232F3E;"><b>Forget Password</b></div>
                    <div class="card-body">
                        
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Enter Mobile Number</b></label>
                              <input type="text" class="form-control mt-0" name="tel_number" required>
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Password</b></label>
                              <input type="password" class="form-control" id="pvalidation" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 or more characters" required>
                            </div>
                            <div class="p-4 card-body" style="background-color: #efefef;" id="message" style="display:none;">
                                <b>Password Should Contains:</b></br>
                                <span id="letter" class="invalid"><i class="bi bi-record-fill"></i>&nbsp;A <b>lowercase</b> letter</span></br>
                                <span id="capital" class="invalid"><i class="bi bi-record-fill"></i>&nbsp;A <b>uppercase</b> letter</span></br>
                                <span id="number" class="invalid"><i class="bi bi-record-fill"></i>&nbsp;A <b>number</b></span></br>
                                <span id="length" class="invalid"><i class="bi bi-record-fill"></i>&nbsp;Minimum <b>6 characters</b></span>
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
<script>
var myInput = document.getElementById("pvalidation");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}

</script>
</html>  
