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
<link href="form.css" rel="stylesheet" type="text/css" />
<!--<link rel="stylesheet" href="css/styles.css">- -->


 
</head>
<body>
	<!-- Responsive navbar-->
	<c:import url="common/navbar.jsp"></c:import>

  <input type="hidden" name="mode" value="SHOW">
        <input type="hidden" name="voucherNo" value="${customer.voucherNo}">
	<div class="container mt-5">
		<table data-replace="jtable" id="customer" class="table table-striped">
			<thead>
				<tr>
					<th>Voucher ID</th>
					<th>Date</th>
					<th>Name</th>
					<th>Phone No</th>
					<th>Device</th>
					<th>Model</th>
					<th>Error</th>
					<th>Finished</th>
					<th>Prices</th>
				</tr>
			</thead>
			<tbody>
				
	

					<tr>
						<td> 2011 </td>
						<td> 11.11.2022 </td>
						<td> Zar Ni Htumm </td>
						<td> 09-782621233</td>
						<td> Laptop </td>
						<td> Aspire E4-S1 </td>
						<td> OS Installation </td>
						<td>No</td>
						<td> $00.00 </td>

					</tr>
			

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
					<th>Finished</th>
					<th>Prices</th>
				</tr>
			</tfoot>
		</table>
	</div>
	
	
	</br>
	<h2  style="color:blue;"> &nbsp; &nbsp; &nbsp; &nbsp;Your Fedback</h2>
	</br>
	  <div id="form-main">
  <div id="form-div">
    <form class="form" id="form1">
      
      <p class="name">
        <input name="name" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="Name" id="name" />
      </p>
      
      <p class="email">
        <input name="email" type="text" class="validate[required,custom[email]] feedback-input" id="email" placeholder="Email" />
      </p>
      
      <p class="text">
        <textarea name="text" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="Comment"></textarea>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="SEND" id="button-blue"/>
        <div class="ease"></div>
      </div>
    </form>
  </div>
	<script src="js/datatable.min.js"></script>

	<c:import url="common/footer.html"></c:import>
	<c:import url="footer.jsp"></c:import>
</body>


</html>