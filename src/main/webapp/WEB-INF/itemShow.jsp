<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
<title>Show</title>
</head>
<body>
<div class="container">
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
	<div class="col-sm-6">
	<h5 class="text-success">Item detail: ${item.description}</h5>
	
			<div class="row">
			<ul class=>
				<li class="nav-item flex-row">
					<form action="edit/${item.id}">
					<button type="submit" class="btn btn-sm btn-outline-success button1">Edit</button>
					</form>
				</li>					
				<li class="nav-item flex-row">
					<a href="/items"class="btn btn-sm btn-outline-secondary button1">Cancel</a>
				</li>
				<li class="nav-item flex-row">
					<form action="/items/${item.id}" method="POST">
					<input type="hidden" name="_method" value="delete">
			        <button type="submit" class="btn btn-sm btn-outline-danger button1">Delete</button>
					</form>
				</li>
			</ul>
			</div>
			<table class="table">
				<thead>
					<tr>
					<th></th>
					<th></th>
					</tr>
				</thead>
				<tbody>
					<tr><td>Store: </td><td>${item.store}</td></tr>	
					<tr><td>Brand: </td><td>${item.brand}</td></tr>
					<tr><td>Description: </td><td>${item.description}</td></tr>	
					<tr><td>Unit: </td><td>${item.unit}</td></tr>	
					<tr><td>Size: </td><td>${item.size}</td></tr>	
					<tr><td>Price: </td><td>${item.price}</td></tr>
					<tr><td>Aisle: </td><td>${item.aisle}</td></tr>
				</tbody>
			</table>	
		</div>
		</div>
	</div>
				
	
	
</div>
</body>
</html>