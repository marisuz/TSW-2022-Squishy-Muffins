<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<% // Provo a prendere dalla request l'attributo prodotti:
	// Se è nullo, richiama la servleet Catalogo per farlo riempire, altrimenti procede alla generazione della pagina

	Collection<ProdottoBean> obj = (Collection<ProdottoBean>)request.getAttribute("prodotti"); 
	if(obj == null){
		response.sendRedirect("./Catalogo?action=read");
	}
	request.setAttribute("prodotti", null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Catalogo</title>
</head>
<body>


	<jsp:include page="header.jsp"/>
	
	
	<table>
	<% // Il for crea una variabile del tipo ProdottoBean ed ad ogni iterazione va ad assegnare a quella variabile il contenuto di obj all'i-esima posizione 
	if(obj != null)
	for(ProdottoBean var:obj){ 
		if(var.getRimosso() == 1){
			continue;
		}
	%>
	<tr>
	<td> <a href="Catalogo?action=view&id=<%= var.getCodprodotto()%>"> <img src="<%= var.getImmagine().getPath()%>"> </a> </td>
	<td> <a href="Catalogo?action=view&id=<%= var.getCodprodotto()%>"> <%= var.getNome()%> </a>	<%= var.getPrezzo()%> &euro;</td>
	<td> <a href="Cart?action=add&id=<%= var.getCodprodotto()%>&qnt=1"> <input type="button" value="Aggiungi">  </a></td>
	</tr>
	<%}%>
	</table>
	
	
	<jsp:include page="footer.jsp"/>
</body>
</html>