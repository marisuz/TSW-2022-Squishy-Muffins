<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, Model.*"%>
    
<%	if(request.getSession().getAttribute("secure") == null || request.getSession().getAttribute("secure").equals("Utente")){
	response.sendRedirect("./login.jsp");
	return;
}
	ProdottoBean var = (ProdottoBean)request.getAttribute("modify");
	request.setAttribute("modify", null);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica Catalogo</title>
</head>
<body>

<form method="post" action="Modify" enctype="multipart/form-data">

<input type="hidden" name="id" value="<%= var.getCodprodotto()%>">
<input type="hidden" name="action" value="update">
		
<input type="text" name="Nome" value="<%= var.getNome()%>">
<br>
<input type="number" name="Prezzo" value="<%= var.getPrezzo()%>">
<br>
<input type="text" name="Descrizione" value="<%= var.getDescrizione()%>">
<br>
<img src="<%= var.getImmagine()%>">
<input type="file" name="Immagine" >
<br>
<input type="radio" name="Rimosso" value="1" <%if(var.getRimosso() == 1) out.println("checked"); %>> Yes
<br>
<input type="radio" name="Rimosso" value="0" <%if(var.getRimosso() == 0) out.println("checked"); %>> No
<br>
<input type="submit" value="Invio">

</form>

</body>
</html>