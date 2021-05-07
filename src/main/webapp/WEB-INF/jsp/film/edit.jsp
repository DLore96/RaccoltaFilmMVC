<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Inserisci nuovo</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    <style>
		.error_field {
	        color: red; 
	    }
	</style>
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<spring:hasBindErrors  name="film_regista_attr">
			<%-- alert errori --%>
			<div class="alert alert-danger " role="alert">
				Attenzione!! Sono presenti errori di validazione
			</div>
		</spring:hasBindErrors>
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Inserisci nuovo elemento</h5> 
		    </div>
		    <div class='card-body'>

					<form  method="post" action="${pageContext.request.contextPath}/film/executeUpdate/${film_attribute.id} " novalidate="novalidate" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="titolo">Titolo</label>
								<spring:bind path="film_attribute.titolo">
									<input type="text" name="titolo" id="titolo" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il titolo" value="${insert_film_attr.titolo }">
								</spring:bind>
								<form:errors  path="film_attribute.titolo" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-6">
								<label for="genere">Genere</label>
								<spring:bind path="film_attribute.genere">
									<input type="text" name="genere" id="genere" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il genere" value="${insert_film_attr.genere }">
								</spring:bind>
								<form:errors  path="film_attribute.genere" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${insert_film_attr.dataPubblicazione}' />
							<div class="form-group col-md-6">
								<label for="dataPubblicazione">Data di Pubblicazione</label>
                        		<spring:bind path="film_attribute.dataPubblicazione">
	                        		<input class="form-control ${status.error ? 'is-invalid' : ''}" id="dataPubblicazione" type="date" placeholder="dd/MM/yy"
	                            		title="formato : gg/mm/aaaa"  name="dataPubblicazione" value="${parsedDate}" >
	                            </spring:bind>
                            	<form:errors  path="film_attribute.dataPubblicazione" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-6">
								<label for="minutiDurata">Durata (minuti)</label>
								<spring:bind path="film_attribute.minutiDurata">
									<input type="number" class="form-control ${status.error ? 'is-invalid' : ''}" name="minutiDurata" id="minutiDurata" placeholder="Inserire la durata" value="${insert_film_attr.minutiDurata }">
								</spring:bind>
								<form:errors  path="film_attribute.minutiDurata" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	 
							<div class="form-group col-md-6"> 
							<label for="regista.id">Regista</label> 
						    <spring:bind path="film_attribute.regista">
						    <select class="form-control ${status.error ? 'is-invalid' : ''}" id="regista.id" name="regista.id"> 
						    	<option value="" selected> -- Selezionare una voce -- </option> 
						      	<c:forEach items="${registi_list_attribute }" var="registaItem"> 
							      		<option value="${registaItem.id}" ${insert_film_attr.regista.id == registaItem.id?'selected':''} >${registaItem.nome } ${registaItem.cognome }</option>
						      	</c:forEach> 
							    </select> 
							 </spring:bind>
							 <form:errors  path="film_attribute.regista" cssClass="error_field" />
							</div> 
						</div> 
							
							
						<div class="form-group col-md-6">
							<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
							<input type="hidden" name="idFilm" value="${film_attribute.id}">
								 <a href="${pageContext.request.contextPath }/film/list/" class='btn btn-outline-secondary' style='width:80px'>
			                	 	<i class='fa fa-chevron-left'></i> Back
			        			 </a>
						</div>
					</form>

			<!-- end card-body -->			   
		    </div>
		</div>	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>