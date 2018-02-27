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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_year_off`
--

LOCK TABLES `company_year_off` WRITE;
/*!40000 ALTER TABLE `company_year_off` DISABLE KEYS */;
INSERT INTO `company_year_off` VALUES (1995,1,0,0,'2018-01-31 09:53:55',0,'2018-02-01 01:55:03',0),(2016,0,0,0,'2018-01-22 07:33:52',0,'2018-01-22 07:34:30',0),(2017,0,1,1,'2018-01-16 03:54:20',0,'2018-01-16 03:54:20',0),(2018,0,1,1,'2018-01-11 08:34:32',0,'2018-01-11 08:34:32',0),(19925,0,0,0,'2018-01-31 09:57:58',0,'2018-01-31 09:57:58',0);
/*!40000 ALTER TABLE `company_year_off` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`company_year_off_BEFORE_INSERT` BEFORE INSERT ON `company_year_off` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`company_year_off_BEFORE_UPDATE` BEFORE UPDATE ON `company_year_off` FOR EACH ROW
BEGIN
	INSERT INTO company_year_off_hist values(OLD.id, OLD.day_off_reset_flag, OLD.current_year_flag, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`company_year_off_BEFORE_DELETE` BEFORE DELETE ON `company_year_off` FOR EACH ROW
BEGIN
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
  `update_operator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_year_off_hist`
--

LOCK TABLES `company_year_off_hist` WRITE;
/*!40000 ALTER TABLE `company_year_off_hist` DISABLE KEYS */;
INSERT INTO `company_year_off_hist` VALUES (20185,1,1,1,'2018-01-22 07:33:12',0,'2018-01-22 07:33:12',0),(2016,1,1,1,'2018-01-22 07:33:52',0,'2018-01-22 07:33:52',0),(1995,1,1,1,'2018-01-31 09:53:55',0,'2018-01-31 09:53:55',0),(1995,1,0,0,'2018-01-31 09:53:55',0,'2018-01-31 09:57:02',0),(1995,0,0,0,'2018-01-31 09:53:55',0,'2018-01-31 09:57:35',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off_type`
--

