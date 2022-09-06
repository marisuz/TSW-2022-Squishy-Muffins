<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>

<%
	// Provo a prendere dalla request l'attributo prodotti:
	// Se è nullo, richiama la servlet Catalogo per farlo riempire, altrimenti procede alla generazione della pagina

	Collection<ProdottoBean> obj = (Collection<ProdottoBean>) request.getAttribute("prodotti");
	if (obj == null) {
		response.sendRedirect("./Catalogo?action=read");
	}
	request.setAttribute("prodotti", null);
%>
<!DOCTYPE html>

<html>

	<head>
	
		<meta charset="ISO-8859-1">
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style/catalog.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
	    
	    <link href="https://fonts.google.com/specimen/Ubuntu?sort=popularity&noto.lang=en_Latn" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="./style/font.css">
	
	  <!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
	
	<!--     <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
	    
		<title>Squishy Muffins|Catalogo</title>
	</head>


	<body>
	
		<jsp:include page="header.jsp" />
	
		<h1 class="titoloCatalogo">Catalogo Squishy Muffins</h1>
		
		<div class="div_esterno">
		
			<%
			// Il for crea una variabile del tipo ProdottoBean ed ad ogni iterazione va ad assegnare a quella variabile il contenuto di obj all'i-esima posizione 
			if (obj != null)
				for (ProdottoBean var : obj) {
					if (var.getRimosso() == 1) {
						continue;
					}
			%>
	
			<!--  POPUP DA INTEGRARE CON LO SCRIPT SOTTO: 
			<jps:include page="PopupAcquisto.html" /> -->
			
			<div class="prodotto">
			
				<a href="Catalogo?action=view&id=<%=var.getCodprodotto()%>">
							<img src="<%=var.getImmagine().getPath()%>" class="imgProdotto">
				</a>	
				<a href="Catalogo?action=view&id=<%=var.getCodprodotto()%>">
							<%=var.getNome()%>
							<br>
							<%= String.format("%.02f", var.getPrezzo()) %> &euro;
				</a> 
				<a href="Cart?action=add&id=<%=var.getCodprodotto()%>&qnt=1&provenienza=catalogo">
					<button class="pulsante" type="button" value="Aggiungi"> Aggiungi 
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16"> <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</button>
				</a>
					
			</div>
						
			
				
			<%
				}
			%>
		</div>
		
	
	
		<jsp:include page="footer.jsp" />
		
<!-- 		<script>
			$(".imgProdotto").mouseover(function(){
				$(this).css("color","black")
			})
		</script>  -->
	</body>

</html>