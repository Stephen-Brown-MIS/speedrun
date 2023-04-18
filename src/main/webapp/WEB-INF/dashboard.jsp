<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Speedrun Dashboard</title>
</head>
<body>

<div class = "container">
	<div class="col-sm-10">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
	  <!-- Container wrapper -->
	  <div class="container-fluid">
	    <!-- Toggle button -->
	    <button
	      class="navbar-toggler"
	      type="button"
	      data-mdb-toggle="collapse"
	      data-mdb-target="#navbarSupportedContent"
	      aria-controls="navbarSupportedContent"
	      aria-expanded="false"
	      aria-label="Toggle navigation"
	    >
	      <i class="fas fa-bars"></i>
	    </button>
	
	    <!-- Collapsible wrapper -->
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <!-- Navbar brand -->
	      <a class="navbar-brand mt-2 mt-lg-0" href="#">
	   		<img src="/images/Supermarket_speedrun_gray_large.png" alt="Supermarket Speedrun Logo" width="490" height="90">
	
	      </a>
	      <!-- Left links -->
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="/orders">Dashboard</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/items">Inventory</a>
	        </li>
	      </ul>
	      <!-- Left links -->
	    </div>
	    <!-- Collapsible wrapper -->
	
	    <!-- Right elements -->
	    <div class="d-flex align-items-center">
	      <!-- Icon -->
	     <p class="text-end text-secondary">Welcome, <c:out value="${loggedUser.userName}"></c:out>!
			<a href="/logout" class="text-end">logout</a></p>       
	    </div>
	    <!-- Right elements -->
	  </div>
	  <!-- Container wrapper -->
	</nav>
	<hr>
	<!-- Navbar -->
	
		<h5 class="text-success">Grocery List Dashboard</h5>
		<p class= "text-secondary"><em>Simplify your  grocery shopping by building an organized grocery list.</em></p>
		<p class= "text-secondary"><em> Get started by making a new grocery list, or work with an existing one.</em></p>
		<a href="/orders/new" class="btn btn-sm btn-outline-success text-end">New list</a> 
	<hr class="white">
		<div class="row justify-content-md-center">
			<table class="table table-striped">
				<thead class="table-success">
					<tr>
						<th>List</th>
						<th>Summary</th>
						<th>Date</th>
						<th></th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
					<tr>
        				<td><c:out value="${order.id}"></c:out></td>
						<td><a href="/orders/${order.id}" class="text-success" ><c:out value="${order.orderName}"></c:out></a></td>
						<td><c:out value="${order.createdAt}"></c:out><td>
        				
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		  
	</div>
</div>

</body>
</html>