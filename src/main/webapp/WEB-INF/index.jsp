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
<title>Login and Registration</title>
</head>
<body>
<div class="container">
	<img src="/images/Supermarket_speedrun_gray_large.png" alt="Supermarket Speedrun Logo" width="850" height="150">
	<h5 class="text-secondary"><em> Please sign in to get your groceries done!</em></h5>
	<h5 class="text-danger"><c:out value="${error}"/></h5>
	<div class="row">
		<div class="gray col-sm-3">
			<h6>New user?</h6>
			<h6 class="text-secondary">Register here to get started.</h6>
			<form:form action="/register" method="POST" modelAttribute="user" class="form1">
				<div>
					<form:label path="userName">Name: </form:label><br>
					<form:input path="userName"/>
					<form:errors path="userName" class="text-danger"/>
				</div>
				<div>
					<form:label path="email">Email: </form:label><br>
					<form:input path="email" type="email"/>
					<form:errors path="email" class="text-danger"/>
				</div>
				<div>
					<form:label path="password">Password: </form:label><br>
					<form:input path="password" type="password"/>
					<form:errors path="password" class="text-danger"/>
				</div>
				<div>
					<form:label path="confirm">Confirm PW: </form:label><br>
					<form:input path="confirm" type="password"/>
					<form:errors path="confirm" class="text-danger"/>
				</div>
				<button class="btn btn-sm btn-outline-success">Submit</button>
				
			</form:form>
		</div>
		<div class="col-sm-1"> </div>
		<div class="outline col-sm-3">
		<h6>Sign in</h6>
		<form:form action="/login" method="POST" modelAttribute="loginUser" class="form1">
			<div>
				<form:label path="email">Email: </form:label><br>
				<form:input path="email" type="email"/>
				<form:errors path="email" class="text-danger"/>
			</div>
			<div>
				<form:label path="password">Password: </form:label><br>
				<form:input path="password" type="password"/>
				<form:errors path="password" class="text-danger"/>
			</div>
			<button class="btn btn-sm btn-outline-success">Submit</button>
			</div>
		</form:form>	
		</div>
	</div>
</div>
</body>
</html>