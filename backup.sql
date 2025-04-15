-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gd
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_advice`
--

DROP TABLE IF EXISTS `gd_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_advice` (
  `aid` int NOT NULL AUTO_INCREMENT COMMENT '建议表ID',
  `uid` int NOT NULL COMMENT '用户ID',
  `cid` int NOT NULL COMMENT '类别ID',
  `title` varchar(255) NOT NULL COMMENT '建议标题',
  `status` int NOT NULL COMMENT '建议状态',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `detail` text COMMENT '建议详情',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='建议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_advice`
--

LOCK TABLES `gd_advice` WRITE;
/*!40000 ALTER TABLE `gd_advice` DISABLE KEYS */;
INSERT INTO `gd_advice` VALUES (1,8,1,'空包裹',1,'2025-04-08 05:22:37','2025-04-08 05:26:02','','');
/*!40000 ALTER TABLE `gd_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_goods`
--

DROP TABLE IF EXISTS `gd_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_goods` (
  `gid` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) NOT NULL,
  `uid` int NOT NULL,
  `cid` int NOT NULL,
  `introduction` text,
  `used_time` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` int DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_goods`
--

LOCK TABLES `gd_goods` WRITE;
/*!40000 ALTER TABLE `gd_goods` DISABLE KEYS */;
INSERT INTO `gd_goods` VALUES (7,'登山拐',4,6,'品质良好','2年',20.00,1,'2025-04-08 13:03:49','2025-04-08 13:03:49'),(8,'mysql',6,2,'好书','1年',10.00,1,'2025-04-08 13:04:46','2025-04-08 13:04:46'),(9,'分布式',6,2,'用不上了','2年',18.00,1,'2025-04-08 13:05:26','2025-04-08 13:05:26'),(10,'数据结构',6,2,'值得一看','1年',20.00,1,'2025-04-08 13:06:04','2025-04-08 13:06:04'),(11,'帐篷',8,6,'好帐篷，能挡雨','1年',80.00,1,'2025-04-08 13:07:41','2025-04-08 13:07:41'),(12,'积木',8,5,'很好玩','1年',9.00,1,'2025-04-08 13:08:22','2025-04-08 13:08:22'),(13,'急救包',8,7,'适合家庭急救','0年',50.00,1,'2025-04-08 13:09:09','2025-04-08 13:09:09');
/*!40000 ALTER TABLE `gd_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_identification`
--

DROP TABLE IF EXISTS `gd_identification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_identification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `name` varchar(171) DEFAULT NULL,
  `student_id` varchar(171) DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_identification`
--

LOCK TABLES `gd_identification` WRITE;
/*!40000 ALTER TABLE `gd_identification` DISABLE KEYS */;
INSERT INTO `gd_identification` VALUES (1,7,'zdw','2021052080',0,'2025-04-08 13:00:24.923','2025-04-08 13:00:24.923');
/*!40000 ALTER TABLE `gd_identification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_message`
--

DROP TABLE IF EXISTS `gd_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender` varchar(171) DEFAULT NULL,
  `receiver` varchar(171) DEFAULT NULL,
  `content` varchar(171) DEFAULT NULL,
  `timestamp` varchar(171) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_message`
--

LOCK TABLES `gd_message` WRITE;
/*!40000 ALTER TABLE `gd_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gd_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_order`
--

DROP TABLE IF EXISTS `gd_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT '1',
  `uid` int NOT NULL,
  `sid` int NOT NULL,
  `gid` int NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  KEY `sid` (`sid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gd_order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `gd_user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `gd_order_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `gd_user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `gd_order_ibfk_3` FOREIGN KEY (`gid`) REFERENCES `gd_goods` (`gid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_order`
--

LOCK TABLES `gd_order` WRITE;
/*!40000 ALTER TABLE `gd_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `gd_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_photo`
--

DROP TABLE IF EXISTS `gd_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  CONSTRAINT `gd_photo_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `gd_advice` (`aid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_photo`
--

LOCK TABLES `gd_photo` WRITE;
/*!40000 ALTER TABLE `gd_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gd_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_pictures`
--

DROP TABLE IF EXISTS `gd_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_pictures` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `gid` int NOT NULL,
  `picture` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gd_pictures_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `gd_goods` (`gid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_pictures`
--

LOCK TABLES `gd_pictures` WRITE;
/*!40000 ALTER TABLE `gd_pictures` DISABLE KEYS */;
INSERT INTO `gd_pictures` VALUES (6,7,'127.0.0.1/pictures/登山拐.jpg','2025-04-08 13:03:48'),(7,8,'127.0.0.1/pictures/数据库.jpg','2025-04-08 13:04:46'),(8,9,'127.0.0.1/pictures/分布式.jpg','2025-04-08 13:05:25'),(9,10,'127.0.0.1/pictures/数据结构.jpg','2025-04-08 13:06:04'),(10,11,'127.0.0.1/pictures/帐篷.jpg','2025-04-08 13:07:40'),(11,12,'127.0.0.1/pictures/二手玩具.jpg','2025-04-08 13:08:22'),(12,13,'127.0.0.1/pictures/急救包.jpg','2025-04-08 13:09:08');
/*!40000 ALTER TABLE `gd_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_user`
--

DROP TABLE IF EXISTS `gd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gd_user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `introduction` text,
  `level` int DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_user`
--

LOCK TABLES `gd_user` WRITE;
/*!40000 ALTER TABLE `gd_user` DISABLE KEYS */;
INSERT INTO `gd_user` VALUES (4,'wwyx','123456',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVaWQiOjQsImV4cCI6MTc0NTE2MjQ1OSwiaWF0IjoxNzQ0NTU3NjU5fQ.Qbrkk0FZJR8K92WsgeD6c9t8Ymi7rZqw4h_PjSZRMZQ','2025-04-08 03:59:02','2025-04-13 15:20:59','wwyxl','176047666742','http://127.0.0.1/file/系统头像6.jpg',NULL,1),(5,'w\'w\'b\'x\'l','123456',NULL,NULL,'2025-04-08 04:07:28','2025-04-08 05:09:39','wwbxl','13212345678',NULL,NULL,1),(6,'abcd','123456',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVaWQiOjYsImV4cCI6MTc0NTMzNDc4MCwiaWF0IjoxNzQ0NzI5OTgwfQ.6JhzRx8i3VskjECVtpJibV8rmgk-KORQcIKYDd9cvTs','2025-04-08 04:08:18','2025-04-15 15:13:00','abcd','18190908989','http://127.0.0.1/file/系统头像6.jpg',NULL,1),(7,'wxyz','123456',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVaWQiOjcsImV4cCI6MTc0NTEzNzg1NCwiaWF0IjoxNzQ0NTMzMDU0fQ.M571k8Yl7SZtD5GvomtEkfNy7RBtY4MOK3OHEGK-gt4','2025-04-08 04:58:52','2025-04-13 08:30:55','wxyz','13980809090','http://127.0.0.1/file/系统头像5.jpg',NULL,2),(8,'wwaxl','123456',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVaWQiOjgsImV4cCI6MTc0NDY5NDY0NiwiaWF0IjoxNzQ0MDg5ODQ2fQ.oJp0PHaoJfXERy6TmCKpjMtYP1pFDN-Ps3PiCSYO06U','2025-04-08 05:06:47','2025-04-08 05:24:06','wwaxl','18709876868','http://127.0.0.1/file/系统头像1.jpg',NULL,1);
/*!40000 ALTER TABLE `gd_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 23:16:23
