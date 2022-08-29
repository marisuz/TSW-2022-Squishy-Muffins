<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
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
<meta charset="ISO-8859-1">
<title>Modifica dati utente</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
<form method="post" action="Mod_utente">

<input type="text" name="Email_nuova" value="<%= var.getEmail()%>">
<input type="hidden" name="Email_vecchia" value="<%= var.getEmail()%>">
<input type="hidden" name="action" value="update">
<br>
<input type="text" name="Password" value="<%= var.getPassword()%>">
<br>
<input type="text" name="Nome" value="<%= var.getNome()%>">
<br>
<input type="text" name="Cognome" value="<%= var.getCognome()%>">
<br>
<input type="text" name="CodiceFiscale" value="<%= var.getCodice_fiscale() %>">
<br>
<input type="submit" value="Conferma">


</form>
	<jsp:include page="footer.jsp" />
</body>
</html>