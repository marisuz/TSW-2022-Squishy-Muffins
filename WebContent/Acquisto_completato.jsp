<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8" import="java.util.*, Model.*"%>
<!DOCTYPE html>
<html>

	<head>
 		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style/acquisto_completato.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
		<title>Squishy Muffins|Acquisto</title>
	</head>
	
	<body>
		<jsp:include page="header.jsp"/>
		
			<div class="grazie">
				<span> Grazie per aver acquistato da Squishy Muffins!</span>
			</div>

			<div class="acquisto">
				<img src="./thanks.png" alt="thank you" class="responsive">
			</div>
			
			<div class="torna">
				<a href="Catalog.jsp"><input class="procedi" type="button" value="Torna all'Homepage"> </a>
			</div>
		

			
		<jsp:include page="footer.jsp"/>
	</body>
	
</html>