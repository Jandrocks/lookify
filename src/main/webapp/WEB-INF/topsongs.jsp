<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>TopSongs</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>

	
	 <main class="container justify-content-center mt-5">
	<div class="container">
		<div class="row">
			<div class="col-8">
				<h1>TOP SONGS</h1>
					<ul class="list-group">
					  <c:forEach items="${topsong}" var="topsong">
					    <li class="list-group-item">
					    <c:out value="${topsong.rating}"/> - <a href="/songs/${topsong.id }">  <c:out value="${topsong.title}"/> </a> -  <c:out value="${topsong.artistName}"/></li>
					</c:forEach>
					</ul>	
					<a href="/dashboard" type="button" class="btn">Dashboard</a>
			</div>
		</div>
	</div>
	</main>
	
</body>
</html>