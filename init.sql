-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebook
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `eb_book_author`
--

DROP TABLE IF EXISTS `eb_book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` int DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_author`
--

LOCK TABLES `eb_book_author` WRITE;
/*!40000 ALTER TABLE `eb_book_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_category`
--

DROP TABLE IF EXISTS `eb_book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `is_parent` int NOT NULL,
  `category_level` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_category`
--

LOCK TABLES `eb_book_category` WRITE;
/*!40000 ALTER TABLE `eb_book_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_category_book`
--

DROP TABLE IF EXISTS `eb_book_category_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_category_book` (
  `book_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  KEY `eb_book_category_book_eb_book_ebook_book_id_fk` (`book_id`),
  KEY `eb_book_category_book_eb_book_category_category_id_fk` (`category_id`),
  CONSTRAINT `eb_book_category_book_eb_book_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `eb_book_category` (`category_id`),
  CONSTRAINT `eb_book_category_book_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_category_book`
--

LOCK TABLES `eb_book_category_book` WRITE;
/*!40000 ALTER TABLE `eb_book_category_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_category_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_collect`
--

DROP TABLE IF EXISTS `eb_book_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_collect` (
  `collect_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`collect_id`),
  KEY `eb_book_collect_eb_book_ebook_book_id_fk` (`book_id`),
  KEY `eb_book_collect_eb_system_member_member_id_fk` (`member_id`),
  CONSTRAINT `eb_book_collect_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`),
  CONSTRAINT `eb_book_collect_eb_system_member_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `eb_system_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_collect`
--

LOCK TABLES `eb_book_collect` WRITE;
/*!40000 ALTER TABLE `eb_book_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_comment`
--

DROP TABLE IF EXISTS `eb_book_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `is_delete` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `eb_book_comment_eb_book_ebook_book_id_fk` (`book_id`),
  KEY `eb_book_comment_eb_system_member_member_id_fk` (`member_id`),
  CONSTRAINT `eb_book_comment_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`),
  CONSTRAINT `eb_book_comment_eb_system_member_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `eb_system_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_comment`
--

LOCK TABLES `eb_book_comment` WRITE;
/*!40000 ALTER TABLE `eb_book_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_contribution`
--

DROP TABLE IF EXISTS `eb_book_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_contribution` (
  `contribution_id` int NOT NULL AUTO_INCREMENT,
  `require_value` int NOT NULL,
  PRIMARY KEY (`contribution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_contribution`
--

LOCK TABLES `eb_book_contribution` WRITE;
/*!40000 ALTER TABLE `eb_book_contribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_ebook`
--

DROP TABLE IF EXISTS `eb_book_ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_ebook` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contribution_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `eb_book_ebook_eb_book_contribution_contribution_id_fk` (`contribution_id`),
  KEY `eb_book_ebook_eb_book_publisher_publisher_id_fk` (`publisher_id`),
  CONSTRAINT `eb_book_ebook_eb_book_contribution_contribution_id_fk` FOREIGN KEY (`contribution_id`) REFERENCES `eb_book_contribution` (`contribution_id`),
  CONSTRAINT `eb_book_ebook_eb_book_publisher_publisher_id_fk` FOREIGN KEY (`publisher_id`) REFERENCES `eb_book_publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_ebook`
--

LOCK TABLES `eb_book_ebook` WRITE;
/*!40000 ALTER TABLE `eb_book_ebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_ebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_file`
--

DROP TABLE IF EXISTS `eb_book_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_file` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_url` varchar(1000) DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `eb_book_file_eb_book_ebook_book_id_fk` (`book_id`),
  CONSTRAINT `eb_book_file_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_file`
--

LOCK TABLES `eb_book_file` WRITE;
/*!40000 ALTER TABLE `eb_book_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_image`
--

DROP TABLE IF EXISTS `eb_book_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_url` int NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `eb_book_image_eb_book_ebook_book_id_fk` (`book_id`),
  CONSTRAINT `eb_book_image_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_image`
--

LOCK TABLES `eb_book_image` WRITE;
/*!40000 ALTER TABLE `eb_book_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_owner`
--

DROP TABLE IF EXISTS `eb_book_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_owner` (
  `book_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  KEY `eb_book_author` (`author_id`),
  KEY `eb_book_fk_ebook` (`book_id`),
  CONSTRAINT `eb_book_author` FOREIGN KEY (`author_id`) REFERENCES `eb_book_author` (`author_id`),
  CONSTRAINT `eb_book_fk_ebook` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_owner`
--

LOCK TABLES `eb_book_owner` WRITE;
/*!40000 ALTER TABLE `eb_book_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_publisher`
--

DROP TABLE IF EXISTS `eb_book_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_publisher`
--

LOCK TABLES `eb_book_publisher` WRITE;
/*!40000 ALTER TABLE `eb_book_publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_publisher_book`
--

DROP TABLE IF EXISTS `eb_book_publisher_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_publisher_book` (
  `publisher_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  KEY `eb_book_publisher_book_eb_book_ebook_book_id_fk` (`book_id`),
  KEY `eb_book_publisher_book_eb_book_publisher_publisher_id_fk` (`publisher_id`),
  CONSTRAINT `eb_book_publisher_book_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`),
  CONSTRAINT `eb_book_publisher_book_eb_book_publisher_publisher_id_fk` FOREIGN KEY (`publisher_id`) REFERENCES `eb_book_publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_publisher_book`
--

LOCK TABLES `eb_book_publisher_book` WRITE;
/*!40000 ALTER TABLE `eb_book_publisher_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_publisher_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_book_upload`
--

DROP TABLE IF EXISTS `eb_book_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_book_upload` (
  `upload_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `eb_book_upload_eb_book_ebook_book_id_fk` (`book_id`),
  KEY `eb_book_upload_eb_system_member_member_id_fk` (`member_id`),
  CONSTRAINT `eb_book_upload_eb_book_ebook_book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `eb_book_ebook` (`book_id`),
  CONSTRAINT `eb_book_upload_eb_system_member_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `eb_system_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_book_upload`
--

LOCK TABLES `eb_book_upload` WRITE;
/*!40000 ALTER TABLE `eb_book_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_book_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_admin`
--

DROP TABLE IF EXISTS `eb_system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_login_date` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_admin`
--

LOCK TABLES `eb_system_admin` WRITE;
/*!40000 ALTER TABLE `eb_system_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_member`
--

DROP TABLE IF EXISTS `eb_system_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `is_delete` int DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_member`
--

LOCK TABLES `eb_system_member` WRITE;
/*!40000 ALTER TABLE `eb_system_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-10 14:41:46
