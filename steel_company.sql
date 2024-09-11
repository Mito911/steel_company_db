-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: steel_company
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_customer_id` int NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `correspondemce_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id_idx` (`fk_customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'Warszawa, Fabryczna 1','Żurawia 44, Warszawa'),(2,2,'Bielsko-Biała, Żywiecka 34','Bielsko-Biała, Żywiecka 34');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `NIP` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'art-But','5535542651'),(2,'Ark-Mal','745786453'),(3,'Metstal','6675532521'),(4,'AstrBud','2346757832'),(5,'Tuz-Bud','6578532553'),(6,'Warsmat','8897765543'),(7,'Ark-Bud','6675538987'),(8,'ACME Corporation','1234567890'),(9,'ACME Corporation','1234567890'),(10,'Azbet','1234567890'),(11,'Azbet','1234567890');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `material` varchar(300) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,1,18,38000.00,'2mm s235',NULL),(2,2,10,13000.00,'1,5m s235',NULL),(3,1,20,38000.00,'2mm S235',NULL),(4,2,10,13000.00,'1.5mm S235',NULL),(5,3,15,20000.00,'3mm S235',NULL),(6,4,25,50000.00,'4mm S235',NULL),(7,5,30,45000.00,'2.5mm S235',NULL),(8,6,12,24000.00,'1mm S335',NULL),(9,7,40,80000.00,'5mm S235',NULL),(10,1,35,35000.00,'2mm S235',NULL),(11,3,5,5000.00,'1mm S235',NULL),(12,1,50,60000.00,'3.5mm S310',NULL),(13,1,20,25000.00,'2mm S235',NULL),(14,2,45,120000.00,'14mm S235',NULL),(15,7,25,37500.00,'2.5mm S235',NULL),(16,6,10,15000.00,'1.5mm S310',NULL),(17,5,60,72000.00,'6mm S235',NULL),(18,6,30,45000.00,'3mm S235',NULL),(19,7,22,26400.00,'2.2mm S310',NULL),(20,1,33,49500.00,'3.3mm S235',NULL),(21,7,7,7000.00,'1.2mm S235',NULL),(22,3,42,84000.00,'4.2mm S235',NULL),(23,8,10,10000.00,'s235',NULL),(24,9,10,10000.00,'s235',NULL),(25,10,10,10000.00,'s235',NULL),(26,11,10,10000.00,'s235',NULL);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `workplace` varchar(128) NOT NULL,
  `date_of_employment` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workplace_idx` (`workplace`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Piotr','Kawka','Właściciel','2012-10-01'),(2,'Sebastian','Góra','Operator lasera','2002-03-24'),(3,'Marcin','Kamiński','Operator Walcarki','2013-04-15'),(4,'Monika','Krawczyk','Ksiegowa','2022-09-22'),(5,'Wiktoria','Ziemniak','Handlowiec','2022-05-19'),(6,'Artur','Kozłowski','Operator lasera','2023-07-02'),(7,'Paulina','Lipińska','Handlowiec','2023-08-15'),(8,'Grzegorz','Szymczak','Spawacz','2022-12-20'),(9,'Marta','Kaczmarek','Handlowiec','2023-06-28'),(10,'Władysław','Jankowski','Operator Wózka widłowego','2022-07-08'),(11,'Ryszard','Czajka','Operator prasy krawędziowej','2023-05-21'),(12,'Bartosz','Błaszczyk','Operator plazmy','2023-09-10'),(13,'Krzysztof','Skowroński','Operator gilotyny','2022-10-03'),(14,'Rafał','Górski','Spawacz','2022-09-15'),(15,'Szymon','Borkowski','Spawacz','2022-06-17'),(16,'Michał','Krawczyk','Kierownik','2023-02-01'),(17,'Marcin','Myśliwy','Spawacz','2024-08-07'),(18,'Ania','Cebrat','Handlowiec',NULL),(19,'Ania','Cebrat','Handlowiec',NULL),(20,'Ania','Cebrat','Handlowiec',NULL),(21,'Ania','Cebrat','Handlowiec',NULL),(22,'Ania','Cebrat','Handlowiec',NULL),(23,'Ania','Cebrat','Handlowiec',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_machine`
--

DROP TABLE IF EXISTS `employee_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_machine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `machine_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id_idx` (`employee_id`),
  KEY `machine_id_idx` (`machine_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_machine`
--

LOCK TABLES `employee_machine` WRITE;
/*!40000 ALTER TABLE `employee_machine` DISABLE KEYS */;
INSERT INTO `employee_machine` VALUES (1,2,2),(2,12,1),(3,3,6),(4,13,7),(5,10,4),(6,10,5);
/*!40000 ALTER TABLE `employee_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_order`
--

DROP TABLE IF EXISTS `employee_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_employee_id` int DEFAULT NULL,
  `fk_order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id` (`fk_order_id`),
  KEY `fk_employee_id` (`fk_employee_id`),
  CONSTRAINT `employee_order_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `employee_order_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_order`
--

LOCK TABLES `employee_order` WRITE;
/*!40000 ALTER TABLE `employee_order` DISABLE KEYS */;
INSERT INTO `employee_order` VALUES (1,5,1),(2,5,2),(3,7,3),(4,7,4),(5,5,5),(6,6,6),(7,5,7),(8,5,8),(9,7,9),(10,7,10),(11,5,11),(12,5,12),(13,5,13),(14,7,14),(15,20,23),(16,21,24),(17,22,25),(18,23,26);
/*!40000 ALTER TABLE `employee_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `name` varchar(260) NOT NULL,
  `quantity` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES ('Eckert Jantar XPR 3x1,5',1,1),('TRUMPF TruLaser 3030 L49',1,2),('CORMAK S-200RH',2,3),('Toyota 8FGL15',1,4),('Toyota 02-8FDJF35',1,5),('METALLKRAFT RBM 2050-30 E',1,6),('Otinus 4×2500 SMO-2504-N',1,7),('Lincoln POWERTEC I420S',2,8),('Esab FABRICATOR 401i',1,9),('Bester 1801',3,10);
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_warehouse`
--

DROP TABLE IF EXISTS `order_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `warehouse_id_idx` (`warehouse_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`),
  CONSTRAINT `warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_warehouse`
--

LOCK TABLES `order_warehouse` WRITE;
/*!40000 ALTER TABLE `order_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `material` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11 13:29:55
