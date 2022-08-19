<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/register.css">
    <link rel="stylesheet" href="style/header.css">
    <link rel="stylesheet" href="style/footer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Squishy Muffins|Registrazione</title>
</head>
<%
	if(request.getSession().getAttribute("utente") == null){;
		request.getSession().setAttribute("ruolo", "guest");
	}
	if(!request.getSession().getAttribute("ruolo").equals("guest"))
	{
		response.sendRedirect("home.jsp");
		return;
	} %>
	
<body>
	
    <jsp:include page="header.jsp"/>

    <form action="./RegisterServlet" method="post" class="loginForm" id="registerForm">
    	<div id="form1">
        	<h1 id="accedi">Registrati</h1>
        	<div class="content">
            	<div class="input-field">
                	<input type="email" placeholder="Email" id="emailInput" name="email" required>
                	<p class="error_message"></p>
            	</div>
 
            	<div class="input-field">
                	<input type="password" placeholder="Password" class="pw" name="password" id="pass1" required>
                	<p class="error_message"></p>
            	</div>
            	<div class="input-field">
               		<input type="password" placeholder="Ripeti Password" class="pw" name="pw" id="pass2" required>
               		<p class="error_message"></p>
            	</div>
        	</div>
        	<div class="">
                <p id="error_messages" style="color: red;"></p>
            	</div>
        	
        	
        	<div class="action">
            	<button id="prosegui" type="button" onclick="validate(1)">Prosegui</button>
        	</div>
        	
    	</div>
    
    	<div id="form2" style="display: none;">
        	<h1 id="accedi">Registrati</h1>
        	<div class="content">
            	<div class="input-field">
                	<input type="text" placeholder="Nome" id="nome" name="nome" required>
                	<p class="error_message"></p>
            	</div>
            
            	<div class="input-field">
                	<input type="text" placeholder="Cognome" id="cognome" name="cognome" required>
                	<p class="error_message"></p>
            	</div>
            	
            	<div class="input-field">
                	<input type="text" placeholder="Username" id="username" name="username" required>
                	<p class="error_message"></p>
            	</div>
            	<div class="">
                <p id="error_messages2" style="color: red;"></p>
            	</div>
        	</div>
        	<br><br>
        	<div class="action">
            	<button id="regBtn" onclick="validate(2)"  type="button">Registrati</button> 
        	</div>
        	
        </div>
    	</form>
    
        <jsp:include page="footer.jsp"/>
        
        <script type="text/javascript">
 
        document.getElementById("registerForm").onkeypress = function(e) { //risolvere il tasto enter che non mostra gli errori
      	  var key = e.charCode || e.keyCode || 0;     
      	  if (key == 13) {
      		     
      	    if(document.getElementById("form1").style.display != 'none'){
      	    	e.preventDefault();
      	    	validate(1);
      	    }else{
      	    	//console.log("flag2");
      	    	validate(2);
      	    }
      	    
      	  }
      	}
        
        function validate(x) { 	
        	if(x == 1){
        		var error_text_output_element = document.getElementById("error_messages");
        	}else if(x == 2){
        		var error_text_output_element = document.getElementById("error_messages2");
        	}
	 	        
				
	 	        if(x == 1){
	 	        	var fields_to_check = ["emailInput", "pass1", "pass2"]; //id dei campi del form da verificare
		 	        var fields_human_names = ["Email", "Password", "RipetiPassword"]; //nomi leggibili per il messaggio di errore
	 	        }else if(x == 2){
	 	        	var fields_to_check = ["nome", "cognome", "username"]; //id dei campi del form da verificare
		 	        var fields_human_names = ["Nome", "Cognome", "Username"]; //nomi leggibili per il messaggio di errore
	 	        }
	 	        

	 	        var check_field;
	 	        var error_message = "Si � verificato un errore: "; //testo di errore
	 	        var errors_exist = 0;

	 	        for (var i = 0; i < fields_to_check.length; i++) {

	 	            check_field = document.forms["registerForm"][fields_to_check[i]].value;
					//console.log(check_field.length);
	 	            if (check_field == ""){

	 	                if (errors_exist === 0) {
	 	                    error_message += "Inserisci: " + fields_human_names[i];  //Il primo errore del testo
	 	                }else {
	 	                    error_message += ", " + fields_human_names[i]; //Aggiunge ogni nuovo errore al testo, delimitati dalla virgola
	 	                }

	 	                errors_exist += 1; // Incrementa il counter degli errori
	 	                console.log(document.forms["registerForm"][fields_to_check[i]].id + " " + check_field.length);
	 	            }else if(strcmp(document.forms["registerForm"][fields_to_check[i]].id, "pass1") != 0 && strcmp(document.forms["registerForm"][fields_to_check[i]].id, "pass2") != 0 && strcmp(document.forms["registerForm"][fields_to_check[i]].id, "emailInput") != 0 && strcmp(document.forms["registerForm"][fields_to_check[i]].id, "username") != 0 && check_field.length < 2){
	 	            	error_message += "<br/>" + fields_human_names[i] + " deve contenere almeno 2 caratteri";
	 	            	errors_exist += 1;
	 	            }else if(strcmp(document.forms["registerForm"][fields_to_check[i]].id, "pass1" ) == 0 && check_field.length < 8){
	 	            	error_message += "<br/>La password deve contenere almeno 8 caratteri";
	 	            	errors_exist += 1;
	 	            }else if(strcmp(document.forms["registerForm"][fields_to_check[i]].id, "username" ) == 0 && check_field.length < 5){
	 	            	error_message += "<br/>L'username deve contenere almeno 5 caratteri";
	 	            	errors_exist += 1;
	 	            }

	 	        }
	 	       //console.log(strcmp(document.forms["registerForm"][fields_to_check[2]].value, document.forms["registerForm"][fields_to_check[1]].value)); flag
	 	       if(x == 1){
	 	    	  if(strcmp(document.forms["registerForm"][fields_to_check[2]].value, document.forms["registerForm"][fields_to_check[1]].value) != 0){ //Controlla che le due password siano uguali
		 	       		error_message += "<br/>Le password non coincidono."; //Aggiunge il testo di errore
		           		errors_exist += 1;  //Incrementa il counter degli errori
		 	       }

		 	        if(!validateEmail(document.forms["registerForm"][fields_to_check[0]].value)){
		 	        	error_message += "<br/>La mail non � valida"; //Se la mail non  valida
		            	errors_exist += 1;
		 	        }
	 	       }
	 	       
	 	        //console.log(errors_exist);
	 	        if (errors_exist > 0){ //Se sono presenti errori

	 	            error_text_output_element.innerHTML = error_message; //Mostra l errore
	 	            return false; //Termina con valore false
	 	        }else if(x == 1){
	 	        	openForm(); //Va al secondo step del form
	 	        	
	 	        }else if(x == 2){
	 	        	document.getElementById("regBtn").setAttribute('type', 'submit');
	 	        }
        }
	 	     
		function openForm() {
			document.getElementById("form1").style.display = "none";
 			document.getElementById("form2").style.display = "block";
		}
		
		/*
		* Questa funzione confronta due stringhe date come parametri
		*/
		function strcmp(a, b){   
		    return (a<b?-1:(a>b?1:0)); //Se a<b restituisce -1; Se a>b restituisce 1; Se le stringhe sono uguali restituisce 0
		}
		
		/*
		* Questa funzione convalida le email poich� la gestione degli errori del browser � stata disabilitata nel primo form 
		*/
		function validateEmail(email){
	        var re = /\S+@\S+\.\S+/; //Il formato della stringa deve essere stringa@stringa.stringa
	        //alert(re.test(email));
	        return re.test(email); //Testa la stringa con il formato re
	    }
	</script>
</body>

</html>