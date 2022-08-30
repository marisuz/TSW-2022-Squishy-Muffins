<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<% 
	Map<ProdottoBean, Integer> obj = (Map<ProdottoBean, Integer>) request.getSession().getAttribute("carrello_view");
	if(obj == null){
		response.sendRedirect("./Carrello.jsp");
	}
	
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina acquisto</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<% 
	if(obj != null && !obj.isEmpty()){
		float Prezzo_finale = 0; 
	for(Map.Entry<ProdottoBean, Integer> entry : obj.entrySet()){
			ProdottoBean var = entry.getKey();
	float Prezzo_totale =(obj.get(var) * var.getPrezzo());
	
	%>
	
	<%= var.getNome() %> 
	quantità: <%= obj.get(var) %>
	prezzo: <%= String.format("%.02f",Prezzo_totale)%> &euro;
	<br>
	
	
	<%Prezzo_finale += Prezzo_totale; }%>
	
	<p>Totale: <%= String.format("%.02f",Prezzo_finale) %> &euro; </p> 
	
	<%}%>
	<jsp:include page="footer.jsp"/>
</body>
</html>