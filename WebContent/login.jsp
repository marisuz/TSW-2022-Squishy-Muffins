<%-- <%@page import="Model.UserBean" %>
<%@ page errorPage="ErrorPage.jsp" %>  --%>

<!DOCTYPE html>
<html lang="it">

	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style/login.css">
	    <link rel="stylesheet" href="style/header.css">
	    <link rel="stylesheet" href="style/footer.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
 	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <title>Squishy Muffins|Login</title>
	</head>

	<body>
	
		<jsp:include page="header.jsp"/>

	    <form id="loginForm" class="loginForm" method="post" action="login">
	        <h1 id="accedi">Accedi</h1>
	        <div class="content">
	            <div class="input-field">
	                <input type="text" placeholder="Username" id="username" name="username">
	                   	<p class="error_message"></p>
	            </div>
	            <div class="input-field">
	                <input type="password" placeholder="Password" id="password" name="password">
	                   	<p class="error_message2"></p>
	            </div>
	        </div>
	        
	        <p id="loginErr" class="loginError"></p>

	        <div class="action">
	            <a href="register.jsp">Registrati</a>
	            <button type="submit" id="loginButton">Login</button>
	        </div>
	    </form>
	
		<jsp:include page="footer.jsp"/>
	
		<script>
		
			/* funzione che controlla l'esistenza dell'utente */
		       $('#loginButton').click(function(event){
		    	   event.preventDefault();
		    	   const risposta = check(event);
		         return;
		       }); 
			
			
			/*risposta */		
			function check(event){
				
				return $.ajax({
		        	  type: "POST",
		              url:"LoginServlet",
		              data : {
			    			username : $("#username").val(), 
			    			password : $("#password").val()
			    		},
		              cache: false,
		              success: function (data){
		            	  
							if (data == "Email no DB"){
								
								$(".error_message").html("L'username non è valido");
								$(".error_message").css("color", "red");
								
							}else if(data == "email e psw si"){
								
								$("#loginForm").submit();
							}else if(data == "Password no"){
								
								$(".error_message2").html("La password non è valida");
								$(".error_message2").css("color", "red");
								
							}

		              }
		          });
	
				
			}
			
   		</script>

	</body>

</html>