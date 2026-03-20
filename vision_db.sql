-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: vision_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user profile',7,'add_userprofile'),(26,'Can change user profile',7,'change_userprofile'),(27,'Can delete user profile',7,'delete_userprofile'),(28,'Can view user profile',7,'view_userprofile'),(29,'Can add password reset otp',8,'add_passwordresetotp'),(30,'Can change password reset otp',8,'change_passwordresetotp'),(31,'Can delete password reset otp',8,'delete_passwordresetotp'),(32,'Can view password reset otp',8,'view_passwordresetotp'),(33,'Can add user difficulty',9,'add_userdifficulty'),(34,'Can change user difficulty',9,'change_userdifficulty'),(35,'Can delete user difficulty',9,'delete_userdifficulty'),(36,'Can view user difficulty',9,'view_userdifficulty'),(37,'Can add training session',10,'add_trainingsession'),(38,'Can change training session',10,'change_trainingsession'),(39,'Can delete training session',10,'delete_trainingsession'),(40,'Can view training session',10,'view_trainingsession'),(41,'Can add level',11,'add_level'),(42,'Can change level',11,'change_level'),(43,'Can delete level',11,'delete_level'),(44,'Can view level',11,'view_level');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `is_superuser` tinyint(1) DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `date_joined` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `username_2` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username_3` (`username`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `username_4` (`username`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `username_5` (`username`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `username_6` (`username`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `username_7` (`username`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `username_8` (`username`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `username_9` (`username`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `username_10` (`username`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `username_11` (`username`),
  UNIQUE KEY `email_10` (`email`),
  UNIQUE KEY `username_12` (`username`),
  UNIQUE KEY `email_11` (`email`),
  UNIQUE KEY `username_13` (`username`),
  UNIQUE KEY `email_12` (`email`),
  UNIQUE KEY `username_14` (`username`),
  UNIQUE KEY `email_13` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$DLFwGH6RZ9O65OlfI7sAgQ$SCIFOwgUuJVmscE8QVOqO1rHYqAYnrWJueSURidrfp0=',0,'crazyanil118@gmail.com','Anil','kumar','crazyanil118@gmail.com',0,1,'2026-03-19 03:20:02',NULL),(2,'pbkdf2_sha256$1000000$Gm07gZC5QErVdolKH0IxTl$G+K8zktYC/AjH4Vw86RM8G3j5uPFlViN+xsKUB7JFao=',0,'anilmaganight33@gmail.com','Wizard','','anilmaganight33@gmail.com',0,1,'2026-03-19 03:20:02',NULL),(3,'pbkdf2_sha256$1000000$t2yPkARqHp5TdnQHN4zibb$i8pzYmioGhwNDIj2AjIOD+CJHK9CI/Putjzvfi50P/4=',0,'geethareddy346@gmail.com','geetha','','geethareddy346@gmail.com',0,1,'2026-03-19 03:20:02',NULL),(6,'pbkdf2_sha256$1000000$qJjckwNIJa2Y2QIM6PCGd2$l9Mfd2h4bBVEgUoETxQYGXLkNvF9cXOOUhWWcBhe48Y=',0,'test@example.com','Test','User','test@example.com',0,1,'2026-03-19 03:20:02',NULL),(8,'pbkdf2_sha256$1000000$P7fCFeXYGxswyfDaetWECB$bRG1uqscIv2c68HWkRY8agISTVWwB5cY2h6lzZhwk08=',0,'Geethareddy123@saveetha.com','Geetha','','Geethareddy123@saveetha.com',0,1,'2026-03-19 03:20:02',NULL),(9,'pbkdf2_sha256$1000000$JD9jRzMLiOgH2a0twD4PTM$6lzrV7ELo0QHOMfN0v82CKHMcgdO7GOhpHlsbdYvQTs=',0,'arsha123@gmail.com','Arsha','','arsha123@gmail.com',0,1,'2026-03-19 03:20:02',NULL),(10,'pbkdf2_sha256$1000000$syb54HY8tI0p6XSdlS9Is1$Trv2CaKP/rk/sy5WnS3CWIEoDv8K4qZoEC1Evt1eh70=',0,'geethareddy123@gmail.com','geetha','','geethareddy123@gmail.com',0,1,'2026-03-19 03:21:19',NULL),(11,'$2a$10$fBhHWpcYqCm3goT8ZcHVtuoUfqKvLArEyiAH0BpWVb6h9JBg.cADK',0,'geethareddy22@gmail.com','geetha','','geethareddy22@gmail.com',0,1,'2026-03-19 06:34:57',NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'game','passwordresetotp'),(7,'game','userprofile'),(11,'level','level'),(10,'score','trainingsession'),(9,'score','userdifficulty'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-01 08:29:08.058324'),(2,'auth','0001_initial','2026-03-01 08:29:08.940626'),(3,'admin','0001_initial','2026-03-01 08:29:09.152896'),(4,'admin','0002_logentry_remove_auto_add','2026-03-01 08:29:09.161580'),(5,'admin','0003_logentry_add_action_flag_choices','2026-03-01 08:29:09.171621'),(6,'contenttypes','0002_remove_content_type_name','2026-03-01 08:29:09.396588'),(7,'auth','0002_alter_permission_name_max_length','2026-03-01 08:29:09.492148'),(8,'auth','0003_alter_user_email_max_length','2026-03-01 08:29:09.517088'),(9,'auth','0004_alter_user_username_opts','2026-03-01 08:29:09.527078'),(10,'auth','0005_alter_user_last_login_null','2026-03-01 08:29:09.610110'),(11,'auth','0006_require_contenttypes_0002','2026-03-01 08:29:09.614109'),(12,'auth','0007_alter_validators_add_error_messages','2026-03-01 08:29:09.621716'),(13,'auth','0008_alter_user_username_max_length','2026-03-01 08:29:09.721525'),(14,'auth','0009_alter_user_last_name_max_length','2026-03-01 08:29:09.806304'),(15,'auth','0010_alter_group_name_max_length','2026-03-01 08:29:09.827684'),(16,'auth','0011_update_proxy_permissions','2026-03-01 08:29:09.839180'),(17,'auth','0012_alter_user_first_name_max_length','2026-03-01 08:29:09.933698'),(18,'game','0001_initial','2026-03-01 08:29:10.070399'),(19,'sessions','0001_initial','2026-03-01 08:29:10.126429'),(20,'game','0002_passwordresetotp','2026-03-01 08:56:55.008450'),(21,'score','0001_initial','2026-03-01 15:25:04.692685'),(22,'score','0002_trainingsession','2026-03-02 03:34:45.270613'),(23,'game','0003_userprofile_age_userprofile_dominant_eye_and_more','2026-03-02 08:05:26.350835'),(24,'level','0001_initial','2026-03-04 17:24:54.844340'),(25,'score','0003_trainingsession_skill_name','2026-03-09 10:08:01.606012');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_passwordresetotp`
--

DROP TABLE IF EXISTS `game_passwordresetotp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_passwordresetotp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_passwordresetotp`
--

LOCK TABLES `game_passwordresetotp` WRITE;
/*!40000 ALTER TABLE `game_passwordresetotp` DISABLE KEYS */;
INSERT INTO `game_passwordresetotp` VALUES (4,'geethareddy346@gmail.com','644574','2026-03-17 06:51:36.969221',0);
/*!40000 ALTER TABLE `game_passwordresetotp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_userprofile`
--

DROP TABLE IF EXISTS `game_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `dominant_eye` varchar(255) DEFAULT NULL,
  `dominant_hand` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `skill_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `game_userprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_userprofile`
--

LOCK TABLES `game_userprofile` WRITE;
/*!40000 ALTER TABLE `game_userprofile` DISABLE KEYS */;
INSERT INTO `game_userprofile` VALUES (1,'geetha','2026-03-02 08:06:13',3,24,'Right','Right','Male','Intermediate'),(2,'Anilkumar','2026-03-02 09:04:32',1,24,'Right','Right','Male','Beginner'),(3,'Test User','2026-03-10 10:33:18',6,NULL,NULL,NULL,NULL,NULL),(4,'Geetha','2026-03-17 05:08:55',8,NULL,NULL,NULL,NULL,NULL),(5,'Arsha ','2026-03-17 07:17:19',9,NULL,NULL,NULL,NULL,NULL),(6,'geetha','2026-03-19 03:21:20',10,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `game_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_level`
--

DROP TABLE IF EXISTS `level_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `game_type` varchar(50) NOT NULL,
  `score` int NOT NULL,
  `date_played` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level_level_user_id_ebdaabc6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `level_level_user_id_ebdaabc6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_level`
