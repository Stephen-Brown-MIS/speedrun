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
<title>Add</title>
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
	<div class="row col-sm-6">
	<h5 class="text-success">Create a New List</h5>
	<p class="text-secondary"><em>Start a new list by adding a name</em>
	<hr class="white">
		<div class="gray">
		<form:form action="/createOrder" method="POST" modelAttribute="order">
			<div>
				<form:label path="orderName">Name: </form:label><br>
				<form:input path="orderName"/>
				<form:errors path="orderName" class="text-danger"/>
			</div>
			<a href="/orders"class="btn btn-sm btn-outline-secondary">Cancel</a>
			<button class="btn btn-sm btn-outline-success">Submit</button>
			</div>
		</form:form>	
	</div>
	</div>
</div>
</body>
</html>