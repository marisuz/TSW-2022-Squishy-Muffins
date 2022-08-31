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
	    <link rel="stylesheet" href="profilo_utente.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<title>Squishy Muffins|Area utente</title>
	</head>
	
	<body>
		<jsp:include page="header.jsp" />
		
		

			<%=obj.getEmail() %>
			<br>
			<%=obj.getPassword() %>
			<br>
			<%=obj.getNome() %>
			<br>
			<%=obj.getCognome() %>
			<br>
			<%=obj.getCodice_fiscale() %>
			<br>
		
		
		<a href="Modify_utente.jsp"> modifica</a> 
		
		
		<jsp:include page="footer.jsp" />
	</body>
</html>