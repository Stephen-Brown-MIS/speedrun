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
<title>Display List Detail</title>
</head>
<body>
<div class="container">	
<div class="row">
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
	<h5 class="text-success">Update your grocery list</h5>
	<p class="text-secondary">${order.orderName} - ${order.createdAt}</p>
<div class="d-flex align-content:space-around">
			<c:if test="${loggedUser.userName == order.postedBy.userName}">
				<form action="/orderitem/add/${order.id}">
				<button type="submit" class="btn btn-sm btn-outline-success button2">Add Item</button>
				</form>

				<form action="edit/${order.id}">
				<button type="submit" class="btn btn-sm btn-outline-warning button2">Remove Item</button>
				</form>
				
				<button onclick="window.print()"; target="_blank" class="btn button1 btn-sm btn-outline-success button2">Print</button>
				
				<a href="/orders"class="btn btn-outline-secondary btn-sm button1 button2">Cancel</a>
				
				<form action="/orders/${order.id}" method="POST">
				<input type="hidden" name="_method" value="delete">
        		<button type="submit" class="btn btn-sm btn-outline-danger button2">Delete List</button>
				</form>
			</c:if>
		
</div>

	
			<table class="table table-striped">
					<thead class="table-success">
						<tr>
							<th>Item Description</th>
							<th>Brand</th>
							<th>Unit</th>
							<th>Size</th>
							<th>Qty</th>
							<th>Aisle</th>
						</tr>
						
					</thead>
					<tbody>
						<c:forEach var="orderItem" items="${order.order_items}">
					<tr>
	        				<td><c:out value="${orderItem.item.description}"></c:out></td>
							<td><c:out value="${orderItem.item.brand}"></c:out></td>
							<td><c:out value="${orderItem.item.unit}"></c:out></td>
							<td><c:out value="${orderItem.item.size}"></c:out></td>
							<td><c:out value="${orderItem.quantity}"></c:out></td>
							<td><c:out value="${orderItem.item.aisle}"></c:out></td>       				
						</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
						


		</div><br><br>
	</div>
</body>
</html>