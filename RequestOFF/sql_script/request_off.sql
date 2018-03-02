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
INSERT INTO `company_year_off` VALUES (2017,0,1,1,'2018-01-16 03:54:20',0,'2018-01-16 03:54:20',0),(2018,0,1,1,'2018-01-11 08:34:32',0,'2018-01-11 08:34:32',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off_type`
--

LOCK TABLES `day_off_type` WRITE;
/*!40000 ALTER TABLE `day_off_type` DISABLE KEYS */;
INSERT INTO `day_off_type` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(22,'Khám thai',1,1,'2018-01-05 06:25:20',0,'2018-02-02 03:46:28',0),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(200,'Khám bệnh',1,1,'2018-02-02 03:47:50',0,'2018-02-02 03:48:43',0);
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
INSERT INTO `day_off_type_hist` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:26:20',NULL),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(22,'Khám thai',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(195,'abc',0,0,'2018-01-22 09:19:59',0,'2018-01-22 09:19:59',0),(196,'ddddd',0,0,'2018-01-22 09:20:27',0,'2018-01-22 09:20:27',0),(197,'aaaa',0,0,'2018-01-22 09:29:32',0,'2018-01-22 09:29:32',0),(197,'addddaaa',0,0,'2018-01-22 09:29:32',0,'2018-01-22 09:30:21',0),(198,'addddaaa',0,0,'2018-01-26 09:28:07',0,'2018-01-26 09:28:07',0),(199,'addddaaa',0,0,'2018-01-26 09:30:33',0,'2018-01-26 09:30:33',0),(22,'Khám thai',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(22,'dau',1,1,'2018-01-05 06:25:20',0,'2018-02-02 03:45:29',0),(200,'Khám thai',1,1,'2018-02-02 03:47:50',0,'2018-02-02 03:47:50',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(2,'PHP',9,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(3,'Ruby',10,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(6,'Android',35,1,'2018-02-08 09:45:34',0,'2018-03-01 08:14:08',0),(55,'department4',22,1,'2018-03-02 01:22:36',0,'2018-03-02 01:22:36',0),(57,'kamita',8,1,'2018-03-02 01:47:48',0,'2018-03-02 01:48:00',0);
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
INSERT INTO `department_hist` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(2,'PHP',9,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(3,'Ruby',10,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(4,'QC',8,1,'2018-01-05 04:02:59',NULL,'2018-01-05 04:02:59',NULL),(5,'iOS',11,1,'2018-01-05 04:04:16',NULL,'2018-01-05 04:04:16',NULL),(6,'abc',4,1,'2018-02-08 04:43:07',0,'2018-02-08 04:43:07',0),(7,'abc',4,1,'2018-02-08 04:44:05',0,'2018-02-08 04:44:05',0),(8,'abc',4,0,'2018-02-08 04:44:25',0,'2018-02-08 04:44:25',0),(9,'abcd',4,0,'2018-02-08 04:50:35',0,'2018-02-08 04:50:35',0),(10,'abcd',4,0,'2018-02-08 04:50:57',0,'2018-02-08 04:50:57',0),(11,'',4,0,'2018-02-08 06:04:28',0,'2018-02-08 06:04:28',0),(12,'',4,0,'2018-02-08 06:04:58',0,'2018-02-08 06:04:58',0),(13,'',4,0,'2018-02-08 06:08:15',0,'2018-02-08 06:08:15',0),(14,'',4,0,'2018-02-08 06:08:53',0,'2018-02-08 06:08:53',0),(15,'',4,0,'2018-02-08 06:20:02',0,'2018-02-08 06:20:02',0),(16,'',4,0,'2018-02-08 06:20:45',0,'2018-02-08 06:20:45',0),(17,'',4,0,'2018-02-08 06:22:16',0,'2018-02-08 06:22:16',0),(18,'',4,0,'2018-02-08 06:22:54',0,'2018-02-08 06:22:54',0),(19,'',4,0,'2018-02-08 06:23:41',0,'2018-02-08 06:23:41',0),(20,'',4,0,'2018-02-08 06:26:52',0,'2018-02-08 06:26:52',0),(21,'',4,0,'2018-02-08 06:28:23',0,'2018-02-08 06:28:23',0),(22,'',4,0,'2018-02-08 06:28:54',0,'2018-02-08 06:28:54',0),(23,'',4,0,'2018-02-08 06:29:02',0,'2018-02-08 06:29:02',0),(24,'abc',4,0,'2018-02-08 06:34:29',0,'2018-02-08 06:34:29',0),(25,'aa',4,0,'2018-02-08 06:35:52',0,'2018-02-08 06:35:52',0),(26,'sss',4,0,'2018-02-08 06:36:58',0,'2018-02-08 06:36:58',0),(27,'qq',1,0,'2018-02-08 06:37:37',0,'2018-02-08 06:37:37',0),(28,'ww',2,0,'2018-02-08 06:38:22',0,'2018-02-08 06:38:22',0),(29,'qqq',1,0,'2018-02-08 09:11:35',0,'2018-02-08 09:11:35',0),(30,'qq',1,0,'2018-02-08 09:16:27',0,'2018-02-08 09:16:27',0),(31,'ww',1,0,'2018-02-08 09:18:04',0,'2018-02-08 09:18:04',0),(32,'zz',1,0,'2018-02-08 09:18:35',0,'2018-02-08 09:18:35',0),(33,'rrrr',2,0,'2018-02-08 09:22:57',0,'2018-02-08 09:22:57',0),(34,'qq',1,1,'2018-02-08 09:38:28',0,'2018-02-08 09:38:28',0),(35,'qq',1,1,'2018-02-08 09:39:07',0,'2018-02-08 09:39:07',0),(36,'qq',1,1,'2018-02-08 09:40:14',0,'2018-02-08 09:40:14',0),(37,'qqq',3,1,'2018-02-08 09:40:25',0,'2018-02-08 09:40:25',0),(38,'abcd',4,1,'2018-02-08 09:45:34',0,'2018-02-08 09:45:34',0),(38,'abcdeeeeeeee',4,1,'2018-02-08 09:45:34',0,'2018-02-08 09:47:49',0),(38,'Android',4,1,'2018-02-08 09:45:34',0,'2018-02-28 02:10:07',0),(6,'Android',4,1,'2018-02-08 09:45:34',0,'2018-02-28 02:14:42',0),(6,'Android',34,1,'2018-02-08 09:45:34',0,'2018-02-28 02:35:09',0),(6,'Android',22,1,'2018-02-08 09:45:34',0,'2018-03-01 08:13:01',0),(6,'Android',35,1,'2018-02-08 09:45:34',0,'2018-03-01 08:13:51',0),(6,'Android xxx',35,1,'2018-02-08 09:45:34',0,'2018-03-01 08:14:03',0),(41,'department4',NULL,1,'2018-03-01 09:24:49',0,'2018-03-01 09:24:49',0),(42,'department4',NULL,1,'2018-03-01 09:35:21',0,'2018-03-01 09:35:21',0),(41,'department4',NULL,1,'2018-03-01 09:44:48',0,'2018-03-01 09:44:48',0),(43,'department4',NULL,1,'2018-03-01 09:49:57',0,'2018-03-01 09:49:57',0),(42,'department5',NULL,1,'2018-03-01 09:51:24',0,'2018-03-01 09:51:24',0),(44,'department5',NULL,1,'2018-03-01 09:57:23',0,'2018-03-01 09:57:23',0),(4,'QC',8,1,'2018-01-05 04:02:59',0,'2018-01-10 07:30:06',0),(45,'QC',8,1,'2018-03-01 09:57:32',0,'2018-03-01 09:57:32',0),(40,'department3',23,1,'2018-03-01 08:28:53',0,'2018-03-01 08:28:53',0),(46,'department3',23,1,'2018-03-01 09:57:44',0,'2018-03-01 09:57:44',0),(39,'dept3',22,1,'2018-03-01 08:27:44',0,'2018-03-01 08:27:44',0),(47,'dept3',22,1,'2018-03-01 09:57:48',0,'2018-03-01 09:57:48',0),(5,'iOS',11,1,'2018-01-05 04:04:16',0,'2018-01-10 07:30:06',0),(48,'iOS',11,1,'2018-03-01 09:57:56',0,'2018-03-01 09:57:56',0),(41,'department4',NULL,1,'2018-03-01 09:51:24',0,'2018-03-01 09:51:24',0),(49,'department4',NULL,1,'2018-03-01 10:03:58',0,'2018-03-01 10:03:58',0),(43,'department6',NULL,1,'2018-03-01 09:51:24',0,'2018-03-01 09:51:24',0),(50,'department6',NULL,1,'2018-03-01 10:04:01',0,'2018-03-01 10:04:01',0),(51,'aaa',22,1,'2018-03-01 10:04:28',0,'2018-03-01 10:04:28',0),(52,'aaa',22,1,'2018-03-01 10:04:32',0,'2018-03-01 10:04:32',0),(53,'',22,1,'2018-03-02 01:22:01',0,'2018-03-02 01:22:01',0),(54,'',22,1,'2018-03-02 01:22:24',0,'2018-03-02 01:22:24',0),(56,'',23,1,'2018-03-02 01:25:55',0,'2018-03-02 01:25:55',0),(57,'kamita',8,1,'2018-03-02 01:47:48',0,'2018-03-02 01:47:48',0),(57,'kamita',34,1,'2018-03-02 01:47:48',0,'2018-03-02 01:47:55',0),(56,'sdfsdfsd',23,1,'2018-03-02 01:25:55',0,'2018-03-02 01:47:24',0),(58,'',23,1,'2018-03-02 01:59:36',0,'2018-03-02 01:59:36',0);
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
  `phone` varchar(20) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:53:28',0,'2018-02-02 03:56:30',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:55:21',0,'2018-02-02 03:56:30',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:55:21',0,'2018-02-02 03:56:30',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:55:21',0,'2018-02-02 03:56:30',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:55:21',0,'2018-02-02 03:56:30',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:56:23',0,'2018-02-02 03:56:30',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:57:23',0,'2018-02-02 03:56:30',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:57:23',0,'2018-02-02 03:56:30',0),(9,'Phan Thi Ngoc','female','1991-02-02',1,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:59:50',0,'2018-02-27 08:28:52',0),(10,'Dinh Van Trung','male','1989-05-12',1,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:00:54',0,'2018-02-27 08:28:52',0),(11,'Kieu Minh Tuan','male','1985-04-12',1,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:04:01',0,'2018-02-05 07:21:51',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-10 07:17:45',0,'2018-02-02 03:56:30',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-02 03:56:30',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-02 03:56:30',0),(22,'manager3','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-03-01 07:39:16',0),(23,'manager4','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-03-01 07:39:16',0),(29,'dactech12','female','1995-06-21',2,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-26 09:05:43',0),(30,'member11','female','1995-06-21',1,'member11@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-28 02:09:32',0,'2018-02-28 02:09:32',0),(31,'member12','female','1995-06-21',1,'member12@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-28 02:09:32',0,'2018-02-28 02:09:32',0),(32,'member13','male','1995-06-21',1,'member13@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-28 02:09:32',0,'2018-02-28 02:09:32',0),(33,'leader1','male','1995-06-21',2,'leader1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-28 02:13:14',0,'2018-02-28 02:13:14',0),(34,'manager1','male','1995-06-21',3,'manager1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-28 02:34:34',0,'2018-02-28 02:34:34',0),(35,'manager2','female','1995-06-21',3,'manager2@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-03-01 03:07:49',0,'2018-03-01 03:07:49',0),(36,'manager5','female','1995-06-21',3,'manager5@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-03-01 09:21:59',0,'2018-03-01 09:21:59',0);
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
  `phone` varchar(20) DEFAULT NULL,
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
INSERT INTO `employee_hist` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',NULL,'2018-01-05 04:23:55',NULL),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',NULL,'2018-01-05 03:57:37',NULL),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 03:57:37',NULL),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 04:01:01',NULL),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',NULL,'2018-01-05 03:59:50',NULL),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',NULL,'2018-01-05 04:01:18',NULL),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',NULL,'2018-01-05 04:04:08',NULL),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',NULL,'2018-01-10 07:17:45',NULL),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:27:42',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:27:42',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:27:42',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:27:42',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:27:42',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:27:42',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:31:47',0),(1,'Cao Hải Nhi','male','1995-06-21',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:51',0),(1,'Cao Hải Nhi','','1995-06-21',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:57',0),(22,'viba','male','1995-06-21',2,'thiendienban@gmail.com','','326599854','2010-01-01','2010-01-01',1,'2018-01-11 07:17:57',0,'2018-01-11 07:17:57',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',1,'2018-01-11 07:18:22',0,'2018-01-11 07:18:22',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',1,'2018-01-11 07:18:28',0,'2018-01-11 07:18:28',0),(22,'vibon','','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',1,'2018-01-11 07:18:39',0,'2018-01-11 07:18:39',0),(22,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',1,'2018-01-16 06:50:41',0,'2018-01-16 06:50:41',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:45:01',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'','0',NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:31:47',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'','0',NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:31:47',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'','0',NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:31:47',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'','0',NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:31:47',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'','0',NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:31:47',0),(13,'slash','male','1985-04-12',2,NULL,'','0',NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-11 02:10:39',0),(21,'viba','male','1995-06-21',2,'thiendienban@gmail.com','','326599854','2010-01-01','2010-01-01',1,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 03:58:10',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 03:58:10',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 03:58:10',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','','0',NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 03:58:10',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','','0',NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 03:58:10',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','','0',NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 03:58:10',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','','0',NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 03:58:10',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','','326599854','2010-01-01','2010-01-01',1,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 04:17:25',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 04:17:25',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','','0',NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 04:17:25',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','','0',NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 04:17:25',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','','0',NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 04:17:25',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','','0',NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 04:17:25',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','','0',NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 04:17:25',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','','326599854','2010-01-01','2010-01-01',1,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','','32659123','2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 06:49:45',0,'2018-01-19 06:44:02',0),(23,'vibon1','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 06:50:44',0,'2018-01-19 06:49:45',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$vTNf2NsHXI0QBvOfjux8euoli5cf8835ic77Xac3ir.ubGnIJ0jMG','32659123','2010-01-01','2010-01-01',0,'2018-01-19 06:59:19',0,'2018-01-19 06:59:19',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$PbWfQ7NvoMmv1IhCVcNF0u2YqAjxvkyOIWPkkO40OqE2v7E/uhK92','32659123','2010-01-01','2010-01-01',0,'2018-01-19 07:33:42',0,'2018-01-19 07:33:42',0),(24,'dactech1','female','1995-06-21',3,'dactech@gmail.com','$2a$10$a7rJu.BfRNG/wbgQe0ipUet2d7cSZ6qS2m2Vo7z7Hk7ndVUrzqbF.','32659123','2010-01-01','2010-01-01',0,'2018-01-19 07:34:00',0,'2018-01-19 07:34:00',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$JUFpGPyNj1tJoaTBBAs1Cuii3db4xs52wOuNlUTlCXS97XAL4ndDC','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:03:41',0,'2018-01-19 08:03:41',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$6H8RRW8l9PykDGAUuKh/4uYLWHJ5kIOEKu1u5La8Oa0ULa1cLqzTi','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:05:10',0,'2018-01-19 08:05:10',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$t/etOx1HHg4n2hjqM1Rm8.oOTpC7mNC/eTUNFIStKpFU70UkVTUmG','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:10:43',0,'2018-01-19 08:10:43',0),(25,'dactech12','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','passpass','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:10:43',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:44:02',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:50:44',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-01-19 08:14:47',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$deM7FNMqtsCQm/OyWfaX4us7Y8pKMtqCrlFMN.5yj.mgRMX5wTppm','32659123','2010-01-01','2010-01-01',0,'2018-01-19 08:15:10',0,'2018-01-19 08:14:19',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly','32659123','2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu','32659123','2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass','32659123','2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$hJBTA0YragK440NcB/wS1OdSrn/nBb6O3KWe8pMe52FdYL5.N3kye','32659123','2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 06:44:02',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 06:44:02',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 06:44:02',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 06:44:02',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 06:44:02',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 06:44:02',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','0',NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 06:44:02',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-02-02 03:56:30',0,'2018-01-19 06:44:02',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-02 03:56:30',0,'2018-01-19 08:14:19',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-02-02 03:56:30',0,'2018-01-19 08:14:19',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba','32659123','2010-01-01','2010-01-01',1,'2018-02-02 03:56:30',0,'2018-02-02 03:56:30',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:00:54',0,'2018-02-02 03:56:30',0),(10,'Dinh Van Trung','male','1989-05-12',1,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:00:54',0,'2018-02-05 07:18:43',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:04:01',0,'2018-02-02 03:56:30',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:59:50',0,'2018-02-02 03:56:30',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-02 03:56:30',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 04:00:54',0,'2018-02-05 07:21:51',0),(9,'Phan Thi Ngoc','female','1991-02-02',2,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','326599854','2010-01-01','2010-01-01',1,'2018-01-05 03:59:50',0,'2018-02-08 09:04:15',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-02 03:56:30',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','32659123','2010-01-01','2010-01-01',1,'2018-01-11 02:10:39',0,'2018-02-02 03:56:30',0);
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
INSERT INTO `employee_off_status` VALUES (2017,3,5000,50,1,'2018-02-07 08:17:43',0,'2018-02-08 01:45:54',0),(2017,4,441,44,1,'2018-02-07 08:17:43',0,'2018-02-07 08:20:11',0),(2018,1,62,20,1,'2018-01-11 08:34:51',0,'2018-02-28 01:53:07',0),(2018,2,56,20,1,'2018-01-16 02:53:02',0,'2018-02-28 01:52:35',0),(2018,3,52,50,1,'2018-01-16 02:53:02',0,'2018-02-09 07:04:41',0),(2018,4,438,44,1,'2018-02-07 08:17:43',0,'2018-03-02 01:41:48',0),(2018,5,111,33,0,'2018-02-07 08:17:43',0,'2018-02-07 08:20:11',0),(2018,9,100,200,1,'2018-02-27 09:32:28',0,'2018-02-27 09:32:28',0),(2018,10,100,200,1,'2018-02-27 09:32:28',0,'2018-02-27 09:32:28',0),(2018,11,100,200,1,'2018-02-27 09:32:28',0,'2018-02-27 09:32:28',0),(2018,30,24,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:34:35',0),(2018,31,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:30:26',0),(2018,32,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:30:26',0),(2018,33,18,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:34:35',0),(2018,34,9,30,1,'2018-02-28 02:46:50',0,'2018-02-28 02:48:24',0);
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
INSERT INTO `employee_off_status_hist` VALUES (2018,3,5,2,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,5,555,44,0,'2018-01-16 04:01:23',0,'2018-01-16 04:01:23',0),(2018,5,222,33,0,'2018-01-16 04:01:55',0,'2018-01-16 04:01:55',0),(2018,1,20,20,1,'2018-01-11 08:34:51',0,'2018-01-11 08:34:51',0),(2018,1,17,20,1,'2018-01-11 08:34:51',0,'2018-02-05 04:48:02',0),(2018,3,70,50,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,3,20,50,1,'2018-01-16 02:53:02',0,'2018-02-06 04:17:07',0),(2018,3,70,50,1,'2018-01-16 02:53:02',0,'2018-02-06 04:44:24',0),(2018,3,60,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:38:27',0),(2018,3,60,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:38:31',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:39:12',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:39:18',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:39:27',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-06 07:39:54',0),(2018,3,2,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:20:44',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:21:12',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:53:12',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:54:29',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:56:55',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 01:57:09',0),(2018,1,19,20,1,'2018-01-11 08:34:51',0,'2018-02-05 04:49:34',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 02:03:35',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 02:23:02',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 02:43:54',0),(2018,3,38,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:09:29',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:16:56',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:17:58',0),(2018,3,38,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:18:32',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:18:46',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:19:13',0),(2018,3,38,50,1,'2018-01-16 02:53:02',0,'2018-02-07 03:57:24',0),(2018,2,30,20,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,3,46,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:00:26',0),(2018,3,54,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:27:31',0),(2018,3,62,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:28:18',0),(2018,3,66,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:29:17',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:42:31',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:45:15',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:49:34',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 04:53:47',0),(2018,3,38,50,1,'2018-01-16 02:53:02',0,'2018-02-07 05:00:48',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 05:01:35',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 05:03:09',0),(2018,2,38,20,1,'2018-01-16 02:53:02',0,'2018-02-07 04:09:10',0),(2018,3,38,50,1,'2018-01-16 02:53:02',0,'2018-02-07 07:47:06',0),(2018,3,46,50,1,'2018-01-16 02:53:02',0,'2018-02-07 07:47:52',0),(2018,3,50,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:16:18',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:16:51',0),(2017,4,441,44,1,'2018-02-07 08:20:11',0,'2018-02-07 08:20:11',0),(2018,4,441,44,1,'2018-02-07 08:20:11',0,'2018-02-07 08:20:11',0),(2018,5,111,33,0,'2018-02-07 08:20:11',0,'2018-02-07 08:20:11',0),(2018,4,441,44,1,'2018-02-07 08:17:43',0,'2018-02-07 08:20:11',0),(2018,4,449,44,1,'2018-02-07 08:17:43',0,'2018-02-07 08:20:33',0),(2018,4,457,44,1,'2018-02-07 08:17:43',0,'2018-02-07 08:27:39',0),(2018,3,44,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:17:57',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:42:03',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:42:10',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:42:30',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:43:15',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:43:28',0),(2018,3,44,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:43:44',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:44:44',0),(2018,3,44,50,1,'2018-01-16 02:53:02',0,'2018-02-07 08:45:17',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:10:04',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:10:19',0),(2018,3,36,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:17:29',0),(2018,3,34,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:21:21',0),(2018,3,26,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:24:36',0),(2018,3,24,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:26:51',0),(2018,3,26,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:27:57',0),(2018,3,28,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:28:17',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:28:51',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:28:51',0),(2018,3,32,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:29:53',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:45:14',0),(2017,3,40,50,1,'2018-02-07 08:17:43',0,'2018-02-07 08:17:43',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:45:14',0),(2018,3,42,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:47:13',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:49:50',0),(2018,3,32,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:50:16',0),(2018,3,32,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:50:16',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:53:25',0),(2018,3,32,50,1,'2018-01-16 02:53:02',0,'2018-02-07 09:59:49',0),(2017,3,55555,50,1,'2018-02-07 08:17:43',0,'2018-02-07 09:45:52',0),(2018,3,30,50,1,'2018-01-16 02:53:02',0,'2018-02-07 10:00:11',0),(2018,4,465,44,1,'2018-02-07 08:17:43',0,'2018-02-07 08:28:29',0),(2018,4,457,44,1,'2018-02-07 08:17:43',0,'2018-02-08 06:39:07',0),(2018,3,32,50,1,'2018-01-16 02:53:02',0,'2018-02-08 01:47:56',0),(2018,2,46,20,1,'2018-01-16 02:53:02',0,'2018-02-07 07:47:52',0),(2018,4,449,44,1,'2018-02-07 08:17:43',0,'2018-02-08 07:46:49',0),(2018,3,46,50,1,'2018-01-16 02:53:02',0,'2018-02-08 07:54:31',0),(2018,3,48,50,1,'2018-01-16 02:53:02',0,'2018-02-09 03:53:01',0),(2018,3,50,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:36:03',0),(2018,3,52,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:42:43',0),(2018,3,40,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:46:56',0),(2018,3,42,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:47:02',0),(2018,3,44,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:47:59',0),(2018,3,46,50,1,'2018-01-16 02:53:02',0,'2018-02-09 04:53:20',0),(2018,3,48,50,1,'2018-01-16 02:53:02',0,'2018-02-09 07:03:40',0),(2018,3,50,50,1,'2018-01-16 02:53:02',0,'2018-02-09 07:04:14',0),(2018,1,27,20,1,'2018-01-11 08:34:51',0,'2018-02-07 02:08:06',0),(2018,1,26,20,1,'2018-01-11 08:34:51',0,'2018-02-26 07:59:33',0),(2018,1,30,20,1,'2018-01-11 08:34:51',0,'2018-02-26 07:59:50',0),(2018,1,25,20,1,'2018-01-11 08:34:51',0,'2018-02-26 08:00:03',0),(2018,1,29,20,1,'2018-01-11 08:34:51',0,'2018-02-26 08:01:20',0),(2018,1,40,20,1,'2018-01-11 08:34:51',0,'2018-02-28 01:50:07',0),(2018,2,54,20,1,'2018-01-16 02:53:02',0,'2018-02-08 07:58:25',0),(2018,1,51,20,1,'2018-01-11 08:34:51',0,'2018-02-28 01:51:53',0),(2018,1,40,20,1,'2018-01-11 08:34:51',0,'2018-02-28 01:52:27',0),(2018,2,55,20,1,'2018-01-16 02:53:02',0,'2018-02-28 01:51:53',0),(2018,1,51,20,1,'2018-01-11 08:34:51',0,'2018-02-28 01:52:35',0),(2018,30,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:30:26',0),(2018,30,9,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:37:29',0),(2018,30,8,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:40:09',0),(2018,34,10,30,1,'2018-02-28 02:46:50',0,'2018-02-28 02:46:50',0),(2018,34,9,30,1,'2018-02-28 02:46:50',0,'2018-02-28 02:47:07',0),(2018,34,7,30,1,'2018-02-28 02:46:50',0,'2018-02-28 02:48:13',0),(2018,33,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:30:26',0),(2018,30,9,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:43:26',0),(2018,30,8,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:50:45',0),(2018,4,441,44,1,'2018-02-07 08:17:43',0,'2018-02-08 08:42:19',0),(2018,30,7,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:51:39',0),(2018,30,8,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:29:25',0),(2018,30,9,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:41:35',0),(2018,30,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:47:15',0),(2018,30,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:47:15',0),(2018,30,11,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:47:52',0),(2018,30,11,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:47:52',0),(2018,30,12,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:51:05',0),(2018,30,12,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:51:05',0),(2018,30,13,30,1,'2018-02-28 02:30:26',0,'2018-02-28 03:59:05',0),(2018,30,14,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:00:18',0),(2018,30,14,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:00:18',0),(2018,30,15,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:06:08',0),(2018,30,16,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:06:30',0),(2018,30,17,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:10:39',0),(2018,33,8,30,1,'2018-02-28 02:30:26',0,'2018-02-28 02:49:50',0),(2018,30,18,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:12:46',0),(2018,30,19,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:30:37',0),(2018,30,20,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:32:09',0),(2018,33,10,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:12:46',0),(2018,30,21,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:32:32',0),(2018,33,12,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:32:32',0),(2018,30,22,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:32:46',0),(2018,33,14,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:32:46',0),(2018,30,23,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:33:42',0),(2018,33,16,30,1,'2018-02-28 02:30:26',0,'2018-02-28 04:33:42',0),(2018,4,440,44,1,'2018-02-07 08:17:43',0,'2018-02-28 02:52:53',0);
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
INSERT INTO `employee_role` VALUES (1,1,1,'2018-01-19 04:19:56',0,'2018-01-19 04:19:56',0),(1,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(2,2,1,'2018-01-19 03:53:22',0,'2018-01-19 03:53:27',0),(2,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(3,1,1,'2018-01-19 04:20:03',0,'2018-01-19 04:20:03',0),(3,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(4,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(5,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(6,6,1,'2018-01-19 04:21:18',0,'2018-01-19 04:21:18',0),(7,6,1,'2018-01-19 08:12:11',0,'2018-01-19 08:12:11',0),(9,5,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:53',0),(10,5,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:53',0),(11,5,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:53',0),(29,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:17:21',0),(30,6,1,'2018-02-28 02:27:40',0,'2018-02-28 02:27:40',0),(31,6,1,'2018-02-28 02:27:40',0,'2018-02-28 02:27:40',0),(32,6,1,'2018-02-28 02:27:40',0,'2018-02-28 02:27:40',0),(33,6,1,'2018-02-28 02:27:40',0,'2018-02-28 02:27:40',0),(34,6,1,'2018-02-28 02:45:56',0,'2018-02-28 02:45:56',0);
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
INSERT INTO `employee_role_hist` VALUES (1,2,1,'2018-01-19 03:53:22',0,'2018-01-19 03:53:22',0),(1,1,1,'2018-01-19 03:53:12',0,'2018-01-19 03:53:12',0),(24,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(25,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(26,6,1,'2018-01-19 08:06:47',0,'2018-01-19 08:06:47',0),(28,1,1,'2018-01-19 08:10:10',0,'2018-01-19 08:10:10',0),(28,6,1,'2018-01-19 08:10:10',0,'2018-01-19 08:10:10',0),(9,6,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:25',0),(10,6,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:25',0),(11,6,1,'2018-02-27 08:36:25',0,'2018-02-27 08:36:25',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'employee',1,'2018-01-05 03:52:20',0,'2018-01-29 09:11:52',0),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(3,'project manager',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(18,'cdf',0,'2018-01-22 09:13:41',0,'2018-02-02 04:12:49',0),(21,'abc',0,'2018-02-02 04:14:13',0,'2018-02-02 04:14:13',0);
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
INSERT INTO `position_hist` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(2,'leader',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(3,'project manager',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(4,'hr',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(17,'hrrrrrrrr',0,'2018-01-22 06:28:20',0,'2018-01-22 06:28:20',0),(20,'aaaaaabbbbb',0,'2018-01-22 09:28:18',0,'2018-01-22 09:28:18',0),(19,'aaaaaa',0,'2018-01-22 09:27:50',0,'2018-01-22 09:27:50',0),(17,'hrrrrrrrrabdsbfb',0,'2018-01-22 06:28:20',0,'2018-01-22 06:29:15',0),(1,'emplyee',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(19,'aaaaaabbbbb',0,'2018-01-22 09:27:50',0,'2018-01-22 09:28:57',0),(18,'abc',0,'2018-01-22 09:13:41',0,'2018-01-22 09:13:41',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',1,'Bận việc nhà',3,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-28 01:32:57',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',1,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-28 01:32:57',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',3,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-28 01:46:57',0),(8,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',1,'đau',4,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-27 06:30:59',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',1,'ốm',4,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-27 06:33:13',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:53:46',0),(11,29,'2018-02-14 08:00:00','2018-02-14 12:00:00',1,'bận việc',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-28 01:44:10',0),(12,29,'2018-02-08 10:00:00','2018-02-08 12:00:00',1,'khám sức khỏe',5,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-27 06:30:59',0),(13,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',1,'du lịch',2,'',1,5,1,'2018-02-07 09:21:21',0,'2018-02-28 01:43:13',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',10,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:53:46',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',1,'ốm',5,'hhhhhh',1,5,1,'2018-02-07 09:26:51',0,'2018-02-27 09:52:49',0),(16,4,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'đau',5,'',1,5,1,'2018-02-08 06:39:07',0,'2018-02-27 06:30:59',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',4,'ok',1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 10:00:09',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:59:51',0),(21,11,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'đau đầu',1,NULL,1,29,1,'2018-02-27 08:35:41',0,'2018-02-27 08:56:34',0),(22,30,'2018-02-28 08:00:00','2018-02-28 09:00:00',1,'đám cưới',5,'',21,33,1,'2018-02-28 02:37:29',0,'2018-02-28 02:46:19',0),(23,30,'2018-02-28 08:00:00','2018-02-28 10:00:00',1,'test',1,'',1,33,0,'2018-02-28 02:40:09',0,'2018-02-28 02:43:26',0),(24,34,'2018-02-08 08:00:00','2018-02-08 09:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:47:07',0,'2018-02-28 02:47:07',0),(25,34,'2018-02-28 08:00:00','2018-02-28 10:00:00',2,'test1',1,'',1,34,0,'2018-02-28 02:48:13',0,'2018-02-28 02:48:24',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',3,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:34:35',0),(27,30,'2018-02-01 08:00:00','2018-02-01 09:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:50:45',0,'2018-02-28 04:36:23',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:36:07',0),(29,4,'2018-02-01 08:00:00','2018-02-01 09:00:00',1,'test',5,'',1,5,1,'2018-02-28 02:52:53',0,'2018-02-28 02:52:53',0),(30,4,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'test',1,'',1,5,1,'2018-03-02 01:41:48',0,'2018-03-02 01:41:48',0);
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
INSERT INTO `request_hist` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',NULL,'2018-01-05 06:34:58',NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 03:03:56',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',0,'789',16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 09:06:21',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-15 03:32:27',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-15 03:56:43',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-15 03:57:34',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-30 04:07:44',0),(4,3,NULL,NULL,NULL,'Nghỉ cho vui',-2,'Không cho nghỉ',15,2,1,'2018-01-30 04:08:59',0,'2018-01-30 04:08:59',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 04:07:44',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-30 04:08:59',0),(4,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',-2,'Không cho nghỉ',15,2,1,'2018-01-30 04:08:59',0,'2018-01-30 04:09:09',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',-1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-30 04:07:44',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 04:10:10',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 08:54:17',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 08:54:22',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 08:55:44',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-30 08:56:11',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 06:58:12',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 06:59:36',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'Not ok',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:00:00',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:05:45',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:08:21',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:08:31',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-30 04:18:56',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 07:08:54',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 07:09:22',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:08:43',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 07:09:35',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:09:53',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:13:00',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:13:27',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:14:18',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:14:26',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:42:46',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:45:33',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 07:59:22',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 07:09:59',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 08:02:13',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 08:00:13',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-31 08:02:19',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-31 08:23:44',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-30 04:10:10',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-01-31 08:43:34',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-01-31 09:01:23',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-01-31 08:27:30',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-01-31 09:48:26',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-01-31 10:02:08',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-01-31 08:43:34',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:40:00',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:41:30',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:42:28',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:42:42',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:42:47',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:43:00',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:43:10',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-01 01:36:09',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:43:56',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-01 03:44:03',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:44:11',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-01 03:44:33',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-01 03:45:07',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 03:44:41',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 04:14:07',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 04:14:18',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,12,1,'2018-01-05 06:34:26',0,'2018-02-01 04:14:27',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-01-31 10:03:06',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-01 04:21:10',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,12,1,'2018-01-05 06:34:26',0,'2018-02-01 04:15:47',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 04:25:11',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 04:32:32',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,12,1,'2018-01-05 06:34:26',0,'2018-02-01 06:31:41',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:33:32',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-01 04:21:19',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-01 03:57:41',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-02-01 06:35:22',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,12,1,'2018-01-15 03:57:34',0,'2018-02-01 06:35:29',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:34:45',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:35:47',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:35:55',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:36:07',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,12,1,'2018-01-05 06:34:26',0,'2018-02-01 06:36:11',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:37:22',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:37:36',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:37:42',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:37:45',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:48:13',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-01 06:56:07',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 06:56:18',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,12,1,'2018-01-05 06:34:26',0,'2018-02-01 07:25:17',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 07:25:24',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:10:02',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,12,1,'2018-01-15 03:56:43',0,'2018-02-01 06:35:04',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:10:10',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,12,1,'2018-01-15 03:56:43',0,'2018-02-01 08:16:06',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:16:14',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:16:20',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-02-01 06:35:33',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:16:22',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,12,1,'2018-01-15 03:56:43',0,'2018-02-01 08:16:14',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:16:48',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OKaaaaaa',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:31:51',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OKaaa',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:32:19',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,'OKaaa',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:38:03',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-02-01 08:16:43',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,12,1,'2018-01-15 03:56:43',0,'2018-02-01 08:16:49',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 01:26:17',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-02-01 08:46:08',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,5,1,'2018-01-05 06:34:26',0,'2018-02-01 08:39:06',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-02 01:26:24',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-02-02 04:25:20',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 04:25:26',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',4,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 06:59:09',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 04:25:12',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:49:47',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:49:47',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:50:07',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:50:07',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:50:24',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',1,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:50:24',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:51:20',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:51:20',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:51:30',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,5,1,'2018-01-15 03:57:34',0,'2018-02-02 08:53:17',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-02 04:32:24',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-02 08:53:37',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:53:21',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:51:30',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:54:44',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-02 08:53:40',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-02 08:56:19',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,12,1,'2018-01-05 06:34:26',0,'2018-02-02 08:56:25',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 08:54:44',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 09:14:07',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-02 09:02:57',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 01:33:09',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-02 08:54:51',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 01:33:34',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 01:52:51',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:36:41',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:36:48',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:38:50',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',3,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:39:01',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:39:13',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:39:20',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 02:39:31',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-02 09:14:56',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 03:49:09',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 01:50:32',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 03:49:09',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-05 04:03:41',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-05 04:13:58',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 03:49:41',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 05:58:01',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 05:58:19',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',2,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 06:19:59',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 06:20:15',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:12:57',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Không cho nghỉ',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:15:04',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:15:17',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'fbskdbsvbsd',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:16:04',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:17:49',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'sgfdh dhdfsfg',15,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:18:06',0),(4,11,'2017-12-12 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,NULL,15,4,1,'2018-02-05 07:19:48',0,'2018-02-05 07:19:48',0),(4,11,'2017-12-12 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,NULL,15,5,1,'2018-02-05 07:19:48',0,'2018-02-05 07:35:22',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 03:51:24',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 07:42:49',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-05 07:56:39',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'sgfdh dhdfsfg',1,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:19:48',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 07:57:04',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 08:09:33',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 08:09:45',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 09:13:15',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 09:42:55',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 09:44:39',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-05 04:16:34',0),(11,3,'2018-02-14 08:00:00','2018-02-15 08:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 04:05:24',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 07:11:33',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 08:56:43',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 09:51:30',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 09:52:04',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 09:54:10',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-06 09:54:24',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:19:07',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:20:22',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:21:27',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:21:53',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:22:16',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:22:23',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:23:22',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:23:29',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:23:54',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:24:02',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:24:37',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:25:45',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:29:09',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:29:21',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:32:03',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:32:16',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:34:24',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:34:29',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:45:09',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:45:20',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:45:53',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:46:12',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:47:13',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:47:20',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:47:49',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:47:57',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:48:32',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:48:40',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:49:21',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:49:30',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:50:58',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:51:08',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:52:48',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:53:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:54:40',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:55:54',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:56:22',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:56:29',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:56:40',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:56:47',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 01:57:16',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:00:37',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:00:49',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:03:35',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:22:34',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:34:03',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:35:00',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:35:09',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:36:03',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:36:13',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:39:13',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:39:31',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:40:24',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:40:40',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:43:20',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:43:33',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:43:44',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:43:54',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:45:20',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:45:33',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:46:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:46:25',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:46:39',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:51:01',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:52:14',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:52:20',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:52:53',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:52:59',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:53:13',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:53:19',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 02:57:22',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:08:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:09:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:09:18',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:10:00',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:10:21',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:17:07',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',2,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:17:31',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:17:49',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:17:58',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:18:17',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:18:23',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:18:52',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:19:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:51:19',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'',1,4,1,'2018-02-06 04:03:16',0,'2018-02-06 04:03:16',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-05 09:44:52',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-07 04:09:10',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',1,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-06 04:01:56',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',3,'',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 03:59:55',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',1,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-06 04:05:12',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 04:27:11',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 04:27:11',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 04:27:35',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 03:52:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:28:53',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:29:17',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:42:23',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:42:41',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:43:54',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:44:01',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:45:09',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:45:15',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:46:55',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:47:44',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:48:36',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:48:59',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:49:39',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:49:46',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:50:45',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:50:53',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:53:19',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:53:31',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:53:41',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 04:53:47',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:00:31',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:00:47',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:01:08',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:01:15',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:03:02',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:03:09',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:03:16',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:03:21',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 05:04:04',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-07 04:27:11',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 04:28:53',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 04:27:11',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:12:17',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:12:43',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:13:47',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:15:36',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-07 07:47:06',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:16:10',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:16:18',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:17:50',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:15:44',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:20:18',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:20:33',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:27:12',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:27:21',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:27:33',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:27:39',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:28:17',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:17:57',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:41:48',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:42:10',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:43:04',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:43:15',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:43:36',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:43:44',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:44:49',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 08:45:17',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 09:10:11',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-06 01:56:52',0),(8,4,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 08:28:29',0),(12,4,'2018-02-08 08:00:00','2018-02-08 12:00:00',NULL,'test',1,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-07 08:07:48',0),(12,3,'2018-02-08 08:00:00','2018-02-08 12:00:00',NULL,'test',1,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-07 09:13:17',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',1,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:21:21',0),(14,3,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'zzzzzzzzzz',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-07 09:24:35',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffff',5,'',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:26:51',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffff',4,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:27:12',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:27:33',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:22:35',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:27:57',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:28:17',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:28:40',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:28:40',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:28:51',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:29:38',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',3,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 09:10:19',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-05 07:57:23',0),(8,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',3,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 09:13:17',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',3,'',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 04:28:18',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 07:47:52',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:41:23',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:41:23',0),(1,3,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',1,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-07 09:13:17',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-07 07:47:50',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',4,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:42:53',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:41:49',0),(12,3,'2018-02-08 10:00:00','2018-02-08 12:00:00',NULL,'test',1,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-07 09:17:29',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:29:53',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:28:50',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:44:12',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:44:12',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:44:12',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:45:12',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:47:13',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',3,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:45:13',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:49:42',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:44:12',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:49:42',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:49:42',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',2,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:51:40',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:51:39',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:50:16',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:50:16',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:53:39',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:53:39',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 09:54:37',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 09:54:38',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-07 10:00:03',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-07 10:00:32',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-07 09:53:39',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-07 09:53:39',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-07 09:41:23',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-07 09:44:12',0),(1,3,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-07 09:44:12',0),(1,3,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',2,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-08 09:21:44',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',3,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-08 07:58:25',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',3,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-08 07:54:31',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',2,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-08 07:54:01',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-08 07:53:48',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',3,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-08 01:47:50',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-08 01:47:45',0),(17,4,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'test',1,'',1,5,1,'2018-02-08 07:46:49',0,'2018-02-08 07:46:49',0),(18,4,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'q',1,'',1,5,1,'2018-02-08 08:42:19',0,'2018-02-08 08:42:19',0),(17,4,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'test',5,'',1,5,1,'2018-02-08 07:46:49',0,'2018-02-09 03:52:04',0),(18,4,'2018-02-01 08:00:00','2018-02-02 08:00:00',NULL,'q',5,'',1,5,1,'2018-02-08 08:42:19',0,'2018-02-09 03:52:04',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 03:52:04',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 03:53:01',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 03:54:12',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 04:47:07',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 04:47:21',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 04:47:59',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 04:53:02',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 04:53:20',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:02:55',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:03:40',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:04:07',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:04:14',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',5,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:04:33',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',5,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-09 03:52:04',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-09 03:52:04',0),(8,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'aaaa',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-07 09:41:23',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'abc',5,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-09 03:52:04',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'qqqqqq',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-26 04:17:47',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'wwwwwww',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-07 09:41:23',0),(12,3,'2018-02-08 10:00:00','2018-02-08 12:00:00',NULL,'test',5,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-07 09:44:12',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'111111',2,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-26 04:17:36',0),(14,3,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'zzzzzzzzzz',5,'',1,5,1,'2018-02-07 09:24:35',0,'2018-02-07 09:25:18',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ffffffffffrrrrrrrrrrrrr',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-09 07:04:40',0),(16,4,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,'aaa',5,'',1,5,1,'2018-02-08 06:39:07',0,'2018-02-08 06:39:07',0),(14,3,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'mệt',5,'',1,5,1,'2018-02-07 09:24:35',0,'2018-02-26 04:19:05',0),(14,3,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-26 09:48:17',0),(1,3,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-09 03:52:04',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-27 03:50:42',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-09 03:52:04',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-09 03:52:04',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'ốm',5,'333',1,4,1,'2018-02-06 04:03:16',0,'2018-02-26 04:19:05',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'bệnh',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-26 04:19:05',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'du lịch',2,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-26 04:19:05',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ốm',3,'hhhhhh',1,4,1,'2018-02-07 09:26:51',0,'2018-02-26 04:19:05',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',5,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-27 03:51:57',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',5,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-27 03:51:57',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',5,'Okie',1,5,1,'2018-01-15 03:57:34',0,'2018-02-27 03:51:57',0),(8,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'đau',5,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-26 04:19:05',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'ốm',5,'333',1,5,1,'2018-02-06 04:03:16',0,'2018-02-27 03:51:57',0),(13,3,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'du lịch',2,'',1,5,1,'2018-02-07 09:21:21',0,'2018-02-27 03:51:57',0),(12,3,'2018-02-08 10:00:00','2018-02-08 12:00:00',NULL,'khám sức khỏe',5,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-26 04:19:05',0),(11,3,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'bận việc',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-26 04:19:05',0),(10,3,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'bệnh',3,'',1,5,1,'2018-02-06 04:05:12',0,'2018-02-27 03:51:57',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'Okie',1,5,1,'2018-01-15 03:57:34',0,'2018-02-27 03:54:40',0),(14,3,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'mệt',5,'',1,5,1,'2018-02-07 09:24:35',0,'2018-02-26 09:48:47',0),(16,4,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,'đau',5,'',1,5,1,'2018-02-08 06:39:07',0,'2018-02-26 04:19:05',0),(13,29,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'du lịch',2,'',1,5,1,'2018-02-07 09:21:21',0,'2018-02-27 03:59:21',0),(16,4,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,'đau',5,'',1,4,1,'2018-02-08 06:39:07',0,'2018-02-27 04:04:28',0),(17,1,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,1,'2018-02-27 04:09:42',0,'2018-02-27 04:09:42',0),(17,1,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,NULL,NULL,'dfgdf',NULL,NULL,1,'2018-02-27 04:09:42',0,'2018-02-27 04:10:39',0),(18,2,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,1,'2018-02-27 04:11:17',0,'2018-02-27 04:11:17',0),(18,2,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,NULL,NULL,'11111111111',NULL,NULL,1,'2018-02-27 04:11:17',0,'2018-02-27 04:11:24',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',NULL,'Bận việc nhà',4,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-27 03:54:40',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',NULL,'Bận việc nước',4,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-27 03:54:40',0),(3,1,'2017-12-11 07:00:00','2017-12-12 15:00:00',NULL,'Nghỉ cho vui',4,'Okie',1,5,1,'2018-01-15 03:57:34',0,'2018-02-27 03:59:21',0),(8,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'đau',4,'',1,5,1,'2018-02-06 04:01:56',0,'2018-02-27 03:54:40',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',NULL,'ốm',4,'333',1,5,1,'2018-02-06 04:03:16',0,'2018-02-27 03:54:40',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',NULL,'bệnh',3,'',1,5,1,'2018-02-06 04:05:12',0,'2018-02-27 03:59:21',0),(11,29,'2018-02-14 08:00:00','2018-02-14 12:00:00',NULL,'bận việc',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-27 03:59:21',0),(12,29,'2018-02-08 10:00:00','2018-02-08 12:00:00',NULL,'khám sức khỏe',5,'',1,5,1,'2018-02-07 08:07:48',0,'2018-02-27 03:59:21',0),(13,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',NULL,'du lịch',2,'',1,5,1,'2018-02-07 09:21:21',0,'2018-02-27 04:05:24',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',NULL,'mệt',5,'',1,5,1,'2018-02-07 09:24:35',0,'2018-02-27 03:59:21',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',NULL,'ốm',3,'hhhhhh',1,5,1,'2018-02-07 09:26:51',0,'2018-02-27 03:51:57',0),(16,4,'2018-02-02 08:00:00','2018-02-03 08:00:00',NULL,'đau',5,'',1,5,1,'2018-02-08 06:39:07',0,'2018-02-27 04:05:34',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',1,'Bận việc nhà',4,NULL,16,5,1,'2018-01-05 06:34:26',0,'2018-02-27 06:30:59',0),(3,1,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',4,'Okie',1,5,1,'2018-01-15 03:57:34',0,'2018-02-27 06:30:59',0),(9,3,'2018-02-06 08:00:00','2018-02-07 08:00:00',1,'ốm',4,'333',1,5,1,'2018-02-06 04:03:16',0,'2018-02-27 06:30:59',0),(11,29,'2018-02-14 08:00:00','2018-02-14 12:00:00',1,'bận việc',5,'',1,5,1,'2018-02-06 04:05:24',0,'2018-02-27 06:30:59',0),(13,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',1,'du lịch',2,'',1,5,1,'2018-02-07 09:21:21',0,'2018-02-27 06:30:59',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,5,1,'2018-02-07 09:24:35',0,'2018-02-27 06:30:59',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',1,'Bận việc nước',4,'Ok',17,5,1,'2018-01-15 03:56:43',0,'2018-02-27 06:30:59',0),(19,9,NULL,NULL,1,'khám',5,NULL,1,4,1,'2018-02-27 08:34:18',0,'2018-02-27 08:34:18',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,4,1,'2018-02-27 08:34:18',0,'2018-02-27 08:35:07',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,4,1,'2018-02-27 08:35:07',0,'2018-02-27 08:35:07',0),(21,11,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'đau đầu',5,NULL,1,4,1,'2018-02-27 08:35:41',0,'2018-02-27 08:35:41',0),(21,11,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'đau đầu',5,NULL,1,29,1,'2018-02-27 08:35:41',0,'2018-02-27 08:38:11',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 08:38:11',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 08:38:11',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,5,1,'2018-02-27 08:34:18',0,'2018-02-27 09:45:35',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:46:15',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,5,1,'2018-02-27 08:34:18',0,'2018-02-27 09:46:31',0),(15,3,'2018-02-06 08:00:00','2018-02-06 10:00:00',1,'ốm',3,'hhhhhh',1,5,1,'2018-02-07 09:26:51',0,'2018-02-27 06:30:59',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',2,NULL,1,5,1,'2018-02-27 08:34:18',0,'2018-02-27 09:46:54',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:43:17',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,5,1,'2018-02-27 08:34:18',0,'2018-02-27 09:53:25',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:53:25',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:53:47',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',2,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:02',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:53:56',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:10',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:10',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',3,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:19',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',3,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:15',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:29',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:29',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',2,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:36',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:35',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:49',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:49',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',3,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:54:55',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',3,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:54:55',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:58:02',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:58:02',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:58:19',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,5,1,'2018-02-27 08:35:07',0,'2018-02-27 09:58:45',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,5,1,'2018-02-27 08:34:18',0,'2018-02-27 09:58:13',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:59:01',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:59:14',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',5,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:59:27',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:59:01',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',2,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:59:42',0),(20,10,'2018-02-03 08:00:00','2018-02-03 08:00:00',1,'khám bệnh',2,NULL,1,29,1,'2018-02-27 08:35:07',0,'2018-02-27 09:59:40',0),(19,9,'2018-02-02 08:00:00','2018-02-03 08:00:00',1,'khám',5,NULL,1,29,1,'2018-02-27 08:34:18',0,'2018-02-27 09:59:51',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',3,'',1,5,1,'2018-02-06 04:05:12',0,'2018-02-27 06:30:59',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-27 06:33:13',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-27 10:06:26',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',2,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-27 10:06:33',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-27 10:06:37',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:17:41',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:17:41',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',2,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:19:56',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:19:58',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:20:11',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',2,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:21:26',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:21:39',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:20:11',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',2,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:23:12',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:23:12',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:23:31',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:23:31',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:24:42',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:24:42',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:24:56',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:24:56',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',2,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:27:57',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',2,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:28:23',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:28:33',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:28:33',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:28:41',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:28:41',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00',1,'Bận việc nhà',4,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-02-27 06:33:13',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00',1,'Bận việc nước',4,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-02-27 06:33:13',0),(3,1,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',4,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-27 06:33:13',0),(13,4,'2018-02-05 08:00:00','2018-02-05 10:00:00',1,'du lịch',2,'',1,4,1,'2018-02-07 09:21:21',0,'2018-02-27 06:33:13',0),(3,1,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',4,'Okie',1,5,1,'2018-01-15 03:57:34',0,'2018-02-28 01:35:30',0),(11,29,'2018-02-14 08:00:00','2018-02-14 12:00:00',1,'bận việc',5,'',1,4,1,'2018-02-06 04:05:24',0,'2018-02-27 06:33:13',0),(3,1,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',4,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-28 01:44:10',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00',1,'Nghỉ cho vui',4,'Okie',1,4,1,'2018-01-15 03:57:34',0,'2018-02-28 01:46:35',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:28:53',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:50:07',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:51:18',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:28:53',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:51:53',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:51:53',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:52:18',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',5,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:52:18',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:52:35',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',5,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:52:54',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',11,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:53:07',0),(14,1,'2018-02-08 08:00:00','2018-02-09 08:00:00',10,'mệt',3,'',1,4,1,'2018-02-07 09:24:35',0,'2018-02-28 01:53:26',0),(10,2,'2018-02-07 08:00:00','2018-02-08 08:00:00',1,'bệnh',3,'',1,4,1,'2018-02-06 04:05:12',0,'2018-02-28 01:52:35',0),(22,30,'2018-02-28 08:00:00','2018-02-28 09:00:00',1,'đám cưới',1,'',21,33,1,'2018-02-28 02:37:29',0,'2018-02-28 02:37:29',0),(23,30,'2018-02-28 08:00:00','2018-02-28 10:00:00',1,'test',1,'',1,33,1,'2018-02-28 02:40:09',0,'2018-02-28 02:40:09',0),(22,30,'2018-02-28 08:00:00','2018-02-28 09:00:00',1,'đám cưới',5,'',21,33,1,'2018-02-28 02:37:29',0,'2018-02-28 02:39:16',0),(22,30,'2018-02-28 08:00:00','2018-02-28 09:00:00',1,'đám cưới',5,'',21,34,1,'2018-02-28 02:37:29',0,'2018-02-28 02:45:06',0),(25,34,'2018-02-28 08:00:00','2018-02-28 10:00:00',2,'test1',1,'',1,34,1,'2018-02-28 02:48:13',0,'2018-02-28 02:48:13',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',1,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 02:49:50',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 02:51:39',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:15:29',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:16:13',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:16:19',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:16:36',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:17:46',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:17:59',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:28:42',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:28:54',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:29:25',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:29:25',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:29:25',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:31:09',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',4,'ok',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:31:17',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:31:36',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:41:35',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:41:35',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:41:59',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:42:10',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:42:18',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:43:20',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:43:32',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:45:02',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:45:02',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:45:11',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:46:14',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'ok',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:46:14',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:46:25',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:15',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:15',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:15',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:24',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:52',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:52',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:47:52',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:48:02',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:51:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:51:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:51:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:51:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:51:13',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:59:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:59:05',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 03:59:21',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:00:18',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:00:18',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:00:18',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:00:18',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:00:28',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:08',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:08',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:08',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:16',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:30',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:06:41',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 02:49:58',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:10:39',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:10:39',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:10:39',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:10:39',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:10:39',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:11:01',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:11:08',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:11:08',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:11:01',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:12:04',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:12:11',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:12:11',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:12:39',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:12:39',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',3,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:12:46',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:12:46',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:12:57',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:16:13',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:16:13',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:16:21',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:30:37',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:01',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:09',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:23',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:12:57',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',3,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:32:32',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:32',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:41',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:32:41',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',3,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:32:46',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:32:46',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:33:35',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:33:35',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',3,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:33:42',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:33:42',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:34:15',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:34:15',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',2,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:34:22',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',2,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:34:22',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',5,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:34:29',0),(26,33,'2018-02-01 08:00:00','2018-02-01 10:00:00',2,'test',5,'',1,34,1,'2018-02-28 02:49:50',0,'2018-02-28 04:34:29',0),(28,30,'2018-02-01 08:00:00','2018-02-01 10:00:00',1,'test',3,'',1,34,1,'2018-02-28 02:51:39',0,'2018-02-28 04:34:35',0),(27,30,'2018-02-01 08:00:00','2018-02-01 09:00:00',1,'test',5,'',1,33,1,'2018-02-28 02:50:45',0,'2018-02-28 02:50:45',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',0,'2018-03-01 08:31:50',0),(2,'react',21,57,1,'2018-01-30 01:35:34',0,'2018-03-02 01:48:11',0),(3,'back-end',9,3,1,'2018-02-08 07:30:10',0,'2018-02-08 09:04:22',0),(4,'java spring',29,1,1,'2018-02-26 09:05:55',0,'2018-02-28 02:11:16',0),(6,'fdghj',13,6,1,'2018-03-01 04:14:54',0,'2018-03-01 04:14:54',0),(8,'ghjkl;',33,1,1,'2018-03-01 10:02:27',0,'2018-03-01 10:02:27',0);
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
INSERT INTO `team_employee` VALUES (1,1,1,'2018-01-05 06:36:42',0,'2018-01-11 03:04:12',0),(1,2,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0),(1,3,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0),(3,7,1,'2018-02-08 09:01:33',0,'2018-02-08 09:02:36',0),(4,9,1,'2018-02-27 08:33:22',0,'2018-02-27 08:46:27',0),(4,10,1,'2018-02-27 08:33:22',0,'2018-02-27 08:46:27',0),(4,11,1,'2018-02-27 08:33:22',0,'2018-02-27 08:46:27',0),(6,30,1,'2018-03-01 04:14:54',0,'2018-03-01 04:14:54',0),(8,32,1,'2018-03-01 10:02:27',0,'2018-03-01 10:02:27',0);
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
INSERT INTO `team_employee_hist` VALUES (1,1,1,'2018-01-05 06:36:42',NULL,'2018-01-05 06:36:42',NULL),(1,2,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL),(1,3,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL),(3,6,1,'2018-02-08 09:01:33',0,'2018-02-08 09:01:33',0),(2,4,1,'2018-02-07 08:11:55',0,'2018-02-07 08:11:55',0),(2,9,1,'2018-02-27 08:33:22',0,'2018-02-27 08:33:22',0),(2,10,1,'2018-02-27 08:33:22',0,'2018-02-27 08:33:22',0),(2,11,1,'2018-02-27 08:33:22',0,'2018-02-27 08:33:22',0),(5,30,1,'2018-02-28 02:26:14',0,'2018-02-28 02:26:14',0),(5,31,1,'2018-02-28 02:26:14',0,'2018-02-28 02:26:14',0),(5,31,1,'2018-03-01 04:15:02',0,'2018-03-01 04:15:02',0),(5,32,1,'2018-02-28 02:26:14',0,'2018-02-28 02:26:14',0),(7,31,1,'2018-03-01 10:02:22',0,'2018-03-01 10:02:22',0);
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
INSERT INTO `team_hist` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',NULL,'2018-01-05 06:36:21',NULL),(2,'new team',12,1,0,'2018-01-10 07:59:18',0,'2018-01-10 07:59:18',0),(3,'new team',12,1,0,'2018-01-10 08:03:34',0,'2018-01-10 08:03:34',0),(4,'new team',12,1,1,'2018-01-10 08:10:00',0,'2018-01-10 08:10:00',0),(5,'new team',12,1,1,'2018-01-10 08:12:31',0,'2018-01-10 08:12:31',0),(6,'new team',12,1,1,'2018-01-10 08:33:11',0,'2018-01-10 08:33:11',0),(6,'new team_update',12,2,1,'2018-01-10 08:33:31',0,'2018-01-10 08:33:31',0),(7,'new team2',12,2,1,'2018-01-10 08:34:34',0,'2018-01-10 08:34:34',0),(7,'new team2_update',12,3,1,'2018-01-11 02:10:50',0,'2018-01-11 02:10:50',0),(7,'new team2_update',13,3,1,'2018-01-16 06:51:42',0,'2018-01-11 02:10:50',0),(7,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-11 02:10:50',0),(8,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-16 06:52:10',0),(6,'new team',12,1,1,'2018-01-22 02:44:18',0,'2018-01-10 08:33:31',0),(9,'new te',31,3,0,'2018-01-22 02:46:25',0,'2018-01-22 02:46:25',0),(10,'new te',21,3,0,'2018-01-22 02:48:34',0,'2018-01-22 02:48:34',0),(10,'new te1',21,3,0,'2018-01-22 03:37:24',0,'2018-01-22 02:48:34',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(12,'team updasdsdsdc',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:42:20',0),(10,'team updated',21,3,0,'2018-01-26 09:39:34',0,'2018-01-22 02:48:34',0),(11,'team upd12312312312312dc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:33',0),(12,'new new new',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:54:20',0),(15,'sgg',NULL,NULL,1,'2018-01-22 08:55:29',0,'2018-01-22 08:55:29',0),(16,'abc',4,1,0,'2018-01-22 09:02:18',0,'2018-01-22 09:02:18',0),(17,'abcdeef',4,1,0,'2018-01-22 09:03:43',0,'2018-01-22 09:03:43',0),(20,'ddddd',1,1,0,'2018-01-22 09:22:18',0,'2018-01-22 09:22:18',0),(22,'dddfffffffffdd',1,1,0,'2018-01-22 09:23:48',0,'2018-01-22 09:23:48',0),(6,'new team',12,1,1,'2018-01-05 06:36:21',0,'2018-01-22 02:44:18',0),(2,'react',3,1,1,'2018-01-30 01:35:34',0,'2018-01-30 01:35:34',0),(2,'react',5,1,1,'2018-01-30 01:35:34',0,'2018-02-01 03:48:03',0),(2,'react',12,1,1,'2018-01-30 01:35:34',0,'2018-02-01 03:48:56',0),(3,'back-end',10,1,1,'2018-02-08 07:30:10',0,'2018-02-08 07:30:10',0),(3,'back-end',10,3,1,'2018-02-08 07:30:10',0,'2018-02-08 07:42:06',0),(4,'spring',29,1,1,'2018-02-26 09:05:55',0,'2018-02-26 09:05:55',0),(5,'team1',33,6,1,'2018-02-28 02:15:12',0,'2018-02-28 02:15:12',0),(1,'intern',4,1,1,'2018-01-05 06:36:21',0,'2018-01-10 07:30:31',0),(1,'intern',4,39,1,'2018-01-05 06:36:21',0,'2018-03-01 08:28:20',0),(7,'ghjk',21,1,1,'2018-03-01 10:02:22',0,'2018-03-01 10:02:22',0),(2,'react',12,2,1,'2018-01-30 01:35:34',0,'2018-02-08 07:42:06',0);
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

-- Dump completed on 2018-03-02  9:15:56
