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
<title>${location.user.name}</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<a href="/home" class="nav-link mb-3">Back to the Homepage!</a>
			<main class="col-8 px-4 py-3 border border-1 border-pirmary rounded bg-light">
				<div class="text-end">
					<c:if test="${location.user == user}"><a href="/traveled/${location.id}/edit" class="nav-link">Edit</a></c:if>
				</div>
				<div>
					<h1 class="display-5 mb-4"><c:out value="${location.locationName}" /></h1>
					<h4 class="mb-3"><span class="text-danger"><c:out value="${location.user.getName()}" /></span> added <span class="text-primary"><c:out value="${location.locationName}" />.</h4>
				
					<hr />
					<p>Date Visited:<c:out value="${location.visited}" /></p>
					<p>Description:<c:out value="${location.description}" /></p>
					<p>Rating:<c:out value="${location.rating}" /></p>
					
				</div>
				<div class= "text-end">
					<c:if test="${location.user == user }"><a href="/traveled/${location.id}/delete" class="nav-link">Delete</a></c:if>
				</div>
			</main>
		</div>
	</div>
</body>
</html>