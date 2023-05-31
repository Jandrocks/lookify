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
    <title>Formulario</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
</head>
<body>
	<a href="/dashboard">Volver</a>
	
	<div class="container">
		<div class="row">
			<div class="col-8">
				<form:form action="/songs/news" method="POST"
					modelAttribute="cancion">
						<form:errors class="text-danger" path="title"/>
						<form:errors class="text-danger" path="artistName"/>
						<form:errors class="text-danger" path="rating" />
					<div class="mb-3">
						<form:label path="title" for="name" class="form-label">Titulo</form:label>
						<form:input path="title" type="text" class="form-control"
							id="name" name="name" />
						
						<form:label path="artistName" for="creator" class="form-label">Artista</form:label>
						<form:input path="artistName" type="text" class="form-control"
							id="nameCreator" name="nameCreator" />
						
						<form:label path="rating" for="currentVersion" class="form-label">Rating</form:label>
						<form:input path="rating" type="text" class="form-control"
							id="version" name="version" />
					</div>
					<div class="row mb-3">
						<div class="col text-center">
							<button type="submit" class="btn btn-lg btn-primary">Guardar</button>
						</div>
					</div>
					
					
				</form:form>
				<a href="/dashboard" type="button" class="btn">Dashboard</a>
			</div>
		</div>
	</div>
</body>
</html>