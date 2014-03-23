-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	6.0.9-alpha-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommerce`;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `USERIDI` (`user_id`),
  CONSTRAINT `USERIDI` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,15);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'BedRooms'),(2,'DiningRooms'),(1,'Kitchens'),(4,'LivingRooms');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `CategoryID` (`category_id`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'\"Twinkle\" Bedroom Furniture',3,4000,3,'bedroom-furniture-set-orl100-6d-165-p.jpg','Made of solid walnut with a hand-applied mink veneer finish, this sleek bedroom furniture balances clean lines with soft upholstered accents. The dramatic headboard is hand-carved, with individual upholstered sections forming an abstract floral motif. The bed\'s sophisticated contrast of light and dark is echoed in the nightstand.'),(2,'Layton Queen Bed',4,3000,3,'Three-Aspects-for-Your-Bedroom-Decorating10.jpg','Transitional bedroom furniture combines crisp, uncluttered lines with traditional touches for a look that is ordered, functional, versatile, and naturally graceful.'),(3,'Bernhardt Magdalena King Bed',2,1000,3,'BernhardtMagdalenaKingBed.jpg','Sleek and modern, this contemporary bedroom furniture features clean lines and polished surfaces with just a touch of upholstery to soften the look.'),(4,'Bernhardt Magdalena Nightstand',1,2000,3,'MagdalenaNightStand.jpg','Three-drawer nightstand has antiqued-mirror exterior; 28\"W x 19\"D x 30\"T. Boxed weight, approximately 136 lbs.'),(5,'\"Aspen\" Door Chest',4,1500,3,'AspenDoorChest.jpg','Entertainment chest has metal base and ten drawers; top drawers have drop fronts with cut-outs in drawer backs and corresponding holes with grommets in back panel for wire management. 51.125\"W x 20.5\"D x 47\"T. Boxed weight, approximately 251 lbs.'),(6,'\"Aspen\" Round Mirror',6,500,3,'AspenRoundMirror.jpg','Round mirror with beveled glass, 40\"Dia. x 1\"D. Boxed weight, approximately 40 lbs.'),(7,'\"Aspen\" Mirror',2,1000,3,'AspenMirror.jpg','Rectangular mirror with wood frame and beveled glass, 42\"W x 2\"D x 35\"T. Boxed weight, approximately 44 lbs.'),(8,'Vanguard Brea Queen Bed',3,2000,3,'VanguardQueenBed.jpg','Simple yet refined describes this platform bed with tufted headboard. USA made.'),(9,'Melinda Night Table',3,5000,3,'MedlinaNightTable.jpg','Handcrafted of hardwood solids, laminated lumber, veneers, resin, and antiqued mirrored glass.'),(10,'Melinda Three-Drawer Nightstand',4,1600,3,'MedlinaNightStand.jpg','Graceful, stylish nightstand features fluted pilasters, carved trim outlining mirrored inserts on drawer fronts, and tapered legs.'),(11,'Ava Mirrored Dining Table',1,2000,2,'AvaMirroredDiningTable.jpg','Table comes with two 18\" leaves. 112\"L x 46\"D x 30\"T; 25.24\" from apron to floor. Boxed weight, approximately 265 lbs.'),(12,'Ava Arm Chair',20,500,2,'AvaArmChair.jpg','Armchair has silver polyester upholstery. 27\"W x 24\"D x 44\"T; seat, 19\"T; arms, 24\"T. Boxed weight, approximately 61 lbs.'),(13,'Ava Sideboard',3,2000,2,'AvaSideBoard.jpg','Sideboard has four doors with three tray drawers behind center door and two adjustable shelves behind each end door. 72\"W x 20\"D x 38\"T. Boxed weight, approximately 322 lbs.'),(14,'John-Richard Mirrored Dining Table',4,1000,2,'ElizaMirroredDiningTable.jpg','Dining table handcrafted of acacia wood and wood composite has a foxed (antiqued) mirror top and apron rail, mosaic tiles on the end rails, and a hand-painted Parisian-silver finish on all moldings. 96\"L x 42\"W x 30\"T.'),(15,'Mentz Host Dining Chair',54,1500,2,'MentHostDiningChair.jpg','Host chair has hardwood frame, polyester/rayon upholstery, feather/down cushion, and sinuous-spring seat. 25\"W x 32\"D x 47\"T. Handcrafted in the USA. Boxed weight, approximately 34 lbs.'),(16,NULL,2,1300,2,NULL,NULL),(17,NULL,3,3300,2,NULL,NULL),(18,NULL,1,9000,2,NULL,NULL),(19,NULL,2,1000,2,NULL,NULL),(20,NULL,3,8500,2,NULL,NULL),(21,NULL,5,800,1,NULL,NULL),(22,NULL,7,700,1,NULL,NULL),(23,NULL,2,500,1,NULL,NULL),(24,NULL,3,800,1,NULL,NULL),(25,NULL,3,600,1,NULL,NULL),(26,NULL,4,2000,1,NULL,NULL),(27,NULL,5,1300,1,NULL,NULL),(28,NULL,6,2000,1,NULL,NULL),(29,NULL,2,3300,1,NULL,NULL),(30,NULL,3,2300,1,NULL,NULL),(31,NULL,4,1500,4,NULL,NULL),(32,NULL,1,2500,4,NULL,NULL),(33,NULL,1,5000,4,NULL,NULL),(34,NULL,2,2000,4,NULL,NULL),(35,NULL,3,999,4,NULL,NULL),(36,NULL,4,1200,4,NULL,NULL),(37,NULL,8,1350,4,NULL,NULL),(38,NULL,5,2400,4,NULL,NULL),(39,NULL,4,3200,4,NULL,NULL),(40,NULL,7,7500,4,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`order_date`),
  KEY `userid3` (`user_id`),
  CONSTRAINT `userid3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `USERID2` (`user_id`),
  KEY `itemid` (`item_id`),
  CONSTRAINT `itemid` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USERID2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `interests` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Active_status` tinyint(1) DEFAULT NULL,
  `Login_status` tinyint(1) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'Kareem Moustafa','2014-01-01','doc','maadi',NULL,'kareem@gmail.com','123',1,0,1000),(17,'Kareem Moustafa','2014-01-01','doc','maadi',NULL,'kareem2@gmail.com','123',1,0,NULL),(21,'Kareem Moustafa','2014-01-01','doc','maadi',NULL,'kareem2222@gmail.com','123',1,0,NULL),(22,'Kareem Moustafa','2014-01-01','doc','maadi',NULL,'yassmeen@gmail.com','123',1,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-23 16:41:35
