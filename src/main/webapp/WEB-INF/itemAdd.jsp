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
<title>Add Item</title>
</head>
<body>
			
<div class="container">
	<div class="row col-sm-10">
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


	<h5 class="text-success">Add an Item to Inventory</h5>
	
		
		<div class="gray row col-sm-6">
		<form:form action="/createitem" method="POST" modelAttribute="item">
			<div>
				<form:label path="store">Store</form:label><br>
				<form:input path="store"/>
				<form:errors path="store" class="text-danger"/>
			</div>
			<div>
				<form:label path="brand">Brand</form:label><br>
				<form:input path="brand"/>
				<form:errors path="brand" class="text-danger"/>
			</div>
			<div>
				<form:label path="description">Description</form:label><br>
				<form:input path="description"/>
				<form:errors path="description" class="text-danger"/>
			</div>
			<div>
				<form:label path="unit">Unit (oz, lbs, liter) </form:label><br>
				<form:input path="unit"/>
				<form:errors path="unit" class="text-danger"/>
			</div>
			<div>
				<form:label path="size">Size</form:label><br>
				<form:input path="size"/>
				<form:errors path="size" class="text-danger"/>
			</div>
			<div>
				<form:label path="price">Price</form:label><br>
				<form:input path="price"/>
				<form:errors path="price" class="text-danger"/>
			</div>
			
			<div>
				<form:label path="aisle">Aisle</form:label><br>
				<form:input path="aisle"/>
				<form:errors path="aisle" class="text-danger"/>
			</div>
			<button class="btn btn-sm btn-outline-success button1">Submit</button>
			<a href="/items"class="btn btn-sm btn-outline-secondary button1">Cancel</a>
			</div>
		</form:form>	
	</div>
</div>
</body>
</html>