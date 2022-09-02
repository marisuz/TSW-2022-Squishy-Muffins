<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, Model.*"%>
    
    <%UtenteBean obj = (UtenteBean)request.getSession().getAttribute("Utente loggato");
    	if(obj == null){%>
    		
    		<jsp:forward page="login.jsp"/>
    		
    	<%}
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="./style/profilo_utente.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />	
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	    
	    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<title>Squishy Muffins|Area utente</title>
	</head>
	
	<body>
		<jsp:include page="header.jsp" />
		
		
		<div class="areaUtente" id="prova">
		    <div class="datiPersonali">
		        <h1><strong>Dati Personali</strong></h1><hr>
		        <div class="nicknameArea">				
		            <div class="nickSX">
							<span class="material-symbols-outlined"> mail </span>
		 					<div class="areaNick">
			                    <p><strong>Email</strong></p>
			                    <p><%=obj.getEmail() %></p>
		                	</div>
		            </div>
		        </div> 
		        
		        <div class="nicknameArea">				
		            <div class="nickSX">
		 					<span class="material-symbols-outlined"> person </span>
		 					<div class="areaNick">
			                    <p><strong>Nome</strong></p>
			                    <p><%=obj.getNome() %></p>
		                	</div>
		            </div>
		        </div> 
		             
		        <div class="nicknameArea">				
		            <div class="nickSX">
		            		<span class="material-symbols-outlined"> person </span>
		 					<div class="areaNick">
			                    <p><strong>Cognome</strong></p>
			                    <p><%=obj.getCognome() %></p>
		                	</div>
		            </div>
		        </div> 
		        
		        <div class="nicknameArea">				
		            <div class="nickSX">
		            		<span class="material-symbols-outlined"> vpn_key </span>
		 					<div class="areaNick">
			                    <p><strong>Password</strong></p>
			                    <p>*********</p>
		                	</div>
		            </div>
		        </div> 
		        
		        <div class="nicknameArea">				
		            <div class="nickSX">
		 					<span class="material-symbols-outlined">barcode</span>
		 					<div class="areaNick">
			                    <p><strong>C.F.</strong></p>
			                    <p><%=obj.getCodice_fiscale() %></p>
		                	</div>
		            </div>
		        </div> 
				
				<form action ="Reindirizzamento" method="get">
					<input type="submit" class="Modifica" value="Modifica dati">
				</form>											
		    </div>
		</div>
		
		<div class="metodi">
			<div class="met">
				<h2><strong>Metodi di pagamento</strong></h2>
				<form id="met_pag" method="post" action="Salva_carta_pagamento">
					<input class="campi" type="text" placeholder="Intestatario" id="intestatario" name="intestatario">
					<input class="campi" type="text" placeholder="Codice carta" id="cod_carta" name="cod_carta" maxlength="12">
					<input class="campi" type="text" placeholder="CVV" id="cod_cvv" name="cod_cvv" maxlength="3">
					<input class="campi" type="month" placeholder="Mese scadenza" id="month" name="month">
					<br>
					<button class="save">Salva nuovo metodo di pagamento</button>
				</form>
			</div>

			<div class="met">
				<h2><strong>Indirizzi di spedizione</strong></h2>
				<form id="met_pag" method="post" action="Salva_ind_consegna">
					<input class="campi" type="text" placeholder="Via" id="via" name="via">
					<input class="campi" type="text" placeholder="Numero civico" id="number" name="number">
					<input class="campi" type="text" placeholder="CAP" id="cap" name="cap" maxlength="5">
					<input class="campi" type="text" placeholder="Citta" id="provincia" name="citta">
					<br>
					<button class="save">Salva nuovo indirizzo di spedizione</button>
				</form>
			</div>
		
			    
		</div>
		



		<%-- 	<%=obj.getPassword() %> --%>
	
		<jsp:include page="footer.jsp" />
	</body>
</html>