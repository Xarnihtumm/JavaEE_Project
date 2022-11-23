<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="common/header.html"></c:import>
<c:import url="common/header.html"></c:import>
<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	
<title>Host Mdy Technology and Show Room</title>
<link rel="stylesheet" href="css/datatable.min.css" />
<link rel="stylesheet" href="css/custom.css">



</head>
<body>
<c:import url="mynav.jsp"></c:import>
	<div class="container">
		<div class="card-header my-3">All Products</div>

		<div class="row">
			<c:forEach var="product" items="${productList }">
				<div class="col-md-3 my-3">
					<div class="card" style="width: 18rem;">
						<img src="product-image/${product.image}" class="card-img-top" alt="...">
						<div class="card-body">

							<h5 class="prices">
								Prices:$
								<c:out value="${product.price}">
								</c:out>
							</h5>
							<h5 class="name">
								Brand:
								<c:out value="${product.name}">
								</c:out>
							</h5>
							<h5 class="category">
								Category:
								<c:out value="${product.category}">
								</c:out>
							</h5>
							<a class="btn btn-dark" href="addtocart?id=${product.id }">Add to Cart</a>
							 <a
								class="btn btn-primary" href="order-now?q=1&id=${product.id }">Buy
								Now</a>

						</div>
					</div>
				</div>
				</c:forEach>
		</div>
		
	</div>
	<c:import url="footer.jsp"></c:import>
</body>
</html>