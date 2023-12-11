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
<title>Dashboard</title>
</head>
<body>

	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<header class="row justify-content-between align-items-center">
				<div class="col-5 text-start">
					<h4>Hello, ${user.name}. Welcome to..</h4>
					<h1>Fellow Travelers!</h1>
				</div>
				<div class="col-5 text-end">
					<a href="/logout" class="nav-link">Logout</a>
					<a href="/traveled/new" class="nav-link">+Add to My Locations</a>
				</div>
			</header>
		</div>
		<div class="row mx-auto mt-3">
			<table class="table table-striped table-bordered caption-top">
				<thead class="table-info">
					<tr class="align-middle">
						<th>ID</th>
						<th>Location Name</th>
						<th>Rating</th>
						<th>User Name</th>
						<th>Date Visited</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="location" items="${locations}">
						<tr>
							<td><c:out value="${location.id}"/></td>
							<td><a href="/traveled/${location.id}" class="nav-link"><c:out value="${location.locationName}" /></a></td>
							<td><c:out value="${location.rating}" /></td>
							<td><c:out value="${location.user.getName()}" /></td>
							<td><c:out value ="${location.visited}"/></td>
							<td class="text-space-between">
								<c:if test="${location.user == user}"><a href="/traveled/${location.id}/edit" class="nav-link">Edit</a></c:if>
								<c:if test="${location.user == user }"><a href="/traveled/${location.id}/delete" class="nav-link">Delete</a></c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	

</body>
 </html>