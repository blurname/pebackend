-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: pe
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `canvas`
--

DROP TABLE IF EXISTS `canvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canvas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `created_at` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=840 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas`
--

LOCK TABLES `canvas` WRITE;
/*!40000 ALTER TABLE `canvas` DISABLE KEYS */;
INSERT INTO `canvas` VALUES (831,24,'1635425826860'),(832,24,'1635507969026'),(833,24,'1635507990911'),(834,24,'1636885570635'),(835,31,'1637666511134'),(836,31,'1637737536137'),(837,31,'1637825034133'),(838,31,'1639037884704'),(839,31,'1643983326601');
/*!40000 ALTER TABLE `canvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaboration`
--

DROP TABLE IF EXISTS `collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaboration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canvas_id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  `collaborator_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaboration`
--

LOCK TABLES `collaboration` WRITE;
/*!40000 ALTER TABLE `collaboration` DISABLE KEYS */;
INSERT INTO `collaboration` VALUES (1,831,24,31),(2,832,24,31),(3,836,31,24);
/*!40000 ALTER TABLE `collaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `owner` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,'t1.jpeg',1,0),(2,'t2.jpg',1,0),(3,'t3.jpeg',1,0),(4,'t4.jpeg',1,0),(5,'t5.jpeg',1,0),(6,'t6.jpeg',1,0),(7,'test.jpg',1,0),(8,'line',2,0),(9,'hollowRect',2,0),(10,'circle',2,0);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `left` int NOT NULL,
  `top` int NOT NULL,
  `spirit_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
INSERT INTO `point` VALUES (224,-385,366,413),(225,-368,308,413),(226,-439,242,415),(227,-454,344,415),(228,-392,227,415),(229,-297,207,415),(230,-235,225,415),(231,-252,313,415),(232,-266,346,417),(233,-246,254,417),(234,-228,238,417),(235,-264,170,417),(236,-304,146,417),(237,-396,114,417),(238,-482,130,417),(239,-502,172,417),(240,-442,252,417),(241,-484,222,417),(242,-152,236,417),(243,-178,252,417),(244,-346,130,417),(245,-408,268,417),(246,-136,146,419),(247,-90,130,419),(248,-49,320,420),(249,-24,263,420),(250,-32,349,420),(251,-15,212,420),(252,505,-77,420),(253,42,197,420),(254,-32,277,420),(255,25,332,420),(256,168,290,420),(257,95,182,420),(258,328,334,420),(259,277,233,420),(260,351,319,420),(261,221,213,420),(262,216,318,420),(263,-14,312,420),(264,155,197,420),(265,243,339,420),(266,262,359,420),(267,41,312,420),(268,61,198,420),(269,323,262,420),(270,118,222,420),(271,107,212,420),(272,233,157,420),(273,90,278,420),(274,200,172,420),(275,155,197,420),(276,258,142,420),(277,416,227,420),(278,436,244,420),(279,395,205,420),(280,513,300,420),(281,488,280,420),(282,357,173,420),(283,378,190,420),(284,460,260,420),(285,543,272,420),(286,118,-73,420),(287,505,123,420),(288,53,10,420),(289,462,64,420),(290,71,44,420),(291,523,162,420),(292,82,-48,420),(293,481,88,420),(294,153,-88,420),(295,213,-105,420),(296,383,-81,420),(297,405,-61,420),(298,516,62,420),(299,492,39,420),(300,423,-43,420),(301,456,-7,420),(302,472,14,420),(303,441,-25,420),(304,556,29,420),(305,538,-58,420),(306,80,-96,420),(307,71,-83,420),(308,56,-112,420),(309,38,134,422),(310,70,87,422),(311,122,120,422),(312,107,95,422),(313,193,-21,422),(314,137,148,422),(315,240,65,422),(316,181,163,422),(317,210,-3,422),(318,225,20,422),(319,56,-51,422),(320,31,-36,422),(321,162,-51,422),(322,55,117,422),(323,207,148,422),(324,223,133,422),(325,178,-36,422),(326,93,-66,422),(327,-19,119,422),(328,-4,7,422),(329,11,-20,422),(330,-27,107,423),(331,-22,72,424),(332,246,99,426),(333,230,39,427),(334,336,245,431),(335,366,262,431),(336,386,277,431),(337,183,178,431),(338,298,224,431),(339,231,194,431),(340,147,163,431),(341,262,209,431);
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spirit`
--

DROP TABLE IF EXISTS `spirit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spirit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canvas_spirit_id` int DEFAULT NULL,
  `canvas_id` int DEFAULT NULL,
  `spirit_type` int NOT NULL,
  `model` varchar(255) NOT NULL,
  `element` varchar(255) DEFAULT NULL,
  `unique_props` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spirit`
--

LOCK TABLES `spirit` WRITE;
/*!40000 ALTER TABLE `spirit` DISABLE KEYS */;
INSERT INTO `spirit` VALUES (373,0,839,4,'{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}','cell',NULL),(374,1,839,1,'{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":406,\"top\":44},\"layer\":0.7}','http://localhost:30001/image/get_single/t1.jpeg',NULL),(375,2,839,1,'{\"id\":2,\"scale\":2,\"rotate\":-7,\"trans\":{\"left\":-360,\"top\":-26},\"layer\":0.7}','http://localhost:30001/image/get_single/t4.jpeg','{\"id\":2,\"brightness\":-0.18,\"contrast\":-0.3,\"hue\":0.02,\"saturation\":0,\"vignette\":0}'),(376,3,839,1,'{\"id\":3,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":303,\"top\":-321},\"layer\":0.7}','http://localhost:30001/image/get_single/t3.jpg',NULL),(389,4,839,1,'{\"id\":4,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":70,\"top\":-371},\"layer\":0.7}','http://localhost:30001/image/get_single/t5.jpeg',NULL),(413,5,839,6,'{\"id\":5,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":5,\"width\":17,\"height\":58,\"left\":-385,\"top\":308,\"uColor\":[]}'),(414,0,836,4,'{\"id\":0,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.8}','pure',NULL),(415,1,836,6,'{\"id\":1,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":1,\"width\":219,\"height\":137,\"left\":-454,\"top\":207,\"uColor\":[]}'),(416,6,839,2,'{\"id\":6,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":85,\"top\":-232},\"layer\":0.7}','hollowRect',NULL),(417,7,839,6,'{\"id\":7,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":7,\"width\":350,\"height\":232,\"left\":-502,\"top\":114,\"uColor\":[]}'),(418,8,839,6,'{\"id\":8,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":8,\"width\":20000,\"height\":20000,\"left\":10000,\"top\":10000,\"uColor\":[]}'),(419,9,839,6,'{\"id\":9,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":9,\"width\":46,\"height\":16,\"left\":-136,\"top\":130,\"uColor\":[]}'),(420,10,839,6,'{\"id\":10,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":10,\"width\":605,\"height\":471,\"left\":-49,\"top\":-112,\"uColor\":[]}'),(421,11,839,2,'{\"id\":11,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":-308,\"top\":127},\"layer\":0.7}','circle',NULL),(422,12,839,6,'{\"id\":12,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":12,\"width\":259,\"height\":229,\"left\":-19,\"top\":-66,\"uColor\":[]}'),(423,13,839,6,'{\"id\":13,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":13,\"width\":0,\"height\":0,\"left\":-27,\"top\":107,\"uColor\":[]}'),(424,14,839,6,'{\"id\":14,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":14,\"width\":0,\"height\":0,\"left\":-22,\"top\":72,\"uColor\":[]}'),(425,15,839,6,'{\"id\":15,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":15,\"width\":20000,\"height\":20000,\"left\":10000,\"top\":10000,\"uColor\":[]}'),(426,16,839,6,'{\"id\":16,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":16,\"width\":0,\"height\":0,\"left\":246,\"top\":99,\"uColor\":[]}'),(427,17,839,6,'{\"id\":17,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":17,\"width\":0,\"height\":0,\"left\":230,\"top\":39,\"uColor\":[]}'),(428,18,839,6,'{\"id\":18,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":18,\"width\":20000,\"height\":20000,\"left\":10000,\"top\":10000,\"uColor\":[]}'),(429,19,839,6,'{\"id\":19,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":19,\"width\":20000,\"height\":20000,\"left\":10000,\"top\":10000,\"uColor\":[]}'),(430,20,839,6,'{\"id\":20,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":20,\"width\":20000,\"height\":20000,\"left\":10000,\"top\":10000,\"uColor\":[]}'),(431,21,839,6,'{\"id\":21,\"scale\":1,\"rotate\":0,\"trans\":{\"left\":0,\"top\":0},\"layer\":0.7}',NULL,'{\"id\":21,\"width\":239,\"height\":114,\"left\":147,\"top\":163,\"uColor\":[]}');
/*!40000 ALTER TABLE `spirit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'image'),(2,'mark'),(3,'mosaic'),(6,'paint');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (24,'2021-10-08 19:21:37','b',21,'b'),(25,'2021-11-18 23:23:34','asdf',NULL,'sadf'),(30,'2021-11-18 23:38:01','bls',NULL,'a'),(31,'2021-11-23 18:58:05','a',24,'a');
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

-- Dump completed on 2022-03-12  7:42:53
