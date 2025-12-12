/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: nwdb
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
  `productoId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL COMMENT 'Cantidad de producto',
  `crrprc` decimal(12,2) NOT NULL COMMENT 'Precio del producto',
  `crrfching` datetime NOT NULL COMMENT 'Fecha cuando se agregó',
  PRIMARY KEY (`usercod`,`productoId`),
  KEY `productoId_idx` (`productoId`),
  CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretilla`
--

/*!40000 ALTER TABLE `carretilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `carretilla` ENABLE KEYS */;

--
-- Table structure for table `carretillaanon`
--

DROP TABLE IF EXISTS `carretillaanon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `productoId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL,
  PRIMARY KEY (`anoncod`,`productoId`),
  KEY `productoId_idx` (`productoId`),
  CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carretillaanon`
--

/*!40000 ALTER TABLE `carretillaanon` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

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
  `productoId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(12,2) NOT NULL,
  PRIMARY KEY (`pedidoId`),
  KEY `ordenId` (`ordenId`),
  KEY `productoId` (`productoId`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ordenId`) REFERENCES `ordenes` (`ordenId`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `productoId` int(11) NOT NULL AUTO_INCREMENT,
  `productoNombre` varchar(255) NOT NULL,
  `productoDescripcion` text NOT NULL,
  `productoPrecio` decimal(10,2) NOT NULL,
  `productoImgUrl` varchar(255) NOT NULL,
  `productoStock` int(11) NOT NULL DEFAULT 0,
  `productoEstado` char(3) NOT NULL,
  PRIMARY KEY (`productoId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Manzana','Manzanas frescas, crujientes y dulces.',5.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/manzana.png',100,'DIS'),(2,'Leche','Cartón de Leche entera.',45.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/cartonLeche.jpg',50,'DIS'),(3,'Pan Integral','Pan integral recién horneado, 400 g.',27.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/panIntegral.jpg',30,'DIS'),(4,'Arroz','Arroz integral de 1 kg.',12.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/arroz.jpg',60,'DIS'),(5,'Pasta','Pasta de trigo duro, 500 g (espaguetis).',31.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/pasta.jpg',40,'DIS'),(6,'Aceite de Oliva','Aceite de oliva virgen extra, 500 ml.',20.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/aceiteOliva.jpg',20,'DIS'),(7,'Huevos','Huevos frescos de gallinas libres, docena.',55.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/huevos.jpg',25,'DIS'),(8,'Tomates','Tomates maduros y jugosos, 1 kg.',12.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/tomates.jpg',40,'DIS'),(9,'Zanahorias','Zanahorias frescas, orgánicas, 1 kg.',6.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/zanahorias.jpg',35,'DIS'),(10,'Cebollas','Cebollas moradas, 1 kg.',8.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/cebollas.jpg',60,'DIS'),(11,'Pollo','Pechugas de pollo frescas, 1 kg.',37.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/pollo.jpg',15,'DIS'),(12,'Pescado','Filetes de pescado fresco, 500 g.',29.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/pescado.jpg',10,'DIS'),(13,'Yogur','Yogur natural sin azúcares añadidos, 150 g.',14.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/yogur.jpg',50,'DIS'),(14,'Nueces','Nueces mixtas, 200 g.',18.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/nueces.jpg',25,'DIS'),(15,'Azúcar','Azúcar blanca, 1 kg.',9.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/azucar.jpg',70,'DIS'),(16,'Harina','Harina de trigo, 1 kg.',11.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/harina.jpg',50,'DIS'),(17,'Sal','Sal de mesa, 500 g.',3.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/sal.jpg',100,'DIS'),(18,'Café','Café molido, 250 g.',21.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/cafe.jpg',40,'DIS'),(19,'Té','Té verde, 20 bolsitas.',19.50,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/te.jpg',30,'DIS'),(20,'Salsa de Tomate','Salsa de tomate orgánica, 350 g.',13.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/salsaDeTomate.jpg',25,'DIS'),(21,'Galletas','Galletas de avena, paquete de 200 g.',10.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/galletas.jpg',50,'DIS'),(22,'Chocolate','Chocolate negro, 100 g.',14.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/chocolate.jpg',40,'DIS'),(23,'Barritas Energéticas','Barritas energéticas de frutos secos, paquete de 6 unidades.',15.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/barraEnergetica.jpg',20,'DIS'),(24,'Frutos Secos','Mezcla de frutos secos, 200 g.',16.00,'/workspaces/Mercadito-LaBendicion/MERCADITO_LABENDICION/public/imgs/productos/frutosSecos.jpg',30,'DIS');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

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
INSERT INTO `roles_usuarios` VALUES (1,'ADMIN',NULL,'2025-12-12 00:29:12',NULL),(2,'CLIENTE',NULL,'2025-12-12 00:29:13',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin@libreria.com','Administrador','admin123','2025-12-12 00:29:10',NULL,NULL,'ACT',NULL,NULL,'ADM'),(2,'cliente@libreria.com','Cliente','cliente123','2025-12-12 00:29:11',NULL,NULL,'ACT',NULL,NULL,'CLI');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'nwdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12  5:14:51
