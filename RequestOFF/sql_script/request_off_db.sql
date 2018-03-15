CREATE DATABASE  IF NOT EXISTS `request_off` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `request_off`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: request_off
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `company_year_off`
--

DROP TABLE IF EXISTS `company_year_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_year_off` (
  `id` int(10) unsigned NOT NULL,
  `day_off_reset_flag` tinyint(1) DEFAULT NULL,
  `current_year_flag` tinyint(1) DEFAULT '1',
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(11) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(11) unsigned DEFAULT '0',
  `number_day_off` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_year_off`
--

LOCK TABLES `company_year_off` WRITE;
/*!40000 ALTER TABLE `company_year_off` DISABLE KEYS */;
INSERT INTO `company_year_off` VALUES (2017,0,0,1,'2018-01-16 03:54:20',0,'2018-02-08 06:46:21',0,NULL),(2018,0,1,1,'2018-01-11 08:34:32',0,'2018-01-11 08:34:32',0,NULL);
/*!40000 ALTER TABLE `company_year_off` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `company_year_off_BEFORE_INSERT` BEFORE INSERT ON `company_year_off` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `company_year_off_BEFORE_UPDATE` BEFORE UPDATE ON `company_year_off` FOR EACH ROW BEGIN
	INSERT INTO company_year_off_hist values(OLD.id, OLD.day_off_reset_flag, OLD.current_year_flag, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.number_day_off);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `company_year_off_BEFORE_DELETE` BEFORE DELETE ON `company_year_off` FOR EACH ROW BEGIN
	INSERT INTO company_year_off_hist values(OLD.id, OLD.day_off_reset_flag, OLD.current_year_flag, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `company_year_off_hist`
--

DROP TABLE IF EXISTS `company_year_off_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_year_off_hist` (
  `id` int(10) DEFAULT NULL,
  `day_off_reset_flag` tinyint(1) DEFAULT NULL,
  `current_year_flag` tinyint(1) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(11) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(11) DEFAULT NULL,
  `number_day_off` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_year_off_hist`
--

LOCK TABLES `company_year_off_hist` WRITE;
/*!40000 ALTER TABLE `company_year_off_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_year_off_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_off_type`
--

DROP TABLE IF EXISTS `day_off_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_off_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `payment_flag` tinyint(1) DEFAULT '1',
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off_type`
--

LOCK TABLES `day_off_type` WRITE;
/*!40000 ALTER TABLE `day_off_type` DISABLE KEYS */;
INSERT INTO `day_off_type` VALUES (26,'Nghỉ phép thường niên',1,1,'2018-02-08 07:26:50',0,'2018-02-08 07:26:50',0),(27,'Nghỉ không lương (BHYT chi trả)',0,1,'2018-02-08 07:27:20',0,'2018-02-08 07:28:02',0),(28,'Nghỉ không lương',0,1,'2018-02-08 07:27:34',0,'2018-02-08 07:28:04',0),(29,'Nghỉ thai sản',0,1,'2018-02-08 07:27:43',0,'2018-02-08 07:28:05',0);
/*!40000 ALTER TABLE `day_off_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `day_off_type_BEFORE_INSERT` BEFORE INSERT ON `day_off_type` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `day_off_type_BEFORE_UPDATE` BEFORE UPDATE ON `day_off_type` FOR EACH ROW BEGIN
	INSERT INTO day_off_type_hist values(OLD.id, OLD.name, OLD.payment_flag, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);    
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `day_off_type_BEFORE_DELETE` BEFORE DELETE ON `day_off_type` FOR EACH ROW BEGIN
	INSERT INTO day_off_type_hist values(OLD.id, OLD.name, OLD.payment_flag, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `day_off_type_hist`
--

DROP TABLE IF EXISTS `day_off_type_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_off_type_hist` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_flag` tinyint(1) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off_type_hist`
--

LOCK TABLES `day_off_type_hist` WRITE;
/*!40000 ALTER TABLE `day_off_type_hist` DISABLE KEYS */;
INSERT INTO `day_off_type_hist` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:26:20',NULL),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(22,'Khám thai',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(22,'Khám thai',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(27,'Nghỉ không lương (BHYT chi trả)',1,1,'2018-02-08 07:27:20',0,'2018-02-08 07:27:20',0),(28,'Nghỉ không lương',1,1,'2018-02-08 07:27:34',0,'2018-02-08 07:27:34',0),(29,'Nghỉ thai sản',1,1,'2018-02-08 07:27:43',0,'2018-02-08 07:27:43',0);
/*!40000 ALTER TABLE `day_off_type_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'One group',30,1,'2018-01-05 04:01:27',0,'2018-02-08 06:37:42',0),(2,'Kamita Lab',31,1,'2018-01-05 04:01:27',0,'2018-02-08 07:11:17',0),(3,'Trung group',40,1,'2018-01-05 04:01:27',0,'2018-02-08 07:11:11',0),(4,'Comtor & QC',43,1,'2018-01-05 04:02:59',0,'2018-02-08 07:11:29',0),(5,'HR',1,1,'2018-01-05 04:04:16',0,'2018-02-08 07:16:57',0),(6,'department',49,1,'2018-03-14 07:52:08',0,'2018-03-14 07:52:08',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `department_BEFORE_INSERT` BEFORE INSERT ON `department` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `department_BEFORE_UPDATE` BEFORE UPDATE ON `department` FOR EACH ROW BEGIN
	INSERT INTO department_hist values(OLD.id, OLD.name, OLD.manager_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `department_BEFORE_DELETE` BEFORE DELETE ON `department` FOR EACH ROW BEGIN
	INSERT INTO department_hist values(OLD.id, OLD.name, OLD.manager_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `department_hist`
--

DROP TABLE IF EXISTS `department_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_hist` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `manager_id` int(10) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_hist`
--

LOCK TABLES `department_hist` WRITE;
/*!40000 ALTER TABLE `department_hist` DISABLE KEYS */;
INSERT INTO `department_hist` VALUES (3,'Trung group',10,1,'2018-01-05 04:01:27',0,'2018-02-08 06:38:10',0),(2,'Kamita Lab',9,1,'2018-01-05 04:01:27',0,'2018-02-08 06:37:56',0),(5,'HR',11,1,'2018-01-05 04:04:16',0,'2018-02-08 06:38:31',0),(4,'Comtor & QC',8,1,'2018-01-05 04:02:59',0,'2018-02-08 06:38:24',0),(5,'HR',49,1,'2018-01-05 04:04:16',0,'2018-02-08 07:11:22',0);
/*!40000 ALTER TABLE `department_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `position_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(50) DEFAULT '0',
  `start_working_date` date DEFAULT NULL,
  `official_working_date` date DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_position_id_idx` (`position_id`),
  CONSTRAINT `fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Le Ngoc Diep','female','1995-06-21',2,'diep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','905678356',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-03-14 03:11:52',0),(30,'Nguyen Chi Nhat','male','1995-06-21',2,'nhat@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','9884350','2017-01-01','2017-01-01',1,'2018-02-08 04:46:32',0,'2018-03-14 03:11:56',0),(31,'Pham Tu Anh','male','1995-06-21',2,'anh@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-02-08 06:48:27',0,'2018-03-14 03:11:58',0),(32,'Phan Van Tuan','male','1989-06-06',1,'tuan@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:58:37',0,'2018-02-08 06:58:37',0),(33,'Le Ba Bach','male','1989-06-06',1,'bach@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:59:03',0,'2018-02-08 06:59:03',0),(34,'Phan Van Hai','male','1989-06-06',1,'hai@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:59:28',0,'2018-02-08 06:59:28',0),(35,'Do Phu Thien','male','1991-06-06',1,'thien@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:59:48',0,'2018-03-14 04:51:00',0),(36,'Dao Quoc Bao','male','1993-06-06',1,'baodao@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:00:16',0,'2018-02-08 07:00:16',0),(37,'Tran Dinh Bao','male','1993-06-06',1,'baotran@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:01:03',0,'2018-02-08 07:01:03',0),(38,'Phan Van Thong','male','1985-06-06',1,'thong@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:01:31',0,'2018-02-08 07:01:31',0),(39,'Tu Minh Hien','male','1989-06-06',1,'hien@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:03:04',0,'2018-02-08 07:03:04',0),(40,'Nguyen Nho Thanh Trung','male','1985-06-06',2,'trung@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:03:29',0,'2018-03-14 03:12:05',0),(41,'Tran Nam Quang','male','1989-06-06',1,'quang@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:04:17',0,'2018-02-08 07:04:17',0),(42,'Phan Quang Nhat','male','1989-06-06',1,'nhatphan@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:06:25',0,'2018-02-08 07:47:03',0),(43,'Tran Thi Anh Tu','female','1985-06-06',2,'tu@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:06:47',0,'2018-03-14 03:12:11',0),(45,'Le Thi Nguyet','female','1986-06-06',1,'nguyet@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:07:24',0,'2018-02-08 07:07:24',0),(46,'Nguyen Thi Hanh','female','1985-06-06',1,'hanh@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:07:48',0,'2018-02-08 07:07:48',0),(47,'Tran Thi Quynh Nhu','female','1991-06-06',1,'nhuquynh@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:08:14',0,'2018-02-08 07:08:14',0),(48,'Tran Le Diem Trinh','female','1993-06-06',1,'trinh@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:08:33',0,'2018-02-08 07:08:33',0),(49,'manager','male','2018-03-01',2,'manager','$2a$10$lpP/6kL5GmcOVl52uuFed.MwmZmQULowCaJOWA6WrqmTGURtFWHgW','+84 123 456 789','2018-03-09','2018-03-24',1,'2018-03-14 07:48:54',0,'2018-03-14 07:48:54',0),(50,'mem1','male','2018-03-02',1,'mem1','$2a$10$91.FLfGFN6cODWZ6uUxOP.s6GUtbvcPCOHbm6foP5ahHV4fyQy98W','asdasd','2018-03-09','2018-03-17',1,'2018-03-14 07:49:25',0,'2018-03-14 07:49:25',0),(51,'mem2','male','2017-10-11',1,'mem2','$2a$10$4lNUSMnNM3MMDJN/sMGBoOqqiVMRub3MC5EYo.Ld.3er8cGuTh36m','123 456 789','2018-03-01','2018-03-24',1,'2018-03-14 07:50:32',0,'2018-03-14 07:50:32',0),(52,'mem3','male','2017-07-04',1,'mem3','$2a$10$1D/RBF7JR6h7drojwl8Ige9bVpsIxBv.WYgSaSSavTGz8NIU.YaTK','123 456 789','2018-03-01','2018-03-24',1,'2018-03-14 07:51:10',0,'2018-03-14 07:51:10',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
	INSERT INTO employee_hist values(OLD.id, OLD.name, OLD.gender, OLD.birthday, OLD.position_id, OLD.email, OLD.password, OLD.phone, OLD.start_working_date, OLD.official_working_date, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_DELETE` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
	INSERT INTO employee_hist values(OLD.id, OLD.name, OLD.gender, OLD.birthday, OLD.position_id, OLD.email, OLD.password, OLD.phone, OLD.start_working_date, OLD.official_working_date, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_hist`
--

DROP TABLE IF EXISTS `employee_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_hist` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `position_id` int(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `start_working_date` date DEFAULT NULL,
  `official_working_date` date DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_hist`
--

LOCK TABLES `employee_hist` WRITE;
/*!40000 ALTER TABLE `employee_hist` DISABLE KEYS */;
INSERT INTO `employee_hist` VALUES (2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 06:44:02',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 06:44:02',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 06:44:02',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 06:44:02',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 06:44:02',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 06:44:02',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-02-08 06:47:18',0,'2018-01-19 06:44:02',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-08 06:47:18',0,'2018-01-19 08:14:19',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-08 06:47:18',0,'2018-01-19 08:14:19',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba','32659123','2010-01-01','2010-01-01',1,'2018-02-08 06:47:18',0,'2018-02-08 06:47:18',0),(31,'Pham Tu Anh','male',NULL,NULL,'','','0',NULL,NULL,1,'2018-02-08 06:48:27',0,'2018-02-08 06:48:27',0),(31,'Pham Tu Anh','male','1995-06-21',3,'anh@dactech.vn','','0',NULL,NULL,1,'2018-02-08 06:48:27',0,'2018-02-08 06:49:01',0),(1,'HR Administrator','female','1995-06-21',4,'hradmin@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-02-08 04:48:15',0),(1,'HR Administrator','female','1995-06-21',4,'hradmin@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','905678356',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-02-08 06:53:55',0),(31,'Pham Tu Anh','male','1995-06-21',3,'anh@dactech.vn','$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-02-08 06:48:27',0,'2018-02-08 06:49:25',0),(35,'Do Phu Thien','male','1991-06-06',1,'thien@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:59:48',0,'2018-02-08 06:59:48',0),(30,'Nguyen Chi Nhat','male','1995-06-21',1,'nhat@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','9884350','2017-01-01','2017-01-01',1,'2018-02-08 04:46:32',0,'2018-02-08 06:36:41',0),(40,'Nguyen Nho Thanh Trung','male','1989-06-06',1,'trung@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:03:29',0,'2018-02-08 07:03:29',0),(40,'Nguyen Nho Thanh Trung','male','1985-06-06',1,'trung@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:03:29',0,'2018-02-08 07:04:31',0),(43,'Tran Thi Anh Tu','female','1985-06-06',1,'tu@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:06:47',0,'2018-02-08 07:06:47',0),(49,'Le Ngoc Diep','female','1986-06-06',1,'diep@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:09:59',0,'2018-02-08 07:09:59',0),(49,'Le Ngoc Diep','female','1986-06-06',3,'diep@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:09:59',0,'2018-02-08 07:16:14',0),(1,'HR Administrator','female','1995-06-21',4,'hradmin@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','905678356',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-02-08 06:54:01',0),(1,'Le Ngoc Diep','female','1995-06-21',4,'hradmin@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','905678356',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-02-08 07:17:14',0),(42,'Phan Van Nhat','male','1989-06-06',1,'nhatphan@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:06:25',0,'2018-02-08 07:06:25',0),(1,'Le Ngoc Diep','female','1995-06-21',4,'diep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','905678356',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-02-08 07:17:23',0),(30,'Nguyen Chi Nhat','male','1995-06-21',3,'nhat@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','9884350','2017-01-01','2017-01-01',1,'2018-02-08 04:46:32',0,'2018-02-08 07:02:08',0),(31,'Pham Tu Anh','male','1995-06-21',3,'anh@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-02-08 06:48:27',0,'2018-02-08 06:58:07',0),(40,'Nguyen Nho Thanh Trung','male','1985-06-06',3,'trung@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:03:29',0,'2018-02-08 07:04:36',0),(43,'Tran Thi Anh Tu','female','1985-06-06',3,'tu@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 07:06:47',0,'2018-02-08 07:09:12',0),(35,'Do Phu Thien','male','1991-06-06',2,'thien@dactech.vn','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','236478356','2017-06-06','2017-08-06',1,'2018-02-08 06:59:48',0,'2018-02-08 07:01:49',0);
/*!40000 ALTER TABLE `employee_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_off_status`
--

DROP TABLE IF EXISTS `employee_off_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_off_status` (
  `year_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `remain_hours` double unsigned DEFAULT NULL,
  `total_hours` double unsigned DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`year_id`,`employee_id`),
  KEY `fk_employee_id_idx` (`employee_id`),
  CONSTRAINT `fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_year_id` FOREIGN KEY (`year_id`) REFERENCES `company_year_off` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_off_status`
--

LOCK TABLES `employee_off_status` WRITE;
/*!40000 ALTER TABLE `employee_off_status` DISABLE KEYS */;
INSERT INTO `employee_off_status` VALUES (2017,1,24,80,1,'2018-02-08 07:19:01',0,'2018-02-08 07:19:01',0),(2017,30,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,31,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,32,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,33,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,34,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,35,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,36,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,37,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,38,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,39,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,40,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,41,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,42,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,43,24,80,1,'2018-02-08 07:21:43',0,'2018-02-08 07:21:43',0),(2017,45,24,80,1,'2018-02-08 07:22:52',0,'2018-02-08 07:22:52',0),(2017,46,24,80,1,'2018-02-08 07:22:52',0,'2018-02-08 07:22:52',0),(2017,47,24,80,1,'2018-02-08 07:22:52',0,'2018-02-08 07:22:52',0),(2017,48,24,80,1,'2018-02-08 07:22:52',0,'2018-02-08 07:22:52',0),(2018,1,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,30,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,31,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,32,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,33,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,34,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,35,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,36,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,37,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,38,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,39,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,40,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,41,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,42,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,43,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,45,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,46,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,47,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,48,120,120,1,'2018-02-08 07:25:54',0,'2018-02-08 07:25:54',0),(2018,49,72,80,1,'2018-03-14 07:48:54',0,'2018-03-14 08:00:34',0),(2018,50,72,80,1,'2018-03-14 07:49:25',0,'2018-03-14 07:53:36',0),(2018,51,79,80,1,'2018-03-14 07:50:32',0,'2018-03-14 07:52:43',0),(2018,52,80,80,1,'2018-03-14 07:51:10',0,'2018-03-14 07:51:10',0);
/*!40000 ALTER TABLE `employee_off_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_off_status_BEFORE_INSERT` BEFORE INSERT ON `employee_off_status` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_off_status_BEFORE_UPDATE` BEFORE UPDATE ON `employee_off_status` FOR EACH ROW BEGIN
	INSERT INTO employee_off_status_hist values(OLD.year_id, OLD.employee_id, OLD.remain_hours, OLD.total_hours, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_off_status_BEFORE_DELETE` BEFORE DELETE ON `employee_off_status` FOR EACH ROW BEGIN
	INSERT INTO employee_off_status_hist values(OLD.year_id, OLD.employee_id, OLD.remain_hours, OLD.total_hours, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_off_status_hist`
--

DROP TABLE IF EXISTS `employee_off_status_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_off_status_hist` (
  `year_id` int(10) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `remain_hours` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_off_status_hist`
--

LOCK TABLES `employee_off_status_hist` WRITE;
/*!40000 ALTER TABLE `employee_off_status_hist` DISABLE KEYS */;
INSERT INTO `employee_off_status_hist` VALUES (2017,4,441,44,1,'2018-02-08 06:44:48',0,'2018-02-08 06:44:48',0),(2018,1,20,20,1,'2018-01-11 08:34:51',0,'2018-01-11 08:34:51',0),(2018,2,22,20,1,'2018-01-16 02:53:02',0,'2018-02-07 09:32:19',0),(2018,3,70,50,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,4,441,44,1,'2018-02-08 06:44:48',0,'2018-02-08 06:44:48',0),(2018,5,111,33,0,'2018-02-08 06:44:48',0,'2018-02-08 06:44:48',0),(2018,51,80,80,1,'2018-03-14 07:50:32',0,'2018-03-14 07:50:32',0),(2018,50,80,80,1,'2018-03-14 07:49:25',0,'2018-03-14 07:49:25',0),(2018,49,80,80,1,'2018-03-14 07:48:54',0,'2018-03-14 07:48:54',0);
/*!40000 ALTER TABLE `employee_off_status_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_role` (
  `employee_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(11) DEFAULT '0',
  PRIMARY KEY (`employee_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role`
--

LOCK TABLES `employee_role` WRITE;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
INSERT INTO `employee_role` VALUES (1,1,1,'2018-02-08 08:47:33',0,'2018-02-08 08:47:33',0),(30,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(31,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(32,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(33,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(34,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(35,5,1,'2018-03-14 04:51:00',0,'2018-03-14 04:51:00',0),(36,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(37,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(38,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(39,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(40,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(41,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(42,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(43,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(45,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(46,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(47,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(48,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0),(49,1,1,'2018-03-14 07:48:54',0,'2018-03-14 07:48:54',0),(50,5,1,'2018-03-14 07:49:25',0,'2018-03-14 07:49:25',0),(51,5,1,'2018-03-14 07:50:32',0,'2018-03-14 07:50:32',0),(52,5,1,'2018-03-14 07:51:10',0,'2018-03-14 07:51:10',0);
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_role_BEFORE_INSERT` BEFORE INSERT ON `employee_role` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_role_BEFORE_UPDATE` BEFORE UPDATE ON `employee_role` FOR EACH ROW BEGIN
	INSERT INTO employee_role_hist values(OLD.employee_id, OLD.role_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_role_BEFORE_DELETE` BEFORE DELETE ON `employee_role` FOR EACH ROW BEGIN
	INSERT INTO employee_role_hist values(OLD.employee_id, OLD.role_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_role_hist`
--

DROP TABLE IF EXISTS `employee_role_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_role_hist` (
  `employee_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_operator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role_hist`
--

LOCK TABLES `employee_role_hist` WRITE;
/*!40000 ALTER TABLE `employee_role_hist` DISABLE KEYS */;
INSERT INTO `employee_role_hist` VALUES (1,1,1,'2018-01-19 04:19:56',0,'2018-01-19 04:19:56',0),(1,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(2,2,1,'2018-01-19 03:53:22',0,'2018-01-19 03:53:27',0),(2,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(3,1,1,'2018-01-19 04:20:03',0,'2018-01-19 04:20:03',0),(3,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(4,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(5,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(6,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(7,6,1,'2018-01-19 08:12:11',0,'2018-01-19 08:12:11',0),(29,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:17:21',0),(35,5,1,'2018-02-08 08:50:03',0,'2018-02-08 08:50:03',0);
/*!40000 ALTER TABLE `employee_role_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  `code` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'employee',1,'2018-01-05 03:52:20',0,'2018-03-12 04:07:07',0,1),(2,'manager',1,'2018-01-05 03:52:20',0,'2018-03-14 03:12:32',0,2);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `position_BEFORE_INSERT` BEFORE INSERT ON `position` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `position_BEFORE_UPDATE` BEFORE UPDATE ON `position` FOR EACH ROW BEGIN
	INSERT INTO position_hist values(OLD.id, OLD.name, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.code);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `position_BEFORE_DELETE` BEFORE DELETE ON `position` FOR EACH ROW BEGIN
	INSERT INTO position_hist values(OLD.id, OLD.name, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.code);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `position_hist`
--

DROP TABLE IF EXISTS `position_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_hist` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_hist`
--

LOCK TABLES `position_hist` WRITE;
/*!40000 ALTER TABLE `position_hist` DISABLE KEYS */;
INSERT INTO `position_hist` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0,NULL),(1,'employee',1,'2018-01-05 03:52:20',0,'2018-02-08 07:26:15',0,NULL),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0,NULL),(3,'manager',1,'2018-01-05 03:52:20',0,'2018-02-08 06:41:54',0,NULL),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0,NULL),(3,'manager',1,'2018-01-05 03:52:20',0,'2018-03-12 04:07:11',0,3),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-03-12 04:07:13',0,4),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-03-12 04:07:09',0,2);
/*!40000 ALTER TABLE `position_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `to_time` datetime DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `response_message` varchar(45) DEFAULT NULL,
  `day_off_type_id` int(10) unsigned DEFAULT NULL,
  `recipient_id` int(10) unsigned DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  `total_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_id_idx` (`employee_id`),
  KEY `fk_employee_id_1` (`employee_id`),
  KEY `fk3_idx` (`day_off_type_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`day_off_type_id`) REFERENCES `day_off_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,51,'2018-03-01 08:00:00','2018-03-02 08:00:00','ghjkl./gyhjukl',5,'',26,49,1,'2018-03-14 07:52:43',0,'2018-03-14 07:52:43',0,1),(2,50,'2018-03-09 08:00:00','2018-03-23 08:00:00','fghjkl;',2,'',26,49,1,'2018-03-14 07:53:36',0,'2018-03-14 07:53:58',0,8),(3,49,'2018-03-01 08:00:00','2018-03-10 08:00:00','vhjkhjkghkghjkg',2,'',26,49,1,'2018-03-14 08:00:34',0,'2018-03-14 08:00:34',0,8);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_BEFORE_INSERT` BEFORE INSERT ON `request` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_BEFORE_UPDATE` BEFORE UPDATE ON `request` FOR EACH ROW BEGIN
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.total_time);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_BEFORE_DELETE` BEFORE DELETE ON `request` FOR EACH ROW BEGIN
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.total_time);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `request_hist`
--

DROP TABLE IF EXISTS `request_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_hist` (
  `id` int(10) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `to_time` datetime DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `response_message` varchar(45) DEFAULT NULL,
  `day_off_type_id` int(10) DEFAULT NULL,
  `recipient_id` int(10) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL,
  `total_time` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_hist`
--

LOCK TABLES `request_hist` WRITE;
/*!40000 ALTER TABLE `request_hist` DISABLE KEYS */;
INSERT INTO `request_hist` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',NULL,'2018-01-05 06:34:58',NULL,NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 03:03:56',0,NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',0,'789',16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 09:06:21',0,NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-15 03:32:27',0,NULL),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00','Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-15 03:56:43',0,NULL),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00','Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-15 03:57:34',0,NULL),(4,2,'2018-02-08 08:00:00','2018-02-08 17:00:00','Go to my country',1,'',16,2,1,'2018-02-07 09:32:19',0,'2018-02-07 09:32:19',0,NULL),(2,50,'2018-03-09 08:00:00','2018-03-23 08:00:00','fghjkl;',5,'',26,49,1,'2018-03-14 07:53:36',0,'2018-03-14 07:53:36',0,8);
/*!40000 ALTER TABLE `request_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_DEPARTMENT_MANAGER',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(2,'ROLE_HR_MAMAGER',1,'2018-01-19 03:44:24',0,'2018-02-08 07:55:55',0),(3,'ROLE_LEADER',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(4,'ROLE_HR',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(5,'ROLE_EMPLOYEE',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(6,'ROLE_ADMIN',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `role_BEFORE_INSERT` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `role_BEFORE_UPDATE` BEFORE UPDATE ON `role` FOR EACH ROW BEGIN
	INSERT INTO role_hist values(OLD.id, OLD.role, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `role_BEFORE_DELETE` BEFORE DELETE ON `role` FOR EACH ROW BEGIN
INSERT INTO role_hist values(OLD.id, OLD.role, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role_hist`
--

DROP TABLE IF EXISTS `role_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_hist` (
  `id` int(10) unsigned DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_hist`
--

LOCK TABLES `role_hist` WRITE;
/*!40000 ALTER TABLE `role_hist` DISABLE KEYS */;
INSERT INTO `role_hist` VALUES (7,'2132',1,'2018-01-19 03:52:44',0,'2018-01-19 03:52:44',0),(7,'213223',1,'2018-01-19 03:52:44',0,'2018-01-19 03:52:47',0),(2,'ROLE_HR_MAMAGER_',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0);
/*!40000 ALTER TABLE `role_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slack_request`
--

DROP TABLE IF EXISTS `slack_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slack_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_user_id` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `msg_content` varchar(500) DEFAULT NULL,
  `msg_time` bigint(20) DEFAULT NULL,
  `day_off_from` date DEFAULT NULL,
  `day_off_to` date DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `process_flag` tinyint(1) DEFAULT NULL,
  `is_valid_msg` tinyint(1) DEFAULT NULL,
  `err_msg` varchar(200) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=799 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slack_request`
--

LOCK TABLES `slack_request` WRITE;
/*!40000 ALTER TABLE `slack_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `slack_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `slack_request_BEFORE_INSERT` BEFORE INSERT ON `slack_request` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `slack_request_BEFORE_UPDATE` BEFORE UPDATE ON `slack_request` FOR EACH ROW BEGIN
	INSERT INTO slack_request_hist values(OLD.id, OLD.msg_user_id, OLD.name, OLD.msg_content, OLD.msg_time, OLD.day_off_from, OLD.day_off_to, OLD.total_hours, OLD.reason, OLD.process_flag, OLD.is_valid_msg, OLD.err_msg, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `slack_request_BEFORE_DELETE` BEFORE DELETE ON `slack_request` FOR EACH ROW BEGIN
	INSERT INTO slack_request_hist values(OLD.id, OLD.msg_user_id, OLD.name, OLD.msg_content, OLD.msg_time, OLD.day_off_from, OLD.day_off_to, OLD.total_hours, OLD.reason, OLD.process_flag, OLD.is_valid_msg, OLD.err_msg, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `slack_request_hist`
--

DROP TABLE IF EXISTS `slack_request_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slack_request_hist` (
  `id` int(11) DEFAULT NULL,
  `msg_user_id` varchar(45) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `msg_content` varchar(500) DEFAULT NULL,
  `msg_time` bigint(20) DEFAULT NULL,
  `day_off_from` date DEFAULT NULL,
  `day_off_to` date DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `process_flag` tinyint(1) DEFAULT NULL,
  `is_valid_msg` tinyint(1) DEFAULT NULL,
  `err_msg` varchar(200) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slack_request_hist`
--

LOCK TABLES `slack_request_hist` WRITE;
/*!40000 ALTER TABLE `slack_request_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `slack_request_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `leader_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_department_id_idx` (`department_id`),
  CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'XmediaOne',30,1,1,'2018-01-05 06:36:21',0,'2018-03-14 07:19:17',0),(6,'DialogOne',35,1,1,'2018-01-05 06:36:21',0,'2018-02-08 09:01:37',0),(10,'Adapt',31,2,1,'2018-02-08 07:52:23',0,'2018-02-08 07:52:24',0),(11,'Radio Cloud',34,2,1,'2018-01-22 03:41:32',0,'2018-02-08 07:36:58',0),(12,'Sherpa',39,3,0,'2018-01-22 03:42:20',0,'2018-02-08 07:37:04',0),(13,'Irept',40,3,1,'2018-02-08 07:29:51',0,'2018-02-08 07:37:07',0),(14,'Comtor',43,4,1,'2018-02-08 07:50:41',0,'2018-02-08 07:52:11',0),(15,'QC',45,4,1,'2018-02-08 07:51:02',0,'2018-02-08 07:52:14',0),(16,'HR',1,5,1,'2018-02-08 07:51:25',0,'2018-02-08 07:51:40',0),(17,'team1',49,6,1,'2018-03-14 07:52:20',0,'2018-03-14 09:28:34',0),(18,'tem2',51,6,1,'2018-03-14 07:52:26',0,'2018-03-14 07:52:26',0);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_INSERT` BEFORE INSERT ON `team` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_UPDATE` BEFORE UPDATE ON `team` FOR EACH ROW BEGIN
	INSERT INTO team_hist values(OLD.id, OLD.name, OLD.leader_id, OLD.department_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_DELETE` BEFORE DELETE ON `team` FOR EACH ROW BEGIN
	INSERT INTO team_hist values(OLD.id, OLD.name, OLD.leader_id, OLD.department_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `team_employee`
--

DROP TABLE IF EXISTS `team_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_employee` (
  `team_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `valid_flag` tinyint(1) DEFAULT '1',
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_operator` int(10) unsigned DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_operator` int(10) unsigned DEFAULT '0',
  `leader_flag` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`team_id`,`employee_id`),
  KEY `fk_employee_id_idx` (`employee_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_employee`
--

LOCK TABLES `team_employee` WRITE;
/*!40000 ALTER TABLE `team_employee` DISABLE KEYS */;
INSERT INTO `team_employee` VALUES (1,30,1,'2018-03-14 07:19:17',0,'2018-03-14 07:19:17',0,1),(1,32,1,'2018-02-08 08:54:16',0,'2018-03-14 03:45:59',0,0),(1,33,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:00',0,0),(1,35,1,'2018-02-08 07:42:45',0,'2018-03-14 07:18:34',0,0),(1,36,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:03',0,0),(1,37,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:04',0,0),(1,38,1,'2018-02-08 07:42:45',0,'2018-03-14 07:19:17',0,0),(10,31,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:52',0,1),(10,42,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:07',0,0),(11,34,1,'2018-02-08 07:49:01',0,'2018-03-14 03:47:05',0,1),(12,39,1,'2018-02-08 07:49:01',0,'2018-03-14 03:47:25',0,1),(12,41,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:11',0,0),(13,40,1,'2018-02-08 07:49:01',0,'2018-03-14 03:47:30',0,1),(14,43,1,'2018-02-08 07:53:59',0,'2018-03-14 03:47:38',0,1),(14,46,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:15',0,0),(15,45,1,'2018-02-08 07:53:59',0,'2018-03-14 03:47:44',0,1),(16,1,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:43',0,1),(16,47,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:18',0,0),(16,48,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:19',0,0),(17,49,1,'2018-03-14 07:52:20',0,'2018-03-14 09:28:34',0,1),(17,50,1,'2018-03-14 07:52:20',0,'2018-03-14 09:28:34',0,0),(18,51,1,'2018-03-14 07:52:26',0,'2018-03-14 07:52:26',0,1),(18,52,1,'2018-03-14 07:52:26',0,'2018-03-14 07:52:26',0,0);
/*!40000 ALTER TABLE `team_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_employee_BEFORE_INSERT` BEFORE INSERT ON `team_employee` FOR EACH ROW BEGIN
	SET NEW.insert_date = CURRENT_TIMESTAMP;
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_employee_BEFORE_UPDATE` BEFORE UPDATE ON `team_employee` FOR EACH ROW BEGIN
	INSERT INTO team_employee_hist values(OLD.team_id, OLD.employee_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.leader_flag);
    SET NEW.update_date = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_employee_BEFORE_DELETE` BEFORE DELETE ON `team_employee` FOR EACH ROW BEGIN
	INSERT INTO team_employee_hist values(OLD.team_id, OLD.employee_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator, OLD.leader_flag);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `team_employee_hist`
--

DROP TABLE IF EXISTS `team_employee_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_employee_hist` (
  `team_id` int(10) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL,
  `leader_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_employee_hist`
--

LOCK TABLES `team_employee_hist` WRITE;
/*!40000 ALTER TABLE `team_employee_hist` DISABLE KEYS */;
INSERT INTO `team_employee_hist` VALUES (1,30,1,'2018-02-08 07:40:58',0,'2018-02-08 07:40:58',0,NULL),(1,32,1,'2018-02-08 08:54:16',0,'2018-02-08 08:54:16',0,NULL),(1,33,1,'2018-02-08 07:42:45',0,'2018-02-08 07:42:45',0,NULL),(1,35,1,'2018-02-08 07:42:45',0,'2018-02-08 07:42:45',0,NULL),(1,36,1,'2018-02-08 07:42:45',0,'2018-02-08 07:42:45',0,NULL),(1,37,1,'2018-02-08 07:42:45',0,'2018-02-08 07:42:45',0,NULL),(1,38,1,'2018-02-08 07:42:45',0,'2018-02-08 07:42:45',0,NULL),(10,31,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(10,42,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(11,34,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(12,39,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(12,41,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(13,40,1,'2018-02-08 07:49:01',0,'2018-02-08 07:49:01',0,NULL),(14,43,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(14,46,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(15,45,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(16,1,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(16,47,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(16,48,1,'2018-02-08 07:53:59',0,'2018-02-08 07:53:59',0,NULL),(16,1,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:17',0,0),(10,31,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:06',0,0),(1,35,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:02',0,0),(11,34,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:09',0,0),(12,39,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:10',0,0),(13,40,1,'2018-02-08 07:49:01',0,'2018-03-14 03:46:12',0,0),(14,43,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:14',0,0),(15,45,1,'2018-02-08 07:53:59',0,'2018-03-14 03:46:16',0,0),(1,35,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:58',0,1),(1,38,1,'2018-02-08 07:42:45',0,'2018-03-14 03:46:05',0,0),(1,30,1,'2018-02-08 07:40:58',0,'2018-03-14 03:45:54',0,1),(1,38,1,'2018-02-08 07:42:45',0,'2018-03-14 07:18:34',0,1),(17,49,1,'2018-03-14 07:52:20',0,'2018-03-14 07:52:20',0,1),(17,50,1,'2018-03-14 07:52:20',0,'2018-03-14 07:52:20',0,0),(17,49,1,'2018-03-14 07:52:20',0,'2018-03-14 07:54:06',0,0),(17,50,1,'2018-03-14 07:52:20',0,'2018-03-14 07:54:06',0,1);
/*!40000 ALTER TABLE `team_employee_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_hist`
--

DROP TABLE IF EXISTS `team_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_hist` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `leader_id` int(10) DEFAULT NULL,
  `department_id` int(10) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_hist`
--

LOCK TABLES `team_hist` WRITE;
/*!40000 ALTER TABLE `team_hist` DISABLE KEYS */;
INSERT INTO `team_hist` VALUES (12,'new new new',1,3,0,'2018-01-22 03:42:20',0,'2018-02-08 06:41:36',0),(1,'XmediaOne',1,1,1,'2018-01-05 06:36:21',0,'2018-02-08 06:41:27',0),(6,'DialogOne',1,1,1,'2018-01-05 06:36:21',0,'2018-02-08 06:41:30',0),(10,'Adapt',1,2,1,'2018-02-08 07:36:14',0,'2018-02-08 06:41:32',0),(11,'Radio Cloud',1,2,1,'2018-01-22 03:41:32',0,'2018-02-08 06:41:33',0),(12,'Sherpa',1,3,0,'2018-01-22 03:42:20',0,'2018-02-08 07:29:17',0),(13,'Irept',1,3,1,'2018-02-08 07:29:51',0,'2018-02-08 07:29:51',0),(14,'Comtor',NULL,NULL,1,'2018-02-08 07:50:41',0,'2018-02-08 07:50:41',0),(16,'HR',NULL,NULL,1,'2018-02-08 07:51:25',0,'2018-02-08 07:51:25',0),(14,'Comtor',1,NULL,1,'2018-02-08 07:50:41',0,'2018-02-08 07:50:49',0),(15,'QC',1,NULL,1,'2018-02-08 07:51:02',0,'2018-02-08 07:51:02',0),(16,'HR',1,NULL,1,'2018-02-08 07:51:25',0,'2018-02-08 07:51:28',0),(14,'Comtor',1,4,1,'2018-02-08 07:50:41',0,'2018-02-08 07:51:35',0),(15,'QC',1,4,1,'2018-02-08 07:51:02',0,'2018-02-08 07:51:38',0),(10,'Adapt',31,2,1,'2018-02-08 07:52:24',0,'2018-02-08 07:36:14',0),(6,'DialogOne',30,1,1,'2018-01-05 06:36:21',0,'2018-02-08 07:36:10',0),(6,'DialogOne',0,1,1,'2018-01-05 06:36:21',0,'2018-02-08 09:01:21',0),(1,'XmediaOne',30,1,1,'2018-01-05 06:36:21',0,'2018-02-08 07:36:03',0),(1,'XmediaOne',38,1,1,'2018-01-05 06:36:21',0,'2018-03-14 07:18:34',0),(17,'team1',49,6,1,'2018-03-14 07:52:20',0,'2018-03-14 07:52:20',0),(17,'team1',50,6,1,'2018-03-14 07:52:20',0,'2018-03-14 07:54:06',0);
/*!40000 ALTER TABLE `team_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'request_off'
--

--
-- Dumping routines for database 'request_off'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-15  8:59:35
