<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>

<%	ProdottoBean var = (ProdottoBean) request.getAttribute("description");
request.setAttribute("description", null);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Pagina articolo dettagliata</title>
	</head>
	
	<body>
		<jsp:include page="header.jsp" />
	
		<%-- <table>
	
		<tr>
			<td rowspan="2">
				<img src="<%= var.getImmagine().getPath()%>">
	
			</td>
			<td>
				<%= var.getNome()%>	<%= var.getPrezzo()%> &euro;
			</td>
		</tr>
		
		<tr>
			<td>
				<%= var.getDescrizione()%>
	
			</td>
		</tr>
	</table> --%>
	
	
		<jsp:include page="footer.jsp" />
	</body>

</html>