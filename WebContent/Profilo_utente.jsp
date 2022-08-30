<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
    <%UtenteBean obj = (UtenteBean)request.getSession().getAttribute("Utente loggato");
    	if(obj == null){%>
    		
    		<jsp:forward page="login.jsp"/>
    		
    	<%}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Area utente</title>
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