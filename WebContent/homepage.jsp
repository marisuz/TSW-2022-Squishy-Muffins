<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*, Model.*"%>
<!DOCTYPE html>

<html>

<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="./style/homepage.css">
	<link rel="shortcut icon" type="image/png" href="logo.png">
	<link href="https://fonts.google.com/specimen/Ubuntu?sort=popularity&noto.lang=en_Latn" rel="stylesheet" type="text/css">
	
	<title>Squishy Muffins|Homepage</title>
    
</head>


<style>
body {
  background-image: url("cupcake02.png");
}
</style>


	<body>
		<jsp:include page="header.jsp"/>
	
	    <div class="center">
	        <div class="dot">
	            <div class="dotArancione">
	            </div>
	        </div>
	        <span class="spanHome" id="testo">Squishy Muffins</span>
	         <hr class="wave-sx" > 
	    </div>
	
		<div class="parteFinaleHome">
			<button class="uname"><a href="Catalog.jsp">Vai al Catalogo</a></button>
		</div>
		
		
		<br><br><br><br><br><br><br>
		<jsp:include page="footer.jsp"/>
	</body>

</html>