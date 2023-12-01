-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: swiftlogix
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `barrios_id_zona` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ulayj5kuu2kpylv836pw4chn` (`barrios_id_zona`),
  CONSTRAINT `FK9ulayj5kuu2kpylv836pw4chn` FOREIGN KEY (`barrios_id_zona`) REFERENCES `zonas` (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambios_estado`
--

DROP TABLE IF EXISTS `cambios_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios_estado` (
  `id_cambio_estado` int NOT NULL AUTO_INCREMENT,
  `fecha_hora_fin` datetime(6) DEFAULT NULL,
  `fecha_hora_inicio` datetime(6) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `numero_factura` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cambio_estado`),
  KEY `FKo1m78rq0x6h37ehdhougr9m9t` (`estado_id`),
  KEY `FK8h9x56jl6m7mj7i5qdhjwpj0l` (`numero_factura`),
  CONSTRAINT `FK8h9x56jl6m7mj7i5qdhjwpj0l` FOREIGN KEY (`numero_factura`) REFERENCES `envios` (`numero_factura`),
  CONSTRAINT `FKo1m78rq0x6h37ehdhougr9m9t` FOREIGN KEY (`estado_id`) REFERENCES `estados_envio` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_estado`
--

LOCK TABLES `cambios_estado` WRITE;
/*!40000 ALTER TABLE `cambios_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambios_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camiones`
--

DROP TABLE IF EXISTS `camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camiones` (
  `patente` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camiones`
--

LOCK TABLES `camiones` WRITE;
/*!40000 ALTER TABLE `camiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  `numero_telefono` varchar(255) DEFAULT NULL,
  `numero_telefono_alternativo` varchar(255) DEFAULT NULL,
  `id_tipo_documento` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FK158uydvsidi86jgv1skdhcms0` (`id_tipo_documento`),
  CONSTRAINT `FK158uydvsidi86jgv1skdhcms0` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipos_documentos` (`id_tipo_documento`)
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
-- Table structure for table `detalles_envios`
--

DROP TABLE IF EXISTS `detalles_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_envios` (
  `id_detalle_envio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_factura` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_envio`),
  KEY `FK316qxh1txvitlpwtp19s13yr3` (`numero_factura`),
  CONSTRAINT `FK316qxh1txvitlpwtp19s13yr3` FOREIGN KEY (`numero_factura`) REFERENCES `envios` (`numero_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_envios`
--

LOCK TABLES `detalles_envios` WRITE;
/*!40000 ALTER TABLE `detalles_envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `numero_factura` varchar(255) NOT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `entre_calles` varchar(255) DEFAULT NULL,
  `ultimos_digitos_tarjeta` varchar(255) DEFAULT NULL,
  `patente` varchar(255) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  PRIMARY KEY (`numero_factura`),
  UNIQUE KEY `UK_8uaci42cp3l4dfb06d7v4s7sb` (`id_estado`),
  KEY `FKhfc4x1n1gy2fuk5ene4h6cgu5` (`patente`),
  KEY `FKe1ag585ivpih4nqoqddp95fsj` (`id_cliente`),
  KEY `FK9cqc2i803wtcip4voinjpg00w` (`id_zona`),
  CONSTRAINT `FK23hl635dxtn2m4pl9fcveh34f` FOREIGN KEY (`id_estado`) REFERENCES `estados_envio` (`id_estado`),
  CONSTRAINT `FK9cqc2i803wtcip4voinjpg00w` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`),
  CONSTRAINT `FKe1ag585ivpih4nqoqddp95fsj` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `FKhfc4x1n1gy2fuk5ene4h6cgu5` FOREIGN KEY (`patente`) REFERENCES `camiones` (`patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_envio`
--

DROP TABLE IF EXISTS `estados_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_envio` (
  `estado_type` varchar(31) NOT NULL,
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_envio`
--

LOCK TABLES `estados_envio` WRITE;
/*!40000 ALTER TABLE `estados_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_hoja`
--

DROP TABLE IF EXISTS `estados_hoja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_hoja` (
  `estado_type` varchar(31) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_hoja`
--

LOCK TABLES `estados_hoja` WRITE;
/*!40000 ALTER TABLE `estados_hoja` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados_hoja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia`
--

DROP TABLE IF EXISTS `hojas_del_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia` (
  `id_hoja_del_dia` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `patente_camion` varchar(255) DEFAULT NULL,
  `estado_hoja_del_dia_id` int DEFAULT NULL,
  `repartidor_id_repartidor` int DEFAULT NULL,
  PRIMARY KEY (`id_hoja_del_dia`),
  UNIQUE KEY `UK_nhiow9dtnjda15vybgdqn7gpx` (`estado_hoja_del_dia_id`),
  KEY `FKe6eco77tsnvrw7yx0gf0oau4g` (`patente_camion`),
  KEY `FKjeqvbe4vny1oi9b9h32i8j3l6` (`repartidor_id_repartidor`),
  CONSTRAINT `FKe6eco77tsnvrw7yx0gf0oau4g` FOREIGN KEY (`patente_camion`) REFERENCES `camiones` (`patente`),
  CONSTRAINT `FKidvjfl3e6fynbwk8hfmukruu5` FOREIGN KEY (`estado_hoja_del_dia_id`) REFERENCES `estados_hoja` (`id`),
  CONSTRAINT `FKjeqvbe4vny1oi9b9h32i8j3l6` FOREIGN KEY (`repartidor_id_repartidor`) REFERENCES `repartidores` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia`
--

LOCK TABLES `hojas_del_dia` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia` DISABLE KEYS */;
/*!40000 ALTER TABLE `hojas_del_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojas_del_dia_envios`
--

DROP TABLE IF EXISTS `hojas_del_dia_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojas_del_dia_envios` (
  `hoja_del_dia_entity_id_hoja_del_dia` int NOT NULL,
  `envios_numero_factura` varchar(255) NOT NULL,
  UNIQUE KEY `UK_o2c4qydkd90dvr4yo7dfsfl9p` (`envios_numero_factura`),
  KEY `FK88t4rvi7xg589j6bim8qxd8ph` (`hoja_del_dia_entity_id_hoja_del_dia`),
  CONSTRAINT `FK88t4rvi7xg589j6bim8qxd8ph` FOREIGN KEY (`hoja_del_dia_entity_id_hoja_del_dia`) REFERENCES `hojas_del_dia` (`id_hoja_del_dia`),
  CONSTRAINT `FKhsgbd96lp45yutcwhvpx91p0y` FOREIGN KEY (`envios_numero_factura`) REFERENCES `envios` (`numero_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojas_del_dia_envios`
--

LOCK TABLES `hojas_del_dia_envios` WRITE;
/*!40000 ALTER TABLE `hojas_del_dia_envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `hojas_del_dia_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `id_repartidor` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documentos` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` VALUES (1,'CUIL'),(2,'CUIT');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `dia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01  1:31:28
