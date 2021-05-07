<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Visualizza elemento</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
		
		<div class='card'>
		    <div class='card-header'>
		        Visualizza dettaglio Regista
		    </div>
		
		    <div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Id:</dt>
				  <dd class="col-sm-9">${show_regista_attr.id}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Nome:</dt>
				  <dd class="col-sm-9">${show_regista_attr.nome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Cognome:</dt>
				  <dd class="col-sm-9">${show_regista_attr.cognome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Data Nascita:</dt>
				  <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${show_regista_attr.dataDiNascita}" /></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Nickname:</dt>
				  <dd class="col-sm-9">${show_regista_attr.nickName}</dd>
		    	</dl>
		    	
		    </div>
		    
		    <!--  Gestione elenco film regista, Da completare
		    <p>
			     <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				    Elenco Films:  
				 </a>
			</p>
		    <div class="collapse" id="collapseExample">
		     <div class='table-responsive'>
		            <table class='table table-striped ' >
		                <thead>
		                    <tr>
		                        <th>Titolo</th>
		                        <th>Genere</th>
		                        <th>Durata</th>
		                        <th>Data di Pubblicazione</th>
		                    </tr>
		                </thead>
		                <tbody>
		          
		                	<c:forEach var="filmItem" items="${lista_film_attribute}">
		                		 <tr >
		                        <td><c:out value="${filmItem.titolo}"/> </td>
		                        <td><c:out value="${filmItem.genere}" /> </td>
		                        <td><c:out value="${filmItem.minutiDurata}"/> </td>
		                	    <td> <fmt:formatDate type="date" pattern="dd/MM/yyy" value="${filmItem.dataPubblicazione}"/></td>
		                    </tr>
		                   </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    -->
		    
		    <div class='card-footer'>
		        <a href="${pageContext.request.contextPath }/regista/list/" class='btn btn-outline-secondary' style='width:80px'>
		            <i class='fa fa-chevron-left'></i> Back
		        </a>
		    </div>
		   </div>
			
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>