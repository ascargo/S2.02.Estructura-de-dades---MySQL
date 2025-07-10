CREATE DATABASE  IF NOT EXISTS `optician` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optician`;
-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: optician
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `addressBook`
--

DROP TABLE IF EXISTS `addressBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressBook` (
  `addressBook_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `number` varchar(5) NOT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(2) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` varchar(32) NOT NULL DEFAULT 'Spain',
  `phone` bigint NOT NULL,
  PRIMARY KEY (`addressBook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressBook`
--

LOCK TABLES `addressBook` WRITE;
/*!40000 ALTER TABLE `addressBook` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressBook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand` (
  `Brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `suppliers_suppliers_id` int NOT NULL,
  PRIMARY KEY (`Brand_id`),
  KEY `fk_Brand_suppliers1_idx` (`suppliers_suppliers_id`),
  CONSTRAINT `fk_Brand_suppliers1` FOREIGN KEY (`suppliers_suppliers_id`) REFERENCES `suppliers` (`suppliers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'RayBan',1),(2,'Oakley',2),(3,'Gucci',3),(4,'Armani',1),(5,'Prada',2);
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_has_address`
--

DROP TABLE IF EXISTS `customer_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_has_address` (
  `customers_id` int NOT NULL,
  `addressBook_id` int NOT NULL,
  `address_type` enum('billing','shipping') NOT NULL DEFAULT 'billing',
  PRIMARY KEY (`customers_id`,`addressBook_id`),
  KEY `fk_customers_has_addressBook_addressBook1_idx` (`addressBook_id`),
  KEY `fk_customers_has_addressBook_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_customers_has_addressBook_addressBook1` FOREIGN KEY (`addressBook_id`) REFERENCES `addressBook` (`addressBook_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_customers_has_addressBook_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_has_address`
--

LOCK TABLES `customer_has_address` WRITE;
/*!40000 ALTER TABLE `customer_has_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_has_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customers_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname1` varchar(45) NOT NULL,
  `surname2` varchar(45) DEFAULT NULL,
  `street` varchar(45) NOT NULL,
  `number` varchar(5) NOT NULL,
  `floor` varchar(3) DEFAULT NULL,
  `door` varchar(2) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Registration_date` datetime DEFAULT NULL,
  `Referred_by` int DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_customers_Referred_by` (`Referred_by`),
  CONSTRAINT `fk_customers_Referred_by` FOREIGN KEY (`Referred_by`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice','Smith',NULL,'Baker St','221B','1','A','London',12345,447832467727,'alice@example.com','2025-07-02 09:23:58',NULL),(2,'Bob','Johnson','Lee','Oxford St','42',NULL,NULL,'London',54321,449167513783,'bob@example.com','2025-07-02 09:23:58',1),(3,'Clara','Oswald',NULL,'Rose Ave','15','3','B','Bristol',10101,448275952792,'clara@example.com','2025-07-02 09:23:58',1),(4,'David','Tennant',NULL,'King Rd','73',NULL,NULL,'Liverpool',67676,448233961833,'david@example.com','2025-07-02 09:23:58',2),(5,'Ana','Peterson',NULL,'Baker St','2B','1','A','London',12345,447832476327,'ana@example.com','2025-07-04 09:23:58',NULL),(6,'Bobie','John','Warthon','Olive Circle','2',NULL,NULL,'London',54321,445167513783,'bobie@example.com','2021-07-02 09:23:58',1),(7,'Clair','Osborne',NULL,'Rose St','153','7','D','Bristol',10101,448275959227,'clair@example.com','2025-05-02 09:23:58',1),(8,'David','Watson','Tennant','Queen Rd','69',NULL,NULL,'Liverpool',67676,448233196833,'davidW@example.com','2025-12-02 09:23:58',2);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','Doe'),(2,'Jane','Doe'),(3,'Emma','Stone');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_sale`
--

