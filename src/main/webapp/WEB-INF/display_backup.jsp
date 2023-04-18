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
<title>TV Order Database</title>
</head>
<body>
<div class="container">
	<h3 class="text-primary">${order.orderName}</h3>
	<h6 class="text-primary">${order.createdAt}</h6>
	<div class="row">
		<div class="col-sm-8">
			<div class=row>
				<a href="/dashboard"class="text-end">Back</a>
			</div>
			
			<table class="table table-striped">
					<thead class="table-dark">
						<tr>
							<th>Desc</th>
							<th>Brand</th>
							<th>Unit</th>
							<th>Size</th>
							<th>Price</th>
							<th>Qty</th>
							<th>Aisle</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order_items" items="${order_items}">
						<tr>
	        				<td><c:out value="${order_items.item.description}"></c:out></td>
							<td><c:out value="${order_items.item.brand}"></c:out></td>
							<td><c:out value="${order_items.item.unit}"></c:out></td>
							<td><c:out value="${order_items.item.size}"></c:out></td>
							<td><c:out value="${order_items.order_item.qty}"></c:out></td>
							<td><c:out value="${order_items.item.aisle}"></c:out></td>       				
						</tr>
						</c:forEach>
					</tbody>
				</table>	
			</div>
			<c:if test="${loggedUser.userName == order.postedBy.userName}">
				<form action="edit/${order.id}">
				<button type="submit" class="btn btn-primary">edit</button>
				</form>
				
			</c:if>	
		</div><br><br>
	</div>
</body>
</html>