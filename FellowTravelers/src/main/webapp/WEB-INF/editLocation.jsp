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
<title>Edit ${Location.title}</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<h1 class="display-4">Edit Your Visited Location!</h1>
			<a href="/home" class="nav-link mb-3">Back to the Homepage</a>
			<form:form action="/traveled/${location.id}/update" modelAttribute="location" method="POST" class="col-5 mt-4 p-3">
				<input type="hidden" name="_method" value="PUT" />
				<div>
					<form:errors path="*" class="text-danger"/>
				</div>
				<div class="mb-3">
					<form:label path="locationName" class="form-label">Location Name:</form:label>
					<form:input  path="locationName" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="description" class="form-label">Location Description:</form:label>
					<form:input  path="description" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="rating" class="form-label">Rating:</form:label>
					<form:input path="rating" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="visited" class="form-label">Day Visited:</form:label>
					<form:input type = "date" path = "visited" class ="form-control"/>
				</div>
				<input type="submit" value="Update Location" class="btn btn-sm btn-primary" />
			</form:form>
		</div>
	</div>
</body>
</html>