<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, Model.*"%>
    
<%
	Map<ProdottoBean, ArrayList<Double>> obj = (Map<ProdottoBean, ArrayList<Double>>)request.getAttribute("carrello_view"); 
	if(obj == null){
		response.sendRedirect("./Cart?action=view");
	}
	//request.setAttribute("carrello_view", null);
	request.getSession().setAttribute("carrello_view", obj);
%>

<!DOCTYPE html>

<html>

	<head>
	
 		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style/carrello.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    	<title>Squishy Muffins|Carrello</title>
    
	</head>
	
	<body>
	
		<jsp:include page="header.jsp"/>
		
			<div id="carrello">		
				<div class = "listProdCarrello">
					<div class="titoloCarrello">
						<p style="width:20%; margin-right:auto">Carrello</p>
						
						<form action="Cart" method="POST"> 												
							<input type="hidden" name="action" value="rmvall">
							<input type="hidden" name="qnt" value="1"> 
							<input type="hidden" name="provenienza" value="carrello">															
							<button class="svuotaCarrello">Svuota carrello</button>																
						</form>
					</div>	
		
				
				<% // Il for crea una variabile del tipo ProdottoBean ed ad ogni iterazione va ad assegnare a quella variabile il contenuto di obj all'i-esima posizione 
				if(obj != null && !obj.isEmpty()){
				for(Map.Entry<ProdottoBean, ArrayList<Double>> entry : obj.entrySet()){
						ProdottoBean var = entry.getKey();
				%>
				
					<div class="prodottoCarrello">
						<div>
							<a href="Catalogo?action=view&id=<%= var.getCodprodotto()%>"> <img src="<%= var.getImmagine().getPath()%>" class="immag"> </a>
						</div>
						<div>
							<a href="Catalogo?action=view&id=<%=var.getCodprodotto()%>" class="prodTitolo" style="text-decoration:none; color:black"> <%= var.getNome()%> </a>	
						</div>
						<div>
							<p class="prodPrezzo">Prezzo: <%= String.format("%.02f", var.getPrezzo()) %> &euro;</p>
						</div>
						<div>	
							<label class="prodLabel" for="quantità">Quantità: <%= entry.getValue().get(0) %> </label>
							<form action="Cart" method="post">
								<input type="hidden" name="action" value="sub">
								<input type="hidden" name="id" value="<%=var.getCodprodotto()%>">
								<input type="hidden" name="qnt" value="1">
								<input type="hidden" name="provenienza" value="carrello">
								<input type="submit" value="-" class="pulsanti"> &nbsp;	
							</form>
							<form action="Cart" method="post">
								<input type="hidden" name="action" value="add">
								<input type="hidden" name="id" value="<%=var.getCodprodotto()%>">
								<input type="hidden" name="qnt" value="1">
								<input type="hidden" name="provenienza" value="carrello">
								<input type="submit" value="+" class="pulsanti"> &nbsp;
							</form>
							 
						</div> 		
						<form id="rimuoviProd" action="Cart" method="POST">
							<input type="hidden" name="action" value="rmv">
							<input type="hidden" name="id" value="<%=var.getCodprodotto()%>">
							<input type="hidden" name="qnt" value="1">
							<input type="hidden" name="provenienza" value="carrello">
							<div>
								<button class="rimuoviProdottoCarrello" value="Rimuovi"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"  class="bi bi-trash-fill" viewBox="0 0 16 16">
		  						<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
								</svg></button>
							</div>
						</form>
					</div>
					<%}%>
					

					
					<%}
					else {%>
						
					<p> Il carrello è vuoto</p>
						
					<%}%>
	
				</div>
			</div>


			<div class="avanti">
				<a href="Acquisto.jsp"><input class="procedi" type="button" value="Procedi all'acquisto"> </a>
			</div>			
			 
	
				
				
		<jsp:include page="footer.jsp"/>
	
	</body>
	
</html>
	 

			
	
		
			







