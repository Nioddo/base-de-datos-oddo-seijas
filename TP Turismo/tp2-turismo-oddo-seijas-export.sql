-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP2 turismo
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `alojamientos`
--

DROP TABLE IF EXISTS `alojamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alojamientos` (
  `codigo` int NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cdt-max-de-personas` int DEFAULT NULL,
  `bar/restaurante` varchar(45) DEFAULT NULL,
  `cabaña_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_alojamientos_cabaña1_idx` (`cabaña_codigo`),
  CONSTRAINT `fk_alojamientos_cabaña1` FOREIGN KEY (`cabaña_codigo`) REFERENCES `cabaña` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamientos`
--

LOCK TABLES `alojamientos` WRITE;
/*!40000 ALTER TABLE `alojamientos` DISABLE KEYS */;
INSERT INTO `alojamientos` VALUES (1,'Hotel',12345678,'Calle Principal #123','Hotel Plaza',100,'Restaurante',1),(2,'Hostal',23456789,'Avenida Central #456','Hostal Central',50,'Bar',2),(3,'Resort',34567890,'Belgrano 15897','Resort Paradise',200,'Restaurante',3),(4,'Cabañas',45678901,'Avenida Principal #1011','Cabañas del Bosque',6,'bar',5),(5,'Hotel',56789012,'Calle Principal #1213','Hotel Marítimo',150,'Bar',5),(6,'Hostal',67890123,'Avenida Central #1415','Hostal del Sol',40,'Restaurante',6),(7,'Resort',78901234,'Calle Secundaria #1617','Resort All-Inclusive',300,'Bar',7),(8,'Cabañas',89012345,'Avenida Principal #1819','Cabañas del Lago',5,'restaurante',8),(9,'Hotel',90123456,'Calle Principal #2021','Hotel Montaña',120,'estaurante',9),(10,'Hostal',12345670,'Avenida Central #2223','Hostal Mediterráneo',60,'Bar',10);
/*!40000 ALTER TABLE `alojamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabaña`
--

DROP TABLE IF EXISTS `cabaña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabaña` (
  `codigo` int NOT NULL,
  `cocina` varchar(45) DEFAULT NULL,
  `garaje` varchar(45) DEFAULT NULL,
  `parilla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabaña`
--

LOCK TABLES `cabaña` WRITE;
/*!40000 ALTER TABLE `cabaña` DISABLE KEYS */;
INSERT INTO `cabaña` VALUES (1,'Equipada','Sí','Sí'),(2,'Equipada','No','No'),(3,'Básica','Sí','Sí'),(4,'Básica','No','No'),(5,'Equipada','No','Sí'),(6,'Equipada','Sí','No'),(7,'Básica','No','Sí'),(8,'Básica','Sí','No'),(9,'Equipada','Sí','Sí'),(10,'Equipada','No','No');
/*!40000 ALTER TABLE `cabaña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `dni` int NOT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (12345670,11009988,99887766,'San Juan 1234','Elena','Ramirez'),(12345678,11223344,99887766,'Calle A #123','Juan','Perez'),(23456789,22446688,77665544,'Avenida B #456','Maria','Gomez'),(34567890,33669900,55443322,'Calle C #789','Carlos','Lopez'),(45678901,44881122,33221100,'Avenida D #1011','Ana','Martinez'),(56789012,55002233,11008877,'Calle E #1213','Pedro','Rodriguez'),(67890123,66113344,99887766,'Avenida F #1415','Laura','Sanchez'),(78901234,77224455,77665544,'Calle G #1617','Diego','Hernandez'),(89012345,88335566,55443322,'Avenida H #1819','Sofia','Diaz'),(90123456,99446677,33221100,'Calle I #2021','Luis','Torres');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `codigo` int NOT NULL,
  `tipo-de-pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'Tarjeta de crédito'),(2,'Tarjeta de débito'),(3,'Transferencia bancaria'),(4,'Pago en efectivo'),(5,'PayPal'),(6,'Cheque'),(7,'Bitcoin'),(8,'Apple Pay'),(9,'Google Pay'),(10,'Amazon Pay');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete-de-viaje`
--

DROP TABLE IF EXISTS `paquete-de-viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete-de-viaje` (
  `codigo` int NOT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `cdt-de-noches` int DEFAULT NULL,
  `cdt-de-dias` int DEFAULT NULL,
  `cdt-de-excursiones` int DEFAULT NULL,
  `viaje_codigo` int NOT NULL,
  `alojamientos_codigo` int NOT NULL,
  `pago_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_paquete-de-viaje_viaje1_idx` (`viaje_codigo`),
  KEY `fk_paquete-de-viaje_alojamientos1_idx` (`alojamientos_codigo`),
  KEY `fk_paquete-de-viaje_pago1_idx` (`pago_codigo`),
  CONSTRAINT `fk_paquete-de-viaje_alojamientos1` FOREIGN KEY (`alojamientos_codigo`) REFERENCES `alojamientos` (`codigo`),
  CONSTRAINT `fk_paquete-de-viaje_pago1` FOREIGN KEY (`pago_codigo`) REFERENCES `pago` (`codigo`),
  CONSTRAINT `fk_paquete-de-viaje_viaje1` FOREIGN KEY (`viaje_codigo`) REFERENCES `viaje` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete-de-viaje`
--

LOCK TABLES `paquete-de-viaje` WRITE;
/*!40000 ALTER TABLE `paquete-de-viaje` DISABLE KEYS */;
INSERT INTO `paquete-de-viaje` VALUES (1,'París',1500,7,5,3,1,2,1),(2,'Roma',1800,7,6,4,2,3,1),(3,'Tokio',2500,10,8,5,3,4,2),(4,'Nueva York',2000,7,6,3,4,4,3),(5,'Sidney',2800,10,9,4,5,6,4),(6,'Barcelona',1600,8,7,2,5,7,5),(7,'Estambul',1900,8,7,3,6,8,6),(8,'Bangkok',2200,9,8,4,7,9,7),(9,'Londres',1700,7,6,2,8,10,8),(10,'Dubái',2600,8,7,3,10,5,9);
/*!40000 ALTER TABLE `paquete-de-viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `codigo` int NOT NULL,
  `fecha-de-inicio` date DEFAULT NULL,
  `fecha-de-fin` date DEFAULT NULL,
  `cdt-de-personas` int DEFAULT NULL,
  `clientes_dni` int NOT NULL,
  `paquete-de-viaje_codigo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_reservas_clientes_idx` (`clientes_dni`),
  KEY `fk_reservas_paquete-de-viaje1_idx` (`paquete-de-viaje_codigo`),
  CONSTRAINT `fk_reservas_clientes` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`),
  CONSTRAINT `fk_reservas_paquete-de-viaje1` FOREIGN KEY (`paquete-de-viaje_codigo`) REFERENCES `paquete-de-viaje` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2024-06-01','2024-06-05',2,56789012,1),(2,'2024-07-10','2024-07-15',4,67890123,1),(4,'2024-09-05','2024-09-10',5,67890123,3),(5,'2024-10-15','2024-10-20',2,78901234,4),(6,'2024-11-25','2024-11-30',4,56789012,5),(7,'2024-12-05','2024-12-10',3,78901234,6),(8,'2025-01-15','2025-01-20',6,67890123,6),(9,'2025-02-20','2025-02-25',2,67890123,10);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `codigo` int NOT NULL,
  `tipo-de-transporte` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,'Avión'),(2,'Tren'),(3,'Autobús'),(4,'Barco'),(5,'Automóvil'),(6,'Helicóptero'),(7,'Motocicleta'),(8,'Bicicleta'),(9,'Caminata'),(10,'Crucero');
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 17:38:01
