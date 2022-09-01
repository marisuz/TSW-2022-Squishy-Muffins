<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<% 
	Map<ProdottoBean, Integer> obj = (Map<ProdottoBean, Integer>) request.getSession().getAttribute("carrello_view");
	if(obj == null){
		response.sendRedirect("./Carrello.jsp");
		return;
	}
	
	UtenteBean u = (UtenteBean)request.getSession().getAttribute("Utente loggato");
	if (u == null){
		response.sendRedirect("./login.jsp");
		return;
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
	
	<form action="Salvataggio_ordine" method="post">
	<% 
		if (u.getPagamento() != null){
		for(PagamentoBean pbean : u.getPagamento()){
			
	%>	
		<input type="radio" name="Pagamento" required value="<%= pbean.getIdpagamento()%>">
		<p> <%=  pbean.getNominativo() %></p>
		<p> <%=  pbean.getCVV() %></p>
		<p> <%=  pbean.getMeseScadenza() %></p>
		<p> <%=  pbean.getAnnoScadenza() %></p>
		<p> <%=  pbean.getCodice_carta() %></p>
		
	<%}}%>
	
		<% 
		if (u.getConsegna() != null){
		for(ConsegnaBean cbean : u.getConsegna()){
	%>	
		<input type="radio" name="Indirizzo" required value="<%= cbean.getIdconsegna()%>">
		<p> <%=  cbean.getVia() %></p>
		<p> <%=  cbean.getNumero() %></p>
		<p> <%=  cbean.getCap() %></p>
		<p> <%=  cbean.getCitta() %></p>
		
	<%}}%>
	
	
		<input type="submit" value="Completa ordine">
	</form>
	<%}%>
	<jsp:include page="footer.jsp"/>
</body>
</html>