/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: libreria
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretilla`
--

/*!40000 ALTER TABLE `carretilla` DISABLE KEYS */;
INSERT INTO `carretilla` VALUES (1,16,3,1.20,'2025-12-12 21:10:37'),(1,17,1,2.50,'2025-12-12 21:10:39'),(1,18,1,1.10,'2025-12-12 21:10:40'),(1,19,1,2.80,'2025-12-12 21:10:40');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretillaanon`
--

/*!40000 ALTER TABLE `carretillaanon` DISABLE KEYS */;
INSERT INTO `carretillaanon` VALUES ('97ef37d9cf3133792770f19f5943ecc4',1,3,12.99,'2025-12-12 20:49:40'),('97ef37d9cf3133792770f19f5943ecc4',16,2,1.20,'2025-12-12 21:04:13'),('97ef37d9cf3133792770f19f5943ecc4',17,1,2.50,'2025-12-12 21:04:16');
/*!40000 ALTER TABLE `carretillaanon` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES ('COMPRAR','Realizar compras','ACT','NEG'),('GEST_CARRITO','Gestionar carrito','ACT','NEG'),('GEST_LIBROS','Gestión de productos','ACT','NEG'),('GEST_PEDIDOS','Gestión de pedidos','ACT','NEG'),('GEST_USUARIOS','Gestión de usuarios','ACT','SIS'),('Menu_PaymentCheckout','Menu_PaymentCheckout','ACT','MNU'),('MOD_ESTADOS','Modificar estados de pedidos','ACT','NEG'),('VER_HISTORIAL','Ver historial completo','ACT','REP'),('VER_PEDIDOS','Ver sus pedidos','ACT','NEG');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_roles`
--

/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` VALUES ('CLIENTE','COMPRAR','ACT',NULL),('CLIENTE','GEST_CARRITO','ACT',NULL),('CLIENTE','VER_PEDIDOS','ACT',NULL);
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
  `libroGenero` varchar(100) NOT NULL,
  `libroPrecio` decimal(10,2) NOT NULL,
  `libroImgUrl` varchar(255) NOT NULL,
  `libroStock` int(11) NOT NULL DEFAULT 0,
  `libroEstado` char(3) NOT NULL,
  PRIMARY KEY (`libroId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (16,'Manzanas Golden','Manzanas frescas y crujientes, perfectas para snack o postres.','Frutas',1.20,'img1.jpg',50,'ACT'),(17,'Pan Integral','Pan saludable hecho con granos enteros y sin conservantes.','Panadería',2.50,'img2.jpg',30,'ACT'),(18,'Leche Entera 1L','Leche fresca de vaca, pasteurizada y con todo su sabor.','Lácteos',1.10,'img3.jpg',40,'ACT'),(19,'Huevos de Gallina x12','Huevos frescos de granja, tamaño mediano.','Lácteos',2.80,'img4.jpg',60,'ACT'),(20,'Arroz Blanco 1kg','Arroz de grano largo, ideal para todo tipo de recetas.','Granos',1.50,'img5.jpg',100,'ACT'),(21,'Aceite de Oliva 500ml','Aceite de oliva extra virgen de alta calidad.','Aceites',5.99,'img6.jpg',25,'ACT'),(22,'Queso Manchego 250g','Queso manchego curado, sabor intenso y textura firme.','Lácteos',4.50,'img7.jpg',20,'ACT'),(23,'Tomates Cherry 500g','Tomates cherry frescos, dulces y jugosos.','Verduras',3.00,'img8.jpg',45,'ACT'),(24,'Pasta Espagueti 1kg','Pasta de trigo de alta calidad, ideal para todo tipo de salsas.','Granos',2.20,'img9.jpg',60,'ACT'),(25,'Galletas de Chocolate 200g','Galletas crujientes con trozos de chocolate.','Snacks',1.75,'img10.jpg',80,'ACT'),(26,'Jugo de Naranja 1L','Jugo natural de naranja, sin azúcares añadidos.','Bebidas',2.30,'img11.jpg',35,'ACT'),(27,'Cereal Integral 500g','Cereal saludable con avena y frutos secos.','Desayuno',3.20,'img12.jpg',40,'ACT'),(28,'Yogur Natural 200g','Yogur fresco sin saborizantes ni conservantes.','Lácteos',1.00,'img13.jpg',50,'ACT'),(29,'Chocolate en Barra 100g','Chocolate con leche de alta calidad, sabor intenso.','Snacks',1.50,'img14.jpg',70,'ACT'),(30,'Café Molido 250g','Café 100% arábica, aroma y sabor excepcionales.','Bebidas',4.99,'img15.jpg',25,'ACT');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ejemplo1@mail.com','John Doe','$2y$10$gyU0Igzqex0rLDVkI65jZOxhdTVifUBNYlDEQmvEHURmKpkVtUfFW','2025-12-12 21:05:46','ACT','2026-03-12 00:00:00','ACT','eca7ca9c09cf7018ee186e365adb181e889e70e4461ad4b56fdca7600b729f0b','2025-12-12 21:05:46','PBL');
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

-- Dump completed on 2025-12-12 21:19:10
