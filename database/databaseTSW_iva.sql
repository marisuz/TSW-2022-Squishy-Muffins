CREATE DATABASE  IF NOT EXISTS `squishy_muffins` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `squishy_muffins`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: squishy_muffins
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `cod_categoria` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'pupazzi'),(2,'portachiavi'),(3,'squishy');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `codi_prodotto` int NOT NULL,
  `num_ordine` int NOT NULL,
  `quantita` double NOT NULL,
  `iva` double NOT NULL DEFAULT '0',
  `prezzo` double NOT NULL DEFAULT '0',
  KEY `codi_prodotto_idx` (`codi_prodotto`),
  KEY `num_ordine_idx` (`num_ordine`),
  CONSTRAINT `codi_prodotto` FOREIGN KEY (`codi_prodotto`) REFERENCES `prodotto` (`cod_prodotto`),
  CONSTRAINT `num_ordine` FOREIGN KEY (`num_ordine`) REFERENCES `ordine` (`id_ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (3,2,2,0,0),(4,3,1,0,0),(3,3,2,0,0),(5,3,3,0,0),(7,4,2,0,0),(4,5,2,0,0);
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consegna`
--

DROP TABLE IF EXISTS `consegna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consegna` (
  `id_consegna` int NOT NULL,
  `via` varchar(45) NOT NULL,
  `cap` int NOT NULL,
  `numero` int NOT NULL,
  `citta` varchar(45) NOT NULL,
  `utente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_consegna`),
  KEY `email_utente_idx` (`utente`),
  CONSTRAINT `email` FOREIGN KEY (`utente`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consegna`
--

LOCK TABLES `consegna` WRITE;
/*!40000 ALTER TABLE `consegna` DISABLE KEYS */;
INSERT INTO `consegna` VALUES (0,'Lombardi',80123,4,'Cosenza','genny.schisano@gmail.com'),(1,'Taurano',84016,58,'Pagani','mary.santillo@gmail.com');
/*!40000 ALTER TABLE `consegna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immagine`
--

DROP TABLE IF EXISTS `immagine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immagine` (
  `nome_immagine` varchar(45) NOT NULL,
  `path` varchar(60) NOT NULL,
  PRIMARY KEY (`nome_immagine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immagine`
--

LOCK TABLES `immagine` WRITE;
/*!40000 ALTER TABLE `immagine` DISABLE KEYS */;
INSERT INTO `immagine` VALUES ('1','./images/1.jpg'),('10','./images/10.jpg'),('11','./images/11.jpg'),('12','./images/12.jpg'),('13','./images/13.jpg'),('14','./images/14.jpg'),('15','./images/15.jpg'),('16','./images/16.jpg'),('17','./images/17.jpg'),('18','./images/18.jpg'),('19','./images/19.jpg'),('2','./images/2.jpg'),('20','./images/20.jpg'),('21','./images/21.jpg'),('22','./images/22.jpg'),('23','./images/23.jpg'),('24','./images/24.jpg'),('25','./images/25.jpg'),('26','./images/26.jpg'),('27','./images/27.jpg'),('28','./images/28.jpg'),('29','./images/29.jpg'),('3','./images/3.jpg'),('30','./images/30.jpg'),('31','./images/31.jpg'),('32','./images/32.jpg'),('33','./images/33.jpg'),('34','./images/34.jpg'),('35','./images/35.jpg'),('36','./images/36.jpg'),('37','./images/37.jpg'),('38','./images/38.jpg'),('39','./images/39.jpg'),('4','./images/4.jpg'),('5','./images/5.jpg'),('6','./images/6.jpg'),('7','./images/7.jpg'),('8','./images/8.jpg'),('9','./images/9.jpg');
/*!40000 ALTER TABLE `immagine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pagamento`
--

DROP TABLE IF EXISTS `metodo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pagamento` (
  `id_pagamento` int NOT NULL,
  `nominativo` varchar(80) NOT NULL,
  `CVV` int NOT NULL,
  `meseScadenza` int NOT NULL,
  `codice_carta` varchar(16) NOT NULL,
  `annoScadenza` int NOT NULL,
  `e_utente` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `e_utente_idx` (`e_utente`),
  CONSTRAINT `e_utente` FOREIGN KEY (`e_utente`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pagamento`
--

LOCK TABLES `metodo_pagamento` WRITE;
/*!40000 ALTER TABLE `metodo_pagamento` DISABLE KEYS */;
INSERT INTO `metodo_pagamento` VALUES (0,'Gennaro',733,3,'123456743653',2022,'genny.schisano@gmail.com'),(1,'Mary',677,4,'hgjtuy12ridotelf',2030,'mary.santillo@gmail.com'),(2,'Leo',633,8,'123ASD432',2031,'mary.santillo@gmail.com');
/*!40000 ALTER TABLE `metodo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `id_ordine` int NOT NULL,
  `data_ordine` date NOT NULL,
  `stato_ordine` varchar(45) NOT NULL,
  `cod_consegna` int NOT NULL,
  `cod_pagamento` int NOT NULL,
  `cod_utente` varchar(50) NOT NULL,
  `prezzo_totale` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ordine`),
  KEY `consegna_idx` (`cod_consegna`),
  KEY `cod_pagamento_idx` (`cod_pagamento`),
  KEY `cod_utente_idx` (`cod_utente`),
  CONSTRAINT `cod_consegna` FOREIGN KEY (`cod_consegna`) REFERENCES `consegna` (`id_consegna`),
  CONSTRAINT `cod_pagamento` FOREIGN KEY (`cod_pagamento`) REFERENCES `metodo_pagamento` (`id_pagamento`),
  CONSTRAINT `cod_utente` FOREIGN KEY (`cod_utente`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'2000-04-23','In arrivo',1,1,'gerardo.napolitano@gmail.com',0),(2,'2022-08-31','In lavorazione',1,1,'mary.santillo@gmail.com',0),(3,'2022-08-31','In lavorazione',1,2,'mary.santillo@gmail.com',0),(4,'2022-09-01','In lavorazione',0,0,'genny.schisano@gmail.com',0),(5,'2022-09-03','In lavorazione',0,0,'genny.schisano@gmail.com',0);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `cod_prodotto` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `descrizione` varchar(800) NOT NULL,
  `quantita` int NOT NULL,
  `cod_immagine` varchar(45) DEFAULT NULL,
  `codi_categoria` int NOT NULL,
  `rimosso` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cod_prodotto`),
  KEY `cod_immagine_idx` (`cod_immagine`),
  KEY `codi_categoria_idx` (`codi_categoria`),
  CONSTRAINT `cod_immagine` FOREIGN KEY (`cod_immagine`) REFERENCES `immagine` (`nome_immagine`),
  CONSTRAINT `codi_categoria` FOREIGN KEY (`codi_categoria`) REFERENCES `categoria` (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,'Sweet',12,'Un soggetto inedito entra a far parte delle Sweet Collection: il bassotto.',50,'1',1,1),(2,'Border Collie',34.99,'Scott è un elegantissimo Border Collie, un cane affettuoso che ama stare in compagnia, soprattutto dei bambini.',50,'2',1,0),(3,'Pastore Tedesco',59.99,'Rusty è un cucciolo di pastore Tedesco, il cane più diffuso in Italia.',65,'3',1,0),(4,'Gattino',14.5,'Il gattino Trudi Friends è caratterizzato da un soffice manto rigato e grandi occhi ricamati su un dolce e tenero musetto. La linea Trudi Friends, è caratterizzata da 8 piccoli amici, dagli occhi vispi e dai musetti felici. I colori abbracciano la fantasia, così come le loro forme. Una linea che lascia lo spazio alla libertà di giocare e di immaginare. Il peluche è lavabile in lavatrice a 30°, in alternativa può essere lavato a mano, utilizzando una spugna e del sapone neutro.',43,'4',1,0),(5,'Drago Rosa Aurora',8,'Peluches drago rosa occhioni. Aurora yohoo&friends. 15cm',24,'5',1,0),(6,'Procione Tirolese',9,'Peluches procione tirolese. Peluches occhioni Aurora Yohho&Friends. Altezza 15cm',20,'6',1,0),(7,'Scimmia Cappuccina',10,'Peluches scimmia cappuccina. Peluches aurora Yohoo&Friends. Altezza 15cm',20,'7',1,0),(8,'Pinguino Nero',10,'Peluches pinguino nero. Peluches Aurora&Friends. Altezza 15cm',30,'8',1,0),(9,'Renna',10,'Peluches renna. Peluches Aurora Yohoo&Friends. Altezza 15cm',15,'9',1,0),(10,'Zebra',24.99,'La marionetta Zebra è una morbidissima puppet tridimensionale. E’ la prima volta che Trudi realizza una puppet zebra!',50,'10',1,0),(11,'Leopardo',14.99,'Il leopardo Trudi Friends è caratterizzato da un coloratissimo manto maculato e grandi occhi ricamati su un dolce e tenero musetto. La linea Trudi Friends, è caratterizzata da 8 piccoli amici, dagli occhi vispi e dai musetti felici. I colori abbracciano la fantasia, così come le loro forme. Una linea che lascia lo spazio alla libertà di giocare e di immaginare. Il peluche è lavabile in lavatrice a 30°, in alternativa può essere lavato a mano, utilizzando una spugna e del sapone neutro.',50,'11',1,0),(12,'Fenicottero',14.99,'Il fenicottero Trudi Friends è caratterizzato da collarino glitterato, un soffice corpicino rosa e grandi occhi ricamati su un dolce e tenero musetto. La linea Trudi Friends, è caratterizzata da 8 piccoli amici, dagli occhi vispi e dai musetti felici. I colori abbracciano la fantasia, così come le loro forme. Una linea che lascia lo spazio alla libertà di giocare e di immaginare. Il peluche è lavabile in lavatrice a 30°, in alternativa può essere lavato a mano, utilizzando una spugna e del sapone neutro.',50,'12',1,0),(13,'Tartaruga',17.99,'Quando l’amore si concentra in pochi centimetri, questi si chiamano Trudini.',50,'13',1,0),(14,'Leone',22.99,'Il Puppy Leone, una nuovo cucciolo del character Trudi leone più amato. I nuovi materiali morbidi e soffici, le espressioni dolcissime e le forme semplici danno vita a questo elefante dall’aspetto tenero e sognante. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'14',1,0),(15,'Elefantino',22.99,'Il Puppy Elefante, una nuovo cucciolo del character Trudi elefante più amato. I nuovi materiali morbidi e soffici, le espressioni dolcissime e le forme semplici danno vita a questo elefante dall’aspetto dolce e sognante.Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'15',1,0),(16,'Beanie Boos',3.99,'Portachiavi beanie boos clips tundra',50,'16',2,0),(17,'Bubbly',9.99,'Bubbly Pegaso, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'17',2,0),(18,'Maialino',9.99,'Bubbly maiale, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'18',2,0),(19,'Coniglietto',9.99,'Bubbly Coniglietto, come suggerIsce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'19',2,0),(20,'Pulcino',9.99,'Bubbly pulcino, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'20',2,0),(21,'Coccinella',9.99,'Bubbly Coccinella, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'21',2,0),(22,'Rana',9.99,'Bubbly rana, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'22',2,0),(23,'Scoiattolo',9.99,'Bubbly scoiattolo, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'23',2,0),(24,'Granchio',9.99,'The Pompons, una nuova coloratissima e scoppiettante linea di charm. Ogni loop in raso è perfettamente abbinato ai colori del soggetto. Mix fantasiosi e peli lunghissimi accompagnano le dolcissime espressioni di questi animaletti. Un granchietto verde acqua arricchito da ciuffi di colore giallo, rosa e azzurro sul corpo. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'24',2,0),(25,'Cigno',12.99,'The Pompons, una nuova coloratissima e scoppiettante linea di charm. Ogni loop in raso è perfettamente abbinato ai colori del soggetto. Mix fantasiosi e peli lunghissimi accompagnano le dolcissime espressioni di questi animaletti. Un elegantissimo cigno bianco con un corpo dai tocchi rosa, azzurri, bianchi e filamenti dorati. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'25',2,0),(26,'Ippopotamo',9.99,'Bubbly ippopotamo, come suggerisce il nome è una vera e propria bollicina di colore. Coloratissimi, piccoli e giocosi, un batuffolo da portare sempre assieme a te. Ogni animaletto ha un espressione semplice e dolce. Punti a mano, cambi di materiale raso e non, li rendono delle miniature davvero preziose. Grazie al keychain, sono perfetti per borse, zaini e portachiavi. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'26',2,0),(27,'Puzzola',12.99,'The Pompons, una nuova coloratissima e scoppiettante linea di charm. Ogni loop in raso è perfettamente abbinato ai colori del soggetto. Mix fantasiosi e peli lunghissimi accompagnano le dolcissime espressioni di questi animaletti. Una puzzola un po pazzerella, con ciuffetti grigi striati, una folta cresta bianca e un nasino rosa all’insù. Il peluche è lavabile in lavatrice a 30°, quando la misura lo consente, in alternativa può essere lavato a mano, utilizzando una spugna e sapone neutro.',50,'27',2,0),(28,'Chewbecca',7,'Peluches portachiavi ChewBecca proveniente dal film Star Wars. Altezza 8cm.',20,'28',2,0),(29,'Tokitoki unicorno',8.9,'Peluches portachiavi Tokidoki Unicorno. Colore assortito.',20,'29',2,0),(30,'Pinocchio',5.9,'Portachiavi in legno per bambini. Pinocchio. Altezza 10cm.',40,'30',2,0),(31,'Orsetto celeste',10,'Squishy orsetto celeste.',40,'31',3,0),(32,'Gattino Kitty',10,'Squishy gattino raffigurante Hello Kitty.',40,'32',3,0),(33,'Gatto',10,'Squishy gatto.',30,'33',3,0),(34,'Squishy Kawaii',12.9,'Squishy by Erika Kawaii.',45,'34',3,0),(35,'Squishy cuore',12.8,'Biscotti cremosi a forma di cuore ripieni di gocce di cioccolato con Yummiibear baby e marshmellii! Palloncini volanti e abbracci, questi graziosi accessori per macaron sono perfetti. Lenta lievitazione e molto soffice.',50,'35',3,0),(36,'Squishy bear',25.59,'Questi simpatici squishy a forma di macaron raffigurano il piccolo Yummiibear che vola con palloncini e il piccolo Marshmellii che abbraccia!',50,'36',3,0),(37,'Squishy cioccolato',15.9,'Adorabili simpatici squishy al cioccolato che CREPANO e creano fantastici giocattoli da spremere per alleviare lo stress! Concessi in licenza e rari da Creamiicandy, includono Yummiibear, gattino zucchero filato, Marshmellii e altro ancora!',50,'37',3,0),(38,'Squishy ghiacciolo',25,'Questi simpatici squishy a forma di gelatini raffigurano il dolce gusto del gelato fuso al kawaii!',50,'38',3,0),(39,'Squishy pancake',18,'Jumbo squishy pancake con panna montata Yummiibear e cioccolato! Così jumbo, squishy ed enorme! Concesso in licenza da Puni Maru e creamiicandy',50,'39',3,0);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tipo_account` tinyint DEFAULT '0',
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(35) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('genny.schisano@gmail.com','Genny1990',0,'Gennaro','Schisano','SCHGNR80A01B963Z'),('gerardo.napolitano@gmail.com','Gerardo2000',1,'Gerardo','Napolitano','NPLGRD00R04A509E'),('gg.winno@gmail.com','aaaaaaaa',0,'Antonio','Pratico','ANTPRT098123ERG3'),('marisa.lasorda@gmail.com','Marisa1994',1,'Marisa','La Sorda','LSRMRS94T61B963S'),('mary.santillo@gmail.com','Mary1975',0,'Maria','Santillo','SNTMRA75L43F839O'),('peppe.alifano@gmail.com','Peppe2002',0,'Giuseppe','Alifano','LFNGPP02T14G482E');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizzo`
--

DROP TABLE IF EXISTS `utilizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizzo` (
  `codi_pagamento` int NOT NULL,
  `codi_utente` varchar(50) NOT NULL,
  KEY `cod_pagamento_idx` (`codi_pagamento`),
  KEY `codi_utente_idx` (`codi_utente`),
  CONSTRAINT `codi_pagamento` FOREIGN KEY (`codi_pagamento`) REFERENCES `metodo_pagamento` (`id_pagamento`),
  CONSTRAINT `codi_utente` FOREIGN KEY (`codi_utente`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizzo`
--

LOCK TABLES `utilizzo` WRITE;
/*!40000 ALTER TABLE `utilizzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilizzo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-03 19:41:18