DROP TABLE IF EXISTS `employee_has_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_sale` (
  `employee_employee_id` int NOT NULL,
  `sale_sale_id` int NOT NULL,
  PRIMARY KEY (`employee_employee_id`,`sale_sale_id`),
  KEY `fk_employee_has_sale_sale1_idx` (`sale_sale_id`),
  KEY `fk_employee_has_sale_employee1_idx` (`employee_employee_id`),
  CONSTRAINT `fk_employee_has_sale_employee1` FOREIGN KEY (`employee_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_has_sale_sale1` FOREIGN KEY (`sale_sale_id`) REFERENCES `sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_sale`
--

LOCK TABLES `employee_has_sale` WRITE;
/*!40000 ALTER TABLE `employee_has_sale` DISABLE KEYS */;
INSERT INTO `employee_has_sale` VALUES (1,1),(2,2),(3,3),(1,4),(1,5),(1,6),(3,7),(1,8),(2,8);
/*!40000 ALTER TABLE `employee_has_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `glasses_id` int NOT NULL AUTO_INCREMENT,
  `Brand_Brand_id` int NOT NULL,
  `prescription` decimal(5,3) DEFAULT NULL,
  `frame_type` enum('Rimless','Plastic','Metal') DEFAULT NULL,
  `frame_colour` varchar(20) DEFAULT NULL,
  `lens_colour` varchar(20) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`glasses_id`),
  KEY `fk_glasses_Brand1_idx` (`Brand_Brand_id`),
  CONSTRAINT `fk_glasses_Brand1` FOREIGN KEY (`Brand_Brand_id`) REFERENCES `Brand` (`Brand_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,-1.250,'Plastic','Black','Clear',120.00),(2,2,2.750,'Metal','Silver','Blue',200.50),(3,3,0.000,'Rimless','Transparent','Clear',180.00),(4,4,-2.500,'Plastic','Red','Green',140.75),(5,5,1.750,'Metal','Gold','Brown',220.00);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `sale_id` int NOT NULL,
  `sale_date` datetime DEFAULT NULL,
  `customers_customers_id` int NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `fk_sale_customers1_idx` (`customers_customers_id`),
  CONSTRAINT `fk_sale_customers1` FOREIGN KEY (`customers_customers_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2025-07-02 09:23:58',1),(2,'2025-07-01 09:23:58',2),(3,'2025-06-30 09:23:58',3),(4,'2025-06-29 09:23:58',4),(5,'2025-07-02 09:23:58',1),(6,'2025-07-01 09:23:58',1),(7,'2025-06-30 09:23:58',8),(8,'2025-06-29 09:23:58',8);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_has_glasses`
--

DROP TABLE IF EXISTS `sale_has_glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_has_glasses` (
  `sale_sale_id` int NOT NULL,
  `glasses_glasses_id` int NOT NULL,
  PRIMARY KEY (`sale_sale_id`,`glasses_glasses_id`),
  KEY `fk_sale_has_glasses_glasses1_idx` (`glasses_glasses_id`),
  KEY `fk_sale_has_glasses_sale1_idx` (`sale_sale_id`),
  CONSTRAINT `fk_sale_has_glasses_glasses1` FOREIGN KEY (`glasses_glasses_id`) REFERENCES `glasses` (`glasses_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_has_glasses_sale1` FOREIGN KEY (`sale_sale_id`) REFERENCES `sale` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_has_glasses`
--

LOCK TABLES `sale_has_glasses` WRITE;
/*!40000 ALTER TABLE `sale_has_glasses` DISABLE KEYS */;
INSERT INTO `sale_has_glasses` VALUES (1,1),(5,1),(8,1),(2,2),(5,2),(8,2),(1,3),(6,3),(3,4),(7,4),(4,5),(8,5);
/*!40000 ALTER TABLE `sale_has_glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_has_address`
--

DROP TABLE IF EXISTS `supplier_has_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_has_address` (
  `suppliers_id` int NOT NULL,
  `addressBook_id` int NOT NULL,
  `address_type` enum('headquarters','warehouse','factory','returns') DEFAULT NULL,
  PRIMARY KEY (`suppliers_id`,`addressBook_id`),
  KEY `fk_supplier_has_address_suppliers1_idx` (`suppliers_id`),
  KEY `fk_supplier_has_address_addressBook1_idx` (`addressBook_id`),
  CONSTRAINT `fk_supplier_has_address_addressBook1` FOREIGN KEY (`addressBook_id`) REFERENCES `addressBook` (`addressBook_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_supplier_has_address_suppliers1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`suppliers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_has_address`
--

LOCK TABLES `supplier_has_address` WRITE;
/*!40000 ALTER TABLE `supplier_has_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_has_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `suppliers_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `number` varchar(5) NOT NULL,
  `floor` varchar(3) DEFAULT NULL,
  `door` varchar(2) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `country` varchar(25) NOT NULL,
  `phone` bigint NOT NULL,
  `fax` bigint DEFAULT NULL,
  `NIF(tax ID)` varchar(20) NOT NULL,
  PRIMARY KEY (`suppliers_id`),
  UNIQUE KEY `NIF(tax ID)_UNIQUE` (`NIF(tax ID)`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'VisionCo','Main Street','10','2','B','London','W1A1AA','UK',441395588632,444265517529,'UK123456A'),(2,'OptiSupply','Queen Rd','5',NULL,NULL,'Manchester','M13AB','UK',445155847706,NULL,'UK987654B'),(3,'LensDepot','Elm St','12','1','C','Birmingham','B12AA','UK',443918181103,NULL,'UK456789C');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'optician'
--

--
-- Dumping routines for database 'optician'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-10 10:43:39