LOCK TABLES `day_off_type` WRITE;
/*!40000 ALTER TABLE `day_off_type` DISABLE KEYS */;
INSERT INTO `day_off_type` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(16,'Nghỉ phép thường',0,1,'2018-01-05 06:25:20',0,'2018-01-26 08:41:09',0),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(22,'Khám thai',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0);
/*!40000 ALTER TABLE `day_off_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`day_off_type_BEFORE_INSERT` BEFORE INSERT ON `day_off_type` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`day_off_type_BEFORE_UPDATE` BEFORE UPDATE ON `day_off_type` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`day_off_type_BEFORE_DELETE` BEFORE DELETE ON `day_off_type` FOR EACH ROW
BEGIN
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
INSERT INTO `day_off_type_hist` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:26:20',NULL),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(22,'Khám thai',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0);
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
  PRIMARY KEY (`id`),
  KEY `fk_manager_id_idx` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(2,'PHP',9,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(3,'Ruby',10,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(4,'QC',8,1,'2018-01-05 04:02:59',0,'2018-01-10 07:30:06',0),(5,'iOS',11,1,'2018-01-05 04:04:16',0,'2018-01-10 07:30:06',0),(17,'chi do be nhi',3,1,'2018-01-22 07:04:38',0,'2018-01-22 08:28:15',0),(18,'chi vay',4,1,'2018-02-01 01:38:58',0,'2018-02-01 01:53:37',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`department_BEFORE_INSERT` BEFORE INSERT ON `department` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`department_BEFORE_UPDATE` BEFORE UPDATE ON `department` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`department_BEFORE_DELETE` BEFORE DELETE ON `department` FOR EACH ROW
BEGIN
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
INSERT INTO `department_hist` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(2,'PHP',9,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(3,'Ruby',10,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(4,'QC',8,1,'2018-01-05 04:02:59',NULL,'2018-01-05 04:02:59',NULL),(5,'iOS',11,1,'2018-01-05 04:04:16',NULL,'2018-01-05 04:04:16',NULL),(7,'day la team mobvvvvvbi',11,1,'2018-01-22 04:42:11',0,'2018-01-22 04:42:11',0),(7,'nhi',11,1,'2018-01-22 04:42:11',0,'2018-01-22 05:22:34',0),(7,'nhi cao hai',5,0,'2018-01-22 04:42:11',0,'2018-01-22 05:23:28',0),(10,'thuc nhu',2,0,'2018-01-22 05:54:51',0,'2018-01-22 05:54:51',0),(9,'thuc nhu',2,0,'2018-01-22 05:54:51',0,'2018-01-22 05:54:51',0),(8,'nhi cao hadcdfdfi',2,0,'2018-01-22 05:51:30',0,'2018-01-22 05:51:30',0),(7,'nhi cao hadcdfdfi',2,0,'2018-01-22 04:42:11',0,'2018-01-22 05:25:29',0),(6,'day la team mobvvvvvbi',11,1,'2018-01-22 04:38:33',0,'2018-01-22 04:38:33',0),(13,'ke toan',11,1,'2018-01-22 06:16:18',0,'2018-01-22 06:16:18',0),(12,'ke toan',11,1,'2018-01-22 06:03:43',0,'2018-01-22 06:03:43',0),(11,'ke toan',11,1,'2018-01-22 05:59:58',0,'2018-01-22 05:59:58',0),(14,'ke toan',11,1,'2018-01-22 06:16:52',0,'2018-01-22 06:16:52',0),(14,'ke toan tai chinh',5,0,'2018-01-22 06:16:52',0,'2018-01-22 06:17:32',0),(15,'ke toan tai chinh ngan hang',5,0,'2018-01-22 06:23:52',0,'2018-01-22 06:23:52',0),(15,'ke toan',10,1,'2018-01-22 06:23:52',0,'2018-01-22 06:24:37',0),(15,'ke toan chi do',100,1,'2018-01-22 06:23:52',0,'2018-01-22 06:36:33',0),(17,'chi do',11,1,'2018-01-22 07:04:38',0,'2018-01-22 07:04:38',0),(17,'chi do be nhi',10,1,'2018-01-22 07:04:38',0,'2018-01-22 07:05:14',0),(17,'chi do be nhi',2,1,'2018-01-22 07:04:38',0,'2018-01-22 08:26:42',0),(18,'chi do',5,1,'2018-02-01 01:38:58',0,'2018-02-01 01:38:58',0),(18,'chi vay',5,1,'2018-02-01 01:38:58',0,'2018-02-01 01:39:33',0);
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
  `phone` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 06:44:02',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 06:44:02',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 06:44:02',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 06:44:02',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 06:44:02',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 06:44:02',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 06:44:02',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',326599854,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 06:44:02',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 08:14:19',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 08:14:19',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,NULL,0,'2018-02-02 02:46:45',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_BEFORE_DELETE` BEFORE DELETE ON `employee` FOR EACH ROW
BEGIN
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
  `phone` int(11) DEFAULT NULL,
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
INSERT INTO `employee_hist` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',NULL,'2018-01-05 04:23:55',NULL),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',NULL,'2018-01-05 03:57:37',NULL),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 03:57:37',NULL),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 04:01:01',NULL),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',NULL,'2018-01-05 03:59:50',NULL),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',NULL,'2018-01-05 04:01:18',NULL),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',NULL,'2018-01-05 04:04:08',NULL),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',NULL,'2018-01-10 07:17:45',NULL),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:27:42',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:27:42',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:27:42',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:27:42',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:27:42',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:27:42',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:31:47',0),(1,'Cao Hải Nhi','male','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:51',0),(1,'Cao Hải Nhi','','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:57',0),(22,'viba','male','1995-06-21',2,'thiendienban@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-11 07:17:57',0,'2018-01-11 07:17:57',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:22',0,'2018-01-11 07:18:22',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:28',0,'2018-01-11 07:18:28',0),(22,'vibon','','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:39',0,'2018-01-11 07:18:39',0),(22,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-16 06:50:41',0,'2018-01-16 06:50:41',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:45:01',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:31:47',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:31:47',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:31:47',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:31:47',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:31:47',0),(13,'slash','male','1985-04-12',2,NULL,'',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-11 02:10:39',0),(21,'viba','male','1995-06-21',2,'thiendienban@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 03:58:10',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 03:58:10',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 03:58:10',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 03:58:10',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 03:58:10',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 03:58:10',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 03:58:10',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 04:17:25',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 04:17:25',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 04:17:25',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 04:17:25',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 04:17:25',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 04:17:25',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 04:17:25',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:49:45',0,'2018-01-19 06:44:02',0),(23,'vibon1','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:50:44',0,'2018-01-19 06:49:45',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$vTNf2NsHXI0QBvOfjux8euoli5cf8835ic77Xac3ir.ubGnIJ0jMG',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:59:19',0,'2018-01-19 06:59:19',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$PbWfQ7NvoMmv1IhCVcNF0u2YqAjxvkyOIWPkkO40OqE2v7E/uhK92',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 07:33:42',0,'2018-01-19 07:33:42',0),(24,'dactech1','female','1995-06-21',3,'dactech@gmail.com','$2a$10$a7rJu.BfRNG/wbgQe0ipUet2d7cSZ6qS2m2Vo7z7Hk7ndVUrzqbF.',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 07:34:00',0,'2018-01-19 07:34:00',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$JUFpGPyNj1tJoaTBBAs1Cuii3db4xs52wOuNlUTlCXS97XAL4ndDC',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:03:41',0,'2018-01-19 08:03:41',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$6H8RRW8l9PykDGAUuKh/4uYLWHJ5kIOEKu1u5La8Oa0ULa1cLqzTi',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:05:10',0,'2018-01-19 08:05:10',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$t/etOx1HHg4n2hjqM1Rm8.oOTpC7mNC/eTUNFIStKpFU70UkVTUmG',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:10:43',0,'2018-01-19 08:10:43',0),(25,'dactech12','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:10:43',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:44:02',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:50:44',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:14:47',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$deM7FNMqtsCQm/OyWfaX4us7Y8pKMtqCrlFMN.5yj.mgRMX5wTppm',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:15:10',0,'2018-01-19 08:14:19',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$hJBTA0YragK440NcB/wS1OdSrn/nBb6O3KWe8pMe52FdYL5.N3kye',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba',32659123,'2010-01-01','2010-01-01',1,'2018-02-02 02:46:45',0,'2018-02-02 02:46:45',0);
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
  `remain_hours` int(11) unsigned DEFAULT NULL,
  `total_hours` int(11) unsigned DEFAULT NULL,
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
INSERT INTO `employee_off_status` VALUES (2017,1,56,96,1,'2018-02-07 05:01:49',0,'2018-02-07 05:01:49',0),(2017,2,12,96,1,'2018-02-07 05:03:33',0,'2018-02-07 05:03:33',0),(2017,4,96,96,1,'2018-01-11 09:34:51',0,'2018-02-07 05:02:42',0),(2018,1,40,96,1,'2018-01-11 08:34:51',0,'2018-02-27 03:27:28',0),(2018,2,14,96,1,'2018-01-16 02:53:02',0,'2018-02-26 02:54:15',0),(2018,3,96,96,1,'2018-01-16 02:53:02',0,'2018-02-07 05:01:19',0),(2018,4,96,96,1,'2017-05-16 02:53:02',0,'2018-02-07 05:02:42',0),(2018,5,96,96,0,'2017-01-16 02:53:02',0,'2018-02-07 05:02:42',0);
/*!40000 ALTER TABLE `employee_off_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_off_status_BEFORE_INSERT` BEFORE INSERT ON `employee_off_status` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_off_status_BEFORE_UPDATE` BEFORE UPDATE ON `employee_off_status` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_off_status_BEFORE_DELETE` BEFORE DELETE ON `employee_off_status` FOR EACH ROW
BEGIN
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
  `remain_hours` int(11) DEFAULT NULL,
  `total_hours` int(11) DEFAULT NULL,
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
INSERT INTO `employee_off_status_hist` VALUES (2018,3,5,2,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,5,555,44,0,'2018-01-16 04:01:23',0,'2018-01-16 04:01:23',0),(2018,5,222,33,0,'2018-01-16 04:01:55',0,'2018-01-16 04:01:55',0),(2018,1,20,20,1,'2018-01-11 08:34:51',0,'2018-01-11 08:34:51',0),(2018,1,15,20,1,'2018-01-11 08:34:51',0,'2018-02-06 03:55:59',0),(2018,1,14,20,1,'2018-01-11 08:34:51',0,'2018-02-06 03:57:06',0),(2018,1,13,20,1,'2018-01-11 08:34:51',0,'2018-02-06 03:58:32',0),(2018,1,12,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:01:43',0),(2018,1,0,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:02:05',0),(2018,1,12,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:02:38',0),(2018,1,1,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:02:50',0),(2018,1,3,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:14:20',0),(2018,1,7,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:15:46',0),(2018,1,11,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:16:23',0),(2018,1,100,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:20:13',0),(2018,1,96,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:20:34',0),(2018,1,92,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:21:32',0),(2018,1,90,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:25:09',0),(2018,1,91,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:28:32',0),(2018,1,88,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:30:35',0),(2018,1,85,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:32:11',0),(2018,1,83,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:33:00',0),(2018,1,78,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:34:27',0),(2018,1,77,20,1,'2018-01-11 08:34:51',0,'2018-02-06 04:48:40',0),(2018,1,75,20,1,'2018-01-11 08:34:51',0,'2018-02-06 05:37:11',0),(2018,1,68,20,1,'2018-01-11 08:34:51',0,'2018-02-06 05:47:47',0),(2018,4,441,44,1,'2018-02-06 06:02:52',0,'2018-02-06 06:02:52',0),(2018,5,111,33,0,'2018-02-06 06:02:52',0,'2018-02-06 06:02:52',0),(2018,5,111,33,0,'2018-02-06 06:04:16',0,'2018-02-06 06:02:52',0),(2018,5,108,33,0,'2018-02-06 06:11:42',0,'2018-02-06 06:04:16',0),(2018,5,105,33,0,'2018-02-06 06:14:59',0,'2018-02-06 06:11:42',0),(2018,5,101,33,0,'2018-02-06 06:21:00',0,'2018-02-06 06:14:59',0),(2018,1,65,20,1,'2018-01-11 08:34:51',0,'2018-02-06 06:01:50',0),(2018,1,61,20,1,'2018-01-11 08:34:51',0,'2018-02-06 06:21:47',0),(2018,1,610,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:03:20',0),(2018,1,610000,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:05:06',0),(2018,1,100,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:05:28',0),(2018,1,99,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:08:16',0),(2018,1,98,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:10:35',0),(2018,1,97,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:12:54',0),(2018,1,95,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:28:05',0),(2018,1,94,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:28:16',0),(2018,1,95,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:34:41',0),(2018,1,94,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:35:09',0),(2018,1,95,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:35:34',0),(2018,1,94,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:35:49',0),(2018,1,92,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:36:03',0),(2018,1,218,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:37:26',0),(2018,1,100,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:37:40',0),(2018,1,99,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:37:54',0),(2018,1,98,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:37:59',0),(2018,1,100,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:38:17',0),(2018,1,20,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:40:30',0),(2018,1,21,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:48:48',0),(2018,1,100,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:49:03',0),(2018,1,105,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:49:31',0),(2018,1,109,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:49:46',0),(2018,1,108,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:50:55',0),(2018,1,107,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:54:52',0),(2018,1,105,20,1,'2018-01-11 08:34:51',0,'2018-02-06 07:57:15',0),(2018,1,104,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:01:29',0),(2018,1,103,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:06:53',0),(2018,1,102,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:07:04',0),(2018,1,103,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:07:17',0),(2018,1,104,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:07:21',0),(2018,1,105,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:08:08',0),(2018,1,104,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:08:40',0),(2018,1,106,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:08:59',0),(2018,1,105,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:14:51',0),(2018,1,104,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:16:26',0),(2018,1,102,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:18:32',0),(2018,1,104,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:19:19',0),(2018,1,103,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:19:31',0),(2018,1,106,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:19:54',0),(2018,1,102,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:26:19',0),(2018,1,106,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:26:56',0),(2018,1,202,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:36:59',0),(2018,1,206,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:39:45',0),(2018,1,211,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:42:00',0),(2018,1,307,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:46:14',0),(2018,1,305,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:49:38',0),(2018,1,297,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:49:56',0),(2018,1,299,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:51:25',0),(2018,1,298,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:51:39',0),(2018,1,303,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:52:13',0),(2018,1,304,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:53:19',0),(2018,1,302,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:55:32',0),(2018,1,301,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:55:49',0),(2018,4,441,44,1,'2018-02-06 08:57:42',0,'2018-02-06 06:02:52',0),(2018,4,439,44,1,'2018-02-06 08:58:25',0,'2018-02-06 08:57:42',0),(2018,5,93,33,0,'2018-02-06 08:59:27',0,'2018-02-06 06:21:00',0),(2018,5,91,33,0,'2018-02-06 09:10:31',0,'2018-02-06 08:59:27',0),(2018,4,432,44,1,'2018-02-06 09:22:38',0,'2018-02-06 08:58:25',0),(2018,4,429,44,1,'2018-02-06 09:24:31',0,'2018-02-06 09:22:38',0),(2018,1,303,20,1,'2018-01-11 08:34:51',0,'2018-02-06 08:56:07',0),(2018,1,302,20,1,'2018-01-11 08:34:51',0,'2018-02-06 09:37:37',0),(2018,1,298,20,1,'2018-01-11 08:34:51',0,'2018-02-06 09:45:06',0),(2018,1,301,20,1,'2018-01-11 08:34:51',0,'2018-02-06 09:45:36',0),(2018,1,149,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:19:45',0),(2018,1,146,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:20:46',0),(2018,1,301,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:21:08',0),(2018,1,300,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:21:33',0),(2018,1,304,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:21:46',0),(2018,1,301,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:32:48',0),(2018,1,300,20,1,'2018-01-11 08:34:51',0,'2018-02-07 01:56:49',0),(2018,1,292,20,1,'2018-01-11 08:34:51',0,'2018-02-07 02:00:58',0),(2018,1,296,20,1,'2018-01-11 08:34:51',0,'2018-02-07 03:06:00',0),(2018,1,456,20,1,'2018-01-11 08:34:51',0,'2018-02-07 03:06:38',0),(2018,1,458,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:32:07',0),(2018,1,456,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:32:22',0),(2018,1,460,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:32:29',0),(2018,1,459,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:32:50',0),(2018,1,456,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:33:05',0),(2018,1,453,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:34:38',0),(2018,1,452,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:34:51',0),(2018,1,453,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:36:18',0),(2018,1,455,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:36:27',0),(2018,1,454,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:37:34',0),(2018,1,458,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:37:37',0),(2018,1,346,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:46:25',0),(2018,1,450,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:47:36',0),(2018,1,442,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:48:04',0),(2018,1,458,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:48:26',0),(2018,1,337,20,1,'2018-01-11 08:34:51',0,'2018-02-07 04:49:22',0),(2017,4,441,44,1,'2018-02-07 05:01:19',0,'2018-02-07 05:01:19',0),(2018,2,30,20,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,3,70,50,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,4,428,44,1,'2018-02-07 05:01:19',0,'2018-02-06 09:24:31',0),(2018,5,88,33,0,'2018-02-07 05:01:19',0,'2018-02-06 09:10:31',0),(2017,4,96,96,1,'2018-02-07 05:02:42',0,'2018-02-07 05:01:19',0),(2018,4,96,96,1,'2018-02-07 05:02:42',0,'2018-02-07 05:01:19',0),(2018,5,96,96,0,'2018-02-07 05:02:42',0,'2018-02-07 05:01:19',0),(2018,1,96,96,1,'2018-01-11 08:34:51',0,'2018-02-07 05:01:19',0),(2018,1,95,96,1,'2018-01-11 08:34:51',0,'2018-02-07 07:55:33',0),(2018,1,94,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:01:07',0),(2018,1,254,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:01:47',0),(2018,1,255,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:02:26',0),(2018,1,254,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:03:57',0),(2018,1,253,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:07:22',0),(2018,1,263,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:07:39',0),(2018,1,259,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:15:08',0),(2018,1,263,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:15:19',0),(2018,1,256,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:16:18',0),(2018,1,259,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:56:46',0),(2018,1,257,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:57:01',0),(2018,1,258,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:57:13',0),(2018,1,260,96,1,'2018-01-11 08:34:51',0,'2018-02-07 08:57:22',0),(2018,1,257,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:01:10',0),(2018,1,263,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:01:24',0),(2018,1,143,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:03:40',0),(2018,1,142,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:04:21',0),(2018,1,384,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:05:24',0),(2018,2,96,96,1,'2018-01-16 02:53:02',0,'2018-02-07 05:01:19',0),(2018,2,95,96,1,'2018-01-16 02:53:02',0,'2018-02-08 01:24:59',0),(2018,1,384,96,1,'2018-01-11 08:34:51',0,'2018-02-07 09:05:24',0),(2018,1,383,96,1,'2018-01-11 08:34:51',0,'2018-02-08 03:19:41',0),(2018,1,503,96,1,'2018-01-11 08:34:51',0,'2018-02-08 03:22:24',0),(2018,1,625,96,1,'2018-01-11 08:34:51',0,'2018-02-08 03:22:31',0),(2018,1,625,96,1,'2018-01-11 08:34:51',0,'2018-02-08 03:22:31',0),(2018,1,626,96,1,'2018-01-11 08:34:51',0,'2018-02-08 03:23:17',0),(2018,1,627,96,1,'2018-01-11 08:34:51',0,'2018-02-08 04:09:58',0),(2018,1,626,96,1,'2018-01-11 08:34:51',0,'2018-02-08 04:43:21',0),(2018,1,627,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:19:17',0),(2018,1,626,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:20:39',0),(2018,1,624,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:21:09',0),(2018,1,622,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:38:34',0),(2018,1,624,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:43:17',0),(2018,1,626,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:44:32',0),(2018,1,630,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:45:36',0),(2018,1,631,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:52:18',0),(2018,1,630,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:53:09',0),(2018,1,632,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:56:38',0),(2018,1,630,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:58:30',0),(2018,1,640,96,1,'2018-01-11 08:34:51',0,'2018-02-08 06:59:44',0),(2018,1,650,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:02:46',0),(2018,1,652,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:05:38',0),(2018,1,657,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:06:57',0),(2018,1,665,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:13:08',0),(2018,1,667,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:14:34',0),(2018,1,669,96,1,'2018-01-11 08:34:51',0,'2018-02-08 07:32:13',0),(2018,1,661,96,1,'2018-01-11 08:34:51',0,'2018-02-09 01:07:49',0),(2018,1,661,96,1,'2018-01-11 08:34:51',0,'2018-02-09 01:07:49',0),(2018,1,660,96,1,'2018-01-11 08:34:51',0,'2018-02-09 03:57:58',0),(2018,1,658,96,1,'2018-01-11 08:34:51',0,'2018-02-09 03:59:02',0),(2018,1,661,96,1,'2018-01-11 08:34:51',0,'2018-02-09 03:59:50',0),(2018,1,664,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:42:25',0),(2018,1,665,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:44:21',0),(2018,1,666,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:45:10',0),(2018,1,665,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:46:17',0),(2018,1,666,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:48:15',0),(2018,1,667,96,1,'2018-01-11 08:34:51',0,'2018-02-09 04:51:50',0),(2018,1,668,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:35:54',0),(2018,1,667,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:36:54',0),(2018,1,668,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:42:37',0),(2018,1,665,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:44:04',0),(2018,1,667,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:46:08',0),(2018,1,669,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:46:53',0),(2018,2,94,96,1,'2018-01-16 02:53:02',0,'2018-02-08 01:25:09',0),(2018,2,12,96,1,'2018-01-16 02:53:02',0,'2018-02-26 02:52:48',0),(2018,1,667,96,1,'2018-01-11 08:34:51',0,'2018-02-26 02:47:21',0),(2018,1,665,96,1,'2018-01-11 08:34:51',0,'2018-02-26 07:58:27',0),(2018,1,12,96,1,'2018-01-11 08:34:51',0,'2018-02-26 08:02:30',0),(2018,1,11,96,1,'2018-01-11 08:34:51',0,'2018-02-26 08:06:27',0),(2018,1,9,96,1,'2018-01-11 08:34:51',0,'2018-02-26 08:07:36',0),(2018,1,8,96,1,'2018-01-11 08:34:51',0,'2018-02-26 08:08:02',0),(2018,1,7,96,1,'2018-01-11 08:34:51',0,'2018-02-26 08:53:00',0),(2018,1,6,96,1,'2018-01-11 08:34:51',0,'2018-02-26 09:43:06',0),(2018,1,4,96,1,'2018-01-11 08:34:51',0,'2018-02-27 01:39:34',0),(2018,1,40,96,1,'2018-01-11 08:34:51',0,'2018-02-27 01:43:55',0),(2018,1,39,96,1,'2018-01-11 08:34:51',0,'2018-02-27 03:21:22',0),(2018,1,38,96,1,'2018-01-11 08:34:51',0,'2018-02-27 03:23:57',0),(2018,1,41,96,1,'2018-01-11 08:34:51',0,'2018-02-27 03:24:05',0);
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
INSERT INTO `employee_role` VALUES (1,1,1,'2018-01-19 04:19:56',0,'2018-01-19 04:19:56',0),(1,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(2,2,1,'2018-01-19 03:53:22',0,'2018-01-19 03:53:27',0),(2,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(3,1,1,'2018-01-19 04:20:03',0,'2018-01-19 04:20:03',0),(3,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(4,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(5,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(6,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(7,6,1,'2018-01-19 08:12:11',0,'2018-01-19 08:12:11',0),(29,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:17:21',0);
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_role_BEFORE_INSERT` BEFORE INSERT ON `employee_role` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_role_BEFORE_UPDATE` BEFORE UPDATE ON `employee_role` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`employee_role_BEFORE_DELETE` BEFORE DELETE ON `employee_role` FOR EACH ROW
BEGIN
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
INSERT INTO `employee_role_hist` VALUES (1,2,1,'2018-01-19 03:53:22',0,'2018-01-19 03:53:22',0),(1,1,1,'2018-01-19 03:53:12',0,'2018-01-19 03:53:12',0),(24,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(25,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(26,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(28,1,1,'2018-01-19 08:10:10',0,'2018-01-19 08:10:10',0),(28,6,1,'2018-01-19 08:10:10',0,'2018-01-19 08:10:10',0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'employee',1,'2018-01-05 03:52:20',0,'2018-01-26 09:19:36',0),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(3,'project manager',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`position_BEFORE_INSERT` BEFORE INSERT ON `position` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`position_BEFORE_UPDATE` BEFORE UPDATE ON `position` FOR EACH ROW
BEGIN
	INSERT INTO position_hist values(OLD.id, OLD.name, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`position_BEFORE_DELETE` BEFORE DELETE ON `position` FOR EACH ROW
BEGIN
	INSERT INTO position_hist values(OLD.id, OLD.name, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_hist`
--

LOCK TABLES `position_hist` WRITE;
/*!40000 ALTER TABLE `position_hist` DISABLE KEYS */;
INSERT INTO `position_hist` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(2,'leader',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(3,'project manager',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(4,'hr',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(1,'emplyee',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0);
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
  `total_time` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `fk_employee_id_idx` (`employee_id`),
  KEY `fk_employee_id_1` (`employee_id`),
  KEY `fk3_idx` (`day_off_type_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`day_off_type_id`) REFERENCES `day_off_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:44:44',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',1,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 04:32:30',0),(3,3,'2018-12-11 07:00:00','2018-12-12 15:00:00',NULL,'Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-26 04:24:08',0),(4,4,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que 123',1,'',16,5,1,'2018-01-22 07:11:26',0,'2018-01-29 08:10:20',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:20:39',0),(7,10,'2018-12-18 10:30:00','2019-01-01 10:00:00',NULL,'ve que',1,'good',16,4,1,'2018-01-22 09:25:55',0,'2018-01-26 04:24:21',0),(8,9,'2017-05-02 14:30:00','2017-05-02 17:00:00',NULL,'thăm đau',1,'ukm',16,5,1,'2018-01-26 04:34:07',0,'2018-02-07 05:04:25',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:15:00',NULL,'học tiếng nhật',1,'complete task',16,4,1,'2018-01-26 04:35:19',0,'2018-02-06 08:36:35',0),(10,1,'2015-07-12 08:00:00','2015-07-12 17:00:00',NULL,'đi tiêm phòng',1,'ok',16,4,1,'2018-01-26 04:37:22',0,'2018-01-30 04:02:23',0),(11,1,'2015-09-29 09:30:00','2015-09-29 11:30:00',NULL,'đi công việc',4,'yes',16,4,1,'2018-01-26 06:40:17',0,'2018-02-05 04:33:20',0),(12,2,'2017-03-30 14:30:00','2017-03-30 16:30:00',NULL,'đón con 123',1,'ok',16,5,1,'2018-01-26 06:41:23',0,'2018-02-07 05:04:25',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec123',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-02-06 08:36:35',0),(14,1,'2016-01-01 10:00:00','2016-01-01 12:00:00',NULL,'oi oi do',1,'',18,4,1,'2018-01-30 01:56:56',0,'2018-02-06 01:14:45',0),(15,3,'2018-01-01 10:00:00','2018-01-01 11:10:00',NULL,'thuc khuya',5,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-07 05:04:25',0),(16,1,'2015-01-01 01:00:00','2015-01-01 02:00:00',NULL,'nam moi 123',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-27 04:06:31',0),(17,5,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',2,'',1,5,1,'2018-01-30 04:55:53',0,'2018-02-07 07:49:23',0),(18,1,'2018-02-14 08:00:00','2018-02-14 11:10:00',NULL,'gi cung duoc',2,'',14,4,1,'2018-01-30 04:57:36',0,'2018-02-06 01:16:19',0),(19,8,'2017-01-01 09:15:00','2018-12-30 13:15:00',NULL,'chi do',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-07 05:04:25',0),(75,1,'2018-02-06 08:00:00','2018-02-14 10:00:00',NULL,'oi',3,'',1,4,1,'2018-02-05 08:18:45',0,'2018-02-06 01:16:19',0),(76,1,'2018-01-30 10:15:00','2018-02-21 08:15:00',NULL,'khong di lam duoc',2,'',15,4,1,'2018-02-05 08:22:19',0,'2018-02-07 07:48:04',0),(77,4,'2019-02-12 08:00:00','2019-03-05 08:00:00',NULL,'22',1,'',1,4,1,'2018-02-05 08:23:59',0,'2018-02-27 03:10:49',0),(78,4,'2018-03-15 10:00:00','2018-03-15 12:00:00',NULL,'bi om roi',1,'',1,4,0,'2018-02-05 08:24:29',0,'2018-02-27 03:10:49',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh333',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-08 03:18:29',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,0,'2018-02-05 08:28:43',0,'2018-02-08 07:06:57',0),(81,1,'2018-02-13 08:00:00','2018-02-14 08:00:00',NULL,'112233',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-08 07:14:34',0);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`request_BEFORE_INSERT` BEFORE INSERT ON `request` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`request_BEFORE_UPDATE` BEFORE UPDATE ON `request` FOR EACH ROW
BEGIN
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.total_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`request_BEFORE_DELETE` BEFORE DELETE ON `request` FOR EACH ROW
BEGIN
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.total_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
  `total_time` int(11) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `response_message` varchar(45) DEFAULT NULL,
  `day_off_type_id` int(10) DEFAULT NULL,
  `recipient_id` int(10) DEFAULT NULL,
  `valid_flag` tinyint(1) DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `insert_operator` int(10) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_hist`
--

LOCK TABLES `request_hist` WRITE;
/*!40000 ALTER TABLE `request_hist` DISABLE KEYS */;
INSERT INTO `request_hist` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',NULL,'2018-01-05 06:34:58',NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 03:03:56',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',0,'789',16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 09:06:21',0),(4,10,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que',0,'',16,4,1,'2018-01-22 07:11:26',0,'2018-01-22 07:11:26',0),(4,2,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que',0,'',16,4,1,'2018-01-22 07:11:26',0,'2018-01-22 07:13:22',0),(5,10,NULL,NULL,NULL,'ve que',0,'',16,4,1,'2018-01-22 09:24:59',0,'2018-01-22 09:24:59',0),(7,10,NULL,NULL,NULL,'ve que',0,'',16,4,1,'2018-01-22 09:25:55',0,'2018-01-22 09:25:55',0),(5,10,NULL,NULL,NULL,'ve que',3,'',16,4,1,'2018-01-22 09:24:59',0,'2018-01-25 08:13:13',0),(5,10,'2016-12-12 10:00:00','2016-12-14 12:00:00',NULL,'ve que',3,'',16,4,1,'2018-01-22 09:24:59',0,'2018-01-26 04:21:02',0),(7,10,NULL,NULL,NULL,'ve que',1,'',16,4,1,'2018-01-22 09:25:55',0,'2018-01-25 08:13:13',0),(5,10,'2016-12-12 10:00:00','2016-12-14 12:00:00',NULL,'đưa con đi khám bệnh',3,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-01-26 04:22:14',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-15 03:57:34',0),(7,10,'2018-12-18 10:30:00','2019-01-01 10:00:00',NULL,'ve que',1,'',16,4,1,'2018-01-22 09:25:55',0,'2018-01-26 04:23:54',0),(5,10,'2016-12-31 10:00:00','2017-01-02 12:00:00',NULL,'đưa con đi khám bệnh',3,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-01-26 04:23:54',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-15 03:32:27',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà 21',1,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-01-29 04:30:21',0),(12,1,'2017-03-30 14:30:00','2017-03-30 16:30:00',NULL,'đón con',2,'ok',16,1,1,'2018-01-26 06:41:23',0,'2018-01-26 06:41:23',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,1,'2018-01-29 06:02:40',0,'2018-01-29 06:02:40',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,0,'2018-01-29 06:02:40',0,'2018-01-29 06:03:03',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,1,'2018-01-29 06:02:40',0,'2018-01-29 06:04:24',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,0,'2018-01-29 06:02:40',0,'2018-01-29 06:04:35',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,1,'2018-01-29 06:02:40',0,'2018-01-29 06:06:52',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,0,'2018-01-29 06:02:40',0,'2018-01-29 06:07:48',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,1,'2018-01-29 06:02:40',0,'2018-01-29 06:08:00',0),(10,1,'2015-07-12 08:00:00','2015-07-12 17:00:00',NULL,'đi tiêm phòng',2,'ok',16,3,1,'2018-01-26 04:37:22',0,'2018-01-26 04:37:22',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:00:00',NULL,'học tiếng nhật',2,'complete task',16,2,1,'2018-01-26 04:35:19',0,'2018-01-26 04:35:19',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,0,'2018-01-29 06:02:40',0,'2018-01-29 06:10:33',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'123456',1,'ok ok ok',15,9,1,'2018-01-29 06:02:40',0,'2018-01-29 06:20:38',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:20:57',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:21:16',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc456789',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:25:53',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc456789',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-01-29 06:26:28',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc456789',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:29:11',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:31:55',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:32:58',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456jhjhjhjh',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:34:18',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:35:43',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc12345622222222222',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:36:11',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:37:58',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456sdsdsdsd',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:38:25',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456sdsdsdsd',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-01-29 06:38:30',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456sdsdsdsd',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:38:50',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:39:08',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-01-29 06:39:19',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc123456',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:41:53',0),(4,2,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que',2,'',16,4,1,'2018-01-22 07:11:26',0,'2018-01-25 08:13:13',0),(4,4,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que',2,'',16,4,1,'2018-01-22 07:11:26',0,'2018-01-29 08:04:20',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 06:42:07',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc234',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 08:10:54',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc234',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-01-29 08:11:00',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc234',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 08:11:17',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'abc2341111111',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 08:20:50',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 08:24:26',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:00:00',NULL,'học tiếng nhật',1,'complete task',16,5,1,'2018-01-26 04:35:19',0,'2018-01-29 06:12:59',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec1111',5,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-29 08:25:45',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec1111',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-30 01:18:14',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-30 01:18:28',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-01-30 01:18:35',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,2,0,'2018-01-29 06:02:40',0,'2018-01-30 01:26:09',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,2,1,'2018-01-29 06:02:40',0,'2018-01-30 01:27:59',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:28:14',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:33:40',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:34:39',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:35:02',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:35:24',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:35:42',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:39:56',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:40:30',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:41:10',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:41:47',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:42:05',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:42:56',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:43:41',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,0,1,'2018-01-29 06:02:40',0,'2018-01-30 01:44:34',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec chi do',1,'ok ok ok',15,4,1,'2018-01-29 06:02:40',0,'2018-01-30 01:45:42',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec',1,'ok ok ok',15,4,1,'2018-01-29 06:02:40',0,'2018-01-30 01:46:04',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhikiiiiiiiiii',5,'',1,4,1,'2018-01-30 01:59:19',0,'2018-01-30 01:59:19',0),(15,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'pklp[',1,'',1,5,1,'2018-01-30 01:58:28',0,'2018-01-30 01:58:28',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'ihklhjkl',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 01:56:56',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 03:59:52',0),(10,1,'2015-07-12 08:00:00','2015-07-12 17:00:00',NULL,'đi tiêm phòng',1,'ok',16,5,1,'2018-01-26 04:37:22',0,'2018-01-29 06:12:48',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:00:00',NULL,'học tiếng nhật',5,'complete task',16,5,1,'2018-01-26 04:35:19',0,'2018-01-29 09:44:50',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',1,'',1,5,1,'2018-01-30 01:56:56',0,'2018-01-30 04:00:11',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',1,'',1,5,1,'2018-01-30 01:56:56',0,'2018-01-30 04:14:00',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 04:14:10',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 04:14:26',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 04:18:13',0),(17,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'fghjfghj',1,'',1,4,1,'2018-01-30 04:55:53',0,'2018-01-30 04:55:53',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-30 04:20:43',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf11',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 01:22:45',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf11dfdf',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 01:45:39',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf11dfdf1111',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 01:45:46',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'444444444',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-01-30 04:57:36',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhikiiiiiiiiii',4,'',1,4,1,'2018-01-30 01:59:19',0,'2018-01-30 03:11:05',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'444444444111',5,'',1,4,1,'2018-01-30 04:57:36',0,'2018-01-31 01:46:09',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf11dfdf11113333',5,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 01:45:50',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfdf11dfdf11113333',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 01:50:56',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 03:57:12',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',1,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 05:52:01',0),(25,1,'2018-01-01 01:00:00','2018-01-01 13:00:00',NULL,'ss',1,'',1,4,1,'2018-01-31 06:13:46',0,'2018-01-31 06:13:46',0),(27,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'555',1,'',1,4,1,'2018-01-31 06:15:07',0,'2018-01-31 06:15:07',0),(26,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,';;',1,'',1,4,1,'2018-01-31 06:14:21',0,'2018-01-31 06:14:21',0),(25,1,'2018-01-01 01:00:00','2018-01-01 13:00:00',NULL,'ss',4,'',1,4,1,'2018-01-31 06:13:46',0,'2018-01-31 06:16:38',0),(24,1,'2018-01-02 01:00:00','2018-01-01 01:00:00',NULL,'sick',5,'',1,4,1,'2018-01-31 06:09:43',0,'2018-01-31 06:09:43',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhikiiiiiiiiii',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-01-31 01:49:36',0),(33,1,'2018-12-31 12:59:00','2018-12-31 12:59:00',NULL,'2323232',5,'',25,5,1,'2018-01-31 06:33:40',0,'2018-01-31 06:33:40',0),(32,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'12121212121',1,'',25,4,1,'2018-01-31 06:33:19',0,'2018-01-31 06:33:19',0),(31,1,'2018-01-01 01:00:00','2018-12-31 12:59:00',NULL,'2121',1,'',5,5,1,'2018-01-31 06:32:34',0,'2018-01-31 06:32:34',0),(30,1,'2018-10-29 14:02:00','2018-01-01 01:00:00',NULL,'df',5,'',3,5,1,'2018-01-31 06:21:13',0,'2018-01-31 06:21:13',0),(29,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'wewe',1,'',3,5,1,'2018-01-31 06:20:54',0,'2018-01-31 06:20:54',0),(28,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'ujghj',1,'',3,5,1,'2018-01-31 06:19:53',0,'2018-01-31 06:19:53',0),(23,1,'2018-01-02 01:00:00','2018-01-01 01:00:00',NULL,'sick',1,'',1,4,1,'2018-01-31 06:08:57',0,'2018-01-31 06:08:57',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'fdfdf',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 02:13:44',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'\r\n',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:42:21',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'\r\n',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:51:24',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'12121',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:52:05',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'111',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:53:26',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'1112323',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:54:23',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'444444444111',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-01-31 01:49:36',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'1',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-01-31 06:55:36',0),(35,1,'2018-12-31 12:59:00','2018-12-31 12:59:00',NULL,'1414141',5,'',1,4,1,'2018-01-31 07:13:11',0,'2018-01-31 07:13:11',0),(34,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'dfd',1,'',1,4,1,'2018-01-31 07:12:50',0,'2018-01-31 07:12:50',0),(22,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'fdfdf',1,'',4,5,1,'2018-01-31 06:06:00',0,'2018-01-31 06:06:00',0),(21,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'fdfdf',5,'',4,5,1,'2018-01-31 02:13:57',0,'2018-01-31 02:13:57',0),(11,1,'2015-09-29 09:30:00','2015-09-29 11:30:00',NULL,'đi công việc',5,'yes',16,1,1,'2018-01-26 06:40:17',0,'2018-01-26 06:40:17',0),(15,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thuc khuya',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-01-30 03:15:48',0),(15,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thuc khuya1',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-01-31 07:41:58',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'111111111111',1,'',1,4,1,'2018-01-31 07:51:44',0,'2018-01-31 07:51:44',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'1010101010',1,'',1,4,1,'2018-01-31 07:51:44',0,'2018-01-31 07:59:41',0),(48,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'22222222222200000000000',1,'',1,4,1,'2018-01-31 08:10:04',0,'2018-01-31 08:10:04',0),(47,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'21212121212121',1,'',1,4,1,'2018-01-31 08:08:18',0,'2018-01-31 08:08:18',0),(50,10,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que cha',1,'',16,4,1,'2018-01-31 08:53:54',0,'2018-01-31 08:53:54',0),(51,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'bbbbbbbbbbbbb',1,'',1,4,1,'2018-02-01 02:45:44',0,'2018-02-01 02:45:44',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec123',1,'ok ok ok',15,5,1,'2018-01-29 06:02:40',0,'2018-01-30 01:46:11',0),(51,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cccccccccc',1,'',1,4,1,'2018-02-01 02:45:44',0,'2018-02-01 03:02:08',0),(51,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cccccccccc',1,'',1,4,0,'2018-02-01 02:45:44',0,'2018-02-01 03:11:29',0),(50,10,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que me',1,'',16,4,1,'2018-01-31 08:53:54',0,'2018-01-31 08:55:40',0),(49,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'0000000000222000000',5,'',1,4,1,'2018-01-31 08:10:18',0,'2018-01-31 08:10:18',0),(48,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'gggggggggggg',5,'',1,4,1,'2018-01-31 08:10:04',0,'2018-01-31 08:10:41',0),(47,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cvcvcvcv',1,'',1,4,1,'2018-01-31 08:08:18',0,'2018-01-31 08:10:49',0),(46,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'22222222222222',5,'',1,4,1,'2018-01-31 07:52:02',0,'2018-01-31 07:52:02',0),(42,10,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que cha',0,'',16,4,1,'2018-01-31 07:49:30',0,'2018-01-31 07:49:30',0),(46,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'22222222222222',1,'',1,4,1,'2018-01-31 07:52:02',0,'2018-02-01 03:13:02',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'1010101010cv',1,'',1,4,1,'2018-01-31 07:51:44',0,'2018-01-31 08:04:20',0),(52,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nguyen binh thien',1,'',17,5,1,'2018-02-01 03:20:26',0,'2018-02-01 03:20:26',0),(52,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thien',1,'',17,5,1,'2018-02-01 03:20:26',0,'2018-02-01 03:21:15',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhikiiiiiiiiii',4,'',1,4,1,'2018-01-30 01:59:19',0,'2018-01-31 06:19:05',0),(54,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nhi',1,'',1,4,1,'2018-02-01 03:59:30',0,'2018-02-01 03:59:30',0),(54,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nhi2',1,'',1,4,1,'2018-02-01 03:59:30',0,'2018-02-01 03:59:38',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 03:59:02',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cao hai nhi',1,'',1,4,1,'2018-01-31 07:51:44',0,'2018-02-01 03:17:55',0),(56,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'minh hien',1,'',1,4,1,'2018-02-01 04:13:39',0,'2018-02-01 04:13:39',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhinhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 04:12:13',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-01-29 04:30:41',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 04:14:36',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 06:44:51',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhioi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 06:47:58',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhioiccv',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 07:23:30',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhioiccvnhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-01 07:39:18',0),(58,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'111111111111',1,'',1,4,1,'2018-02-01 07:43:06',0,'2018-02-01 07:43:06',0),(60,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'mmmmmmmm',1,'',5,4,1,'2018-02-01 08:45:37',0,'2018-02-01 08:45:37',0),(64,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'eeeeeeee',1,'',1,4,1,'2018-02-02 01:46:41',0,'2018-02-02 01:46:41',0),(64,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'eeeeeee11111',1,'',1,4,1,'2018-02-02 01:46:41',0,'2018-02-02 04:01:23',0),(64,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'eeeeee222',1,'',1,4,1,'2018-02-02 01:46:41',0,'2018-02-02 04:45:49',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'11122222222222',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-01 07:58:16',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'1112',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-02 05:34:04',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'11111111111',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-02 05:34:12',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'2222222222111',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-02 05:36:34',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'222222',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-02 05:37:23',0),(17,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'fghjfghj',1,'',1,4,0,'2018-01-30 04:55:53',0,'2018-01-30 04:57:18',0),(19,1,'2018-01-01 01:00:00','2018-12-30 12:59:00',NULL,'chi do',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-01-31 02:13:26',0),(61,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'hai',1,'',1,4,1,'2018-02-01 09:02:28',0,'2018-02-01 09:02:28',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cao hai nhi',1,'',1,4,0,'2018-01-31 07:51:44',0,'2018-02-01 04:12:29',0),(46,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'22222222222222',1,'',1,4,0,'2018-01-31 07:52:02',0,'2018-02-01 03:13:14',0),(52,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thien',1,'',17,5,0,'2018-02-01 03:20:26',0,'2018-02-01 03:21:18',0),(54,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nhi2',1,'',1,4,0,'2018-02-01 03:59:30',0,'2018-02-01 03:59:41',0),(56,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'minh hien',1,'',1,4,0,'2018-02-01 04:13:39',0,'2018-02-01 04:14:30',0),(58,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'111111111111',1,'',1,4,0,'2018-02-01 07:43:06',0,'2018-02-01 07:48:44',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'222222',1,'',1,4,0,'2018-02-01 07:58:16',0,'2018-02-02 05:37:26',0),(60,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'mmmmmmmm',1,'',5,4,0,'2018-02-01 08:45:37',0,'2018-02-01 09:55:58',0),(64,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'eeeeee222',1,'',1,4,0,'2018-02-02 01:46:41',0,'2018-02-02 04:45:52',0),(60,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'mmmmmmmm',1,'',5,4,1,'2018-02-01 08:45:37',0,'2018-02-02 07:15:12',0),(58,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'111111111111',1,'',1,4,1,'2018-02-01 07:43:06',0,'2018-02-02 07:15:12',0),(19,1,'2018-01-01 01:00:00','2018-12-30 12:59:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-02 06:23:05',0),(19,1,'2017-01-01 01:00:00','2018-12-30 12:59:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-05 03:34:00',0),(19,1,'2017-01-01 09:00:00','2018-12-30 12:10:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-05 03:48:42',0),(52,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thien',1,'',17,5,1,'2018-02-01 03:20:26',0,'2018-02-02 07:15:12',0),(14,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'oi oi',5,'',1,4,1,'2018-01-30 01:56:56',0,'2018-01-31 05:52:04',0),(61,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'hai nhi cao',1,'',1,4,1,'2018-02-01 09:02:28',0,'2018-02-02 07:14:41',0),(64,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'eeeeee222',1,'',1,4,1,'2018-02-02 01:46:41',0,'2018-02-02 07:15:12',0),(63,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'llllllllllllllllll',5,'',1,4,1,'2018-02-01 09:06:20',0,'2018-02-01 09:06:20',0),(62,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'123',1,'',1,4,1,'2018-02-01 09:06:06',0,'2018-02-01 09:06:06',0),(61,1,'2016-01-01 01:00:00','2016-01-01 01:00:00',NULL,'hai nhi cao',1,'',1,4,1,'2018-02-01 09:02:28',0,'2018-02-05 04:22:07',0),(60,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'mmmmmmmm',1,'',5,4,0,'2018-02-01 08:45:37',0,'2018-02-02 07:15:29',0),(59,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'222222',1,'',1,4,1,'2018-02-01 07:58:16',0,'2018-02-02 07:15:12',0),(58,1,'2018-01-01 13:00:00','2018-01-01 13:00:00',NULL,'111111111111',1,'',1,4,0,'2018-02-01 07:43:06',0,'2018-02-02 07:15:36',0),(57,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'hien pham',5,'',12,5,1,'2018-02-01 04:14:04',0,'2018-02-01 04:14:04',0),(56,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'minh hien',1,'',1,4,1,'2018-02-01 04:13:39',0,'2018-02-02 07:15:12',0),(55,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nhi oi',5,'',1,4,1,'2018-02-01 03:59:58',0,'2018-02-01 03:59:58',0),(54,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'nhi2',1,'',1,4,1,'2018-02-01 03:59:30',0,'2018-02-02 07:15:12',0),(53,1,'2018-12-31 00:59:00','2018-12-30 12:59:00',NULL,'thien 2',5,'',1,4,1,'2018-02-01 03:20:47',0,'2018-02-01 03:20:47',0),(52,1,'2015-01-01 01:00:00','2015-01-01 01:00:00',NULL,'thien',1,'',17,5,1,'2018-02-01 03:20:26',0,'2018-02-05 04:07:50',0),(45,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'cao hai nhi',1,'',1,4,1,'2018-01-31 07:51:44',0,'2018-02-02 07:15:12',0),(46,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'22222222222222',1,'',1,4,1,'2018-01-31 07:52:02',0,'2018-02-02 07:15:12',0),(16,1,'2018-01-01 01:00:00','2018-01-01 02:00:00',NULL,'fghfgdhioiccvnhi',1,'',1,4,0,'2018-01-30 01:59:19',0,'2018-02-01 07:39:28',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-15 03:56:43',0),(5,1,'2016-12-31 10:00:00','2017-01-02 12:00:00',NULL,'đưa con đi khám bệnh',3,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-01-26 04:32:48',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:00:00',NULL,'học tiếng nhật',5,'complete task',16,4,1,'2018-01-26 04:35:19',0,'2018-01-30 04:02:34',0),(8,1,'2017-05-02 14:30:00','2017-05-02 17:00:00',NULL,'thăm đau',2,'ukm',16,5,1,'2018-01-26 04:34:07',0,'2018-01-26 04:34:07',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:00:00',NULL,'học tiếng nhật',1,'complete task',16,4,1,'2018-01-26 04:35:19',0,'2018-02-05 04:32:30',0),(14,1,'2016-01-01 01:00:00','2016-01-01 01:00:00',NULL,'oi oi',5,'',1,4,1,'2018-01-30 01:56:56',0,'2018-02-05 04:22:07',0),(11,1,'2015-09-29 09:30:00','2015-09-29 11:30:00',NULL,'đi công việc',5,'yes',16,4,1,'2018-01-26 06:40:17',0,'2018-01-31 07:35:55',0),(15,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thuc khuya',5,'',1,4,1,'2018-01-30 01:58:28',0,'2018-01-31 07:42:18',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'12',5,'',1,4,1,'2018-01-30 04:57:36',0,'2018-01-31 06:55:59',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'11',5,'',4,5,1,'2018-01-31 02:13:44',0,'2018-01-31 06:54:42',0),(15,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'thuc khuya',4,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 04:33:20',0),(20,1,'2018-01-01 01:00:00','2018-01-01 01:00:00',NULL,'11',4,'',4,5,1,'2018-01-31 02:13:44',0,'2018-02-05 04:33:20',0),(18,1,'2018-01-01 13:00:00','2018-01-01 01:00:00',NULL,'12',4,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 04:33:20',0),(18,1,'2018-01-01 13:00:00','2018-01-01 10:10:00',NULL,'12',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 06:54:09',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:05:00',NULL,'học tiếng nhật',1,'complete task',16,4,1,'2018-01-26 04:35:19',0,'2018-02-05 04:32:41',0),(18,1,'2018-01-01 13:00:00','2018-01-01 10:10:00',NULL,'12ss',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 06:55:13',0),(18,1,'2018-01-01 13:00:00','2018-01-01 11:10:00',NULL,'12ss',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:11:51',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12ss',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:12:05',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2',1,'',1,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:12:14',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2',1,'',5,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:16:33',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2',1,'',13,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:16:40',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2dd',1,'',13,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:19:49',0),(20,1,'2018-01-01 10:20:00','2018-01-01 12:20:00',NULL,'11',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-02-05 06:31:42',0),(20,1,'2018-01-01 10:20:00','2018-01-01 12:20:00',NULL,'11gg',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-02-05 07:20:09',0),(15,1,'2018-01-01 10:00:00','2018-01-01 11:00:00',NULL,'thuc khuya',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 06:31:28',0),(15,1,'2018-01-01 10:00:00','2018-01-01 11:10:00',NULL,'thuc khuya',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 07:21:53',0),(15,1,'2018-01-01 10:00:00','2018-01-01 11:10:00',NULL,'thuc khuya11',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 07:22:01',0),(15,1,'2018-01-01 10:00:00','2018-01-01 11:10:00',NULL,'thuc khuya',1,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 07:22:06',0),(70,1,'2017-02-06 08:00:00','2018-02-01 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-05 07:43:11',0,'2018-02-05 07:43:11',0),(67,1,'2018-02-14 08:00:00','2018-02-14 08:00:00',NULL,'777',1,'',1,4,1,'2018-02-05 07:41:38',0,'2018-02-05 07:41:38',0),(66,1,'2018-01-30 08:00:00','2018-02-20 11:00:00',NULL,'ttt',1,'',5,5,1,'2018-02-05 07:23:31',0,'2018-02-05 07:23:31',0),(65,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'sss',1,'',1,4,1,'2018-02-05 06:57:34',0,'2018-02-05 06:57:34',0),(42,10,'2017-05-06 08:00:00','2017-05-06 17:00:00',NULL,'ve que cha',1,'',16,4,1,'2018-01-31 07:49:30',0,'2018-02-01 03:13:02',0),(20,1,'2018-01-01 10:20:00','2018-01-01 12:30:00',NULL,'11gg',1,'',4,5,1,'2018-01-31 02:13:44',0,'2018-02-05 07:20:15',0),(74,1,'2018-00-02 08:00:00','2018-02-21 08:00:00',NULL,'jjj',1,'',1,4,1,'2018-02-05 08:00:46',0,'2018-02-05 08:00:46',0),(73,1,'2018-02-06 08:00:00','2018-02-23 08:00:00',NULL,'jjjj',1,'',1,4,1,'2018-02-05 07:45:42',0,'2018-02-05 07:45:42',0),(72,1,'2018-02-07 08:00:00','2018-02-07 08:20:00',NULL,'333',1,'',1,4,1,'2018-02-05 07:44:36',0,'2018-02-05 07:44:36',0),(71,1,'2015-02-22 08:00:00','2015-02-22 08:00:00',NULL,'n',1,'',1,4,1,'2018-02-05 07:44:09',0,'2018-02-05 07:44:09',0),(70,1,'2017-02-06 08:00:00','2018-02-01 08:00:00',NULL,'hhh',1,'',1,4,0,'2018-02-05 07:43:11',0,'2018-02-05 07:44:54',0),(68,1,'2018-02-05 08:00:00','2018-02-19 08:00:00',NULL,'222',1,'',1,4,1,'2018-02-05 07:42:08',0,'2018-02-05 07:42:08',0),(69,1,'2017-02-08 08:00:00','2018-02-21 08:00:00',NULL,'lll',1,'',1,4,1,'2018-02-05 07:42:24',0,'2018-02-05 07:42:24',0),(105,1,'2018-01-30 08:00:00','2018-02-20 08:00:00',NULL,'hh',1,'',1,4,1,'2018-02-05 08:55:59',0,'2018-02-05 08:55:59',0),(104,1,'2018-02-13 08:00:00','2018-02-22 08:00:00',NULL,'fgf',1,'',1,4,1,'2018-02-05 08:55:51',0,'2018-02-05 08:55:51',0),(103,1,'2018-02-05 08:00:00','2018-02-05 08:05:00',NULL,'111',1,'',1,4,1,'2018-02-05 08:53:14',0,'2018-02-05 08:53:14',0),(102,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'ooo',1,'',1,4,1,'2018-02-05 08:53:01',0,'2018-02-05 08:53:01',0),(101,1,'2018-02-05 08:00:00','2018-02-28 08:00:00',NULL,'kkk',1,'',1,4,1,'2018-02-05 08:51:57',0,'2018-02-05 08:51:57',0),(99,1,'2018-01-29 08:00:00','2018-02-27 08:00:00',NULL,'yyy',1,'',1,4,1,'2018-02-05 08:51:22',0,'2018-02-05 08:51:22',0),(98,1,'2018-01-31 08:00:00','2018-02-28 08:00:00',NULL,'uuu',1,'',1,4,1,'2018-02-05 08:46:18',0,'2018-02-05 08:46:18',0),(100,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'jjj',1,'',1,4,1,'2018-02-05 08:51:48',0,'2018-02-05 08:51:48',0),(97,1,'2018-02-05 08:00:00','2018-02-21 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-05 08:45:39',0,'2018-02-05 08:45:39',0),(96,1,'2018-02-06 08:00:00','2018-02-28 08:00:00',NULL,'yyy',1,'',1,4,1,'2018-02-05 08:44:27',0,'2018-02-05 08:44:27',0),(95,1,'2018-02-07 08:00:00','2018-02-28 08:00:00',NULL,'yyy',1,'',1,4,1,'2018-02-05 08:44:06',0,'2018-02-05 08:44:06',0),(94,1,'2018-02-06 08:00:00','2018-02-28 08:00:00',NULL,'777',1,'',1,4,1,'2018-02-05 08:42:59',0,'2018-02-05 08:42:59',0),(92,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'nnn',1,'',1,4,1,'2018-02-05 08:40:11',0,'2018-02-05 08:40:11',0),(90,1,'2018-02-07 08:00:00','2018-02-28 08:00:00',NULL,'bbb',1,'',1,4,1,'2018-02-05 08:39:03',0,'2018-02-05 08:39:03',0),(93,1,'2018-01-10 08:00:00','2018-02-23 08:00:00',NULL,'nnn',1,'',1,4,1,'2018-02-05 08:40:19',0,'2018-02-05 08:40:19',0),(91,1,'2018-02-12 08:00:00','2018-02-22 08:00:00',NULL,'gggg',1,'',1,4,1,'2018-02-05 08:39:14',0,'2018-02-05 08:39:14',0),(89,1,'2018-02-13 08:00:00','2018-02-27 08:00:00',NULL,'nnn',1,'',1,4,1,'2018-02-05 08:38:49',0,'2018-02-05 08:38:49',0),(88,1,'2018-02-06 08:00:00','2018-02-28 08:00:00',NULL,'yyy',1,'',1,4,1,'2018-02-05 08:37:28',0,'2018-02-05 08:37:28',0),(87,1,'2018-01-01 08:00:00','2018-01-08 08:00:00',NULL,'fff',1,'',1,4,1,'2018-02-05 08:32:23',0,'2018-02-05 08:32:23',0),(86,1,'2018-01-02 08:00:00','2018-01-08 08:00:00',NULL,'fff',1,'',1,4,1,'2018-02-05 08:31:46',0,'2018-02-05 08:31:46',0),(84,1,'2018-01-30 08:00:00','2018-02-28 08:00:00',NULL,'fff',1,'',1,4,1,'2018-02-05 08:31:30',0,'2018-02-05 08:31:30',0),(83,1,'2018-01-31 08:00:00','2018-02-26 08:00:00',NULL,'ddd',1,'',1,4,1,'2018-02-05 08:31:02',0,'2018-02-05 08:31:02',0),(85,1,'2018-01-04 08:00:00','2018-02-27 08:00:00',NULL,'fff',1,'',1,4,1,'2018-02-05 08:31:38',0,'2018-02-05 08:31:38',0),(82,1,'2018-02-05 08:00:00','2018-02-23 08:00:00',NULL,'ss',1,'',1,4,1,'2018-02-05 08:30:49',0,'2018-02-05 08:30:49',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2dd',1,'',2,4,1,'2018-01-30 04:57:36',0,'2018-02-05 07:19:54',0),(81,1,'2018-02-02 08:00:00','2018-02-28 08:00:00',NULL,'yyy',1,'',1,4,1,'2018-02-05 08:30:34',0,'2018-02-05 08:30:34',0),(76,1,'2018-01-30 08:00:00','2018-02-21 08:00:00',NULL,'sss',1,'',1,4,1,'2018-02-05 08:22:19',0,'2018-02-05 08:22:19',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'12s2dd',1,'',14,4,1,'2018-01-30 04:57:36',0,'2018-02-05 09:09:38',0),(18,1,'2018-01-01 09:00:00','2018-01-01 11:10:00',NULL,'gi cung duoc',1,'',14,4,1,'2018-01-30 04:57:36',0,'2018-02-05 09:23:29',0),(76,1,'2018-01-30 08:00:00','2018-02-21 08:15:00',NULL,'sss11',1,'',15,4,1,'2018-02-05 08:22:19',0,'2018-02-05 09:16:53',0),(18,1,'2018-01-01 14:00:00','2018-02-14 11:10:00',NULL,'gi cung duoc',1,'',14,4,1,'2018-01-30 04:57:36',0,'2018-02-05 09:23:55',0),(78,1,'2018-01-29 08:00:00','2018-03-15 08:00:00',NULL,'uuu',1,'',1,4,1,'2018-02-05 08:24:29',0,'2018-02-05 08:24:29',0),(78,1,'2018-01-29 15:00:00','2018-03-15 12:00:00',NULL,'bi om roi',1,'',1,4,1,'2018-02-05 08:24:29',0,'2018-02-05 09:28:06',0),(81,1,'2018-02-02 08:00:00','2018-02-28 08:00:00',NULL,'yyy',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-05 09:16:09',0),(119,1,'2018-02-06 08:00:00','2018-02-21 08:00:00',NULL,'ddd',1,'',1,4,1,'2018-02-05 09:49:53',0,'2018-02-05 09:49:53',0),(118,1,'2018-02-05 08:00:00','2018-02-13 08:00:00',NULL,'gggg',1,'',1,4,1,'2018-02-05 09:49:38',0,'2018-02-05 09:49:38',0),(117,1,'2018-02-14 08:00:00','2018-02-28 08:00:00',NULL,'bnbb',1,'',1,4,1,'2018-02-05 09:40:30',0,'2018-02-05 09:40:30',0),(116,1,'2018-02-07 08:00:00','2018-02-27 08:00:00',NULL,'uuuu',1,'',1,4,1,'2018-02-05 09:40:20',0,'2018-02-05 09:40:20',0),(115,1,'2018-02-06 08:00:00','2018-02-28 08:00:00',NULL,'ccc',5,'',1,4,1,'2018-02-05 09:33:36',0,'2018-02-05 09:33:36',0),(114,1,'2018-02-13 08:00:00','2018-02-20 08:00:00',NULL,'vvvv',1,'',15,4,1,'2018-02-05 09:33:13',0,'2018-02-05 09:33:13',0),(113,1,'2018-02-06 08:00:00','2018-02-26 08:00:00',NULL,'x',1,'',1,4,1,'2018-02-05 09:32:21',0,'2018-02-05 09:32:21',0),(112,1,'2018-02-05 08:00:00','2018-02-20 08:00:00',NULL,'xxx',1,'',1,4,1,'2018-02-05 09:32:04',0,'2018-02-05 09:32:04',0),(111,1,'2018-01-10 08:00:00','2018-01-17 08:00:00',NULL,'bi cam cum',1,'',17,4,1,'2018-02-05 09:31:44',0,'2018-02-05 09:31:44',0),(109,1,'2018-02-06 08:00:00','2018-02-20 08:00:00',NULL,'vvvvvvvvv',1,'',16,4,1,'2018-02-05 09:10:09',0,'2018-02-05 09:10:09',0),(110,1,'2018-02-06 08:00:00','2018-02-27 08:00:00',NULL,'chong mat',1,'',1,4,1,'2018-02-05 09:28:47',0,'2018-02-05 09:28:47',0),(14,1,'2016-01-01 01:00:00','2016-01-01 01:00:00',NULL,'oi oi',4,'',1,4,1,'2018-01-30 01:56:56',0,'2018-02-05 04:33:20',0),(76,1,'2018-01-30 10:00:00','2018-02-21 08:15:00',NULL,'khong di lam duoc',1,'',15,4,1,'2018-02-05 08:22:19',0,'2018-02-05 09:25:24',0),(75,1,'2018-02-06 08:00:00','2018-02-14 10:00:00',NULL,'oi',1,'',1,4,1,'2018-02-05 08:18:45',0,'2018-02-05 08:18:45',0),(19,1,'2017-01-01 09:15:00','2018-12-30 12:15:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-05 03:48:54',0),(18,1,'2018-02-14 08:00:00','2018-02-14 11:10:00',NULL,'gi cung duoc',1,'',14,4,1,'2018-01-30 04:57:36',0,'2018-02-05 09:26:23',0),(106,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'sdsd',1,'',1,4,1,'2018-02-05 09:07:46',0,'2018-02-05 09:07:46',0),(80,1,'2018-01-29 08:00:00','2018-02-20 08:00:00',NULL,'ddd',1,'',1,4,1,'2018-02-05 08:28:43',0,'2018-02-05 08:28:43',0),(80,1,'2017-01-29 08:00:00','2018-02-20 10:00:00',NULL,'ddd23',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 01:20:13',0),(77,1,'2018-02-06 08:00:00','2018-03-05 08:00:00',NULL,'ooo',1,'',1,4,1,'2018-02-05 08:23:59',0,'2018-02-05 08:23:59',0),(77,1,'2018-02-06 08:00:00','2019-03-05 08:00:00',NULL,'o o o',1,'',1,4,1,'2018-02-05 08:23:59',0,'2018-02-06 01:27:59',0),(77,1,'2018-02-06 08:00:00','2019-03-05 08:00:00',NULL,'111',1,'',1,4,1,'2018-02-05 08:23:59',0,'2018-02-06 01:29:19',0),(121,1,'2018-02-05 08:00:00','2018-03-06 08:00:00',NULL,'ffff',1,'',12,4,1,'2018-02-06 01:26:53',0,'2018-02-06 01:26:53',0),(134,1,'2018-01-29 10:15:00','2018-01-29 11:15:00',NULL,'2222222222',1,'',1,4,1,'2018-02-06 03:34:39',0,'2018-02-06 03:34:39',0),(133,1,'2018-02-13 08:00:00','2018-02-19 08:00:00',NULL,'555',1,'',1,4,1,'2018-02-06 03:33:12',0,'2018-02-06 03:33:12',0),(132,1,'2018-01-31 08:00:00','2018-02-23 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-06 03:31:18',0,'2018-02-06 03:31:18',0),(131,1,'2018-02-06 08:00:00','2018-02-08 08:00:00',NULL,'111111111111',1,'',1,4,1,'2018-02-06 03:23:52',0,'2018-02-06 03:23:52',0),(130,1,'2018-02-20 08:00:00','2018-03-14 08:00:00',NULL,'1111',1,'',1,4,1,'2018-02-06 03:23:19',0,'2018-02-06 03:23:19',0),(129,1,'2018-01-29 08:00:00','2018-02-12 08:00:00',NULL,'kkkk',1,'',1,4,1,'2018-02-06 03:22:55',0,'2018-02-06 03:22:55',0),(128,1,'2018-01-30 08:00:00','2018-01-30 09:00:00',NULL,'fgg',1,'',1,4,1,'2018-02-06 03:11:37',0,'2018-02-06 03:11:37',0),(127,1,'2018-02-06 08:00:00','2018-02-26 08:00:00',NULL,'cccc',1,'',1,4,1,'2018-02-06 02:59:02',0,'2018-02-06 02:59:02',0),(126,1,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'test 1',5,'',1,4,1,'2018-02-06 01:46:19',0,'2018-02-06 01:46:19',0),(125,1,'2018-02-02 08:00:00','2018-02-28 08:00:00',NULL,'ok',1,'',1,4,1,'2018-02-06 01:39:41',0,'2018-02-06 01:39:41',0),(124,1,'2019-02-07 08:00:00','2019-03-08 08:00:00',NULL,'test',1,'',16,4,1,'2018-02-06 01:38:34',0,'2018-02-06 01:38:34',0),(123,1,'2019-02-07 08:00:00','2019-03-13 08:00:00',NULL,'fff',1,'',1,4,1,'2018-02-06 01:27:25',0,'2018-02-06 01:27:25',0),(122,1,'2018-02-13 08:00:00','2018-03-21 08:00:00',NULL,'ffff',5,'',1,4,1,'2018-02-06 01:27:08',0,'2018-02-06 01:27:08',0),(121,1,'2018-02-05 08:00:00','2018-03-06 08:00:00',NULL,'ffff222',1,'',12,4,1,'2018-02-06 01:26:53',0,'2018-02-06 01:30:41',0),(120,1,'2018-02-06 08:00:00','2018-02-28 10:00:00',NULL,'123456',5,'',6,4,1,'2018-02-06 01:15:46',0,'2018-02-06 01:15:46',0),(108,1,'2018-02-05 08:00:00','2018-02-20 08:00:00',NULL,'ban viec rieng',1,'',1,4,1,'2018-02-05 09:09:03',0,'2018-02-05 09:09:03',0),(107,1,'2018-02-14 08:00:00','2018-02-14 08:10:00',NULL,'sss',1,'',1,4,1,'2018-02-05 09:08:12',0,'2018-02-05 09:08:12',0),(147,1,'2018-01-08 08:00:00','2018-01-08 11:00:00',NULL,'444',1,'',1,4,1,'2018-02-06 04:03:45',0,'2018-02-06 04:03:45',0),(146,1,'2018-01-30 08:00:00','2018-01-30 10:00:00',NULL,'444',1,'',1,4,1,'2018-02-06 04:03:35',0,'2018-02-06 04:03:35',0),(145,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'4444444',1,'',1,4,1,'2018-02-06 04:02:50',0,'2018-02-06 04:02:50',0),(144,1,'2018-01-30 08:00:00','2018-01-30 12:00:00',NULL,'111111',1,'',1,4,1,'2018-02-06 04:02:05',0,'2018-02-06 04:02:05',0),(143,1,'2018-01-29 08:00:00','2018-01-29 13:00:00',NULL,'111111111111',1,'',1,4,1,'2018-02-06 04:01:43',0,'2018-02-06 04:01:43',0),(142,1,'2018-01-29 08:00:00','2018-01-29 09:00:00',NULL,'hhhhhhhhhh',1,'',1,4,1,'2018-02-06 03:58:32',0,'2018-02-06 03:58:32',0),(161,1,'2018-02-05 08:00:00','2018-02-05 16:00:00',NULL,'252525',5,'',1,4,1,'2018-02-06 05:47:47',0,'2018-02-06 05:47:47',0),(160,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'cccc',1,'',1,4,1,'2018-02-06 05:37:11',0,'2018-02-06 05:37:11',0),(159,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'222222233',1,'',1,4,1,'2018-02-06 04:48:40',0,'2018-02-06 04:48:40',0),(158,1,'2018-02-05 08:00:00','2018-02-05 08:05:00',NULL,'jjj',1,'',1,4,1,'2018-02-06 04:46:17',0,'2018-02-06 04:46:17',0),(157,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'22222',1,'',1,4,1,'2018-02-06 04:34:27',0,'2018-02-06 04:34:27',0),(156,1,'2018-01-29 08:00:00','2018-01-29 10:00:00',NULL,'hy',5,'',1,4,1,'2018-02-06 04:33:00',0,'2018-02-06 04:33:00',0),(155,1,'2018-01-29 08:00:00','2018-01-29 11:00:00',NULL,'yyyy',5,'',1,4,1,'2018-02-06 04:32:11',0,'2018-02-06 04:32:11',0),(154,1,'2018-01-02 08:00:00','2018-01-02 10:00:00',NULL,'333',5,'',1,4,1,'2018-02-06 04:30:45',0,'2018-02-06 04:30:45',0),(153,1,'2018-01-29 08:00:00','2018-01-29 11:00:00',NULL,'111',5,'',1,4,1,'2018-02-06 04:30:35',0,'2018-02-06 04:30:35',0),(152,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'1 tiesng',5,'',19,5,1,'2018-02-06 04:28:53',0,'2018-02-06 04:28:53',0),(151,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'2 tieng',5,'',16,5,1,'2018-02-06 04:25:09',0,'2018-02-06 04:25:09',0),(150,1,'2018-01-09 08:00:00','2018-01-09 10:00:00',NULL,'322222',5,'',1,4,1,'2018-02-06 04:22:14',0,'2018-02-06 04:22:14',0),(149,1,'2018-01-30 08:00:00','2018-01-30 13:00:00',NULL,'222222',5,'',1,4,1,'2018-02-06 04:21:32',0,'2018-02-06 04:21:32',0),(148,1,'2018-01-30 08:00:00','2018-01-30 13:00:00',NULL,'4444444',5,'',1,4,1,'2018-02-06 04:20:34',0,'2018-02-06 04:20:34',0),(147,1,'2018-01-08 08:00:00','2018-01-08 11:00:00',NULL,'444',1,'',1,4,0,'2018-02-06 04:03:45',0,'2018-02-06 04:07:45',0),(146,1,'2018-01-30 08:00:00','2018-01-30 10:00:00',NULL,'444',1,'',1,4,0,'2018-02-06 04:03:35',0,'2018-02-06 04:14:20',0),(167,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'chi cung duoc',1,'',16,4,1,'2018-02-06 06:21:47',0,'2018-02-06 06:21:47',0),(167,1,'2018-02-05 08:00:00','2018-02-05 12:10:00',NULL,'chi cung duoc vay',1,'',16,4,1,'2018-02-06 06:21:47',0,'2018-02-06 06:23:10',0),(139,1,'2018-01-29 08:00:00','2018-01-29 13:00:00',NULL,'kkkkkkkkkkkkkkkkkkkk',1,'',1,4,1,'2018-02-06 03:55:59',0,'2018-02-06 03:55:59',0),(139,1,'2018-01-29 08:15:00','2018-01-29 13:15:00',NULL,'ngay nghi',1,'',1,4,1,'2018-02-06 03:55:59',0,'2018-02-06 06:32:50',0),(139,1,'2018-01-29 08:15:00','2018-01-29 13:15:00',NULL,'ngay nghi1',1,'',1,4,1,'2018-02-06 03:55:59',0,'2018-02-06 06:39:33',0),(139,1,'2018-01-29 08:15:00','2018-01-29 13:15:00',NULL,'ngay nghi',1,'',1,4,1,'2018-02-06 03:55:59',0,'2018-02-06 06:40:18',0),(137,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'hhhhh',1,'',1,4,1,'2018-02-06 03:51:15',0,'2018-02-06 03:51:15',0),(140,1,'2018-02-06 08:00:00','2018-02-27 10:00:00',NULL,'pppppp',1,'',1,4,1,'2018-02-06 03:57:06',0,'2018-02-06 03:57:06',0),(167,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'chi cung duoc',1,'',16,4,1,'2018-02-06 06:21:47',0,'2018-02-06 06:31:03',0),(140,1,'2018-02-06 08:00:00','2018-02-27 10:00:00',NULL,'1995',1,'',1,4,1,'2018-02-06 03:57:06',0,'2018-02-06 07:05:06',0),(138,1,'2018-01-31 08:00:00','2018-02-20 08:00:00',NULL,'jjj',1,'',1,4,1,'2018-02-06 03:55:11',0,'2018-02-06 03:55:11',0),(141,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'12121212',1,'',1,4,1,'2018-02-06 03:57:18',0,'2018-02-06 03:57:18',0),(141,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'tam chin muoi',1,'',1,4,1,'2018-02-06 03:57:18',0,'2018-02-06 07:10:24',0),(141,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'tam chin',1,'',1,4,1,'2018-02-06 03:57:18',0,'2018-02-06 07:10:35',0),(169,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'366666',1,'',1,4,1,'2018-02-06 07:13:08',0,'2018-02-06 07:13:08',0),(137,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'19991',1,'',1,4,1,'2018-02-06 03:51:15',0,'2018-02-06 07:03:20',0),(80,1,'2018-01-29 08:00:00','2018-02-20 10:00:00',NULL,'ddd23',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 01:20:33',0),(170,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'cho nghi vai tieng',1,'',1,4,1,'2018-02-06 07:28:05',0,'2018-02-06 07:28:05',0),(170,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'cho em nghi vai tieng',1,'',1,4,1,'2018-02-06 07:28:05',0,'2018-02-06 07:35:34',0),(169,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'di cho',1,'',1,4,1,'2018-02-06 07:13:08',0,'2018-02-06 07:33:55',0),(80,1,'2018-01-29 08:00:00','2018-02-20 11:00:00',NULL,'1111111',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 07:35:08',0),(170,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'cho em nghi vai tieng',1,'',1,4,1,'2018-02-06 07:28:05',0,'2018-02-06 07:35:49',0),(170,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'cho em nghi vai tieng',1,'',1,4,1,'2018-02-06 07:28:05',0,'2018-02-06 07:37:54',0),(141,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'tam chin muoi',1,'',1,4,1,'2018-02-06 03:57:18',0,'2018-02-06 07:11:01',0),(172,1,'2018-02-06 08:00:00','2018-02-20 08:00:00',NULL,'ghfghjfghj',1,'',1,4,1,'2018-02-06 07:40:30',0,'2018-02-06 07:40:30',0),(168,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'33333',1,'',1,4,1,'2018-02-06 07:12:54',0,'2018-02-06 07:12:54',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 07:37:25',0),(135,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'hhhhhh',1,'',1,4,1,'2018-02-06 03:46:37',0,'2018-02-06 03:46:37',0),(188,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'hhhhhhh',1,'',1,4,1,'2018-02-06 08:07:04',0,'2018-02-06 08:07:04',0),(187,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'hhhhh',1,'',1,4,1,'2018-02-06 08:06:53',0,'2018-02-06 08:06:53',0),(183,1,'2018-02-04 08:00:00','2018-02-04 11:00:00',NULL,'tttttt',1,'',1,4,1,'2018-02-06 07:57:44',0,'2018-02-06 07:57:44',0),(185,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'ggg',1,'',1,4,1,'2018-02-06 07:59:38',0,'2018-02-06 07:59:38',0),(184,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'ggg',1,'',1,4,1,'2018-02-06 07:58:29',0,'2018-02-06 07:58:29',0),(180,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'bbbbb',1,'',1,4,1,'2018-02-06 07:56:46',0,'2018-02-06 07:56:46',0),(179,1,'2018-02-04 08:00:00','2018-02-04 10:00:00',NULL,'ggggg',1,'',1,4,1,'2018-02-06 07:56:06',0,'2018-02-06 07:56:06',0),(178,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'yyyyyy',1,'',1,4,1,'2018-02-06 07:55:46',0,'2018-02-06 07:55:46',0),(177,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'rrrrrr',1,'',1,4,1,'2018-02-06 07:55:06',0,'2018-02-06 07:55:06',0),(186,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'yyyyy',1,'',1,4,1,'2018-02-06 08:01:29',0,'2018-02-06 08:01:29',0),(182,1,'2018-02-01 08:00:00','2018-02-01 10:00:00',NULL,'ttttt',1,'',1,4,1,'2018-02-06 07:57:15',0,'2018-02-06 07:57:15',0),(182,1,'2018-02-01 08:00:00','2018-02-01 11:00:00',NULL,'11111',1,'',1,4,1,'2018-02-06 07:57:15',0,'2018-02-06 08:08:40',0),(188,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'hhhhhhh',1,'',1,4,0,'2018-02-06 08:07:04',0,'2018-02-06 08:07:17',0),(187,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'hhhhh',1,'',1,4,0,'2018-02-06 08:06:53',0,'2018-02-06 08:07:21',0),(186,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'yyyyy',1,'',1,4,0,'2018-02-06 08:01:29',0,'2018-02-06 08:08:08',0),(185,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'ggg',1,'',1,4,0,'2018-02-06 07:59:38',0,'2018-02-06 08:07:39',0),(184,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'ggg',1,'',1,4,0,'2018-02-06 07:58:29',0,'2018-02-06 08:07:43',0),(183,1,'2018-02-04 08:00:00','2018-02-04 11:00:00',NULL,'tttttt',1,'',1,4,0,'2018-02-06 07:57:44',0,'2018-02-06 08:07:28',0),(182,1,'2018-02-01 08:00:00','2018-02-01 09:00:00',NULL,'11111',5,'',1,4,1,'2018-02-06 07:57:15',0,'2018-02-06 08:08:59',0),(181,1,'2018-02-11 08:00:00','2018-02-11 09:00:00',NULL,'vvvvvv',1,'',1,4,1,'2018-02-06 07:57:01',0,'2018-02-06 07:57:01',0),(180,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'bbbbb',1,'',1,4,0,'2018-02-06 07:56:46',0,'2018-02-06 08:07:47',0),(179,1,'2018-02-04 08:00:00','2018-02-04 10:00:00',NULL,'ggggg',1,'',1,4,0,'2018-02-06 07:56:06',0,'2018-02-06 08:07:51',0),(178,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'yyyyyy',1,'',1,4,0,'2018-02-06 07:55:46',0,'2018-02-06 08:07:54',0),(177,1,'2018-02-04 08:00:00','2018-02-04 09:00:00',NULL,'rrrrrr',1,'',1,4,0,'2018-02-06 07:55:06',0,'2018-02-06 08:07:58',0),(176,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'ggggggg',1,'',1,4,1,'2018-02-06 07:54:52',0,'2018-02-06 07:54:52',0),(175,1,'2018-02-04 08:00:00','2018-02-04 10:00:00',NULL,'uuuuuu',1,'',1,4,1,'2018-02-06 07:51:09',0,'2018-02-06 07:51:09',0),(174,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'dfdf',1,'',1,4,1,'2018-02-06 07:50:55',0,'2018-02-06 07:50:55',0),(173,1,'2018-02-04 08:00:00','2018-02-04 11:00:00',NULL,'bbbbbbb',1,'',1,4,1,'2018-02-06 07:50:23',0,'2018-02-06 07:50:23',0),(172,1,'2018-02-06 08:00:00','2018-02-20 08:00:00',NULL,'ghfghjfghj',1,'',1,4,0,'2018-02-06 07:40:30',0,'2018-02-06 07:40:48',0),(171,1,'2018-02-07 08:00:00','2018-02-07 09:00:00',NULL,'55555',1,'',1,4,1,'2018-02-06 07:28:16',0,'2018-02-06 07:28:16',0),(170,1,'2018-02-06 08:00:00','2018-02-06 13:00:00',NULL,'cho em nghi vai tieng',1,'',1,4,1,'2018-02-06 07:28:05',0,'2018-02-06 07:37:59',0),(169,1,'2018-02-06 08:00:00','2018-02-06 13:00:00',NULL,'di cho',1,'',1,4,1,'2018-02-06 07:13:08',0,'2018-02-06 07:36:03',0),(168,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'33333',1,'',1,4,0,'2018-02-06 07:12:54',0,'2018-02-06 07:48:48',0),(167,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'chi cung duoc12',1,'',16,4,1,'2018-02-06 06:21:47',0,'2018-02-06 07:08:00',0),(166,5,'2018-02-27 08:00:00','2018-02-28 08:00:00',NULL,'ghghgh',2,'',1,5,1,'2018-02-06 06:21:00',0,'2018-02-06 06:21:00',0),(165,5,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'gui toi toi',2,'',1,5,1,'2018-02-06 06:14:59',0,'2018-02-06 06:14:59',0),(164,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'22222222222',5,'',1,4,1,'2018-02-06 06:01:50',0,'2018-02-06 06:01:50',0),(163,4,'2018-01-29 08:00:00','2018-01-29 13:00:00',NULL,'ddf',5,'',1,5,1,'2018-02-06 06:00:27',0,'2018-02-06 06:00:27',0),(162,4,'2018-02-05 08:00:00','2018-02-05 14:00:00',NULL,'21221',1,'',1,5,1,'2018-02-06 05:55:48',0,'2018-02-06 05:55:48',0),(145,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'4444444',1,'',1,4,0,'2018-02-06 04:02:50',0,'2018-02-06 04:14:57',0),(144,1,'2018-01-30 08:00:00','2018-01-30 12:00:00',NULL,'111111',1,'',1,4,0,'2018-02-06 04:02:05',0,'2018-02-06 04:15:46',0),(143,1,'2018-01-29 08:00:00','2018-01-29 13:00:00',NULL,'111111111111',1,'',1,4,0,'2018-02-06 04:01:43',0,'2018-02-06 04:16:23',0),(142,1,'2018-01-29 08:00:00','2018-01-29 09:00:00',NULL,'hhhhhhhhhh',1,'',1,4,0,'2018-02-06 03:58:32',0,'2018-02-06 04:28:32',0),(191,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'gyuigyui',1,'',1,4,1,'2018-02-06 08:18:32',0,'2018-02-06 08:18:32',0),(191,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'giu con',1,'',1,4,1,'2018-02-06 08:18:32',0,'2018-02-06 08:19:19',0),(191,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'giu con',1,'',1,4,1,'2018-02-06 08:18:32',0,'2018-02-06 08:19:31',0),(19,1,'2017-01-01 09:15:00','2018-12-30 12:15:00',NULL,'chi do hi',4,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 01:16:19',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:15:00',NULL,'học tiếng nhật',1,'complete task',16,4,1,'2018-01-26 04:35:19',0,'2018-02-05 07:03:37',0),(19,1,'2017-01-01 09:15:00','2018-12-30 12:15:00',NULL,'chi do',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 08:20:30',0),(19,1,'2017-01-01 09:15:00','2018-12-30 13:15:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 08:30:02',0),(19,1,'2017-01-01 09:15:00','2018-12-30 13:15:00',NULL,'chi do',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 08:30:36',0),(19,1,'2017-01-01 09:15:00','2018-12-30 13:15:00',NULL,'chi do hi',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 08:31:23',0),(9,1,'2018-01-26 13:00:00','2018-01-26 17:15:00',NULL,'học tiếng nhật',1,'complete task',16,4,0,'2018-01-26 04:35:19',0,'2018-02-06 08:26:56',0),(13,1,'2017-05-20 14:30:00','2017-05-20 14:30:00',NULL,'co viec123',1,'ok ok ok',15,5,0,'2018-01-29 06:02:40',0,'2018-02-01 03:10:41',0),(16,1,'2015-01-01 01:00:00','2015-01-01 02:00:00',NULL,'fghfgdhioiccvnhi',1,'',1,4,0,'2018-01-30 01:59:19',0,'2018-02-05 04:23:04',0),(17,1,'2018-01-01 13:00:00','2018-01-01 23:59:59',NULL,'fghjfghj',1,'',1,4,0,'2018-01-30 04:55:53',0,'2018-02-02 06:17:50',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,0,'2018-02-05 08:28:43',0,'2018-02-06 07:49:31',0),(106,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'sdsd',1,'',1,4,0,'2018-02-05 09:07:46',0,'2018-02-06 01:16:42',0),(135,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'hhhhhh',1,'',1,4,0,'2018-02-06 03:46:37',0,'2018-02-06 07:49:46',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-05 08:24:44',0),(17,1,'2018-01-01 13:00:00','2018-01-01 23:59:59',NULL,'fghjfghj',1,'',1,4,1,'2018-01-30 04:55:53',0,'2018-02-06 08:36:35',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 08:36:35',0),(191,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'giu con',1,'',1,4,0,'2018-02-06 08:18:32',0,'2018-02-06 08:19:54',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,0,'2018-02-05 08:28:43',0,'2018-02-06 08:42:00',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh',1,'',1,4,0,'2018-02-05 08:24:44',0,'2018-02-06 08:36:59',0),(17,1,'2018-01-01 13:00:00','2018-01-01 23:59:59',NULL,'fghjfghj',1,'',1,4,0,'2018-01-30 04:55:53',0,'2018-02-06 08:39:45',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-06 08:42:47',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh22',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-06 08:43:03',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-06 08:43:53',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh333',1,'',1,4,1,'2018-02-05 08:24:44',0,'2018-02-06 08:45:58',0),(193,1,'2018-02-12 08:00:00','2018-02-12 10:00:00',NULL,'dsfsdf',1,'',1,4,1,'2018-02-06 08:49:38',0,'2018-02-06 08:49:38',0),(193,1,'2018-02-12 08:10:00','2018-02-12 10:10:00',NULL,'xxxxxxxx',1,'',1,4,1,'2018-02-06 08:49:38',0,'2018-02-06 08:51:25',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-06 08:42:47',0),(136,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'ddddddd',1,'',1,4,1,'2018-02-06 03:49:34',0,'2018-02-06 03:49:34',0),(195,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'cccccccc',1,'',1,4,1,'2018-02-06 08:55:32',0,'2018-02-06 08:55:32',0),(195,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'cc',1,'',1,4,1,'2018-02-06 08:55:32',0,'2018-02-06 08:55:49',0),(195,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'cc',1,'',1,5,1,'2018-02-06 08:55:32',0,'2018-02-06 08:55:56',0),(196,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'cvcvcv',1,'',1,5,1,'2018-02-06 08:57:42',0,'2018-02-06 08:57:42',0),(200,4,'2018-02-12 08:00:00','2018-02-12 11:00:00',NULL,'cbxcvbcvbxcvb',1,'',1,5,1,'2018-02-06 09:22:38',0,'2018-02-06 09:22:38',0),(200,4,'2018-02-12 08:00:00','2018-02-12 11:00:00',NULL,'cbxcvbcv',1,'',1,5,1,'2018-02-06 09:22:38',0,'2018-02-06 09:23:20',0),(195,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'cc',1,'',1,5,1,'2018-02-06 08:55:32',0,'2018-02-06 08:56:07',0),(202,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'hhhhhh',1,'',1,4,1,'2018-02-06 09:45:06',0,'2018-02-06 09:45:06',0),(202,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'hhhhhhjjjj',1,'',1,4,1,'2018-02-06 09:45:06',0,'2018-02-06 09:45:36',0),(201,1,'2018-02-14 08:00:00','2018-02-14 09:00:00',NULL,'nnnnnnnn',1,'',1,4,1,'2018-02-06 09:37:37',0,'2018-02-06 09:37:37',0),(200,4,'2018-02-12 08:00:00','2018-02-12 12:00:00',NULL,'cbxcvbcv',1,'',1,5,1,'2018-02-06 09:22:38',0,'2018-02-06 09:24:31',0),(199,5,'2018-02-12 08:00:00','2018-02-12 11:00:00',NULL,'nnnnnnn',1,'',1,5,1,'2018-02-06 09:10:31',0,'2018-02-06 09:10:31',0),(198,5,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'fgdfgdfg',2,'',1,5,1,'2018-02-06 08:59:27',0,'2018-02-06 08:59:27',0),(197,4,'2018-02-06 08:00:00','2018-02-06 16:00:00',NULL,'cccccccc',5,'',1,5,1,'2018-02-06 08:58:25',0,'2018-02-06 08:58:25',0),(196,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'cvcvcv',5,'',1,5,1,'2018-02-06 08:57:42',0,'2018-02-06 08:58:12',0),(194,1,'2018-02-14 08:00:00','2018-02-14 17:00:00',NULL,'ccccccc',5,'',1,4,1,'2018-02-06 08:49:56',0,'2018-02-06 08:49:56',0),(195,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'ccnn',1,'',1,5,1,'2018-02-06 08:55:32',0,'2018-02-06 09:40:34',0),(193,1,'2018-02-12 08:10:00','2018-02-12 11:10:00',NULL,'xxxxxxxx',1,'',1,4,1,'2018-02-06 08:49:38',0,'2018-02-06 08:51:39',0),(192,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'nguyen binh thien',1,'',1,4,1,'2018-02-06 08:26:19',0,'2018-02-06 08:26:19',0),(191,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'giu con',1,'',1,4,1,'2018-02-06 08:18:32',0,'2018-02-06 08:42:47',0),(189,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'phai di cho',1,'',17,4,1,'2018-02-06 08:14:51',0,'2018-02-06 08:14:51',0),(190,1,'2018-02-04 08:00:00','2018-02-05 09:00:00',NULL,'sadfasdfasd',1,'',1,4,1,'2018-02-06 08:16:26',0,'2018-02-06 08:16:26',0),(141,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'tam chin',1,'',1,4,1,'2018-02-06 03:57:18',0,'2018-02-06 07:38:17',0),(140,1,'2018-02-06 08:00:00','2018-02-27 11:00:00',NULL,'1992',1,'',1,4,1,'2018-02-06 03:57:06',0,'2018-02-06 07:08:16',0),(139,1,'2018-01-29 08:15:00','2018-01-29 13:15:00',NULL,'ngay nghi',5,'',1,4,1,'2018-02-06 03:55:59',0,'2018-02-06 06:40:20',0),(204,1,'2018-02-21 08:00:00','2018-02-21 11:00:00',NULL,'33333',1,'',1,4,1,'2018-02-07 01:20:46',0,'2018-02-07 01:20:46',0),(204,1,'2018-02-21 08:00:00','2018-02-21 11:00:00',NULL,'333',1,'',1,4,1,'2018-02-07 01:20:46',0,'2018-02-07 01:21:08',0),(204,1,'2018-02-21 08:00:00','2018-02-21 12:00:00',NULL,'333',1,'',1,4,1,'2018-02-07 01:20:46',0,'2018-02-07 01:21:33',0),(205,1,'2018-03-21 08:00:00','2018-03-21 11:00:00',NULL,'hhhhhhh2222',1,'',1,5,1,'2018-02-07 01:32:48',0,'2018-02-07 01:32:48',0),(206,1,'2018-05-23 08:00:00','2018-05-23 09:00:00',NULL,'uityuityui',1,'',1,4,1,'2018-02-07 01:56:49',0,'2018-02-07 01:56:49',0),(135,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'hhhhhh',1,'',1,4,1,'2018-02-06 03:46:37',0,'2018-02-06 08:36:41',0),(106,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'sdsd',1,'',1,4,1,'2018-02-05 09:07:46',0,'2018-02-06 08:36:41',0),(106,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'snsd',1,'',1,4,1,'2018-02-05 09:07:46',0,'2018-02-07 03:06:18',0),(17,1,'2018-01-01 13:00:00','2018-01-01 23:59:59',NULL,'fghjfghj',1,'',1,4,1,'2018-01-30 04:55:53',0,'2018-02-06 08:42:47',0),(17,1,'2018-01-01 13:00:00','2018-01-01 15:00:00',NULL,'snsd',1,'',1,4,1,'2018-01-30 04:55:53',0,'2018-02-07 04:32:07',0),(17,1,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',1,'',1,4,1,'2018-01-30 04:55:53',0,'2018-02-07 04:32:22',0),(210,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'yuyuyuyu',1,'',1,5,1,'2018-02-07 04:34:38',0,'2018-02-07 04:34:38',0),(210,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'yuyuyuyu',1,'',1,5,1,'2018-02-07 04:34:38',0,'2018-02-07 04:36:18',0),(209,1,'2018-02-22 08:00:00','2018-02-22 11:00:00',NULL,'oooooo',1,'',1,5,1,'2018-02-07 04:33:05',0,'2018-02-07 04:33:05',0),(209,1,'2018-02-22 08:00:00','2018-02-22 12:00:00',NULL,'oooooo',1,'',1,5,1,'2018-02-07 04:33:05',0,'2018-02-07 04:37:34',0),(211,1,'2018-02-15 08:00:00','2018-02-15 09:00:00',NULL,'iiiiii',5,'',1,4,1,'2018-02-07 04:34:51',0,'2018-02-07 04:34:51',0),(210,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'yuyuyuyu',1,'',1,5,0,'2018-02-07 04:34:38',0,'2018-02-07 04:36:27',0),(209,1,'2018-02-22 08:00:00','2018-02-22 12:00:00',NULL,'oooooo',1,'',1,5,0,'2018-02-07 04:33:05',0,'2018-02-07 04:37:37',0),(208,1,'2018-02-13 09:00:00','2018-02-13 10:00:00',NULL,'4444444',1,'',1,4,1,'2018-02-07 04:32:50',0,'2018-02-07 04:32:50',0),(207,1,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'test',5,'',1,4,1,'2018-02-07 02:00:58',0,'2018-02-07 02:00:58',0),(206,1,'2018-05-23 08:00:00','2018-05-23 09:00:00',NULL,'uityuityui',5,'',1,4,1,'2018-02-07 01:56:49',0,'2018-02-07 01:57:45',0),(137,1,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'di cho',1,'',1,4,1,'2018-02-06 03:51:15',0,'2018-02-06 07:34:41',0),(205,1,'2018-03-21 08:00:00','2018-03-21 11:00:00',NULL,'hhhhhhh2222',5,'',1,5,1,'2018-02-07 01:32:48',0,'2018-02-07 01:57:38',0),(204,1,'2018-02-21 08:00:00','2018-02-21 12:00:00',NULL,'333',1,'',1,4,0,'2018-02-07 01:20:46',0,'2018-02-07 01:21:46',0),(203,1,'2018-02-05 08:00:00','2018-03-02 08:00:00',NULL,'222222',1,'',1,4,1,'2018-02-07 01:19:45',0,'2018-02-07 01:19:45',0),(138,1,'2018-01-31 08:00:00','2018-01-31 10:00:00',NULL,'khong biet',1,'',1,4,1,'2018-02-06 03:55:11',0,'2018-02-06 07:09:16',0),(136,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'323232',1,'',1,4,1,'2018-02-06 03:49:34',0,'2018-02-06 08:53:19',0),(135,1,'2018-02-05 08:00:00','2018-02-05 13:00:00',NULL,'hhhhhh',1,'',1,4,0,'2018-02-06 03:46:37',0,'2018-02-07 03:06:00',0),(106,1,'2018-01-30 08:00:00','2018-02-27 08:00:00',NULL,'snsd',1,'',1,4,0,'2018-02-05 09:07:46',0,'2018-02-07 03:06:38',0),(212,1,'2018-02-06 08:00:00','2018-02-26 08:00:00',NULL,'sssss',1,'',1,5,1,'2018-02-07 04:46:25',0,'2018-02-07 04:46:25',0),(212,1,'2018-02-26 08:00:00','2018-02-27 08:00:00',NULL,'nhi cao',1,'',16,5,1,'2018-02-07 04:46:25',0,'2018-02-07 04:47:36',0),(212,1,'2018-02-26 08:00:00','2018-02-28 08:00:00',NULL,'nhi cao hai',1,'',2,5,1,'2018-02-07 04:46:25',0,'2018-02-07 04:48:04',0),(12,1,'2017-03-30 14:30:00','2017-03-30 16:30:00',NULL,'đón con 123',1,'ok',16,5,1,'2018-01-26 06:41:23',0,'2018-01-29 04:33:34',0),(15,1,'2018-01-01 10:00:00','2018-01-01 11:10:00',NULL,'thuc khuya',5,'',1,4,1,'2018-01-30 01:58:28',0,'2018-02-05 07:22:10',0),(17,1,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',1,'',1,4,0,'2018-01-30 04:55:53',0,'2018-02-07 04:32:29',0),(19,1,'2017-01-01 09:15:00','2018-12-30 13:15:00',NULL,'chi do',1,'',4,5,1,'2018-01-31 02:13:26',0,'2018-02-06 08:35:44',0),(8,1,'2017-05-02 14:30:00','2017-05-02 17:00:00',NULL,'thăm đau',1,'ukm',16,5,1,'2018-01-26 04:34:07',0,'2018-02-05 04:32:30',0),(76,1,'2018-01-30 10:00:00','2018-02-21 08:15:00',NULL,'khong di lam duoc',2,'',15,4,1,'2018-02-05 08:22:19',0,'2018-02-06 01:16:19',0),(17,5,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',1,'',1,4,0,'2018-01-30 04:55:53',0,'2018-02-07 05:04:25',0),(17,5,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',1,'',1,5,0,'2018-01-30 04:55:53',0,'2018-02-07 07:48:35',0),(17,5,'2018-01-01 13:00:00','2018-01-01 17:00:00',NULL,'snsd',2,'',1,5,0,'2018-01-30 04:55:53',0,'2018-02-07 07:48:49',0),(81,1,'2018-02-13 08:00:00','2018-03-14 08:00:00',NULL,'11',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-05 09:47:22',0),(81,1,'2018-02-13 08:00:00','2018-03-14 09:00:00',NULL,'1122',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-07 08:01:07',0),(214,1,'2018-02-12 08:00:00','2018-02-12 09:00:00',NULL,'ccccccrrrrrrrr',1,'',20,5,1,'2018-02-07 07:55:33',0,'2018-02-07 07:55:33',0),(213,1,'2018-02-07 08:00:00','2018-02-08 09:00:00',NULL,'opjiopjiop',1,'',1,4,1,'2018-02-07 04:49:22',0,'2018-02-07 04:49:22',0),(213,1,'2018-02-07 08:00:00','2018-02-08 09:00:00',NULL,'opjiopjiop',1,'',6,4,1,'2018-02-07 04:49:22',0,'2018-02-07 08:02:41',0),(213,1,'2018-02-07 08:00:00','2018-02-08 09:00:00',NULL,'opjiopjiop',1,'',6,5,1,'2018-02-07 04:49:22',0,'2018-02-07 08:02:46',0),(213,1,'2018-02-07 08:05:00','2018-02-08 09:05:00',NULL,'opjiopjiop',1,'',6,5,1,'2018-02-07 04:49:22',0,'2018-02-07 08:02:57',0),(213,1,'2018-02-07 08:05:00','2018-02-08 09:05:00',NULL,'oi duoc',1,'',6,5,1,'2018-02-07 04:49:22',0,'2018-02-07 08:03:28',0),(81,1,'2018-02-13 08:00:00','2018-02-14 09:00:00',NULL,'1122',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-07 08:01:47',0),(81,1,'2018-02-13 08:00:00','2018-02-14 09:00:00',NULL,'112233',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-07 08:07:16',0),(81,1,'2018-02-13 08:00:00','2018-02-14 10:00:00',NULL,'112233',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-07 08:07:22',0),(215,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'111111111',1,'',1,4,1,'2018-02-07 08:15:08',0,'2018-02-07 08:15:08',0),(216,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'yyyyyy',1,'',1,4,1,'2018-02-07 08:16:18',0,'2018-02-07 08:16:18',0),(217,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'uuuuu',1,'',1,4,1,'2018-02-07 08:57:01',0,'2018-02-07 08:57:01',0),(217,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'uuuuulllllllll',1,'',1,4,1,'2018-02-07 08:57:01',0,'2018-02-07 08:57:13',0),(217,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'uuuuulllllllll',1,'',1,4,0,'2018-02-07 08:57:01',0,'2018-02-07 08:57:22',0),(218,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'yyyyyyy',1,'',1,4,1,'2018-02-07 09:01:10',0,'2018-02-07 09:01:10',0),(218,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'yyyyyyy',1,'',1,4,0,'2018-02-07 09:01:10',0,'2018-02-07 09:01:24',0),(219,1,'2018-02-05 08:00:00','2018-02-26 08:00:00',NULL,'12121212',1,'',1,4,1,'2018-02-07 09:03:40',0,'2018-02-07 09:03:40',0),(219,1,'2018-02-05 08:00:00','2018-02-26 08:00:00',NULL,'1212121225252',1,'',1,4,1,'2018-02-07 09:03:40',0,'2018-02-07 09:04:13',0),(219,1,'2018-02-05 08:00:00','2018-02-26 09:00:00',NULL,'1212121225252',1,'',1,4,1,'2018-02-07 09:03:40',0,'2018-02-07 09:04:21',0),(219,1,'2018-02-05 08:00:00','2018-02-26 09:00:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-07 09:04:29',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-07 09:04:47',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',5,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-07 09:04:52',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-07 09:05:09',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',1,'',3,5,0,'2018-02-07 09:03:40',0,'2018-02-07 09:05:24',0),(220,2,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'21212121',1,'',1,4,1,'2018-02-08 01:24:59',0,'2018-02-08 01:24:59',0),(79,1,'2018-02-06 08:00:00','2018-02-22 08:00:00',NULL,'hhh333',1,'',1,4,0,'2018-02-05 08:24:44',0,'2018-02-06 08:46:14',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,0,'2018-02-05 08:28:43',0,'2018-02-06 08:52:13',0),(81,1,'2018-02-13 08:00:00','2018-02-14 10:00:00',NULL,'112233',1,'',6,4,0,'2018-02-05 08:30:34',0,'2018-02-07 08:07:39',0),(212,1,'2018-02-26 08:00:00','2018-02-28 08:00:00',NULL,'nhi cao hai',1,'',2,5,0,'2018-02-07 04:46:25',0,'2018-02-07 04:48:26',0),(214,1,'2018-02-12 08:00:00','2018-02-12 09:00:00',NULL,'ccccccrrrrrrrr',1,'',20,5,0,'2018-02-07 07:55:33',0,'2018-02-07 08:02:26',0),(215,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'111111111',1,'',1,4,0,'2018-02-07 08:15:08',0,'2018-02-07 08:15:19',0),(216,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'yyyyyy',1,'',1,4,0,'2018-02-07 08:16:18',0,'2018-02-07 08:56:46',0),(217,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'uuuuulllllllll',1,'',1,4,0,'2018-02-07 08:57:01',0,'2018-02-07 08:57:22',0),(218,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'yyyyyyy',1,'',1,4,0,'2018-02-07 09:01:10',0,'2018-02-07 09:01:24',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',1,'',3,5,0,'2018-02-07 09:03:40',0,'2018-02-07 09:05:24',0),(217,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'uuuuulllllllll',1,'',1,4,1,'2018-02-07 08:57:01',0,'2018-02-08 03:18:29',0),(217,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'uuuuulll',1,'',1,4,1,'2018-02-07 08:57:01',0,'2018-02-08 03:19:35',0),(219,1,'2018-02-05 08:20:00','2018-02-26 09:20:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-08 03:18:29',0),(219,1,'2018-02-05 08:20:00','2018-02-05 09:20:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-08 03:22:24',0),(219,1,'2018-02-05 08:20:00','2018-02-05 09:20:00',NULL,'1212121225252',1,'',3,5,0,'2018-02-07 09:03:40',0,'2018-02-08 03:22:31',0),(219,1,'2018-02-05 08:20:00','2018-02-05 09:20:00',NULL,'1212121225252',1,'',3,5,1,'2018-02-07 09:03:40',0,'2018-02-08 03:22:59',0),(5,1,'2016-12-31 10:00:00','2017-01-02 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-05 04:32:30',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:18:54',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:20:57',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:34:58',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:35:38',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:36:10',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:40:36',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 04:43:21',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'phai đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:09:38',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:10:58',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:14:43',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:15:10',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:15:41',0),(5,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:18:44',0),(5,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'đưa con đi khám bệnh',1,'commit code',16,4,1,'2018-01-22 09:24:59',0,'2018-02-08 06:19:17',0),(225,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:21:09',0),(225,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,0,'2018-02-08 06:21:09',0,'2018-02-08 06:26:31',0),(225,1,'2018-12-31 07:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,0,'2018-02-08 06:21:09',0,'2018-02-08 06:44:32',0),(225,1,'2018-12-31 08:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,0,'2018-02-08 06:21:09',0,'2018-02-08 06:45:36',0),(225,1,'2018-12-31 07:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:46:36',0),(225,1,'2018-12-31 08:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:47:43',0),(225,1,'2018-12-31 09:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:51:24',0),(225,1,'2018-12-31 07:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:53:09',0),(225,1,'2018-12-31 09:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:54:29',0),(225,1,'2018-12-31 08:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:55:40',0),(214,1,'2018-02-12 08:00:00','2018-02-12 09:00:00',NULL,'ccccccrrrrrrrr',1,'',20,5,1,'2018-02-07 07:55:33',0,'2018-02-08 03:18:29',0),(215,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'111111111',1,'',1,4,1,'2018-02-07 08:15:08',0,'2018-02-08 03:18:29',0),(216,1,'2018-02-06 08:00:00','2018-02-06 11:00:00',NULL,'yyyyyy',1,'',1,4,1,'2018-02-07 08:16:18',0,'2018-02-08 03:18:29',0),(217,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'uuuuulll',1,'',1,4,1,'2018-02-07 08:57:01',0,'2018-02-08 03:19:41',0),(218,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'yyyyyyy',1,'',1,4,1,'2018-02-07 09:01:10',0,'2018-02-08 03:18:29',0),(219,1,'2018-02-05 08:20:00','2018-02-05 09:20:00',NULL,'1212121225252',1,'',3,5,0,'2018-02-07 09:03:40',0,'2018-02-08 03:23:17',0),(220,2,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'2121',1,'',1,4,1,'2018-02-08 01:24:59',0,'2018-02-08 01:25:09',0),(221,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 05:51:06',0,'2018-02-08 05:51:06',0),(222,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:00:24',0,'2018-02-08 06:00:24',0),(223,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'phai đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:08:25',0,'2018-02-08 06:08:25',0),(224,1,'2018-12-31 10:00:00','2018-12-31 11:00:00',NULL,'phai đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:09:07',0,'2018-02-08 06:09:07',0),(225,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'đưa con đi khám bệnh',1,'',16,4,1,'2018-02-08 06:21:09',0,'2018-02-08 06:56:38',0),(213,1,'2018-02-07 08:05:00','2018-02-08 10:05:00',NULL,'oi duoc',1,'',6,5,1,'2018-02-07 04:49:22',0,'2018-02-07 08:03:57',0),(213,1,'2018-02-07 08:05:00','2018-02-08 10:05:00',NULL,'oi duoc',1,'',6,5,0,'2018-02-07 04:49:22',0,'2018-02-08 06:59:44',0),(213,1,'2018-02-07 08:05:00','2018-02-08 10:05:00',NULL,'oi duoc',1,'',6,5,1,'2018-02-07 04:49:22',0,'2018-02-08 07:01:30',0),(226,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'',1,'',4,4,1,'2018-02-08 06:58:30',0,'2018-02-08 06:58:30',0),(80,1,'2018-01-29 08:00:00','2018-01-29 14:00:00',NULL,'1111111',1,'',24,4,1,'2018-02-05 08:28:43',0,'2018-02-08 03:18:29',0),(212,1,'2018-02-26 08:00:00','2018-02-28 08:00:00',NULL,'nhi cao hai',1,'',2,5,1,'2018-02-07 04:46:25',0,'2018-02-08 03:18:29',0),(81,1,'2018-02-13 08:00:00','2018-02-14 10:00:00',NULL,'112233',1,'',6,4,1,'2018-02-05 08:30:34',0,'2018-02-08 03:18:29',0),(78,1,'2018-03-15 10:00:00','2018-03-15 12:00:00',NULL,'bi om roi',1,'',1,4,1,'2018-02-05 08:24:29',0,'2018-02-05 09:28:26',0),(227,1,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'test',1,'',1,4,1,'2018-02-09 01:07:49',0,'2018-02-09 01:07:49',0),(226,1,'2018-12-31 10:00:00','2018-12-31 12:00:00',NULL,'',1,'',4,4,0,'2018-02-08 06:58:30',0,'2018-02-08 07:05:38',0),(213,1,'2018-02-07 08:05:00','2018-02-08 10:05:00',NULL,'oi duoc',1,'',6,5,0,'2018-02-07 04:49:22',0,'2018-02-08 07:02:46',0),(212,1,'2018-02-26 08:00:00','2018-02-27 08:00:00',NULL,'nhi cao hai',1,'',2,5,1,'2018-02-07 04:46:25',0,'2018-02-08 07:13:08',0),(228,1,'2018-02-09 14:00:00','2018-02-09 15:00:00',NULL,'112121212',1,'',5,5,1,'2018-02-09 03:57:58',0,'2018-02-09 03:57:58',0),(228,1,'2018-02-09 14:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,1,'2018-02-09 03:57:58',0,'2018-02-09 03:59:02',0),(228,1,'2018-02-09 14:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,0,'2018-02-09 03:57:58',0,'2018-02-09 03:59:50',0),(228,1,'2018-02-09 14:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,1,'2018-02-09 03:57:58',0,'2018-02-09 04:41:53',0),(228,1,'2018-02-09 14:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,0,'2018-02-09 03:57:58',0,'2018-02-09 04:42:25',0),(228,1,'2018-02-09 14:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,1,'2018-02-09 03:57:58',0,'2018-02-09 04:43:53',0),(230,1,'2018-02-09 15:00:00','2018-02-09 16:00:00',NULL,'yyyy',1,'',6,5,1,'2018-02-09 04:46:17',0,'2018-02-09 04:46:17',0),(230,1,'2018-02-09 15:00:00','2018-02-09 16:00:00',NULL,'yyyy',5,'',6,5,1,'2018-02-09 04:46:17',0,'2018-02-09 04:47:29',0),(230,1,'2018-02-09 15:00:00','2018-02-09 16:00:00',NULL,'yyyy',3,'',6,5,1,'2018-02-09 04:46:17',0,'2018-02-09 04:48:15',0),(230,1,'2018-02-09 15:00:00','2018-02-09 16:00:00',NULL,'hgfghjfghj',3,'fghjfghj',6,5,1,'2018-02-09 04:46:17',0,'2018-02-09 04:50:09',0),(230,1,'2018-02-07 12:02:42','2018-02-07 12:02:42',NULL,'qqqqqqq',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-09 04:51:50',0),(230,1,'2018-02-07 12:02:42','2018-02-07 12:02:42',NULL,'nghi tet',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:33:00',0),(230,1,'2018-02-07 10:00:00','2018-02-07 12:00:00',NULL,'nghi tet',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:34:40',0),(230,1,'2018-02-07 11:00:00','2018-02-07 12:00:00',NULL,'di lam lai',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:35:54',0),(230,1,'2018-02-07 10:00:00','2018-02-07 12:00:00',NULL,'di lam lai',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:36:54',0),(230,1,'2018-02-07 10:00:00','2018-02-07 12:00:00',NULL,'di lam lajjjjjji',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:37:44',0),(230,1,'2018-02-07 10:00:00','2018-02-07 12:00:00',NULL,'di lam l',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:38:16',0),(230,1,'2018-02-07 10:00:00','2018-02-07 12:00:00',NULL,'di lamdfdfdf l',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:39:03',0),(230,1,'2018-02-07 11:00:00','2018-02-07 12:00:00',NULL,'nghi tet',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:42:37',0),(230,1,'2018-02-07 11:00:00','2018-02-07 12:00:00',NULL,'nghi tet vvvvvvvvvvv',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:43:19',0),(230,1,'2018-02-07 08:00:00','2018-02-07 12:00:00',NULL,'nghi tet vvvvvvvvvvv',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:44:04',0),(230,1,'2018-02-07 08:00:00','2018-02-07 12:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:44:38',0),(233,1,'2018-02-07 08:00:00','2018-02-07 10:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-26 02:47:21',0,'2018-02-26 02:47:21',0),(232,1,'2018-02-07 08:00:00','2018-02-07 10:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-26 02:46:53',0,'2018-02-26 02:46:53',0),(231,1,'2018-02-07 08:00:00','2018-02-07 10:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-26 02:46:08',0,'2018-02-26 02:46:08',0),(230,2,'2018-02-07 08:00:00','2018-02-07 12:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:53:10',0),(238,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'cvcvcv',1,'',1,5,1,'2018-02-26 08:53:00',0,'2018-02-26 08:53:00',0),(237,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'iiiiiiiii',5,'',1,4,1,'2018-02-26 08:08:02',0,'2018-02-26 08:08:02',0),(236,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'uuuuuuu',1,'',1,5,1,'2018-02-26 08:07:36',0,'2018-02-26 08:07:36',0),(235,1,'2018-02-13 08:00:00','2018-02-13 09:00:00',NULL,'hhh',1,'',1,4,1,'2018-02-26 08:06:27',0,'2018-02-26 08:06:27',0),(234,1,'2018-02-23 08:00:00','2018-02-23 10:00:00',NULL,'cccccccccccccc',1,'',4,5,1,'2018-02-26 07:58:27',0,'2018-02-26 07:58:27',0),(229,1,'2018-02-09 15:00:00','2018-02-09 16:00:00',NULL,'yyyy',1,'',6,5,1,'2018-02-09 04:45:10',0,'2018-02-09 04:45:10',0),(230,2,'2018-02-07 08:00:00','2018-02-07 10:00:00',NULL,'nghi tet di',2,'eeeeeee',2,4,1,'2018-02-09 04:46:17',0,'2018-02-26 02:54:15',0),(228,1,'2018-02-09 15:00:00','2018-02-09 17:00:00',NULL,'new',1,'',5,5,1,'2018-02-09 03:57:58',0,'2018-02-09 04:44:21',0),(77,1,'2019-02-12 08:00:00','2019-03-05 08:00:00',NULL,'22',1,'',1,4,1,'2018-02-05 08:23:59',0,'2018-02-06 01:29:48',0),(78,1,'2018-03-15 10:00:00','2018-03-15 12:00:00',NULL,'bi om roi',1,'',1,4,0,'2018-02-05 08:24:29',0,'2018-02-08 07:32:13',0),(239,1,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'uiuiui',1,'',1,4,1,'2018-02-26 09:43:06',0,'2018-02-26 09:43:06',0),(240,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'vvvvvvvvvv',1,'',1,4,1,'2018-02-27 01:39:34',0,'2018-02-27 01:39:34',0),(240,1,'2018-02-05 08:00:00','2018-02-05 11:00:00',NULL,'vvvvvvvvvv99',1,'',1,4,1,'2018-02-27 01:39:34',0,'2018-02-27 03:21:22',0),(240,1,'2018-02-05 08:00:00','2018-02-05 12:00:00',NULL,'vvvvvvvvvv99',1,'',1,4,1,'2018-02-27 01:39:34',0,'2018-02-27 03:23:57',0),(240,1,'2018-02-05 08:00:00','2018-02-05 09:00:00',NULL,'vvvvvvvvvv99',1,'',1,4,1,'2018-02-27 01:39:34',0,'2018-02-27 03:24:05',0),(240,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'vvvvvvvvvv99',1,'',1,4,1,'2018-02-27 01:39:34',0,'2018-02-27 03:27:28',0),(240,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'vvvvvvvvvv99',1,'',1,4,0,'2018-02-27 01:39:34',0,'2018-02-27 03:27:40',0),(240,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'vvvvvvvvvv99',1,'aaa',1,4,0,'2018-02-27 01:39:34',0,'2018-02-27 04:00:58',0),(240,1,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'vvvvvvvvvv99',1,'aaaff',1,4,0,'2018-02-27 01:39:34',0,'2018-02-27 04:01:37',0),(16,1,'2015-01-01 01:00:00','2015-01-01 02:00:00',NULL,'fghfgdhioiccvnhi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-06 08:36:35',0),(16,1,'2015-01-01 01:00:00','2015-01-01 02:00:00',NULL,'nam moi',1,'',1,4,1,'2018-01-30 01:59:19',0,'2018-02-27 04:05:29',0),(239,5,'2018-02-06 08:00:00','2018-02-06 09:00:00',NULL,'uiuiui',1,'',1,4,1,'2018-02-26 09:43:06',0,'2018-02-27 03:10:53',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_DEPARTMENT_MANAGER',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(2,'ROLE_HR_MAMAGER_',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(3,'ROLE_LEADER',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(4,'ROLE_HR',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(5,'ROLE_EMPLOYEE',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0),(6,'ROLE_ADMIN',1,'2018-01-19 03:44:24',0,'2018-01-19 03:44:24',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`role_BEFORE_INSERT` BEFORE INSERT ON `role` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`role_BEFORE_UPDATE` BEFORE UPDATE ON `role` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`role_BEFORE_DELETE` BEFORE DELETE ON `role` FOR EACH ROW
BEGIN
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
INSERT INTO `role_hist` VALUES (7,'2132',1,'2018-01-19 03:52:44',0,'2018-01-19 03:52:44',0),(7,'213223',1,'2018-01-19 03:52:44',0,'2018-01-19 03:52:47',0);
/*!40000 ALTER TABLE `role_hist` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',0,'2018-01-10 07:30:31',0),(6,'new team',12,1,1,'2018-01-05 06:36:21',0,'2018-01-22 02:44:18',0);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_BEFORE_INSERT` BEFORE INSERT ON `team` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_BEFORE_UPDATE` BEFORE UPDATE ON `team` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_BEFORE_DELETE` BEFORE DELETE ON `team` FOR EACH ROW
BEGIN
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
INSERT INTO `team_employee` VALUES (1,1,1,'2018-01-05 06:36:42',0,'2018-01-11 03:04:12',0),(1,2,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0),(1,3,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0);
/*!40000 ALTER TABLE `team_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_employee_BEFORE_INSERT` BEFORE INSERT ON `team_employee` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_employee_BEFORE_UPDATE` BEFORE UPDATE ON `team_employee` FOR EACH ROW
BEGIN
	INSERT INTO team_employee_hist values(OLD.team_id, OLD.employee_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_off`.`team_employee_BEFORE_DELETE` BEFORE DELETE ON `team_employee` FOR EACH ROW
BEGIN
	INSERT INTO team_employee_hist values(OLD.team_id, OLD.employee_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_employee_hist`
--

LOCK TABLES `team_employee_hist` WRITE;
/*!40000 ALTER TABLE `team_employee_hist` DISABLE KEYS */;
INSERT INTO `team_employee_hist` VALUES (1,1,1,'2018-01-05 06:36:42',NULL,'2018-01-05 06:36:42',NULL),(1,2,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL),(1,3,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL),(1,4,1,'2018-02-26 07:08:37',0,'2018-02-26 07:08:37',0);
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
INSERT INTO `team_hist` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',NULL,'2018-01-05 06:36:21',NULL),(2,'new team',12,1,0,'2018-01-10 07:59:18',0,'2018-01-10 07:59:18',0),(3,'new team',12,1,0,'2018-01-10 08:03:34',0,'2018-01-10 08:03:34',0),(4,'new team',12,1,1,'2018-01-10 08:10:00',0,'2018-01-10 08:10:00',0),(5,'new team',12,1,1,'2018-01-10 08:12:31',0,'2018-01-10 08:12:31',0),(6,'new team',12,1,1,'2018-01-10 08:33:11',0,'2018-01-10 08:33:11',0),(6,'new team_update',12,2,1,'2018-01-10 08:33:31',0,'2018-01-10 08:33:31',0),(7,'new team2',12,2,1,'2018-01-10 08:34:34',0,'2018-01-10 08:34:34',0),(7,'new team2_update',12,3,1,'2018-01-11 02:10:50',0,'2018-01-11 02:10:50',0),(7,'new team2_update',13,3,1,'2018-01-16 06:51:42',0,'2018-01-11 02:10:50',0),(7,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-11 02:10:50',0),(8,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-16 06:52:10',0),(6,'new team',12,1,1,'2018-01-22 02:44:18',0,'2018-01-10 08:33:31',0),(9,'new te',31,3,0,'2018-01-22 02:46:25',0,'2018-01-22 02:46:25',0),(10,'new te',21,3,0,'2018-01-22 02:48:34',0,'2018-01-22 02:48:34',0),(10,'new te1',21,3,0,'2018-01-22 03:37:24',0,'2018-01-22 02:48:34',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(12,'team updasdsdsdc',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:42:20',0),(14,'thuc nhu',2,1,0,'2018-01-22 05:56:31',0,'2018-01-22 05:56:31',0),(12,'new new new',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:54:20',0),(11,'team upd12312312312312dc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:33',0),(10,'team updated',21,3,0,'2018-01-22 08:29:23',0,'2018-01-22 02:48:34',0),(19,'e',12,NULL,1,'2018-01-22 08:32:21',0,'2018-01-22 08:32:21',0),(20,'hien',2,1,1,'2018-01-22 09:10:13',0,'2018-01-22 09:10:13',0),(21,'hien phamcccc',2,2,1,'2018-01-22 09:19:00',0,'2018-01-22 09:19:00',0),(20,'hien pham',2,1,1,'2018-01-22 09:10:13',0,'2018-01-22 09:11:07',0);
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

-- Dump completed on 2018-02-27 11:24:08
