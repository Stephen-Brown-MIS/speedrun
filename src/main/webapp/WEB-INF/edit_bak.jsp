<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
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
<title>Order Update</title>
</head>
<body>

<div class="container">
	<h3 class="text-primary">${order.orderName}</h3>
	<div class="col-sm-8">
		<div class="row">
	
			<div class="gray">
			<table class="table">
				<thead class="table-dark">
					<tr>
						
						
						<th>Desc</th>
						<th>Brand</th>
						<th>Unit</th>
						<th>Size</th>
						<th>Qty</th>
						<th></th>
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
        				
        				<td><form action="/order/${order.orderItem.id}" method="POST">
        					<input type="hidden" name="_method" value="delete"> 
        					<button class="btn btn-sm btn-danger">delete</button> </form></td>
        				
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<form action="/orders/${order.id}" method="POST">
		<input type="hidden" name="_method" value="udpate">
        <button type="submit" class="btn btn-primary">Done</button>
		</form>
	</div>
</div>
</body>
</html>