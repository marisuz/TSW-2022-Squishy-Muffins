<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8" import="java.util.*, Model.*"%>

<%	ProdottoBean var = (ProdottoBean) request.getAttribute("description");
	request.setAttribute("description", null);
	%>

<!DOCTYPE html>

<html>

	<head>
	
    	<meta charset="utf-8">
	 	<link href = "style/description.css" rel = "stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<link rel="shortcut icon" type="image/png" href="logo.png">
    	<title><%= var.getNome()%></title>
    	
	</head>
	
	
	<body>
	
		<jsp:include page="header.jsp" />

		<p class = "product-title-nascosto"><%= var.getNome() %></p>
		
		<div class="padre"> 
		
			<div class = "container">
			      
				<div class ="item_descr_pagina">
					<img class="image" src="<%= var.getImmagine().getPath()%>">
				</div>
			            
				<div class="item-descrizione">
					<p class = "product-title"><%= var.getNome() %></p>
					<p class = "descrizione"><%= var.getDescrizione()%></p>
					<p class = "product-title-price">&euro; <%= String.format("%.02f", var.getPrezzo()) %> <span style="font-size:0.85rem;">iva inc.</span></p>
					<p class = "container-bottone">
						<button class="aggiungi">
							<a href="Cart?action=add&id=<%=var.getCodprodotto()%>&qnt=1&provenienza=catalogo">Aggiungi al carrello</a>
							<img src="icons/Aggiunta-Carrello.png"></button>
					</p>
				</div>
			
			</div>
			
			<div id="sped" class="sped">
				<p> <strong> Consegne e resi </strong> </p>
		
				<a id="frecciaGiu"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
	            	<path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
	        		</svg></a>
	        	<a id="frecciaSu"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up" viewBox="0 0 16 16">
	            	<path d="M3.204 11h9.592L8 5.519 3.204 11zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659z"/>
	          		</svg></a>
	    	</div>
	    
	    	<div id="nascosto">
		    	<p>Consegna standard entro 6-7 giorni lavorativi per tutti gli ordini di merce superiori a 15 euro! Spedizione 
					espressa entro 2 giorni lavorativi dalla presa in carico, disponibile al momento del pagamento.  Gli ordini con richieste di pacco regalo potranno avere un tempo 
					di elaborazione e spedizione più lungo. La merce non aperta può essere restituita per il rimborso completo entro 10 giorni lavorativi dalla data di ricevimento della 
					merce. Possono esservi alcune eccezioni. Visita la pagina Termini e Condizioni per maggiori informazioni.</p>
	    	</div>

		</div>
    	<jsp:include page="footer.jsp" />	
    	
    	<script>
	        const frecciaGiu = document.getElementById('frecciaGiu');
	        const frecciaSu = document.getElementById('frecciaSu');
	        const mostra = document.getElementById('nascosto');
	        const sped = document.getElementById('sped');
	
	        frecciaGiu.onclick = function(){
	            mostra.setAttribute("style", "display: block; border-top-left-radius:0px; border-top-right-radius:0px");
	            sped.setAttribute("style", "border-bottom-left-radius:0px; border-bottom-right-radius:0px;");
	            frecciaSu.setAttribute("style", "display: block");
	            frecciaGiu.setAttribute("style", "display: none");
	        }
	
	        frecciaSu.onclick = function(){
	            mostra.setAttribute("style", "display: none");
	            frecciaSu.setAttribute("style", "display: none");
	            frecciaGiu.setAttribute("style", "display: block");
	      		sped.setAttribute("style", "border-radius:18px");
	        }
    	</script>
    
    
	</body>
	
</html>
