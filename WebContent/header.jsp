<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="style/header.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Squishy Muffins Navbar</title>
</head>

<body>
    <header>
        <div>
            <a href="homepage.html"> <img src="./logo.png" alt="logo" class="logo"></a>
        </div>

        <div class="link">
            <a href="#">Catalogo</a>
           <!-- <a href="#"></a>
            <a href="#"></a>  -->
            <a href="#">barra di ricerca</a>
            <a href="#">immagine utente</a>
            <a href="#">carrello</a>
        </div>

        <div class="hamburger">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </header>
</body>



<script>
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".link");

    hamburger.addEventListener("click", () => {
        hamburger.classList.toggle("active");
        navMenu.classList.toggle("active");
    })
</script>

</html>