<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <style media="screen">
    * {
padding: 0;
margin: 0;
box-sizing: border-box;
}

body {
font-family: sans-serif;
display: flex;
align-items: center;
justify-content: center;
min-height: 100vh;
background: #cfd3d0;
}
head {
  float: top;
  font-weight: bold;
  padding-top: 2px;
  background: #d3cfcf;
}

.formm {
position: relative;
padding: 60px 15px;
width: 270px;
height: 350px;
background:#00a800;
overflow: hidden;
box-shadow: 0px 0px 10px 0px rgb(116, 119, 114);
border-radius: 5px;
}

.form-inner {
position: absolute;
height: 98%;
width: 98%;
top: 50%;
left: 50%;
background: #e4dbec;
transform: translate(-50%, -50%);
}

.content {
height: 100%;
width: 100%;
padding: 25px;
}
.form-inner h2 {
font-size: 25px;
color: #d7a3d7;
text-align: center;
padding-top: 35px;
}
.input {
display: block;
padding: 12px 15px;
width: 100%;
left: 50%;
border-radius: 10px;
margin-top: 20px;
border: 1.5px solid rgb(109, 87, 121);
outline: none;
background: #19052c;
color: white;
}

.btn {
cursor: pointer;
color: white;
margin-top: 40px;
width: 100%;
padding: 12px;
outline: none;
background: #800080;
border: none;
font-size: 18px;
border-radius: 10px;
transition: 0.4s;
}
.btn:hover {
background: #c907c9;
}

.form span {
position: absolute;
height: 50%;
width: 50%;

}

.form span:nth-child(1) {
background: #ffda05;
top: 0;
left: -48%;
animation: 5s span1 infinite linear;
animation-delay: 1s;
}
.form span:nth-child(2) {
background: #00a800;
bottom: 0;
right: -48%;
animation: 5s span2 infinite linear;
}
.form span:nth-child(3) {
background: #800080;
right: -48%;
top: 0px;
animation: 5s span3 infinite linear;
}
.form span:nth-child(4) {
background: #ff0000;
bottom: 0;
right: -48%;
animation: 5s span4 infinite linear;
animation-delay: 1s;
}

@keyframes span1 {
0% {
  top: -48%;
  left: -48%;
}
25% {
  top: -48%;
  left: 98%;
}
50% {
  top: 98%;
  left: 98%;
}
75% {
  top: 98%;
  left: -48%;
}
100% {
  top: -48%;
  left: -48%;
}
}
@keyframes span2 {
0% {
  bottom: -48%;
  right: -48%;
}
25% {
  bottom: -48%;
  right: 98%;
}
50% {
  bottom: 98%;
  right: 98%;
}
75% {
  bottom: 98%;
  right: -48%;
}
100% {
  bottom: -48%;
  right: -48%;
}
}
@keyframes span3 {
0% {
  top: -48%;
  left: -48%;
}
25% {
  top: -48%;
  left: 98%;
}
50% {
  top: 98%;
  left: 98%;
}
75% {
  top: 98%;
  left: -48%;
}
100% {
  top: -48%;
  left: -48%;
}
}

@keyframes span4 {
0% {
  bottom: -48%;
  right: -48%;
}
25% {
  bottom: -48%;
  right: 98%;
}
50% {
  bottom: 98%;
  right: 98%;
}
75% {
  bottom: 98%;
  right: -48%;
}
100% {
  bottom: -48%;
  right: -48%;
}

    </style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <c:import url="common/header.html"></c:import>
	<title>Sign in Page</title>
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
  <h2 class="head">Please Sign in</h2>
	
    <form class="form" action="login" method="post">
      <div class="container"></div>
       
        
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <div class="form-inner">
        
        <input type="hidden" name="mode" value="SIGNIN">
        
        <c:if test="${loginFail }">
        <div class="mb-3">
        <span class="alert alert-danger"> Username or password is incorrect</span>
        </div>
        </c:if>
        
        <div class="input">
     <i class="fa fa-envelope" style="font-size:24px"></i>
            <label for="email" class="form-label" >Email</label>
            <input class="input" type="email" id="email" name="email" placeholder="Enter Your Email" class="form-control" required="required" autofocus>
        </div>
         <div class="input">
          <i class="fa fa-key icon" style="font-size:24px"></i>
         <!--  <i class="fa fa-lock" style="font-size:24px"></i> -->
            <label for="password" class="form-label">Password</label>
            <input class="input" type="password" id="myPassword" name="password" placeholder="Enter Your Password" class="form-control" required="required" autofocus>
          </div>
           <li class="show"> <input  type="checkbox" onclick="myFunction()">Show Password</li>
    </form> <!-- /form -->
    <button type="submit" class="btn btn-primary">Submit</button>
<button type="reset" class="btn btn-danger">Reset</button>
 <p> Don't have an account? <a href="signup.jsp">Create New Account!</a> </p>
</div> <!-- ./container -->

	<c:import url="common/footer.html"></c:import>	

</body>
</html>