<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Fellow Travelers</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<div class="text-end">
				<a href="/home" class="nav-link mb-3">Back to the homepage!</a>
			</div>
			<h1 class="display-4">Add a Location</h1>
			<form:form action="/traveled/create" modelAttribute="location" method="POST" class="col-5 mt-4 p-3">
				<div>
					<form:errors path="*" class="text-danger"/>
				</div>
				<div class="mb-3">
					<form:label path="locationName" >Location Name:</form:label>
					<form:input type="text" path="locationName" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="description" >Description Of Your Experience:</form:label>
					<form:input type="textarea" path="description" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="rating" >Rating:</form:label>
					<form:input type="number" path="rating" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="visited">Day Visited:</form:label>
					<form:input type = "date" path = "visited" class ="form-control"/>
				</div>
				<div class="form-row">
					<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
				</div>
				<button>Submit</button>
			</form:form>
		</div>
	</div>
</body>
</html>