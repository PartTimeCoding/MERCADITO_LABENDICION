/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.28-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: libreria
-- ------------------------------------------------------
-- Server version	11.4.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `autorId` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAutor` varchar(100) NOT NULL,
  PRIMARY KEY (`autorId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Antoine de Saint-Exupéry'),(2,'Gabriel García Márquez'),(3,'Miguel de Cervantes'),(4,'George Orwell'),(5,'J.K. Rowling'),(6,'J.R.R. Tolkien'),(7,'Jane Austen'),(8,'Homero'),(9,'Julio Cortázar'),(10,'Paulo Coelho'),(11,'Ray Bradbury'),(12,'Harper Lee'),(13,'Bram Stoker'),(14,'Suzanne Collins'),(15,'Carlos Ruiz Zafón');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;

--
-- Table structure for table `carretilla`
--

DROP TABLE IF EXISTS `carretilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretilla` (
  `usercod` bigint(10) NOT NULL,
  `libroId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL COMMENT 'Cantidad del libro',
  `crrprc` decimal(12,2) NOT NULL COMMENT 'Precio del libro',
  `crrfching` datetime NOT NULL COMMENT 'Fecha cuando se agregó',
  PRIMARY KEY (`usercod`,`libroId`),
  KEY `libroId_idx` (`libroId`),
  CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretilla`
--

/*!40000 ALTER TABLE `carretilla` DISABLE KEYS */;
INSERT INTO `carretilla` VALUES (4,6,1,470.00,'2025-07-31 23:35:49'),(4,7,1,320.00,'2025-07-31 23:35:51'),(4,8,1,290.00,'2025-07-31 23:35:52'),(4,9,1,540.00,'2025-07-31 23:35:53'),(4,10,1,400.00,'2025-07-31 23:35:53'),(5,11,5,360.00,'2025-07-31 23:38:16'),(5,13,5,380.00,'2025-07-31 23:38:21');
/*!40000 ALTER TABLE `carretilla` ENABLE KEYS */;

--
-- Table structure for table `carretillaanon`
--

DROP TABLE IF EXISTS `carretillaanon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `libroId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`anoncod`,`libroId`),
  KEY `libroId_idx` (`libroId`),
  CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretillaanon`
--

/*!40000 ALTER TABLE `carretillaanon` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretillaanon` ENABLE KEYS */;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `editorialId` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEditorial` varchar(100) NOT NULL,
  PRIMARY KEY (`editorialId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'HCH'),(2,'Sudamericana'),(3,'Francisco de Robles'),(4,'Secker & Warburg'),(5,'Bloomsbury'),(6,'Allen & Unwin'),(7,'T. Egerton'),(8,'Clásicos Griegos'),(9,'Rocco'),(10,'Ballantine Books'),(11,'J.B. Lippincott & Co.'),(12,'Archibald Constable'),(13,'Scholastic'),(14,'Planeta');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('COMPRAR','Realizar compras','ACT','NEG'),('Controllers\\Libreria\\Historial\\Transacciones','Controllers\\Libreria\\Historial\\Transacciones','ACT','CTR'),('GEST_CARRITO','Gestionar carrito','ACT','NEG'),('GEST_LIBROS','Gestión de libros','ACT','NEG'),('GEST_PEDIDOS','Gestión de pedidos','ACT','NEG'),('GEST_USUARIOS','Gestión de usuarios','ACT','SIS'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','MNU'),('MOD_ESTADOS','Modificar estados de pedidos','ACT','NEG'),('VER_HISTORIAL','Ver historial completo','ACT','REP'),('VER_PEDIDOS','Ver sus pedidos','ACT','NEG');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

--
-- Table structure for table `funciones_roles`
--

DROP TABLE IF EXISTS `funciones_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('ADMIN','GEST_LIBROS','ACT',NULL),('ADMIN','GEST_PEDIDOS','ACT',NULL),('ADMIN','GEST_USUARIOS','ACT',NULL),('ADMIN','MOD_ESTADOS','ACT',NULL),('ADMIN','VER_HISTORIAL','ACT',NULL),('CLIENTE','COMPRAR','ACT',NULL),('CLIENTE','GEST_CARRITO','ACT',NULL),('CLIENTE','VER_PEDIDOS','ACT',NULL);
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `libroId` int(11) NOT NULL AUTO_INCREMENT,
  `libroNombre` varchar(255) NOT NULL,
  `libroDescripcion` text NOT NULL,
  `libroAñoPublicacion` int(4) NOT NULL,
  `autorId` int(11) NOT NULL,
  `editorialId` int(11) NOT NULL,
  `libroGenero` varchar(100) NOT NULL,
  `libroPrecio` decimal(10,2) NOT NULL,
  `libroImgUrl` varchar(255) NOT NULL,
  `libroStock` int(11) NOT NULL DEFAULT 0,
  `libroEstado` char(3) NOT NULL,
  PRIMARY KEY (`libroId`),
  KEY `fk_libro_autor` (`autorId`),
  KEY `fk_libro_editorial` (`editorialId`),
  CONSTRAINT `fk_libro_autor` FOREIGN KEY (`autorId`) REFERENCES `autores` (`autorId`),
  CONSTRAINT `fk_libro_editorial` FOREIGN KEY (`editorialId`) REFERENCES `editoriales` (`editorialId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (16,'El Principito','Libro animado para niños',2000,1,1,'Fantasía',350.00,'https://via.placeholder.com/300x180?text=El+Principito',100,'ACT'),(17,'Cien Años de Soledad','Obra maestra del realismo mágico',1967,2,2,'Terror',500.00,'https://via.placeholder.com/300x180?text=Cien+Anios+Soledad',200,'ACT'),(18,'Don Quijote de la Mancha','Clásico de la literatura española',1605,3,3,'Terror',420.00,'https://via.placeholder.com/300x180?text=Don+Quijote',80,'ACT'),(19,'1984','Distopía política sobre vigilancia y control',1949,4,4,'Ciencia Ficción',310.00,'https://via.placeholder.com/300x180?text=1984',60,'ACT'),(20,'Harry Potter y la piedra filosofal','Inicio de la saga del joven mago',1997,5,5,'Fantasía',600.00,'https://via.placeholder.com/300x180?text=Harry+Potter+1',150,'ACT'),(21,'El Hobbit','Aventura fantástica en la Tierra Media',1937,6,6,'Fantasía',470.00,'https://via.placeholder.com/300x180?text=El+Hobbit',75,'ACT'),(22,'Orgullo y Prejuicio','Novela romántica clásica inglesa',1813,7,7,'Terror',320.00,'https://via.placeholder.com/300x180?text=Orgullo+Prejuicio',90,'ACT'),(23,'La Odisea','Viaje épico del héroe Odiseo',-800,8,8,'Terror',290.00,'https://via.placeholder.com/300x180?text=La+Odisea',50,'ACT'),(24,'Rayuela','Novela experimental e innovadora',1963,9,2,'Terror',540.00,'https://via.placeholder.com/300x180?text=Rayuela',60,'ACT'),(25,'El Alquimista','Fábula sobre seguir los sueños',1988,10,9,'Terror',400.00,'https://via.placeholder.com/300x180?text=El+Alquimista',110,'ACT'),(26,'Fahrenheit 451','Crítica a la censura y quema de libros',1953,11,10,'Ciencia Ficción',360.00,'https://via.placeholder.com/300x180?text=Fahrenheit+451',85,'ACT'),(27,'Matar a un ruiseñor','Novela sobre justicia y racismo',1960,12,11,'Terror',430.00,'https://via.placeholder.com/300x180?text=Matar+Ruise%C3%B1or',70,'ACT'),(28,'Drácula','Clásico de la literatura gótica',1897,13,12,'Terror',380.00,'https://via.placeholder.com/300x180?text=Dracula',60,'ACT'),(29,'Los juegos del hambre','Distopía juvenil de supervivencia',2008,14,13,'Ciencia Ficción',550.00,'https://via.placeholder.com/300x180?text=Juegos+Hambre',100,'ACT'),(30,'La sombra del viento','Misterio literario en Barcelona',2001,15,14,'Terror',470.00,'https://via.placeholder.com/300x180?text=Sombra+Viento',95,'ACT');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `ordenId` int(11) NOT NULL AUTO_INCREMENT,
  `usercod` bigint(10) NOT NULL,
  `fechaOrden` datetime DEFAULT current_timestamp(),
  `estado` enum('Pendiente','Completado','Cancelado','Enviado') DEFAULT 'Pendiente',
  `montoTotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`ordenId`),
  KEY `usercod` (`usercod`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (9,4,'2025-07-31 21:58:05','Completado',5880.00),(10,4,'2025-07-31 23:09:40','Completado',5880.00),(11,4,'2025-07-31 23:36:36','Completado',2020.00),(12,5,'2025-07-31 23:39:26','Completado',3700.00);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedidoId` int(11) NOT NULL AUTO_INCREMENT,
  `ordenId` int(11) NOT NULL,
  `libroId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(12,2) NOT NULL,
  PRIMARY KEY (`pedidoId`),
  KEY `ordenId` (`ordenId`),
  KEY `libroId` (`libroId`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ordenId`) REFERENCES `ordenes` (`ordenId`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (25,9,1,1,350.00),(26,9,2,9,500.00),(27,9,3,1,420.00),(28,9,7,1,320.00),(29,9,8,1,290.00),(30,10,1,1,350.00),(31,10,2,9,500.00),(32,10,3,1,420.00),(33,10,7,1,320.00),(34,10,8,1,290.00),(35,11,6,1,470.00),(36,11,7,1,320.00),(37,11,8,1,290.00),(38,11,9,1,540.00),(39,11,10,1,400.00),(40,12,11,5,360.00),(41,12,13,5,380.00);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADMIN','Administrador del sistmea','ACT'),('CLIENTE','Usuario cliente','ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'ADMIN',NULL,'2025-07-31 17:30:48',NULL),(2,'CLIENTE',NULL,'2025-07-31 17:30:49',NULL);
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `transaccionId` int(11) NOT NULL AUTO_INCREMENT,
  `ordenId` int(11) NOT NULL,
  `fechaTransaccion` datetime DEFAULT current_timestamp(),
  `orderjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Aqui va almacenado el orderJSON de la transacccion para fines de referencia contable.' CHECK (json_valid(`orderjson`)),
  PRIMARY KEY (`transaccionId`),
  KEY `ordenId` (`ordenId`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`ordenId`) REFERENCES `ordenes` (`ordenId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (4,9,'2025-07-31 21:58:05','{\"id\":\"9W266136MV5076402\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"account_id\":\"J43AJEPDD55TA\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"business_name\":\"Test Store\",\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743999076\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"9TX28917PN0132538\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"5880.00\"},\"final_capture\":true,\"disbursement_mode\":\"INSTANT\",\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"5880.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"293.90\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"5586.10\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9TX28917PN0132538\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9TX28917PN0132538\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9W266136MV5076402\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-31T21:58:02Z\",\"update_time\":\"2025-07-31T21:58:02Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"payer_id\":\"J43AJEPDD55TA\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9W266136MV5076402\",\"rel\":\"self\",\"method\":\"GET\"}]}'),(5,10,'2025-07-31 23:09:40','{\"name\":\"UNPROCESSABLE_ENTITY\",\"details\":[{\"issue\":\"ORDER_ALREADY_CAPTURED\",\"description\":\"Order already captured.If \'intent=CAPTURE\' only one capture per order is allowed.\"}],\"message\":\"The requested action could not be performed, semantically incorrect, or failed business validation.\",\"debug_id\":\"f957340065b9f\",\"links\":[{\"href\":\"https:\\/\\/developer.paypal.com\\/api\\/rest\\/reference\\/orders\\/v2\\/errors\\/#ORDER_ALREADY_CAPTURED\",\"rel\":\"information_link\",\"method\":\"GET\"}]}'),(6,11,'2025-07-31 23:36:37','{\"id\":\"7R7448563P2782409\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"account_id\":\"J43AJEPDD55TA\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"business_name\":\"Test Store\",\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1744004967\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"9RA25718H2934280D\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"2020.00\"},\"final_capture\":true,\"disbursement_mode\":\"INSTANT\",\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"2020.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"101.29\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"1918.71\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9RA25718H2934280D\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/9RA25718H2934280D\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7R7448563P2782409\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-31T23:36:34Z\",\"update_time\":\"2025-07-31T23:36:34Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"payer_id\":\"J43AJEPDD55TA\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7R7448563P2782409\",\"rel\":\"self\",\"method\":\"GET\"}]}'),(7,12,'2025-07-31 23:39:26','{\"id\":\"31Y58412WR321410L\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"account_id\":\"J43AJEPDD55TA\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"business_name\":\"Test Store\",\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1744005147\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"8EN793054B255425C\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"3700.00\"},\"final_capture\":true,\"disbursement_mode\":\"INSTANT\",\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"3700.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"185.12\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"3514.88\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8EN793054B255425C\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8EN793054B255425C\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/31Y58412WR321410L\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-31T23:39:23Z\",\"update_time\":\"2025-07-31T23:39:23Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-u2fcb44965988@business.example.com\",\"payer_id\":\"J43AJEPDD55TA\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/31Y58412WR321410L\",\"rel\":\"self\",\"method\":\"GET\"}]}');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,'administrador@lib.com','John Doe','$2y$10$zYFgFg4tEq2eciqfiHPyy.zXJeWIQqgeTzZV8C2FbeER9grxGVR2e','2025-07-31 17:52:56','ACT','2025-10-29 00:00:00','ACT','c191d324e78245723547340b90a16b49755ca34740da9d06fba7f3a3c9e166ce','2025-07-31 17:52:56','PBL'),(5,'ejemplo@mail.com','John Doe','$2y$10$qVJBNxRP29rJ19TksDcxOeupixGKqWahHaZChBNySgnNbqJ9.2bmq','2025-07-31 23:37:24','ACT','2025-10-29 00:00:00','ACT','8c72b9d83b472231d92fe8991e436eef3a4ff84c729e63909fb7054945bf5189','2025-07-31 23:37:24','PBL');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'libreria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-01  1:22:50
