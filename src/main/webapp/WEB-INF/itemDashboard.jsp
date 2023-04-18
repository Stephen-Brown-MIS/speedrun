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
<title>item Club</title>
</head>
<body>
<div class = "container">
	<div class="col-sm-10">
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
	     <p class="text-end">Welcome, <c:out value="${loggedUser.userName}"></c:out>!
			<a href="/logout"class="text-end">logout</a></p>       
	    </div>
	    <!-- Right elements -->
	  </div>
	  <!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
	<hr>
	
	<div class="row">
		<h5 class="text-success">Inventory Maintenance</h5>
		<p class= "text-secondary"><em>Update an existing item or add a new one.</em></p>
		<a href="/items/new" class="btn btn-sm btn-outline-success button1 button2">Add item</a>  
		<a href="/orders" class="btn btn-sm btn-outline-secondary button1 button2">Cancel</a>
		<form class="text-end">
				Filter:
				<input type="text" name="keyword"/> 
				<input type="submit" value="Search" class=""/> 
				<input type="button" value="Clear" class="" onclick="clearFilter"/> 
		</form>
		
		<hr class="white">
		
		</div>	
			<table class="table table-striped">
				<thead class="table-secondary">
					<tr>
						<th>Item</th>
						<th>Description</th>
						<th>Store</th>
						<th>Brand</th>
						<th>Unit</th>
						<th>Size</th>
						<th>Price</th>
						<th>Aisle</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items}">
					<tr>
        				<td><c:out value="${item.id}"></c:out></td>
        				<td><a href="/items/${item.id}" class="text-success"><c:out value="${item.description}"></c:out></a></td>
        				<td><c:out value="${item.store}"></c:out></td>
        				<td><c:out value="${item.brand}"></c:out></td>
        				<td><c:out value="${item.unit}"></c:out></td>
        				<td><c:out value="${item.size}"></c:out></td>
        				<td><c:out value="${item.price}"></c:out></td>
        				<td><c:out value="${item.aisle}"></c:out></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	function clearFilter() {
		window.location = '/items';
	}
</script>
</body>
</html>