--

LOCK TABLES `level_level` WRITE;
/*!40000 ALTER TABLE `level_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_trainingsession`
--

DROP TABLE IF EXISTS `score_trainingsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_trainingsession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `game_name` varchar(100) NOT NULL,
  `sport_name` varchar(100) NOT NULL,
  `score` int NOT NULL,
  `accuracy_percentage` double NOT NULL,
  `average_reaction_time_ms` double NOT NULL,
  `total_attempts` int NOT NULL,
  `correct_hits` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `score_trainingsession_user_id_2c4091ff_fk_auth_user_id` (`user_id`),
  CONSTRAINT `score_trainingsession_user_id_2c4091ff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_trainingsession`
--

LOCK TABLES `score_trainingsession` WRITE;
/*!40000 ALTER TABLE `score_trainingsession` DISABLE KEYS */;
INSERT INTO `score_trainingsession` VALUES (1,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:38:19.096790',1,NULL),(2,'Focus Hold','Tennis',2,0,0,0,0,'2026-03-02 03:38:39.533504',1,NULL),(3,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:44:41.401259',1,NULL),(4,'Focus Hold','Tennis',1,0,0,0,0,'2026-03-02 03:44:48.256856',1,NULL),(5,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:44:56.979995',1,NULL),(6,'Speed Tap','Tennis',6,0,0,0,0,'2026-03-02 03:45:00.701804',1,NULL),(7,'Focus Hold','Baseball',1,0,0,0,0,'2026-03-02 03:45:49.858723',1,NULL),(8,'Multi Object','Baseball',300,0,0,0,0,'2026-03-02 03:48:07.103773',1,NULL),(9,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:51:59.031609',1,NULL),(10,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:56:38.727087',1,NULL),(11,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:58:51.698619',1,NULL),(12,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:58:54.021383',1,NULL),(13,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 03:59:00.369371',1,NULL),(14,'Peripheral Flash','Cricket',1,0,0,0,0,'2026-03-02 04:04:41.041972',3,NULL),(15,'Peripheral Flash','Cricket',1,0,0,0,0,'2026-03-02 04:04:49.169910',3,NULL),(16,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-02 04:10:15.428269',3,NULL),(17,'Peripheral Flash','Tennis',1,0,0,0,0,'2026-03-02 04:10:25.586005',3,NULL),(18,'Focus Hold','Tennis',2,0,0,0,0,'2026-03-02 04:10:33.055297',3,NULL),(19,'Speed Tap','Tennis',4,0,0,0,0,'2026-03-02 04:10:38.134408',3,NULL),(20,'Focus Hold','Baseball',0,0,0,0,0,'2026-03-02 04:11:57.859888',3,NULL),(21,'Accuracy Precision','Baseball',600,0,0,0,0,'2026-03-02 04:12:09.417799',3,NULL),(22,'Advanced Combo','Baseball',900,0,0,0,0,'2026-03-02 04:12:21.096310',3,NULL),(23,'Speed Tap','Tennis',1,0,0,0,0,'2026-03-02 04:14:40.589677',3,NULL),(24,'Focus Hold','Tennis',0,0,0,0,0,'2026-03-02 04:15:30.014856',3,NULL),(25,'Peripheral Flash','Cricket',2,0,0,0,0,'2026-03-02 06:40:44.713121',3,NULL),(26,'Hand Eye Sync','Cricket',300,0,0,0,0,'2026-03-02 06:40:54.637802',3,NULL),(27,'Left Right','Cricket',1250,0,0,0,0,'2026-03-02 06:41:07.710605',3,NULL),(28,'Multi Object','Cricket',300,0,0,0,0,'2026-03-02 06:41:21.367685',3,NULL),(29,'Number Sequence','Cricket',600,0,0,0,0,'2026-03-02 06:41:37.441429',3,NULL),(30,'Number Sequence','Cricket',350,0,0,0,0,'2026-03-02 06:41:57.534394',3,NULL),(31,'Random Target','Cricket',240,0,0,0,0,'2026-03-02 06:42:04.942978',3,NULL),(32,'Color Match','Cricket',2050,0,0,0,0,'2026-03-02 06:42:53.144721',3,NULL),(33,'Peripheral Flash','Cricket',1,0,0,0,0,'2026-03-02 09:04:45.774452',1,NULL),(34,'Color Match','Other',200,0,0,0,0,'2026-03-04 15:52:48.274729',1,NULL),(35,'Focus Hold','Basketball',36,0,0,0,0,'2026-03-04 17:36:49.651230',1,NULL),(36,'Color Match','Other, Baseball',350,35.294117,3409.5293,17,6,'2026-03-04 17:54:31.056959',1,NULL),(37,'Focus Hold','Basketball',30,96.77419,988.3333,31,30,'2026-03-04 18:17:36.911179',1,NULL),(38,'Hand Eye Sync','Tennis',4500,75,677.4667,40,30,'2026-03-04 18:37:33.565166',1,NULL),(39,'Peripheral Flash','Tennis',3,0,0,0,0,'2026-03-05 03:28:24.820471',3,NULL),(40,'Focus Hold','Tennis',9,90,730.44446,10,9,'2026-03-05 03:28:45.120313',3,NULL),(41,'Speed Tap','Tennis',19,100,3157.8948,19,19,'2026-03-05 03:28:54.041460',3,NULL),(42,'Advanced Combo','Tennis',600,66.66667,683.5,3,2,'2026-03-05 03:29:04.646632',3,NULL),(43,'Hand Eye Sync','Other',3750,62.5,650.96,40,25,'2026-03-09 08:54:30.570256',3,NULL),(44,'Peripheral Flash','Baseball',0,0,0,2,0,'2026-03-09 09:40:58.712906',3,NULL),(45,'Speed Tap','Baseball',36,100,1666.6666,36,36,'2026-03-09 09:41:13.529567',3,NULL),(46,'Speed Tap','Baseball',12,100,5000,12,12,'2026-03-09 09:41:18.390872',3,NULL),(47,'Left Right','Baseball',900,51.6129,234.3871,31,16,'2026-03-09 09:41:29.774914',3,NULL),(48,'Random Target','Baseball',120,100,699,1,1,'2026-03-09 09:41:35.677116',3,NULL),(49,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-09 09:50:50.468238',3,NULL),(50,'Hand Eye Sync','Tennis',150,33.333336,731,3,1,'2026-03-09 09:50:58.033567',3,NULL),(51,'Multi Object','Tennis',-400,12.5,533.125,8,1,'2026-03-09 09:51:09.356776',3,NULL),(52,'Speed Tap','Other',50,100,250,50,50,'2026-03-10 10:27:27.659197',1,NULL),(53,'Peripheral Flash','Cricket',0,0,0,3,0,'2026-03-10 10:37:34.807973',3,NULL),(54,'Focus Hold','Cricket',0,0,1065,1,0,'2026-03-10 10:37:43.800372',3,NULL),(55,'Focus Hold','Cricket',1,50,3517,2,1,'2026-03-10 10:38:00.782097',3,NULL),(56,'Hand Eye Sync','Cricket',2400,84.210526,622,19,16,'2026-03-10 10:38:32.605050',3,NULL),(57,'Color Match','Tennis',50,25.531916,741.44684,47,12,'2026-03-10 15:44:51.044581',1,NULL),(58,'Random Target','Tennis',3360,93.333336,539.8571,30,28,'2026-03-10 15:46:02.768651',1,NULL),(59,'Focus Hold','Tennis',12,92.30769,800.25,13,12,'2026-03-10 15:57:19.002729',1,NULL),(60,'Number Sequence','Tennis',-1150,11.428572,968.9429,35,4,'2026-03-10 15:58:00.478670',1,NULL),(61,'Multi Object','Tennis',1800,46.51163,808.32556,43,20,'2026-03-10 15:58:44.514326',1,NULL),(62,'Multi Object','Tennis',2600,47.457626,574.98303,59,28,'2026-03-10 16:12:32.593860',3,NULL),(63,'Multi Object','Tennis',2600,47.457626,574.98303,59,28,'2026-03-10 16:12:32.834530',3,NULL),(64,'Random Target','Other',3480,96.666664,541.62067,30,29,'2026-03-10 16:18:21.031658',3,NULL),(65,'Focus Hold','Other',0,0,740,1,0,'2026-03-10 16:32:16.422244',3,NULL),(66,'Multi Object','Other',2700,47.540985,568.39343,61,29,'2026-03-10 16:32:57.251163',3,NULL),(67,'Number Sequence','Tennis',0,0,0,0,0,'2026-03-11 07:17:06.809511',1,NULL),(68,'Random Target','Tennis',1080,30.000002,516.7778,30,9,'2026-03-11 07:17:47.725228',1,NULL),(69,'Focus Hold','Tennis',9,90,849.6667,10,9,'2026-03-11 07:19:42.541397',1,NULL),(70,'Color Match','Tennis',250,66.66667,6998,3,2,'2026-03-11 07:20:25.976785',1,NULL),(71,'Peripheral Flash','Tennis',0,0,0,0,0,'2026-03-11 07:35:39.667753',1,NULL),(72,'Peripheral Flash','Tennis',1,16.666668,459,6,1,'2026-03-11 07:36:02.609208',1,NULL),(73,'Focus Hold','Tennis',1,50,669,2,1,'2026-03-11 07:36:20.336502',1,NULL),(74,'Speed Tap','Tennis',37,100,945.9459,37,37,'2026-03-11 07:36:28.421497',1,NULL),(75,'Hand Eye Sync','Tennis',150,100,600,1,1,'2026-03-11 07:36:32.389311',1,NULL),(76,'Peripheral Flash','Tennis',0,0,0,2,0,'2026-03-11 10:11:25.499003',3,NULL),(77,'Color Match','Tennis',0,0,0,0,0,'2026-03-11 10:13:18.107551',3,NULL),(78,'Number Sequence','Tennis',0,0,0,0,0,'2026-03-11 10:14:55.804341',3,NULL),(79,'Number Sequence','Tennis',0,0,0,0,0,'2026-03-11 10:19:42.852631',3,NULL),(80,'Color Match','Tennis',-350,15.789473,778.9474,19,3,'2026-03-11 10:20:54.656229',3,NULL),(81,'Peripheral Flash','Tennis',0,0,0,16,0,'2026-03-11 10:21:59.979145',3,NULL),(82,'Color Match','Tennis',0,0,0,0,0,'2026-03-11 10:22:13.918146',3,NULL),(83,'Number Sequence','Tennis',200,41.17647,1631.8235,17,7,'2026-03-11 10:22:47.571571',3,NULL),(84,'Color Match','Tennis',0,0,0,0,0,'2026-03-11 10:23:59.810223',3,NULL),(85,'Color Match','Basketball',600,62.5,2190.75,8,5,'2026-03-11 10:27:10.627644',3,NULL),(86,'Focus Hold','Tennis',2,66.66667,721,3,2,'2026-03-11 10:30:09.327645',3,NULL),(87,'Peripheral Flash','Tennis',2,66.66667,714,3,2,'2026-03-11 14:34:15.733621',3,NULL),(88,'Focus Hold','Tennis',4,80,650.5,5,4,'2026-03-11 14:34:25.237234',3,NULL),(89,'Multi Object','Tennis',600,75,728.5,4,3,'2026-03-11 14:34:33.411580',3,NULL),(90,'Peripheral Flash','Tennis',0,0,0,8,0,'2026-03-11 15:23:47.443400',3,NULL),(91,'Focus Hold','Tennis',0,0,802,1,0,'2026-03-11 15:24:04.622497',3,NULL),(92,'Peripheral Flash','Tennis',0,0,0,2,0,'2026-03-11 15:25:03.830282',3,NULL),(93,'Focus Hold','Baseball',1,50,880,2,1,'2026-03-11 15:28:28.418394',3,NULL),(94,'Peripheral Flash','Tennis',0,0,0,3,0,'2026-03-12 02:48:23.015521',3,NULL),(95,'Peripheral Flash','Tennis',2,66.66667,466.5,3,2,'2026-03-12 02:48:32.786646',3,NULL),(96,'Focus Hold','Tennis',4,80,644.75,5,4,'2026-03-12 02:48:50.141447',3,NULL),(97,'Speed Tap','Tennis',61,100,573.7705,61,61,'2026-03-12 02:49:03.454004',3,NULL),(98,'Left Right','Tennis',1050,84.61539,544.46155,13,11,'2026-03-12 02:49:14.733655',3,NULL),(99,'Speed Tap','Tennis',0,0,0,0,0,'2026-03-12 02:49:49.374597',3,NULL),(100,'Peripheral Flash','Tennis',0,0,0,1,0,'2026-03-12 03:02:11.279479',3,NULL),(101,'Focus Hold','Tennis',3,75,669.6667,4,3,'2026-03-12 03:02:22.865493',3,NULL),(102,'Focus Hold','Tennis',0,0,744,1,0,'2026-03-12 03:02:25.315660',3,NULL),(103,'Focus Hold','Tennis',3,75,862.3333,4,3,'2026-03-12 03:02:59.242031',3,NULL),(104,'Focus Hold','Tennis',0,0,0,1,0,'2026-03-12 03:03:05.600208',3,NULL),(105,'Peripheral Flash','Tennis',1,50,589,2,1,'2026-03-12 03:07:50.944935',3,NULL),(106,'Peripheral Flash','Tennis',0,0,0,1,0,'2026-03-12 03:08:00.197585',3,NULL),(107,'Focus Hold','Tennis',5,83.33333,732.8,6,5,'2026-03-12 03:08:13.656082',3,NULL),(108,'Peripheral Flash','Cricket',2,66.66667,514.5,3,2,'2026-03-12 15:13:52.731783',3,NULL),(109,'Peripheral Flash','Cricket',1,100,637,1,1,'2026-03-12 15:14:01.419770',3,NULL),(110,'Focus Hold','Cricket',5,83.33333,888.6,6,5,'2026-03-12 15:14:14.163482',3,NULL),(111,'Speed Tap','Cricket',19,100,3157.8948,19,19,'2026-03-12 15:14:21.236521',3,NULL),(112,'Hand Eye Sync','Cricket',450,60.000004,789.3333,5,3,'2026-03-12 15:14:31.041566',3,NULL),(113,'Left Right','Cricket',350,55.555557,529.3333,9,5,'2026-03-12 15:14:41.018327',3,NULL),(114,'Multi Object','Cricket',2000,90.909096,951.5455,11,10,'2026-03-12 15:14:56.040226',3,NULL),(115,'Number Sequence','Cricket',1300,87.5,609.0625,16,14,'2026-03-12 15:15:11.662363',3,NULL),(116,'Random Target','Cricket',600,100,555.8,5,5,'2026-03-12 15:15:25.296861',3,NULL),(117,'Color Match','Cricket',1800,100,1081.9166,12,12,'2026-03-12 15:15:42.928596',3,NULL),(118,'Advanced Combo','Cricket',0,0,0,1,0,'2026-03-12 15:15:52.763118',3,NULL),(119,'Peripheral Flash','Cricket',0,0,0,1,0,'2026-03-13 03:08:20.057661',1,NULL),(120,'Focus Hold','Cricket',0,0,0,1,0,'2026-03-13 03:08:54.069247',1,NULL),(121,'Speed Tap','Cricket',1,100,25000,1,1,'2026-03-13 03:08:58.425917',1,NULL),(122,'Peripheral Flash','Tennis',1,100,816,1,1,'2026-03-13 07:59:30.045061',3,NULL),(123,'Focus Hold','Tennis',1,50,664,2,1,'2026-03-13 07:59:35.476445',3,NULL),(124,'Speed Tap','Tennis',3,100,20000,3,3,'2026-03-13 07:59:39.358139',3,NULL),(125,'Hand Eye Sync','Tennis',300,66.66667,645.5,3,2,'2026-03-13 07:59:46.837058',3,NULL),(126,'Left Right','Tennis',0,30.000002,341.3,10,3,'2026-03-13 07:59:57.679103',3,NULL),(127,'Multi Object','Tennis',600,75,566.25,4,3,'2026-03-13 08:00:03.834593',3,NULL),(128,'Number Sequence','Tennis',-150,0,875,3,0,'2026-03-13 08:00:10.689191',3,NULL),(129,'Random Target','Tennis',240,100,559,2,2,'2026-03-13 08:00:17.938714',3,NULL),(130,'Random Target','Tennis',120,100,745,1,1,'2026-03-13 08:00:23.592712',3,NULL),(131,'Color Match','Tennis',450,100,1168.6666,3,3,'2026-03-13 08:00:34.698060',3,NULL),(132,'Peripheral Flash','Tennis',2,100,577.5,2,2,'2026-03-15 11:45:19.887762',3,NULL),(133,'Focus Hold','Tennis',4,80,703.75,5,4,'2026-03-15 11:45:29.435581',3,NULL),(134,'Speed Tap','Tennis',63,100,952.381,63,63,'2026-03-15 11:45:48.454802',3,NULL),(135,'Hand Eye Sync','Tennis',450,100,632.6667,3,3,'2026-03-15 11:45:56.231909',3,NULL),(136,'Left Right','Tennis',650,66.66667,312.91666,12,8,'2026-03-15 11:46:03.613991',3,NULL),(137,'Multi Object','Tennis',600,75,464.25,4,3,'2026-03-15 11:46:09.040225',3,NULL),(138,'Number Sequence','Tennis',800,100,567.875,8,8,'2026-03-15 11:46:17.788343',3,NULL),(139,'Random Target','Tennis',240,100,556.5,2,2,'2026-03-15 11:46:26.465760',3,NULL),(140,'Random Target','Tennis',120,100,552,1,1,'2026-03-15 11:46:30.583291',3,NULL),(141,'Color Match','Tennis',250,66.66667,1004.6667,3,2,'2026-03-15 11:46:37.165573',3,NULL),(142,'Advanced Combo','Tennis',600,66.66667,624,3,2,'2026-03-15 11:46:43.473030',3,NULL),(143,'Focus Hold','Tennis',1,50,629,2,1,'2026-03-16 04:56:27.241201',3,NULL),(144,'Peripheral Flash','Other',0,0,0,3,0,'2026-03-16 05:28:29.613918',3,NULL),(145,'Peripheral Flash','Tennis',0,0,0,1,0,'2026-03-16 08:55:36.807768',1,NULL),(146,'Focus Hold','Tennis',2,66.66667,1664,3,2,'2026-03-16 08:56:16.184050',1,NULL),(147,'Focus Hold','Tennis',4,80,636.25,5,4,'2026-03-16 08:58:22.086104',3,NULL),(148,'Speed Tap','Tennis',16,100,3750,16,16,'2026-03-16 08:58:35.784889',3,NULL),(149,'Focus Hold','Tennis',0,0,0,1,0,'2026-03-16 08:58:39.887212',3,NULL),(150,'Random Target','Tennis',600,62.5,663,8,5,'2026-03-16 08:59:39.307135',3,NULL),(151,'Focus Hold','Tennis',1,50,1683,2,1,'2026-03-16 09:04:00.651446',3,NULL),(152,'Speed Tap','Tennis',52,100,480.76923,52,52,'2026-03-16 09:04:56.017225',3,NULL),(153,'Speed Tap','Tennis',52,100,480.76923,52,52,'2026-03-16 09:04:56.083394',3,NULL),(154,'Speed Tap','Tennis',52,100,480.76923,52,52,'2026-03-16 09:04:56.210263',3,NULL),(155,'Speed Tap','Tennis',52,100,480.76923,52,52,'2026-03-16 09:04:56.352043',3,NULL),(156,'Speed Tap','Basketball',25,100,1400,25,25,'2026-03-16 09:13:33.842623',3,NULL),(157,'Color Match','Basketball',900,50,1841,12,6,'2026-03-16 09:14:09.595849',3,NULL),(158,'Random Target','Basketball',1560,48.148148,514.8461,27,13,'2026-03-16 09:15:20.706984',3,NULL),(159,'Random Target','Basketball',840,41.17647,561.1429,17,7,'2026-03-16 09:18:07.510112',3,NULL),(160,'Speed Tap','Basketball',2,100,17500,2,2,'2026-03-16 09:20:29.983380',3,NULL),(161,'Speed Tap','Tennis',60,100,416.66666,60,60,'2026-03-16 09:23:23.930561',3,NULL),(162,'Speed Tap','Tennis',64,100,390.625,64,64,'2026-03-16 09:26:59.941996',3,NULL),(163,'Random Target','Tennis',0,0,0,17,0,'2026-03-16 09:27:20.044066',3,NULL),(164,'Color Match','Tennis',0,0,0,0,0,'2026-03-16 09:27:32.448705',3,NULL),(165,'Random Target','Tennis',0,0,0,42,0,'2026-03-16 09:28:02.268172',3,NULL),(166,'Peripheral Flash','Baseball',0,0,0,5,0,'2026-03-17 07:13:04.589520',3,NULL),(167,'Focus Hold','Baseball',3,75,1256.6666,4,3,'2026-03-17 07:13:29.145868',3,NULL),(168,'Speed Tap','Baseball',59,100,423.72882,59,59,'2026-03-17 07:13:42.901587',3,NULL),(169,'Speed Tap','Baseball',59,100,423.72882,59,59,'2026-03-17 07:13:43.195669',3,NULL),(170,'Hand Eye Sync','Baseball',300,66.66667,443,3,2,'2026-03-17 07:13:53.222319',3,NULL),(171,'Multi Object','Baseball',600,75,656.75,4,3,'2026-03-17 07:14:00.072698',3,NULL),(172,'Number Sequence','Baseball',-100,20,2275.6,5,1,'2026-03-17 07:14:22.137979',3,NULL),(173,'Number Sequence','Baseball',350,80,1306.2,5,4,'2026-03-17 07:14:33.716639',3,NULL),(174,'Color Match','Baseball',1050,100,928,7,7,'2026-03-17 07:14:45.138855',3,NULL),(175,'Color Match','Baseball',1050,100,928,7,7,'2026-03-17 07:14:45.939557',3,NULL),(176,'Advanced Combo','Baseball',300,50,1500,2,1,'2026-03-17 07:14:55.805406',3,NULL),(177,'Peripheral Flash','Baseball, Cricket',2,40,498,5,2,'2026-03-18 05:49:59.345580',3,NULL),(178,'Peripheral Flash','Baseball, Cricket',0,0,0,0,0,'2026-03-18 05:50:09.488916',3,NULL),(179,'Focus Hold','Baseball, Cricket',4,80,2147.25,5,4,'2026-03-18 05:50:30.604822',3,NULL),(180,'Speed Tap','Baseball, Cricket',14,100,4285.7144,14,14,'2026-03-18 05:50:40.719421',3,NULL),(181,'Hand Eye Sync','Baseball, Cricket',450,75,739,4,3,'2026-03-18 05:50:49.421983',3,NULL),(182,'Left Right','Baseball, Cricket',100,25,891,4,1,'2026-03-18 05:50:59.727933',3,NULL),(183,'Number Sequence','Baseball, Cricket',150,66.66667,1389.6666,3,2,'2026-03-18 05:51:09.186245',3,NULL),(184,'Color Match','Baseball, Cricket',150,50,1806,2,1,'2026-03-18 05:51:19.016919',3,NULL),(185,'Advanced Combo','Baseball, Cricket',0,0,0,1,0,'2026-03-18 05:51:43.385795',3,NULL),(186,'Multi Object','Baseball, Cricket',300,50,880.5,4,2,'2026-03-18 05:51:59.857799',3,NULL),(187,'Left Right','Baseball, Cricket',0,0,0,1,0,'2026-03-18 05:52:55.360928',3,NULL),(188,'Peripheral Flash','Baseball, Cricket',0,0,0,0,0,'2026-03-18 05:53:22.912896',3,NULL),(189,'Peripheral Flash','Baseball, Cricket',0,0,0,0,0,'2026-03-18 05:53:40.218370',3,NULL),(190,'Peripheral Flash','Tennis',0,0,0,1,0,'2026-03-18 06:07:06.498731',3,NULL),(191,'Peripheral Flash','Tennis',0,0,0,2,0,'2026-03-19 03:23:34.015609',3,NULL),(192,'Focus Hold','Baseball',0,0,659,1,0,'2026-03-19 03:54:04.582555',3,NULL),(193,'Focus Hold','Other',1,50,1537,2,1,'2026-03-19 04:36:37.401524',3,NULL),(194,'Color Match','Other',450,75,1267.75,4,3,'2026-03-19 04:36:47.877369',3,NULL),(195,'Peripheral Flash','Tennis',1,100,556,1,1,'2026-03-19 05:56:47.222817',3,NULL),(196,'Focus Hold','Tennis',4,80,531.75,5,4,'2026-03-19 05:56:55.711940',3,NULL),(197,'Speed Tap','Tennis',53,100,1132.0754,53,53,'2026-03-19 05:57:07.924396',3,NULL),(198,'Hand Eye Sync','Tennis',450,50,760.6667,6,3,'2026-03-19 05:57:20.000752',3,NULL),(199,'Left Right','Tennis',900,50,222.05556,18,9,'2026-03-19 05:57:27.555310',3,NULL),(200,'Multi Object','Tennis',2700,87.5,719.0625,16,14,'2026-03-19 05:57:43.128160',3,NULL),(201,'Focus Hold','Tennis',1,50,829,2,1,'2026-03-19 06:09:15.288831',3,NULL),(202,'Speed Tap','Tennis',31,100,1129.0322,31,31,'2026-03-19 06:09:23.324287',3,NULL),(203,'Speed Tap','Tennis',0,0,0,0,0,'2026-03-19 06:10:06.171745',3,NULL),(204,'Peripheral Flash','Tennis',0,0,0,1,0,'2026-03-19 10:52:40.233033',3,NULL),(205,'Peripheral Flash','Tennis',2,50,639.5,4,2,'2026-03-19 10:53:12.401567',3,NULL);
/*!40000 ALTER TABLE `score_trainingsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_userdifficulty`
--

DROP TABLE IF EXISTS `score_userdifficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_userdifficulty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `global_difficulty` varchar(20) NOT NULL,
  `adaptive_difficulty` tinyint(1) NOT NULL,
  `reaction_time` varchar(20) NOT NULL,
  `color_match` varchar(20) NOT NULL,
  `number_sequence` varchar(20) NOT NULL,
  `random_target` varchar(20) NOT NULL,
  `multi_object_tracking` varchar(20) NOT NULL,
  `focus_hold` varchar(20) NOT NULL,
  `peripheral_flash` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `score_userdifficulty_user_id_33fb7465_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_userdifficulty`
--

LOCK TABLES `score_userdifficulty` WRITE;
/*!40000 ALTER TABLE `score_userdifficulty` DISABLE KEYS */;
INSERT INTO `score_userdifficulty` VALUES (1,'hard',0,'hard','hard','hard','hard','hard','hard','hard',1),(2,'easy',0,'easy','easy','easy','easy','easy','easy','easy',3),(3,'medium',0,'medium','medium','medium','medium','medium','medium','medium',9);
/*!40000 ALTER TABLE `score_userdifficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_game_sessions`
--

DROP TABLE IF EXISTS `website_game_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_game_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `gameName` varchar(255) NOT NULL,
  `score` int DEFAULT '0',
  `reactionTime` float DEFAULT '0',
  `accuracy` float DEFAULT '0',
  `timePlayed` int DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `website_game_sessions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_game_sessions`
--

LOCK TABLES `website_game_sessions` WRITE;
/*!40000 ALTER TABLE `website_game_sessions` DISABLE KEYS */;
INSERT INTO `website_game_sessions` VALUES (7,10,'Peripheral Flash',850,450,90,30,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00'),(8,10,'Speed Tap',1200,380,95,30,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00'),(9,10,'Focus Hold',900,520,88,60,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00'),(10,10,'Random Target',1500,400,92,45,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00'),(11,10,'Multi Object',3200,600,80,120,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00'),(12,10,'Number Sequence',2500,550,85,90,'2026-03-19 05:39:00','2026-03-19 05:39:00','2026-03-19 05:39:00');
/*!40000 ALTER TABLE `website_game_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_leaderboard`
--

DROP TABLE IF EXISTS `website_leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_leaderboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `totalScore` int DEFAULT '0',
  `rank` int DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `website_leaderboard_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `website_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_leaderboard_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_leaderboard`
--

LOCK TABLES `website_leaderboard` WRITE;
/*!40000 ALTER TABLE `website_leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_stats`
--

DROP TABLE IF EXISTS `website_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_stats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `totalTime` int DEFAULT '0',
  `totalDrills` int DEFAULT '0',
  `streak` int DEFAULT '0',
  `bestScore` int DEFAULT '0',
  `avgReactionTime` float DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `website_stats_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `website_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_stats_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_stats`
--

LOCK TABLES `website_stats` WRITE;
/*!40000 ALTER TABLE `website_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_users`
--

DROP TABLE IF EXISTS `website_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int DEFAULT NULL,
  `dominantHand` varchar(255) DEFAULT NULL,
  `dominantEye` varchar(255) DEFAULT NULL,
  `skillLevel` enum('Beginner','Intermediate','Pro / Elite') DEFAULT 'Beginner',
  `sports` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `email_3` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_users`
--

LOCK TABLES `website_users` WRITE;
/*!40000 ALTER TABLE `website_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-20  9:16:10
