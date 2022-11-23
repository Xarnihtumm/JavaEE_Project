<%@page import="java.text.DecimalFormat"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Shopping  Cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<c:import url="mynav.jsp"></c:import>
	<div class="container my-3">
		<div class="d-flex py-3">

			<h3>
				Total Price: $
				<c:out value="${(total>0)?dcf.format(total):0}"></c:out>
			</h3>
			<a class="mx-3 btn btn-primary" href="check-out">Check Out</a>
		</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th>Cancel</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="product" items="${cartProduct}">
					<c:url var="increaseItem" value="quantity-inc-dec">
						<c:param name="action" value="inc"></c:param>
						<c:param name="id" value="${product.id }"></c:param>
					</c:url>

					<c:url var="decreaseItem" value="quantity-inc-dec">
						<c:param name="action" value="dec"></c:param>
						<c:param name="id" value="${product.id }"></c:param>
					</c:url>
					<c:url var="removeItem" value="remove-from-cart">
						<c:param name="id" value="${product.id }"></c:param>
					</c:url>

					<tr>

						<td><c:out value="${product.name}">
							</c:out></td>
						<td><c:out value="${product.category}">
							</c:out></td>
						<td><c:out value="${product.price}">
							</c:out></td>
						<td>
							<form action="order-now" method="post"
								class="form-inline">
							   <input type="hidden" name="id" value="${product.id}"
									class="form-input"> 
								<div class="form-group d-flex justify-content-between">
									<a class="btn bnt-sm btn-incre" href="${increaseItem}"><i
										class="fas fa-plus-square"></i></a> <input type="text"
										name="q" class="form-control"
										value="${product.quantity}" readonly> <a
										class="btn btn-sm btn-decre" href="${decreaseItem}"><i
										class="fas fa-minus-square"></i></a>
								</div>
								<button type="submit" class="btn btn-primary btn-sm">Buy</button>
							</form>
						</td>
						<td><a href="${removeItem}" class="btn btn-sm btn-danger">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<c:import url="footer.jsp"></c:import>
</body>
</html>