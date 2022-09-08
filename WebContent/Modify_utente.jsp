<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, Model.*"%>
    
<%
	UtenteBean var = (UtenteBean)request.getSession().getAttribute("Utente loggato");
	if(var == null){
		System.out.println("cose");
		response.sendRedirect("./login.jsp");
		return;
	}
	request.setAttribute("Utente loggato", null);
%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="./style/modify_utente.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />	
	    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<title>Squishy Muffins|Modifica dati utente</title>
	</head>
	
	<body>
		<jsp:include page="header.jsp" />
			
		<form method="post" action="Mod_utente">
			<div class="areaUtente" id="prova">
				<div class="datiPersonali"> 
					<h1><strong>Modifica dati personali</strong></h1><hr>
					<div class="nicknameArea">
						<div class="nickSX">
							<div class="areaNick">
							<p><strong>Email</strong></p>
							<input class="campi" type="text" name="Email_nuova" value="<%= var.getEmail()%>">
							<input class="campi" type="hidden" name="Email_vecchia" value="<%= var.getEmail()%>">
							<input class="campi" type="hidden" name="action" value="update">
						    </div>
						</div>	
					</div>
				
				
					<div class="nicknameArea">				
	            		<div class="nickSX">
	                    	<div class="areaNick">
		                        <p><strong>Nome</strong></p>
		                        <input class="campi" type="text" name="Nome" value="<%= var.getNome()%>">
	                    	</div>
	            		</div>
	        		</div> 
					
					<div class="nicknameArea">				
	            		<div class="nickSX">
	                    	<div class="areaNick">
		                        <p><strong>Cognome</strong></p>
		                        <input class="campi" type="text" name="Cognome" value="<%= var.getCognome()%>">
	                    	</div>
	            		</div>
	        		</div>
	
					<div class="nicknameArea">				
	            		<div class="nickSX">
	                    	<div class="areaNick">
		                        <p><strong>Password</strong></p>
		                        <input class="campi" type="password" name="Password" value="<%= var.getPassword()%>">
	                    	</div>
	            		</div>
	        		</div>
	        		
	 				<div class="nicknameArea">				
	            		<div class="nickSX">
	                    	<div class="areaNick">
		                        <p><strong>Codice Fiscale</strong></p>
		                        <input class="campi" type="text" name="CodiceFiscale" value="<%= var.getCodice_fiscale() %>">
	                    	</div>
	            		</div>
	        		</div>  
	        		
	        		<div class="nicknameArea">				
	            		<div class="nickSX">
	                    	<div class="areaNick">
		                        <input class="Modifica" type="submit" value="Conferma">
	                    	</div>
	            		</div>
	        		</div> 
        		</div>   		
			</div>
		</form>
		<jsp:include page="footer.jsp" />
	
	</body>
	
	
</html>