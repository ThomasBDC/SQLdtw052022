-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: dtw_import
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
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `link_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`link_id`),
  KEY `link_id` (`link_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1),(5,1),(1,2),(1,3),(1,4),(5,4),(1,5),(5,5);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `links_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'https://google.com','Google','Le moteur de recherche le plus connu','2022-06-08 00:00:00',1),(2,'https://sql.sh/','SQL','Liste de cours SQL','2022-06-08 00:00:00',1),(3,'https://www.pierre-giraud.com/html-css-apprendre-coder-cours/','Cours HTML','Cours HTML de Pierre GIRAUD','2022-06-08 00:00:00',2),(4,'https://www.pierre-giraud.com/html-css-apprendre-coder-cours/','Cours CSS','Cours CSS de Pierre GIRAUD','2022-06-08 00:00:00',2),(5,'https://www.pierre-giraud.com/javascript-apprendre-coder-cours/','Cours JS','Cours JS de Pierre GIRAUD','2022-06-08 00:00:00',2),(6,'https://www.pierre-giraud.com/php-mysql-apprendre-coder-cours/','Cours PGP','Cours PHP de Pierre GIRAUD','2022-06-08 00:00:00',3),(7,'https://www.pierre-giraud.com/bootstrap-apprendre-cours/','Cours Boostrap','Cours BS de Pierre GIRAUD','2022-06-08 00:00:00',4),(8,'https://www.pierre-giraud.com/jquery-apprendre-cours/','Cours JQUERY','Cours JQUERY de Pierre GIRAUD','2022-06-08 00:00:00',5),(9,'https://www.pierre-giraud.com/','Cours Pierre GIRUD','Toutes les ressources de Pierre GIRAUD','2022-06-08 00:00:00',5);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links_tags`
--

DROP TABLE IF EXISTS `links_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links_tags` (
  `link_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`link_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `links_tags_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`),
  CONSTRAINT `links_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links_tags`
--

LOCK TABLES `links_tags` WRITE;
/*!40000 ALTER TABLE `links_tags` DISABLE KEYS */;
INSERT INTO `links_tags` VALUES (2,1),(9,1),(9,2),(3,3),(9,3),(4,4),(5,4),(7,4),(9,4),(8,5),(9,5),(6,6),(9,6);
/*!40000 ALTER TABLE `links_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `color` varchar(6) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'SQL','eb4034'),(2,'C#','431f6b'),(3,'HTML','9aa321'),(4,'CSS','a36621'),(5,'JS','854564'),(6,'PHP','2a229c');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `forename` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `avatar` blob,
  `avatar_mimeType` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Abdallah','BAILOUL','abba@gmail.com','JDORSQL',NULL,NULL),(2,'Aleksandra','CICHOCKA','test@gmail.com','pwd',NULL,NULL),(3,'Andriy','NANTOY','test@gmail.com','pwd',NULL,NULL),(4,'ANTHOnY','COMMUN','test@gmail.com','pwd',NULL,NULL),(5,'Bruno','DAHLEM','test@gmail.com','pwd',NULL,NULL),(6,'Christophe','THEVENET','test@gmail.com','pwd',NULL,NULL),(7,'Dominique','BUTIN','test@gmail.com','pwd',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 14:53:22
