<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="#"><img id="logo"
				src="assets/fblogo.jpg" alt="logo" /> ShowRoom</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="product">ShowRoom</a></li>
					
					 <c:choose>
         
         <c:when test = "${fn:contains(user.role,'admin') }">
        <li class="nav-item"><a class="nav-link active"
					aria-current="page" href="customer">Service</a></li>
            
         </c:when>
        
         
         <c:otherwise>
          <li class="nav-item"><a class="nav-link active"
					aria-current="page" href="userinfo.jsp">Service</a></li>
         </c:otherwise>
      </c:choose>
				
				<li class="nav-item"><a class="nav-link active "
					aria-current="page" href="card">Cart<span
						class="badge badge-danger">${cartProduct.size()}</span>
				</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="userproduct">Orders</a></li>
						
						<li class="nav-item"><a class="nav-link" href="customer?mode=LOGOUT">Logout</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false"><c:out
							value="${user.username }"></c:out></a></li>
					
					
			</ul>
		</div>
	</div>
</nav>


