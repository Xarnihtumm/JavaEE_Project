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
<title>E-Commerce Cart</title>
<style type="text/css">

</style>
</head>
<body>
	<c:import url="mynav.jsp"></c:import>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${orders}">
				<c:url var="cancelorder" value="cancel-order">
						<c:param name="id" value="${product.orderId }"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${product.date}">
							</c:out></td>
						<td><c:out value="${product.name}">
							</c:out></td>
						<td><c:out value="${product.category}">
							</c:out></td>
						<td><c:out value="${product.qunatity}">
							</c:out></td>
						<td><c:out value="${product.price}">
							</c:out></td>
						<td><a href="${cancelorder}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to delete this result?');">Cancel
								Order</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>