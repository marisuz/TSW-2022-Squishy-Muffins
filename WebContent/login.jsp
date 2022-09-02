<%-- <%@page import="Model.UserBean" %>
<%@ page errorPage="ErrorPage.jsp" %>  --%>

<!DOCTYPE html>
<html lang="it">

	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style/login.css">
	    <link rel="stylesheet" href="style/header.css">
	    <link rel="stylesheet" href="style/footer.css">
	    <link rel="shortcut icon" type="image/png" href="logo.png">
 	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <title>Squishy Muffins|Login</title>
	</head>


<%-- 	<%
	if(request.getSession().getAttribute("utente") == null){;
		request.getSession().setAttribute("ruolo", "guest");
	}
	if(!request.getSession().getAttribute("ruolo").equals("guest"))
	{
		response.sendRedirect("home.jsp");
		return;
	} %> --%>



	<body>
	
		<jsp:include page="header.jsp"/>
	    
	<%-- 	<%String pageRedirect = request.getParameter("pageLogin");%> --%>
	
	
	    <form id="loginForm" class="loginForm" method="post" action="login">
	        <h1 id="accedi">Accedi</h1>
	        <div class="content">
	            <div class="input-field">
	                <input type="text" placeholder="Username" id="username" name="username">
	            </div>
	            <div class="input-field">
	                <input type="password" placeholder="Password" id="password" name="password">
	            </div>
	            
	        </div>
	        <p id="loginErr" class="loginError"></p>
	        <br><br>
	        <div class="action">
	            <a href="register.jsp">Registrati</a>
	            <button id="loginButton">Login</button>
	        </div>
	    </form>
	
		<jsp:include page="footer.jsp"/>
	
	<!-- <script>
       $('#loginForm').on('submit', function(e){
    	   e.preventDefault();

          $.ajax({
        	  type: "POST",
              url:"LoginServlet",
              data: $("#loginForm").serialize(),
              cache: false,
              success: function (data) {
                 if(data.substring(0, 4)=='True'){
                   let redirectPage = data.replace('True', '');
                   $(location).attr('href', redirectPage);
                 }else{
                     var el = document.getElementById("loginErr");
                     el.innerHTML = "Errore! Utente o password non corretti! Riprovare!"
                 }
              }
          });
         return;
       });
   </script>
	 -->
	</body>

</html>