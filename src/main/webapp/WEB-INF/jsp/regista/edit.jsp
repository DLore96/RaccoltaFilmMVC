<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../header.jsp" />
		<title>modifica elemento</title>
		
		<!-- style per le pagine diverse dalla index -->
	    <link href="./assets/css/global.css" rel="stylesheet">
	    <style>
		.ui-autocomplete-loading {
			background: white url("../assets/img/jqueryUI/anim_16x16.gif") right center no-repeat;
		}
		.error_field {
	        color: red; 
	    }
	</style>
	</head>
	<body>
		<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Modifica Regista</h5> 
		    </div>
		    <div class='card-body'>

					<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
					<form method="post" action="${pageContext.request.contextPath }/regista/exeEdit/${regista_attribute.id}" novalidate="novalidate">
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Nome <span class="text-danger">*</span></label>
								<spring:bind path="regista_attribute.nome">
									<input type="text" name="nome" id="nome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il nome" value="${regista_attribute.nome }" required>
								</spring:bind>
								<form:errors  path="nome" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-6">
								<label>Cognome <span class="text-danger">*</span></label>
								<spring:bind path="regista_attribute.cognome">
									<input type="text" name="cognome" id="cognome" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Inserire il cognome" value="${regista_attribute.cognome }" required>
								</spring:bind>
								<form:errors  path="cognome" cssClass="error_field" />
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>Nickname <span class="text-danger">*</span></label>
								<spring:bind path="regista_attribute.nickName">
									<input type="text" class="form-control ${status.error ? 'is-invalid' : ''}" name="nickName" id="nickName" placeholder="Inserire il nickname" value="${regista_attribute.nickName }" required>
								</spring:bind>
								<form:errors  path="nickName" cssClass="error_field" />
							</div>
							
							<fmt:formatDate pattern='yyyy-MM-dd' var="parsedDate" type='date' value='${regista_attribute.dataDiNascita}' />
							<div class="form-group col-md-3">
								<label>Data di Nascita <span class="text-danger">*</span></label>
                        		<spring:bind path="regista_attribute.dataDiNascita">
                        			<input class="form-control ${status.error ? 'is-invalid' : ''}" id="dataDiNascita" type="date" placeholder="dd/MM/yy"
                            			title="formato : gg/mm/aaaa"  name="dataDiNascita" required 
                            			value="${parsedDate}" >
                            	</spring:bind>
                            	<form:errors  path="dataDiNascita" cssClass="error_field" />
							</div>
							
							<div class="form-group col-md-3">
								<label for="sesso">Sesso <span class="text-danger">*</span></label>
							    <spring:bind path="regista_attribute.sesso">
							    	<select class="form-control ${status.error ? 'is-invalid' : ''}" id="sesso" name="sesso" required>
							    		<option value="" selected> - Selezionare - </option>
							      		<option value="MASCHIO" ${regista_attribute.sesso == 'MASCHIO'?'selected':''} >M</option>
							      		<option value="FEMMINA" ${regista_attribute.sesso == 'FEMMINA'?'selected':''} >F</option>
							    	</select>
							    </spring:bind>
							    <form:errors  path="sesso" cssClass="error_field" />
							</div>
							
						</div>
							

						<div class="form-group col-md-6">	
							<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>
							<input type="hidden" name="idRegista" value="${regista_attribute.id}">
							 <a href="${pageContext.request.contextPath }/regista/list/" class='btn btn-outline-secondary' style='width:80px'>
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