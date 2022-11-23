<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <c:import url="common/header.html"></c:import>
	<title>User Register Page</title>
	<script type="text/javascript">
	function myFunction() {
		  var x = document.getElementById("myPassword");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	</script>
</head>
<body>
	
	<div class="container">
    <form action="user" method="post">
        <h2 class="mb-3 text-center">User Registration</h2>
        
        <input type="hidden" name="mode" value="SIGNUP">
        
        <div class="mb-3">
        <i class="fa fa-user icon" style="font-size:24px" ></i>
            <label for="username" class="form-label">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter Your Name" class="form-control" required="required" autofocus>
        </div>
        
        <div class="mb-3">
        <i class="fa fa-envelope" style="font-size:24px"></i>
            <label for="email" class="form-label"  class="fa fa-envelope">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter Your Email" class="form-control" required="required" autofocus>
        </div>
        
         <div class="mb-3">
         <i class="fa fa-key icon" style="font-size:24px"></i>
            <label for="password" class="form-label">Password</label>
            <input type="password" id="myPassword" name="password" placeholder="Enter Your Password" class="form-control" required="required" autofocus>
         <input type="checkbox" onclick="myFunction()">Show Password
        </div>
        
        <div class="mb-3 form-check">
      		<input type="checkbox" class="form-check-input" id="role" name="role" value="true">
      		<label class="form-check-label" for="role">Admin</label>
    	</div>
        
        <div class="mb-3">
            <div class="col-sm-9 col-sm-offset-3">
                <span class="help-block">*Required fields</span>
            </div>
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form> <!-- /form -->
     <p> Already has an account ? <a href="signin.jsp">Please Sign in</a> </p>
</div> <!-- ./container -->
	
	
<c:import url="common/footer.html"></c:import>	
</body>
</html>