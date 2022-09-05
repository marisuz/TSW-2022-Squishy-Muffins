<!DOCTYPE html>
<html lang="it">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <link rel="stylesheet" href="style/header.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	    <title>Squishy Muffins Navbar</title>
	</head>

	<body>
	    <header>
	        <div>
	            <a href="homepage.jsp"> <img src="./logo.png" alt="logo" class="logo"></a>
	        </div>
	
	        <div class="link">
					<div id="prova1" class="ricerca">
						<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg> 
						<input class="search" type="text" id="search">	 

					</div>
					
					<div id ="ricerca" class="leo"> <input type="hidden"> </div>
					 
 					 
		        <a href="Catalog.jsp">Catalogo</a>
		        <a href="Profilo_utente.jsp">
		            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16"> <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/> <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</a>
					
		        <a href="Carrello.jsp">
		            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16"> <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
					</svg> 
				</a>	
	        </div>
	
	        <div class="hamburger">
	            <span class="bar"></span>
	            <span class="bar"></span>
	            <span class="bar"></span>
	        </div>
	    </header>
	</body>



	<script>
	    const hamburger = document.querySelector(".hamburger");
	    const navMenu = document.querySelector(".link");
	
	    hamburger.addEventListener("click", () => {
	        hamburger.classList.toggle("active");
	        navMenu.classList.toggle("active");
	    })
	    
	     /* FUNZIONE AJAX  */
	     

		$(document).ready(function(){
		
			$("#search").keyup(function(){

		    	$("#ricerca").empty();
		    	var risultato = ricercaAjax($("#search").val());
		    	} 
		    )
		    
		    function ricercaAjax(nomeProdotto){
		    	return $.ajax({
		    		url : "ricerca",
		    		type : "GET",
		    		async : false,
		    		cache : false,
		    		timeout : 30000,
		    		dataType : "json",
		    		data : {
		    			action : "search",
		    			prodotto : nomeProdotto
		    		},
		    		success : function (data){

		    			
		    			mostraElemento(data);
		    			return data
		    		},
		    		fail : function (msg){
		    			alert("negativo")
		    			return true;
		    		}	
		    	});
		    }
		    
		    function mostraElemento(data){
		    	
		    	if(data.length > 0){

		    		$("#ricerca").empty();
		    		$("#ricerca").show();
		    		
		    		
		    		
		    		data.forEach(e => {
		    			
		    			var myvar=  '<a href="Catalogo?action=view&id='+e.codprodotto+'">'+
	                    			'<div style=" border:1px solid #ffc1c1; width:230px; background-color:lightblue; right:50px; z-index:1; border-radius: 10px; margin-bottom:5px; display:flex; justify-content:center; align-items:center;">'+
	                    			'<h2 class="titolo-ricerca">'+e.Nome+'</h2></a>'
	                    			+ '<a href="Catalogo?action=view&id='+e.codprodotto+'"><img class="immagine-ricerca" src="'+ e.Immagine.path +'">'+
	                        		'</a></div>';
	                $("#ricerca").append( myvar );
		    		})	
		    	}
		    	
		    	else if (data.length == 0){
		    		$("#ricerca").hide();
		    	}
		    }	
			
			
		})
		
		
		

	    
	    
	</script>
	
	

</html>