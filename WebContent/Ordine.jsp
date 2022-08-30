<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<%
	LinkedList<OrdineBean> var = (LinkedList<OrdineBean>)request.getAttribute("ordini");
	if (var == null) {
		response.sendRedirect("./Ordine");
		
	}

%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista ordini</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
		<% 
		// Il cilco for serve per controllare che la variabile non sia vuota, e in caso positivo continua ad interare inserendo il valore in obj
		if(var != null){
				for(OrdineBean obj : var){
						System.out.println("cose" + obj);
					
		
		%>
		
				<p>  <%=obj.getIdOrdine() %> </p>
		<br>
				<p>  <%=obj.getIdOrdine() %> </p>
		<br>
				<p>  <%=obj.getData_ordine() %> </p>
		<br>
				<p>  <%=obj.getStato_ordine() %> </p>
		<br>
				<p>  <%=obj.getCodConsegna().getIdconsegna() %> </p>
		<br>
				<p>  <%=obj.getCodPagamento().getIdpagamento() %> </p>
		<br>
				<p>  <%=obj.getCodUtente().getEmail() %> </p>
		<br>
		
		<% 
			
				
				
				
				
				
		
				
				
				
		}%>
		
		
		<% 
		}
		else{%>
			<p>Nessun ordine</p>
			
		<%}
		%>
	
	<jsp:include page="footer.jsp" />
</body>
</html>