<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="common/header.html"></c:import>
<title>Host Mdy Technology and Service</title>
 <link rel="stylesheet" href="css/datatable.min.css" /> 
<link rel="stylesheet" href="css/styles.css">



</head>
<body>
<!-- Responsive navbar-->
	<c:import url="common/navbar.jsp"></c:import>
	
	<div class="container mt-5">
		<table data-replace="jtable" id="customer" class="table table-striped"
			aria-label="JS Datatable" data-locale="en" data-search="true">


			<thead>
				<tr>
					<th>Voucher ID</th>
					<th>Date</th>
					<th>Name</th>
					<th>Phone No</th>
					<th>Device</th>
					<th>Model</th>
					<th>Error</th>

					<c:if test="${fn:contains(user.role,'admin') }">
						<th>Action</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList }">
					<c:url var="updateLink" value="customer">
						<c:param name="mode" value="LOAD"></c:param>
						<c:param name="voucherNo" value="${customer.voucherNo}"></c:param>
					</c:url>

					<c:url var="deleteLink" value="customer">
						<c:param name="mode" value="DELETE"></c:param>
						<c:param name="voucherNo" value="${customer.voucherNo}"></c:param>
					</c:url>
					
					<c:url var="showLink" value="customer">
						<c:param name="mode" value="SHOW"></c:param>
						<c:param name="voucherNo" value="${customer.voucherNo}"></c:param>
					</c:url>



					<tr>
						<td> <c:out value="${customer.voucherNo}"></c:out> </td>
						<td> <c:out value="${customer.date}"></c:out> </td>
						<td> <c:out value="${customer.name}"></c:out> </td>
						<td> <c:out value="${customer.phNo}"></c:out> </td>
						<td> <c:out value="${customer.device}"></c:out> </td>
						<td> <c:out value="${customer.model}"></c:out> </td>
						<td> <c:out value="${customer.error}"></c:out> </td>


						<c:if test="${fn:contains(user.role,'admin') }">
								<td><a href="${updateLink }" class="btn btn-primary">Edit</a></td>
								<td><a href="${deleteLink }" id="delete" class="btn btn-danger"
									onclick="return confirm('Are you sure to delete this result?');">Delete</a>
								</td>
							</c:if>
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<th>Voucher ID</th>
					<th>Date</th>
					<th>Name</th>
					<th>Phone No</th>
					<th>Device</th>
					<th>Model</th>
					<th>Error</th>

					<c:if test="${fn:contains(user.role,'admin') }">
						<th>Action</th>
					</c:if>
				</tr>
			</tfoot>
		</table>
		<c:if test="${fn:contains(user.role,'admin') }">
				
		<h3><a href="userinfo.jsp" class="btn btn-primary">GET</a></h3>
			</c:if>
</div>
	
	<script src="js/datatable.min.js"></script>
	
<c:import url="common/footer.html"></c:import>	
<c:import url="footer.jsp"></c:import>
</body>


</html>