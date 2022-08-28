<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<%
	Map<ProdottoBean, Integer> obj = (Map<ProdottoBean, Integer>)request.getAttribute("carrello_view"); 
	if(obj == null){
		response.sendRedirect("./Cart?action=view");
	}
	request.setAttribute("carrello_view", null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<table>
	<% // Il for crea una variabile del tipo ProdottoBean ed ad ogni iterazione va ad assegnare a quella variabile il contenuto di obj all'i-esima posizione 
	if(obj != null && !obj.isEmpty()){
	for(Map.Entry<ProdottoBean, Integer> entry : obj.entrySet()){
		ProdottoBean var = entry.getKey();
		
	%>
	<tr>
	<td> <a href="Catalogo?action=view&id=<%= var.getCodprodotto()%>"> <img src="<%= var.getImmagine().getPath()%>"> </a> </td>
	<td> <a href="Catalogo?action=view&id=<%= var.getCodprodotto()%>"> <%= var.getNome()%> </a>	<%= String.format("%.02f", var.getPrezzo()) %> &euro;</td>
	<td> Quantità : <%= entry.getValue() %>  <a href="Cart?action=add&id=<%= var.getCodprodotto()%>&qnt=1&provenienza=carrello"><input type ="button" value = "+"></a>&nbsp;	<a href="Cart?action=sub&id=<%= var.getCodprodotto()%>&qnt=1&provenienza=carrello"><input type ="button" value = "-"> </a>
			&nbsp;	<a href="Cart?action=rmv&id=<%= var.getCodprodotto()%>&qnt=1&provenienza=carrello"><input type ="button" value = "Rimuovi"></a>
	</td>
	</tr>
	</table>
	
		
	<%}%>
	<a href="Cart?action=rmvall&qnt=1&provenienza=carrello"><input type ="button" value = "Rimuovi tutto"></a>
	
	<%}
	else {%>
	
	<p> Il carrello è vuoto</p>
	
	<%}%>



<jsp:include page="footer.jsp"/>

</body>
</html>