-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: db_style
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `camisa`
--

DROP TABLE IF EXISTS `camisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camisa` (
  `id_camisa` varchar(25) NOT NULL,
  `precio` double NOT NULL,
  `marca` varchar(25) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `id_proveedor` varchar(10) NOT NULL,
  `id_cliente` varchar(25) NOT NULL,
  `id_venta` int NOT NULL,
  PRIMARY KEY (`id_camisa`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `camisa_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `camisa_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `camisa_ibfk_3` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camisa`
--

LOCK TABLES `camisa` WRITE;
/*!40000 ALTER TABLE `camisa` DISABLE KEYS */;
INSERT INTO `camisa` VALUES ('CA001',25.5,'Nike','M','P001','C001',1),('CA002',30,'Adidas','L','P002','C002',2),('CA003',28,'Puma','S','P003','C003',3),('CA004',26.5,'Reebok','M','P004','C004',4),('CA005',29,'Vans','L','P005','C005',5),('CA006',35,'Jordan','XL','P006','C006',6),('CA007',40,'Lacoste','M','P007','C007',7),('CA008',55,'Gucci','L','P008','C008',8),('CA009',60,'Armani','S','P009','C009',9),('CA010',22,'Zara','M','P010','C010',10);
/*!40000 ALTER TABLE `camisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` varchar(25) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `apellido_cliente` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('C001','Juan','Perez','juan@gmail.com','0980000001'),('C002','Maria','Lopez','maria@gmail.com','0980000002'),('C003','Pedro','Mora','pedro@gmail.com','0980000003'),('C004','Ana','Castro','ana@gmail.com','0980000004'),('C005','Luis','Diaz','luis@gmail.com','0980000005'),('C006','Jose','Vega','jose@gmail.com','0980000006'),('C007','Sofia','Leon','sofia@gmail.com','0980000007'),('C008','Lucia','Torres','lucia@gmail.com','0980000008'),('C009','Miguel','Ruiz','miguel@gmail.com','0980000009'),('C010','Andrea','Mena','andrea@gmail.com','0980000010');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `detalle_factura` varchar(45) DEFAULT NULL,
  `unidad` int NOT NULL,
  `total` double NOT NULL,
  `precio` double NOT NULL,
  `id_factura` varchar(10) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (1,'Camisa Nike talla M',1,28.56,25.5,'F001'),(2,'Camisa Adidas talla L',1,33.6,30,'F002'),(3,'Camisa Puma talla S',1,31.36,28,'F003'),(4,'Camisa Reebok talla M',1,29.68,26.5,'F004'),(5,'Camisa Vans talla L',1,32.48,29,'F005'),(6,'Camisa Jordan talla XL',1,39.2,35,'F006'),(7,'Camisa Lacoste talla M',1,44.8,40,'F007'),(8,'Camisa Gucci talla L',1,61.6,55,'F008'),(9,'Camisa Armani talla S',1,67.2,60,'F009'),(10,'Camisa Zara talla M',1,24.64,22,'F010');
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(45) NOT NULL,
  `apellido_empleado` varchar(45) NOT NULL,
  `rol` enum('Diseñador','Cajero','Vendedor') NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Kevin','Lopez','Cajero','0971111111'),(2,'David','Perez','Diseñador','0972222222'),(3,'Carlos','Mora','Vendedor','0973333333'),(4,'Luis','Castro','Cajero','0974444444'),(5,'Mario','Diaz','Diseñador','0975555555'),(6,'Jose','Ruiz','Vendedor','0976666666'),(7,'Pedro','Torres','Cajero','0977777777'),(8,'Ana','Vega','Diseñador','0978888888'),(9,'Lucia','Leon','Vendedor','0979999999'),(10,'Miguel','Mena','Cajero','0961111111');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` varchar(10) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `fecha_emisión` date NOT NULL,
  `total` double NOT NULL,
  `subtotal` double NOT NULL,
  `iva` decimal(4,2) NOT NULL,
  `id_venta` int NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('F001','Camisa Nike','2026-05-01',28.56,25.5,0.12,1),('F002','Camisa Adidas','2026-05-02',33.6,30,0.12,2),('F003','Camisa Puma','2026-05-03',31.36,28,0.12,3),('F004','Camisa Reebok','2026-05-04',29.68,26.5,0.12,4),('F005','Camisa Vans','2026-05-05',32.48,29,0.12,5),('F006','Camisa Jordan','2026-05-06',39.2,35,0.12,6),('F007','Camisa Lacoste','2026-05-07',44.8,40,0.12,7),('F008','Camisa Gucci','2026-05-08',61.6,55,0.12,8),('F009','Camisa Armani','2026-05-09',67.2,60,0.12,9),('F010','Camisa Zara','2026-05-10',24.64,22,0.12,10);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalizacion`
--

DROP TABLE IF EXISTS `personalizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalizacion` (
  `id_personalizacion` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_cliente` varchar(25) NOT NULL,
  PRIMARY KEY (`id_personalizacion`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `personalizacion_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalizacion`
--

LOCK TABLES `personalizacion` WRITE;
/*!40000 ALTER TABLE `personalizacion` DISABLE KEYS */;
INSERT INTO `personalizacion` VALUES (1,'Logo personalizado','C001'),(2,'Nombre estampado','C002'),(3,'Diseño anime','C003'),(4,'Diseño gamer','C004'),(5,'Frase personalizada','C005'),(6,'Imagen deportiva','C006'),(7,'Logo empresa','C007'),(8,'Diseño urbano','C008'),(9,'Foto personalizada','C009'),(10,'Diseño elegante','C010');
/*!40000 ALTER TABLE `personalizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` varchar(10) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `apellido_proveedor` varchar(45) NOT NULL,
  `telefono_proveedor` varchar(10) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('P001','Carlos','Lopez','0991111111'),('P002','Maria','Perez','0992222222'),('P003','Jose','Mora','0993333333'),('P004','Ana','Ruiz','0994444444'),('P005','Luis','Torres','0995555555'),('P006','Pedro','Mena','0996666666'),('P007','Lucia','Vega','0997777777'),('P008','Miguel','Castro','0998888888'),('P009','Sofia','Diaz','0999999999'),('P010','Andres','Leon','0981111111');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `producto` varchar(45) NOT NULL,
  `total` double NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2026-05-01','Camisa Nike',25.5,1),(2,'2026-05-02','Camisa Adidas',30,2),(3,'2026-05-03','Camisa Puma',28,3),(4,'2026-05-04','Camisa Reebok',26.5,4),(5,'2026-05-05','Camisa Vans',29,5),(6,'2026-05-06','Camisa Jordan',35,6),(7,'2026-05-07','Camisa Lacoste',40,7),(8,'2026-05-08','Camisa Gucci',55,8),(9,'2026-05-09','Camisa Armani',60,9),(10,'2026-05-10','Camisa Zara',22,10);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-20 23:36:12
