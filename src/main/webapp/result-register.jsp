<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="common/header.html"></c:import>
<title>Result Register Page</title>
</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"><img id="logo"
				src="assets/fblogo.jpg" alt="logo" /> HMI</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="customer">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="result-register.jsp">Register</a></li>
				<!-- 	<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Order</a></li>
							<li><a class="dropdown-item" href="#"></a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>  --->
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<form action="customer" method="post">
			<h2 class="text-center">New Customer Registration</h2>

			<input type="hidden" name="mode" value="CREATE">

			<div class="mb-3">
				<label for="date" class="form-label">*Date</label> <input
					type="date" id="major" name="date" placeholder="Enter Date"
					class="form-control" required="required" autofocus>
			</div>

			<div class="mb-3">
				<label for="name" class="form-label">*Customer Name</label> <input
					type="text" id="name" name="name" placeholder="Enter Customer Name"
					class="form-control" required="required" autofocus>
			</div>

			<div class="mb-3">
				<label for="phNo" class="form-label">*Phone No</label> <input
					type="tel" id="phNo" name="phNo" pattern="[0-9]{2}-[0-9]{9}"
					placeholder="Enter Phone No" class="form-control"
					required="required" autofocus>
			</div>

			<div class="mb-3">
				<label for="device" class="form-label">*Device</label> 
				  
				<input
					type="text" id="device" name="device" placeholder="Enter Device"
					class="form-control" required="required" autofocus> 
					
					
			</div>

			<div class="mb-3">
				<label for="model" class="form-label">*Model</label> <input
					type="text" id="model" name="model" placeholder="Enter Model"
					class="form-control" required="required" autofocus>
			</div>

			<div class="mb-3">
				<label for="error" class="form-label">*Error</label> <input
					type="text" id="error" name="error" placeholder="Enter Error"
					class="form-control" required="required" autofocus>
			</div>

			<div class="mb-3">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>


			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-danger">Reset</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<c:import url="footer.jsp"></c:import>
</body>
</html>