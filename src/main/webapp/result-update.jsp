<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>IT Mall Sale and Service</title>
<!-- CDN-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/school.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/custom.css" rel="stylesheet" />
</head>
<body>
<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"><img id="logo"
				src="assets/fblogo.jpg" alt="logo" />IT Mall</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="customer">Service</a></li>
					<li class="nav-item"><a class="nav-link" href="result-register.jsp">Register</a></li>
					<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li> - -->
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
    <form action="customer" method="post">
        <h2 class="text-center">Customer Update</h2>
        <h3>VoucherNo : ${customer.voucherNo} </h3>
        
        
        <input type="hidden" name="mode" value="UPDATE">
        <input type="hidden" name="voucherNo" value="${customer.voucherNo}">
      <!--    <h3> <c:out value="Voucher No : ${customer.voucherNo}"></c:out> </h3> -->
        <div class="mb-3">
            <label for="date" class="form-label">*Date</label>
            <input type="text" id="date" name="date" value="${customer.date }" placeholder="Enter Major" class="form-control" required="required" autofocus>
        </div>
        
        <div class="mb-3">
            <label for="name" class="form-label">*Name</label>
            <input type="text" id="name" name="name" value="${customer.name }" placeholder="Enter Year" class="form-control" required="required" autofocus>
        </div>
        
         <div class="mb-3">
            <label for="PhNo" class="form-label">*Phone No</label>
            <input type="text" id="phNo" name="phNo" value="${customer.phNo }" placeholder="Enter SeatNo" class="form-control" required="required" autofocus>
        </div>
        
        <div class="mb-3">
            <label for="device" class="form-label">*Device</label>
            <input type="text" id="device" name="device" value="${customer.device}" placeholder="Enter Name" class="form-control" required="required" autofocus>
        </div>
        
         <div class="mb-3">
            <label for="model" class="form-label">*Model</label>
            <input type="text" id="model" name="model" value="${customer.model }" placeholder="Enter Grade" class="form-control" required="required" autofocus>
        </div>
        
        <div class="mb-3">
            <label for="error" class="form-label">*Error</label>
            <input type="text" id="error" name="error" value="${customer.error }" placeholder="Enter Grade" class="form-control" required="required" autofocus>
        </div>
       
    	<div class="mb-3">
            <div class="col-sm-9 col-sm-offset-3">
                <span class="help-block">*Required fields</span>
            </div>
        </div>
        
        <button type="submit" class="btn btn-primary">Update</button>
        <button type="reset" class="btn btn-danger">Reset</button>
    </form> <!-- /form -->
</div> 
	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<c:import url="footer.jsp"></c:import>
</body>
</html>