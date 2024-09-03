-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: projecttourismDB
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Temporary view structure for view `Destination_pack_vw`
--

DROP TABLE IF EXISTS `Destination_pack_vw`;
/*!50001 DROP VIEW IF EXISTS `Destination_pack_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Destination_pack_vw` AS SELECT 
 1 AS `did`,
 1 AS `destination_name`,
 1 AS `location`,
 1 AS `destination_description`,
 1 AS `destination_image`,
 1 AS `pid`,
 1 AS `package_name`,
 1 AS `price`,
 1 AS `duration`,
 1 AS `package_details`,
 1 AS `package_image`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Destinations`
--

DROP TABLE IF EXISTS `Destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Destinations` (
  `did` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Destinations`
--

LOCK TABLES `Destinations` WRITE;
/*!40000 ALTER TABLE `Destinations` DISABLE KEYS */;
INSERT INTO `Destinations` VALUES (1,'Alibaug','Maharastra, India','A coastal town with beaches, forts, and coconut groves. A popular weekend getaway from Mumbai','Images/alibaug.jpg'),(2,'Ratnagiri','Maharastra, India','A port city on the Arabian Sea, famous for its Alphonso mangoes, beautiful beaches','Images/ratnagiri.jpg'),(3,'Sindhudurg','Maharastra, India','A fortress located on the shores of Malvan town, known for its historical significance ','Images/sindhudurg.jpg'),(4,'Ganpatipule','Maharastra, India','A small town known for its 400-year-old Ganpati temple and its pristine beach','Images/Ganapatipule_Beach.jpg'),(5,'Murud-Janjira','Maharastra, India',' Murud-Janjira fort: iconic on island near coastal Murud','Images/murud-janjira.jpg');
/*!40000 ALTER TABLE `Destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Packages`
--

DROP TABLE IF EXISTS `Packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Packages` (
  `pid` int NOT NULL,
  `pack_name` varchar(30) DEFAULT NULL,
  `did` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `details` varchar(150) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `did` (`did`),
  CONSTRAINT `Packages_ibfk_1` FOREIGN KEY (`did`) REFERENCES `Destinations` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Packages`
--

LOCK TABLES `Packages` WRITE;
/*!40000 ALTER TABLE `Packages` DISABLE KEYS */;
INSERT INTO `Packages` VALUES (101,'Alibaug Weekend Getaway',1,6000,2,'Enjoy a relaxing weekend at the beaches of Alibaug with a stay in a beach resort, including breakfast and a guided tour of Alibaug Fort.','Images/alibaug2.jpg'),(102,'Ratnagiri Heritage Tour',2,7000,2,'Explore the historical landmarks and beautiful beaches of Ratnagiri. The package includes a 3-day stay in a beachfront hotel, all meals','Images/ratnagiri.jpg'),(103,'Sindhudurg Fort Adventure',3,8000,2,'Experience the historical Sindhudurg Fort with a 2-day adventure package including a stay in Malvan, a boat ride to the fort.','Images/sindhudurg.jpg'),(104,'Ganpatipule Temple Retreat',4,7500,2,'Visit the serene town of Ganpatipule with its famous Ganpati temple. The package includes a 2-day stay at a beach resort, breakfast','Images/Ganpatipule.jpg'),(105,'Murud-Janjira Fort Escape',5,8500,3,'Discover the historical Murud-Janjira Fort with a 3-day escape package. Includes a stay in a coastal village resort, meals, and a guided boat trip','Images/murud-janjira.jpg'),(106,'Harnai Full Tour',2,7000,3,'Explore serene beaches, the historic Harnai Fort, vibrant fish markets, and witness stunning sunsets in this coastal paradise.','Images/harnai.jpg');
/*!40000 ALTER TABLE `Packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminuser` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES ('admin1','admin@123','admin1@gmail.com'),('admin2','admin@111','admin2@gmailcom');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycart`
--

DROP TABLE IF EXISTS `mycart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mycart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `pack_id` int DEFAULT NULL,
  `no_of_person` int DEFAULT NULL,
  `status` enum('waiting','confirmed') DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `username` (`username`),
  CONSTRAINT `mycart_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycart`
--

LOCK TABLES `mycart` WRITE;
/*!40000 ALTER TABLE `mycart` DISABLE KEYS */;
INSERT INTO `mycart` VALUES (22,104,2,'confirmed','umesh23',7),(23,103,3,'confirmed','umesh23',7),(24,103,2,'confirmed','umesh23',8),(25,105,3,'confirmed','umesh23',9),(27,103,1,'confirmed','umeshp',10),(28,103,2,'confirmed','umesh23',11);
/*!40000 ALTER TABLE `mycart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_master` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `date_of_order` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES (7,'2024-06-18',39000,'umesh23'),(8,'2024-06-18',16000,'umesh23'),(9,'2024-06-18',25500,'umesh23'),(10,'2024-06-18',8000,'umeshp'),(11,'2024-07-04',16000,'umesh23');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_vw`
--

DROP TABLE IF EXISTS `order_vw`;
/*!50001 DROP VIEW IF EXISTS `order_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_vw` AS SELECT 
 1 AS `pid`,
 1 AS `pack_name`,
 1 AS `price`,
 1 AS `image_url`,
 1 AS `no_of_person`,
 1 AS `total_amount`,
 1 AS `username`,
 1 AS `order_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pack_cart_vw`
--

DROP TABLE IF EXISTS `pack_cart_vw`;
/*!50001 DROP VIEW IF EXISTS `pack_cart_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pack_cart_vw` AS SELECT 
 1 AS `pid`,
 1 AS `pack_name`,
 1 AS `price`,
 1 AS `image_url`,
 1 AS `no_of_person`,
 1 AS `total_amount`,
 1 AS `username`,
 1 AS `cart_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `cardno` varchar(4) NOT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `expiry` varchar(10) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`cardno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('111','111','12/2030',822500),('222','222','12/2030',177500);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('umesh23','umesh@123','demo@gmail.com'),('umeshp','umeshp@123','umesh@mail.com');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Destination_pack_vw`
--

/*!50001 DROP VIEW IF EXISTS `Destination_pack_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Destination_pack_vw` AS select `d`.`did` AS `did`,`d`.`name` AS `destination_name`,`d`.`location` AS `location`,`d`.`description` AS `destination_description`,`d`.`image_url` AS `destination_image`,`p`.`pid` AS `pid`,`p`.`pack_name` AS `package_name`,`p`.`price` AS `price`,`p`.`duration` AS `duration`,`p`.`details` AS `package_details`,`p`.`image_url` AS `package_image` from (`Destinations` `d` join `Packages` `p` on((`d`.`did` = `p`.`did`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_vw`
--

/*!50001 DROP VIEW IF EXISTS `order_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_vw` AS select `p`.`pid` AS `pid`,`p`.`pack_name` AS `pack_name`,`p`.`price` AS `price`,`p`.`image_url` AS `image_url`,`m`.`no_of_person` AS `no_of_person`,(`p`.`price` * `m`.`no_of_person`) AS `total_amount`,`m`.`username` AS `username`,`m`.`order_id` AS `order_id` from (`mycart` `m` join `Packages` `p` on(((`m`.`pack_id` = `p`.`pid`) and (`m`.`status` = 'confirmed')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pack_cart_vw`
--

/*!50001 DROP VIEW IF EXISTS `pack_cart_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pack_cart_vw` AS select `p`.`pid` AS `pid`,`p`.`pack_name` AS `pack_name`,`p`.`price` AS `price`,`p`.`image_url` AS `image_url`,`m`.`no_of_person` AS `no_of_person`,(`p`.`price` * `m`.`no_of_person`) AS `total_amount`,`m`.`username` AS `username`,`m`.`cart_id` AS `cart_id` from (`mycart` `m` join `Packages` `p` on(((`m`.`pack_id` = `p`.`pid`) and (`m`.`status` = 'waiting')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04 11:36:21
