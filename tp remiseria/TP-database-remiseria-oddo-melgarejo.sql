-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP_remiseria_oddo_melgarejo
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `patente` varchar(7) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES ('ABC123','Toyota Corolla'),('DEF456','Honda Civic'),('GHI789','Ford Focus'),('JKL012','Chevrolet Cruze'),('MNO345','Volkswagen Golf');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choferes` (
  `id` int NOT NULL,
  `dni` int DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,12345678,'Gonzalez','Juan','Calle Falsa 123',123456789),(2,87654321,'Perez','Maria','Avenida Siempre Viva 456',987654321),(3,11223344,'Lopez','Carlos','Calle Luna 789',112233445),(4,44332211,'Martinez','Ana','Calle Sol 101',443322110),(5,55667788,'Garcia','Luis','Avenida Estrellas 202',556677889);
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `dni` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `id_cuenta_corriente` int DEFAULT NULL,
  `id_tipo_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuenta_corriente` (`id_cuenta_corriente`),
  KEY `id_tipo_cliente` (`id_tipo_cliente`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cuenta_corriente`) REFERENCES `cuenta_corriente` (`id`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,23456789,'Andres','Fernandez','Calle Norte 10',234567890,'VIP',1,1),(2,34567890,'Beatriz','Rodriguez','Avenida Sur 20',345678901,'Frecuente',2,1),(3,45678901,'Carlos','Hernandez','Calle Este 30',456789012,'Nuevo',3,2),(4,56789012,'Daniela','Diaz','Avenida Oeste 40',567890123,'VIP',4,2),(5,67890123,'Esteban','Martinez','Calle Centro 50',678901234,'Regular',5,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_corriente`
--

DROP TABLE IF EXISTS `cuenta_corriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_corriente` (
  `id` int NOT NULL,
  `saldo` int DEFAULT NULL,
  `nombre_titular` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_corriente`
--

LOCK TABLES `cuenta_corriente` WRITE;
/*!40000 ALTER TABLE `cuenta_corriente` DISABLE KEYS */;
INSERT INTO `cuenta_corriente` VALUES (1,10000,'Juan Perez'),(2,15000,'Maria Gonzalez'),(3,20000,'Carlos Lopez'),(4,25000,'Ana Martinez'),(5,30000,'Luis Garcia');
/*!40000 ALTER TABLE `cuenta_corriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_cliente` (
  `id` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
INSERT INTO `tipo_cliente` VALUES (1,'Persona'),(2,'Empresa');
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `destino` varchar(45) DEFAULT NULL,
  `hora_de_llegada` time DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `cuenta_corriente` tinyint DEFAULT NULL,
  `patente_auto` varchar(7) DEFAULT NULL,
  `id_choferes` int DEFAULT NULL,
  `id_clientes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patente_auto` (`patente_auto`),
  KEY `id_choferes` (`id_choferes`),
  KEY `id_clientes` (`id_clientes`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`patente_auto`) REFERENCES `auto` (`patente`),
  CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`id_choferes`) REFERENCES `choferes` (`id`),
  CONSTRAINT `viaje_ibfk_3` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`),
  CONSTRAINT `viaje_chk_1` CHECK ((`costo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,'2024-07-01','Destino A','10:00:00',100,1,'ABC123',1,1),(2,'2024-07-02','Destino B','11:00:00',200,0,'DEF456',2,2),(4,'2024-07-04','Destino D','13:00:00',400,0,'JKL012',4,4),(5,'2024-07-05','Destino E','14:00:00',500,1,'MNO345',5,5),(6,'2024-07-06','Destino F','15:00:00',600,0,'ABC123',1,1),(7,'2024-07-07','Destino G','16:00:00',700,1,'DEF456',2,2),(9,'2024-07-09','Destino I','18:00:00',900,1,'JKL012',4,4),(10,'2024-07-10','Destino J','19:00:00',1000,0,'MNO345',5,5);
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

-- Dump completed on 2024-07-05 16:44:56
