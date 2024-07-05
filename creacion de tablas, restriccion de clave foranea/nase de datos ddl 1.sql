-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: claseDDL
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
  `dirreccion` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cdt_max_de_personas` int DEFAULT NULL,
  `bar_o_restaurante` varchar(45) DEFAULT NULL,
  `cabaña_codigo` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cabaña_codigo` (`cabaña_codigo`),
  CONSTRAINT `alojamientos_ibfk_1` FOREIGN KEY (`cabaña_codigo`) REFERENCES `cabaña` (`codigo`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamientos`
--

LOCK TABLES `alojamientos` WRITE;
/*!40000 ALTER TABLE `alojamientos` DISABLE KEYS */;
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
  `parrilla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabaña`
--

LOCK TABLES `cabaña` WRITE;
/*!40000 ALTER TABLE `cabaña` DISABLE KEYS */;
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
  `tipo_de_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete_de_viaje`
--

DROP TABLE IF EXISTS `paquete_de_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete_de_viaje` (
  `codigo` int NOT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `cdt_de_personas` int DEFAULT NULL,
  `cdt_de_excursiones` int DEFAULT NULL,
  `viaje_codigo` int DEFAULT NULL,
  `alojamientos_codigo` int DEFAULT NULL,
  `pago_codigo` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `viaje_codigo` (`viaje_codigo`),
  KEY `alojamientos_codigo` (`alojamientos_codigo`),
  KEY `pago_codigo` (`pago_codigo`),
  CONSTRAINT `paquete_de_viaje_ibfk_1` FOREIGN KEY (`viaje_codigo`) REFERENCES `viaje` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `paquete_de_viaje_ibfk_2` FOREIGN KEY (`alojamientos_codigo`) REFERENCES `alojamientos` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `paquete_de_viaje_ibfk_3` FOREIGN KEY (`pago_codigo`) REFERENCES `pago` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete_de_viaje`
--

LOCK TABLES `paquete_de_viaje` WRITE;
/*!40000 ALTER TABLE `paquete_de_viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquete_de_viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `codigo` int NOT NULL,
  `fecha_de_inicio` date DEFAULT NULL,
  `fecha_de_fin` date DEFAULT NULL,
  `cdt_de_personas` int DEFAULT NULL,
  `clientes_dni` int DEFAULT NULL,
  `paquete_de_viaje_codigo` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `clientes_dni` (`clientes_dni`),
  KEY `paquete_de_viaje_codigo` (`paquete_de_viaje_codigo`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`paquete_de_viaje_codigo`) REFERENCES `paquete_de_viaje` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
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
  `tipo_de_transporte` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
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

-- Dump completed on 2024-05-24 17:50:35
