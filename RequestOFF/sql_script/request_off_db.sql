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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (62,'Java',62,1,'2018-03-02 04:27:25',0,'2018-03-06 08:57:19',0),(63,'PHP',54,1,'2018-03-02 04:27:36',0,'2018-03-02 04:27:36',0),(66,'Ruby',60,1,'2018-03-05 09:12:26',0,'2018-03-05 09:12:26',0);
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
INSERT INTO `department_hist` VALUES (64,'Ruby',60,1,'2018-03-02 04:48:03',0,'2018-03-02 04:48:03',0),(65,'kamita',60,1,'2018-03-02 04:48:40',0,'2018-03-02 04:48:40',0),(62,'Java',41,1,'2018-03-02 04:27:25',0,'2018-03-02 04:27:25',0),(62,'Java',62,1,'2018-03-02 04:27:25',0,'2018-03-06 04:02:24',0),(62,'Java',41,1,'2018-03-02 04:27:25',0,'2018-03-06 07:16:16',0),(67,'new dept',41,1,'2018-03-06 09:22:56',0,'2018-03-06 09:22:56',0),(68,'new dept',72,1,'2018-03-06 09:31:57',0,'2018-03-06 09:31:57',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (37,'Cao Hai Nhi','female','1995-02-28',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-06 03:44:12',0),(38,'Nguyen Binh Thien','male','2018-03-14',1,'binhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333','2018-03-20','2018-04-07',1,'2018-03-02 04:14:46',0,'2018-03-02 04:35:00',0),(39,'Pham Minh Hien','female','2018-02-27',1,'minhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','2222','2018-04-03','2018-05-05',1,'2018-03-02 04:15:26',0,'2018-03-02 04:35:00',0),(40,'Do Phu Thien','male','2018-01-30',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','666666666666','2018-04-11','2018-06-09',1,'2018-03-02 04:16:09',0,'2018-03-02 04:35:00',0),(41,'Nguyen Van Nhat','male','2018-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','333333333333','2018-04-18','2018-07-07',1,'2018-03-02 04:16:47',0,'2018-03-06 07:16:07',0),(42,'Nguyen Thi Ha','male','2018-01-02',1,'hanguyen@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333333','2018-04-16','2018-08-04',1,'2018-03-02 04:17:46',0,'2018-03-02 04:35:00',0),(43,'nguyen thi ngoc','female','2018-01-01',1,'nguyenngoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333333','2018-04-17','2018-09-07',1,'2018-03-02 04:18:11',0,'2018-03-02 04:35:00',0),(44,'leader Java 1','male','2018-01-10',2,'leaderJava1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','4444444','2018-04-10','2018-10-05',1,'2018-03-02 04:18:37',0,'2018-03-02 04:35:00',0),(45,'Tran Ngoc Duyen','female','2018-01-01',1,'ngocduyen@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','444444444','2018-04-16','2018-10-24',1,'2018-03-02 04:19:03',0,'2018-03-02 04:35:00',0),(46,'Duong Thuc Huyen','female','2018-01-09',1,'thuchuyen@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','3333','2018-03-25','2018-10-30',1,'2018-03-02 04:19:22',0,'2018-03-02 04:35:00',0),(47,'leader java 2','male','2018-01-01',2,'leaderjava2@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','55555','2018-03-21','2018-11-09',1,'2018-03-02 04:19:44',0,'2018-03-02 04:35:00',0),(48,'Nguyen Thu Thuy','female','2018-01-03',1,'thuthuy@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','6666666','2018-03-12','2018-12-07',1,'2018-03-02 04:20:14',0,'2018-03-02 04:35:00',0),(49,'Tran Van Hung','male','2017-12-31',1,'vanhung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','66','2018-03-13','2019-01-05',1,'2018-03-02 04:20:39',0,'2018-03-02 04:35:00',0),(50,'leader PHP 1','male','2017-11-28',2,'leaderPHP1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','66666','2018-02-25','2019-01-17',1,'2018-03-02 04:21:02',0,'2018-03-02 04:35:00',0),(51,'Nguyen Hoang Nam','male','2017-10-30',1,'hoangnam@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','2222222','2018-02-27','2019-02-09',1,'2018-03-02 04:21:22',0,'2018-03-02 04:35:00',0),(53,'leader PHP 2','male','2017-08-30',2,'leaderPHP2@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-02-14','2019-03-29',1,'2018-03-02 04:22:05',0,'2018-03-02 04:35:00',0),(54,'Manager PHP','male','2017-07-31',3,'managerPHP@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','3434','2018-02-19','2019-04-06',1,'2018-03-02 04:22:37',0,'2018-03-02 04:35:18',0),(55,'Le Ngoc Diep','female','2018-03-06',5,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-06 03:50:11',0),(56,'Phan Tran Diem Trinh','female','2018-02-26',4,'thitrinh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-06 03:50:48',0),(57,'Nguyen Thi Quynh Nhu','female','2018-01-28',4,'quynhnhu@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','565656','2018-03-05','2018-06-09',1,'2018-03-02 04:25:59',0,'2018-03-02 04:35:18',0),(58,'Nguyen Hoang Dat','male','2018-02-27',1,'nguyenhoangdat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333333','2018-03-28','2018-04-05',1,'2018-03-02 04:39:14',0,'2018-03-05 09:21:22',0),(59,'Nguyen Thi Lan','female','2018-02-27',2,'nguyenthilan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:40:36',0,'2018-03-05 09:21:22',0),(60,'Nguyen Thanh Lam','male','2018-02-26',3,'nguyenvannam@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 09:21:22',0),(61,'Tran Thi Que Ngan','female','2018-02-26',1,'quengan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-06 03:53:10',0),(62,'Duong Thi Cam Nhung','female','2018-02-26',3,'camnhung@gmail.com','$2a$10$MTC8Go/hhgW8alj2AnkLeey5f8jbtP8DS34B8waMQEQ/uNI1..VOS','232323','2018-03-20','2018-04-07',1,'2018-03-06 03:56:47',0,'2018-03-06 04:02:08',0),(68,'nhu quynh','male','2018-03-01',2,'nhuquynh@gmail.com','$2a$10$IZiMH/3rXZElY5MVXApmW.jdgoSw3gluEvx/QofsG3iVC1dV85bse','6767','2018-03-26','2018-04-06',1,'2018-03-06 07:00:36',0,'2018-03-06 07:58:03',0),(70,'Le Thi Minh Tam','female','2018-02-25',1,'minhtam@gmail.com','$2a$10$hVwKKIjuZqhm28ccqzKkC.rDclImJUtVFapGMhFp9ucsIvJYbyQTm','3','2018-03-20','2018-03-28',1,'2018-03-06 09:24:12',0,'2018-03-06 09:24:12',0),(71,'new team leader','male','2018-02-26',2,'ffffffff','$2a$10$swfseEv/wKvrJKyIpSW74ur/CNPTMWWh7bedE9zI8DM6ijG5ZQYqm','4','2018-03-26','2018-03-29',1,'2018-03-06 09:25:21',0,'2018-03-06 09:25:26',0),(72,'new dept manager','male','2018-02-26',3,'uuuuuuuuu','$2a$10$7/aOfkVOPcLh5lX051hUtuwurrh5oGI1Ock54qMKkoF9nML7HNTzW','5','2018-04-03','2018-04-04',1,'2018-03-06 09:31:28',0,'2018-03-06 09:31:28',0),(73,'thanh thao','female','2018-02-25',1,'hhh','$2a$10$LfcfUITQwO9QqKgyS/JJbOGv05AelHT0KhfHF1yJmRgPOS4zqboF6','9','2018-03-27','2018-04-04',1,'2018-03-06 09:36:18',0,'2018-03-06 09:36:18',0),(74,'duc thuan','male','2018-03-05',2,'hh','$2a$10$YIY0jpn7RTE9G0nO37KsTun66WPaMCSlrY/4Z0A/M6Om6mHeP2bIy','5','2018-04-02','2018-03-28',1,'2018-03-06 09:37:42',0,'2018-03-06 09:37:42',0);
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
INSERT INTO `employee_hist` VALUES (56,'Duong Thi Trinh','female','2018-02-26',1,'thitrinh@gmail.com','$2a$10$ipm3vox8Eavf6yOEOoNKAe0KM6hJQHk1TKzOau7/54Tj/CwkimvAW','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-02 04:25:23',0),(37,'Cao Hai Nhi','female','1995-02-28',1,'caohainhi@gmail.com','$2a$10$UjGI4p17hsWnWH2Au4.OeuSdS4jXuHCve2DtRARfmV8008z7n..Ia','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-02 04:12:57',0),(38,'Nguyen Binh Thien','male','2018-03-14',1,'binhthien@gmail.com','$2a$10$0oL/ShG0BhGv0JDoCTgTa.62JCORd1RozMZErFAgQn.P8Mh/ZdYIK','33333','2018-03-20','2018-04-07',1,'2018-03-02 04:14:46',0,'2018-03-02 04:14:46',0),(39,'Pham Minh Hien','female','2018-02-27',1,'minhhien@gmail.com','$2a$10$IlSk3Pc4zBYgt06myesEaet/2k01e6O448YoNT7Niyvx5KeU6m6Rq','2222','2018-04-03','2018-05-05',1,'2018-03-02 04:15:26',0,'2018-03-02 04:15:26',0),(40,'Do Phu Thien','male','2018-01-30',2,'dophuthien@gmail.com','$2a$10$sN4zh/RCl/6DdcokDo/tzOZEy9eDbMsObEEODLO8a/IbL.hL.tX/G','666666666666','2018-04-11','2018-06-09',1,'2018-03-02 04:16:09',0,'2018-03-02 04:16:09',0),(41,'Nguyen Van Nhat','male','2018-01-01',3,'nguyenvannhat@gmail.com','$2a$10$YfS3lWvWIfgPHK5658lz6uH7P2BSagfWF2fSiffs6jMmoX1jQnds.','333333333333','2018-04-18','2018-07-07',1,'2018-03-02 04:16:47',0,'2018-03-02 04:16:47',0),(42,'Nguyen Thi Ha','male','2018-01-02',1,'hanguyen@gmail.com','$2a$10$O/CP4ItXKt9NJTFN11OfsOYEo1MT8r.o0tN4Bl4ITgHL3TveNYioK','33333333','2018-04-16','2018-08-04',1,'2018-03-02 04:17:46',0,'2018-03-02 04:17:46',0),(43,'nguyen thi ngoc','female','2018-01-01',1,'nguyenngoc@gmail.com','$2a$10$z/./lmIrBw1depToaXLonejx6W1BIDMx.XR66lSCsWIhXFywMjXLa','33333333','2018-04-17','2018-09-07',1,'2018-03-02 04:18:11',0,'2018-03-02 04:18:11',0),(44,'leader Java 1','male','2018-01-10',2,'leaderJava1@gmail.com','$2a$10$RhHa8IXYOZHe3rn3CbvGYe39cSaaqkdWpMqK92DCGJdojwVDoYzaK','4444444','2018-04-10','2018-10-05',1,'2018-03-02 04:18:37',0,'2018-03-02 04:18:37',0),(45,'Tran Ngoc Duyen','female','2018-01-01',1,'ngocduyen@gmail.com','$2a$10$LfO1UpQXctiSx.3w4aPeQeWfxXTTWwbNivi8yownoIu83jF43B5E2','444444444','2018-04-16','2018-10-24',1,'2018-03-02 04:19:03',0,'2018-03-02 04:19:03',0),(46,'Duong Thuc Huyen','female','2018-01-09',1,'thuchuyen@gmail.com','$2a$10$Lr58fAohdbWex/Gcjklj0.3qMeFEmJm.G/aCvRkOKWHbV8ebvWP6K','3333','2018-03-25','2018-10-30',1,'2018-03-02 04:19:22',0,'2018-03-02 04:19:22',0),(47,'leader java 2','male','2018-01-01',2,'leaderjava2@gmail.com','$2a$10$AZRBx41FMoCrGDose5kR/.2aTmhxchU22c2jwEKGHOllSiEfxGlOW','55555','2018-03-21','2018-11-09',1,'2018-03-02 04:19:44',0,'2018-03-02 04:19:44',0),(48,'Nguyen Thu Thuy','female','2018-01-03',1,'thuthuy@gmail.com','$2a$10$0d0jsp.qzaWc8MRkLnjmV./lg5ybJQj0IY5aZHTADXSbvf2F4q0Tu','6666666','2018-03-12','2018-12-07',1,'2018-03-02 04:20:14',0,'2018-03-02 04:20:14',0),(49,'Tran Van Hung','male','2017-12-31',1,'vanhung@gmail.com','$2a$10$qEr/S0U5tpeLpRXldgpLqu4diLYjYDsM5IwYal7R3ruJIBufU54iC','66','2018-03-13','2019-01-05',1,'2018-03-02 04:20:39',0,'2018-03-02 04:20:39',0),(50,'leader PHP 1','male','2017-11-28',2,'leaderPHP1@gmail.com','$2a$10$.TPOksQ/K5LLb8tWJERJ1e28natnzu9h4vwVZV43s2444hQ1IG3ta','66666','2018-02-25','2019-01-17',1,'2018-03-02 04:21:02',0,'2018-03-02 04:21:02',0),(51,'Nguyen Hoang Nam','male','2017-10-30',1,'hoangnam@gmail.com','$2a$10$KmGGeK3r9eAdo9hL2wNF8.NDxEb0h7nkuqaPUQo4ph9ZemwWagI.C','2222222','2018-02-27','2019-02-09',1,'2018-03-02 04:21:22',0,'2018-03-02 04:21:22',0),(52,'Mai Thi Bich Nguyen','female','2017-09-26',1,'bichnguyen@gmail.com','$2a$10$lUirJxA0ZbAbEMu94qitLuNGePsVt.ts2aScqlqw8pm8lJF6J5j5a','43434','2018-02-27','2019-03-08',1,'2018-03-02 04:21:44',0,'2018-03-02 04:21:44',0),(53,'leader PHP 2','male','2017-08-30',2,'leaderPHP2@gmail.com','$2a$10$BUyPzSswMSmeLM1umLZ6RemK1x4PU8mhXnKIdIv9yC0uiL2gthOji','454545','2018-02-14','2019-03-29',1,'2018-03-02 04:22:05',0,'2018-03-02 04:22:05',0),(54,'Manager PHP','male','2017-07-31',3,'managerPHP@gmail.com','$2a$10$OjAgIoPSx8gzMz05bGXLPu4thlBgSKIRLh8Y4Y5eXFvf/2UEIJ5K2','3434','2018-02-19','2019-04-06',1,'2018-03-02 04:22:37',0,'2018-03-02 04:22:37',0),(55,'nguyen ngoc diep','female','2018-03-06',18,'ngocdiep@gmail.com','$2a$10$jtGOY/Z2hjoFO9G.epD2auQfZ3.KXcdeeP52z8NZgQlGX5fEAqkXa','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-02 04:24:36',0),(56,'Duong Thi Trinh','female','2018-02-26',4,'thitrinh@gmail.com','$2a$10$ipm3vox8Eavf6yOEOoNKAe0KM6hJQHk1TKzOau7/54Tj/CwkimvAW','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-02 04:25:34',0),(57,'Nguyen Thi Quynh Nhu','female','2018-01-28',4,'quynhnhu@gmail.com','$2a$10$8LCXMlnDfKk4T.mpWfM6LOQzaKPlQr8XSF8H7VIxQfWJ9OOBOrBJa','565656','2018-03-05','2018-06-09',1,'2018-03-02 04:25:59',0,'2018-03-02 04:25:59',0),(52,'Mai Thi Bich Nguyen','female','2017-09-26',1,'bichnguyen@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','43434','2018-02-27','2019-03-08',1,'2018-03-02 04:21:44',0,'2018-03-02 04:35:00',0),(58,'Nguyen Hoang Dat','male','2018-02-27',2,'nguyenhoangdat@gmail.com','$2a$10$YeelpWkY8APbQ2sMwdAnxevLleLgpaEa..emulKkALYUC69aVflTy','33333333','2018-03-28','2018-04-05',1,'2018-03-02 04:39:14',0,'2018-03-02 04:39:14',0),(59,'Nguyen Thi Lan','female','2018-02-27',1,'nguyenthilan@gmail.com','$2a$10$lwWysqGUBEGiwJmkZu1nAOD64OkfNKNa9vpVpSQrFgyYHW3AwtRyC','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:40:36',0,'2018-03-02 04:40:36',0),(55,'nguyen ngoc diep','female','2018-03-06',18,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-02 04:35:18',0),(60,'Nguyen Van Nam','male','2018-02-26',3,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-02 04:47:02',0),(60,'Nguyen Van Nam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:46:38',0),(60,'Nguyen Thanh Lam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:47:51',0),(60,'Nguyen Thanh Lam','male','2018-02-26',2,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:48:22',0),(60,'Nguyen Thanh Lam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:50:33',0),(60,'Nguyen Thanh Lam','male','2018-02-26',2,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:50:50',0),(60,'Nguyen Thanh Lam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:52:05',0),(60,'Nguyen Thanh Lam','male','2018-02-26',2,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:55:33',0),(60,'Nguyen Thanh Lam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:56:18',0),(60,'Nguyen Thanh Lam','male','2018-02-26',2,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:56:49',0),(60,'Nguyen Thanh Lam','male','2018-02-26',1,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 08:57:07',0),(58,'Nguyen Hoang Dat','male','2018-02-27',1,'nguyenhoangdat@gmail.com','$2a$10$YeelpWkY8APbQ2sMwdAnxevLleLgpaEa..emulKkALYUC69aVflTy','33333333','2018-03-28','2018-04-05',1,'2018-03-02 04:39:14',0,'2018-03-05 08:32:24',0),(59,'Nguyen Thi Lan','female','2018-02-27',2,'nguyenthilan@gmail.com','$2a$10$lwWysqGUBEGiwJmkZu1nAOD64OkfNKNa9vpVpSQrFgyYHW3AwtRyC','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:40:36',0,'2018-03-05 08:41:23',0),(60,'Nguyen Thanh Lam','male','2018-02-26',3,'nguyenvannam@gmail.com','$2a$10$KBApFfLxCIJxJNFtZYVGhOSvH0vKFgzxlOgSndT/FVJNdQgiCgI6K','33333333','2018-03-26','2018-03-28',1,'2018-03-02 04:47:02',0,'2018-03-05 09:12:10',0),(61,'Tran Thi Que Ngan','female','2018-02-26',1,'quengan@gmail.com','$2a$10$knreJVXDAcOek9dSr2JDku68T.eWNj1xR1N9lNh/lV1dBw6VuiNNm','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-05 09:17:37',0),(61,'Tran Thi Que Ngan','female','2018-02-26',1,'quengan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-05 09:21:22',0),(61,'Tran Thi Que Ngan','female','2018-02-26',3,'quengan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-05 09:42:23',0),(61,'Tran Thi Que Ngan','female','2018-02-26',1,'quengan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-05 09:52:02',0),(37,'Cao Hai Nhi','female','1995-02-28',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-02 04:35:00',0),(37,'Cao Hai Nhi','female','1995-02-28',2,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-06 01:53:20',0),(37,'Cao Hai Nhi','female','1995-02-28',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-06 01:54:16',0),(37,'Cao Hai Nhi','female','1995-02-28',2,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-06 01:54:49',0),(37,'Cao Hai Nhi','female','1995-02-28',3,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','1233333','2018-03-27','2018-04-07',1,'2018-03-02 04:12:57',0,'2018-03-06 01:57:08',0),(55,'nguyen ngoc diep','female','2018-03-06',5,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-05 08:44:26',0),(55,'nguyen ngoc diep','female','2018-03-06',1,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-06 03:48:25',0),(55,'nguyen ngoc diep','female','2018-03-06',3,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-06 03:48:45',0),(56,'Duong Thi Trinh','female','2018-02-26',4,'thitrinh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-02 04:35:18',0),(56,'Duong Thi Trinh','female','2018-02-26',5,'thitrinh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-06 03:48:59',0),(56,'Duong Thi Trinh','female','2018-02-26',2,'thitrinh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-06 03:49:11',0),(55,'nguyen ngoc diep','female','2018-03-06',5,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-06 03:48:51',0),(55,'Nguyen Ngoc Diep','female','2018-03-06',5,'ngocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','56565','2018-03-13','2018-04-07',1,'2018-03-02 04:24:36',0,'2018-03-06 03:49:47',0),(56,'Phan Tran Diem Trinh','female','2018-02-26',2,'thitrinh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','343434','2018-03-20','2018-05-05',1,'2018-03-02 04:25:23',0,'2018-03-06 03:49:29',0),(61,'Tran Thi Que Ngan','female','2018-02-26',3,'quengan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','454545','2018-03-27','2018-04-07',1,'2018-03-05 09:17:37',0,'2018-03-05 09:52:11',0),(62,'Duong Thi Cam Nhung','female','2018-02-26',1,'camnhung@gmail.com','$2a$10$MTC8Go/hhgW8alj2AnkLeey5f8jbtP8DS34B8waMQEQ/uNI1..VOS','232323','2018-03-20','2018-04-07',1,'2018-03-06 03:56:47',0,'2018-03-06 03:56:47',0),(62,'Duong Thi Cam Nhung','female','2018-02-26',4,'camnhung@gmail.com','$2a$10$MTC8Go/hhgW8alj2AnkLeey5f8jbtP8DS34B8waMQEQ/uNI1..VOS','232323','2018-03-20','2018-04-07',1,'2018-03-06 03:56:47',0,'2018-03-06 03:58:48',0),(62,'Duong Thi Cam Nhung','female','2018-02-26',1,'camnhung@gmail.com','$2a$10$MTC8Go/hhgW8alj2AnkLeey5f8jbtP8DS34B8waMQEQ/uNI1..VOS','232323','2018-03-20','2018-04-07',1,'2018-03-06 03:56:47',0,'2018-03-06 03:59:39',0),(41,'Nguyen Van Nhat','male','2018-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','333333333333','2018-04-18','2018-07-07',1,'2018-03-02 04:16:47',0,'2018-03-02 04:35:00',0),(63,'ooio','male','2018-04-02',1,'hhhh','$2a$10$IuozSp.bjDn6QSWeST6TceZl7fMw23BQZLLdaawkIf4wNzDDrEyhG','7777777','2018-03-19','2018-03-27',1,'2018-03-06 04:18:53',0,'2018-03-06 04:18:53',0),(64,'ii','male','2018-02-26',1,'iiiiiiiii','$2a$10$2zDbolj1j5YaS1egXavVyurZNDJ7uqHyRmCiNAV.yZtK3iQhOdmWy','99999999','2018-03-26','2018-03-21',1,'2018-03-06 04:42:25',0,'2018-03-06 04:42:25',0),(65,'ggg','male','2018-03-05',1,'gg','$2a$10$njZIbj5MYJ4hwk3y8mfQ6usZc5vpc6QkxsjXNaORFy70A1DJyhnli','555','2018-03-12','2018-03-28',1,'2018-03-06 04:48:27',0,'2018-03-06 04:48:27',0),(66,'iii','male','2018-03-05',1,'iiii','$2a$10$.H8PWa/wd0ra0XXwgYm91OIOWi9PmypJ84WUJXe74xpJVpn4ILINq','888','2018-03-26','2018-03-28',1,'2018-03-06 06:29:46',0,'2018-03-06 06:29:46',0),(67,'nbnbn','male','2018-02-25',1,'ghgh','$2a$10$2xwrNrQIxvusib6LTGx40O5hRZmkdJZAfAwDoETvveAFuhFpTaZPm','76767','2018-03-26','2018-04-02',1,'2018-03-06 06:32:10',0,'2018-03-06 06:32:10',0),(68,'nhu quynh','male','2018-03-01',1,'nhuquynh@gmail.com','$2a$10$IZiMH/3rXZElY5MVXApmW.jdgoSw3gluEvx/QofsG3iVC1dV85bse','6767','2018-03-26','2018-04-06',1,'2018-03-06 07:00:36',0,'2018-03-06 07:00:36',0),(68,'nhu quynh','male','2018-03-01',2,'nhuquynh@gmail.com','$2a$10$IZiMH/3rXZElY5MVXApmW.jdgoSw3gluEvx/QofsG3iVC1dV85bse','6767','2018-03-26','2018-04-06',1,'2018-03-06 07:00:36',0,'2018-03-06 07:14:55',0),(41,'Nguyen Van Nhat','male','2018-01-01',1,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki','333333333333','2018-04-18','2018-07-07',1,'2018-03-02 04:16:47',0,'2018-03-06 04:02:49',0),(68,'nhu quynh','male','2018-03-01',1,'nhuquynh@gmail.com','$2a$10$IZiMH/3rXZElY5MVXApmW.jdgoSw3gluEvx/QofsG3iVC1dV85bse','6767','2018-03-26','2018-04-06',1,'2018-03-06 07:00:36',0,'2018-03-06 07:15:08',0),(69,'fgfgfg','male','2018-03-05',1,'fgfgfg','$2a$10$6Nj9wZUj6bYorDH.8320SedA.MADRkP1VkaA271oO2.8JGSukAqkO','666','2018-03-19','2018-03-14',1,'2018-03-06 08:43:11',0,'2018-03-06 08:43:11',0),(71,'new team leader','male','2018-02-26',1,'ffffffff','$2a$10$swfseEv/wKvrJKyIpSW74ur/CNPTMWWh7bedE9zI8DM6ijG5ZQYqm','4','2018-03-26','2018-03-29',1,'2018-03-06 09:25:21',0,'2018-03-06 09:25:21',0);
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
INSERT INTO `employee_off_status` VALUES (2017,47,148,148,1,'2018-03-02 06:46:51',0,'2018-03-07 02:22:55',0),(2017,48,148,150,1,'2018-03-02 06:46:51',0,'2018-03-02 06:46:51',0),(2017,49,148,152.5,1,'2018-03-02 06:46:51',0,'2018-03-07 02:24:49',0),(2017,50,148,150,1,'2018-03-02 06:46:51',0,'2018-03-02 06:46:51',0),(2017,51,148,150,1,'2018-03-02 06:46:51',0,'2018-03-02 06:46:51',0),(2018,37,153,150,1,'2018-03-02 06:46:06',0,'2018-03-07 03:43:18',0),(2018,38,165.5,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:49',0),(2018,39,185.5,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:49',0),(2018,40,146.5,150,1,'2018-03-02 06:28:09',0,'2018-03-07 03:52:49',0),(2018,41,111.5,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:49',0),(2018,42,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,43,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,44,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,45,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,46,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,47,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,48,148,157.5,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:57',0),(2018,49,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,50,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,51,111.5,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:49',0),(2018,53,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,54,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,55,126,150,1,'2018-03-05 09:20:31',0,'2018-03-07 02:22:55',0),(2018,56,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,57,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,58,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,59,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,60,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,61,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0);
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
INSERT INTO `employee_off_status_hist` VALUES (2018,40,100,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:28:09',0),(2018,40,150,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:28:45',0),(2018,40,148,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:29:23',0),(2017,40,148,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:46:06',0),(2018,40,148,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:46:16',0),(2018,37,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,37,140,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:56:42',0),(2018,37,138,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:00:15',0),(2018,37,137,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:00:30',0),(2018,37,136,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:01:02',0),(2018,38,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,38,146,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:02:10',0),(2018,38,145,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:02:27',0),(2018,39,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,39,147,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:03:15',0),(2018,39,145,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:03:36',0),(2018,38,143,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:02:45',0),(2018,37,134,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:01:15',0),(2018,39,143,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:03:54',0),(2018,39,145,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:07:59',0),(2018,38,145,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:04:40',0),(2018,38,147,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:07:59',0),(2018,39,144,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:07:59',0),(2018,39,146,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:13:33',0),(2018,38,146,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:07:59',0),(2018,37,135,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:07:51',0),(2018,37,137,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:14:41',0),(2018,38,147,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:14:41',0),(2018,37,138,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:15:39',0),(2018,40,147,150,1,'2018-03-02 06:28:09',0,'2018-03-02 06:47:30',0),(2018,37,146,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:16:35',0),(2018,37,147,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:17:35',0),(2018,39,145,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:13:33',0),(2018,37,155,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:17:43',0),(2018,37,156,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:22:48',0),(2018,38,149,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:16:12',0),(2018,40,148,150,1,'2018-03-02 06:28:09',0,'2018-03-02 07:16:40',0),(2018,39,146,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:20:32',0),(2018,37,157,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:22:48',0),(2018,37,158,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:36:30',0),(2018,37,160,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:37:08',0),(2018,37,168,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:40:59',0),(2018,37,170,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:41:04',0),(2018,37,172,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:41:14',0),(2018,37,173,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:45:21',0),(2018,37,174,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:48:53',0),(2018,37,174,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:48:53',0),(2018,37,174,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:48:53',0),(2018,37,173,150,1,'2018-03-02 06:46:06',0,'2018-03-02 08:20:26',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-02 08:20:46',0),(2018,37,169,150,1,'2018-03-02 06:46:06',0,'2018-03-06 01:57:39',0),(2018,37,168,150,1,'2018-03-02 06:46:06',0,'2018-03-06 01:57:55',0),(2018,37,169,150,1,'2018-03-02 06:46:06',0,'2018-03-06 01:58:43',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 01:58:47',0),(2018,37,170,150,1,'2018-03-02 06:46:06',0,'2018-03-06 04:39:49',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 04:39:55',0),(2018,37,170,150,1,'2018-03-02 06:46:06',0,'2018-03-06 05:53:26',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 05:53:33',0),(2018,37,170,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:02:31',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:02:43',0),(2018,37,168,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:03:33',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:03:40',0),(2018,37,168,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:05:29',0),(2018,37,171,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:06:04',0),(2018,37,169,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:26:06',0),(2018,37,167,150,1,'2018-03-02 06:46:06',0,'2018-03-06 08:50:01',0),(2018,37,165,150,1,'2018-03-02 06:46:06',0,'2018-03-07 01:11:19',0),(2017,47,148,150,1,'2018-03-02 06:46:51',0,'2018-03-02 06:46:51',0),(2018,48,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,55,150,150,1,'2018-03-05 09:20:31',0,'2018-03-05 09:20:31',0),(2018,37,167,150,1,'2018-03-02 06:46:06',0,'2018-03-07 01:11:30',0),(2018,40,150,150,1,'2018-03-02 06:28:09',0,'2018-03-02 07:29:04',0),(2018,37,153,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:22:55',0),(2017,49,148,150,1,'2018-03-02 06:46:51',0,'2018-03-02 06:46:51',0),(2018,51,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,41,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 06:46:06',0),(2018,38,150,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:24:37',0),(2018,39,148,150,1,'2018-03-02 06:46:06',0,'2018-03-02 07:34:54',0),(2018,48,148,157,1,'2018-03-02 06:46:06',0,'2018-03-07 02:22:55',0),(2018,37,156,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:24:49',0),(2018,37,158,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:40:18',0),(2018,37,160,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:57:03',0),(2018,37,156,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:57:21',0),(2018,37,156,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:57:49',0),(2018,37,156,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:57:56',0),(2018,37,152,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:58:25',0),(2018,37,152,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:58:32',0),(2018,37,144,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:58:55',0),(2018,37,152,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:59:36',0),(2018,37,148,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:59:50',0),(2018,37,148,150,1,'2018-03-02 06:46:06',0,'2018-03-07 02:59:59',0),(2018,37,146,150,1,'2018-03-02 06:46:06',0,'2018-03-07 03:06:03',0),(2018,37,138,150,1,'2018-03-02 06:46:06',0,'2018-03-07 03:06:51',0),(2018,37,140,150,1,'2018-03-02 06:46:06',0,'2018-03-07 03:41:55',0),(2018,40,146,150,1,'2018-03-02 06:28:09',0,'2018-03-07 02:24:49',0);
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
INSERT INTO `employee_role` VALUES (37,5,1,'2018-03-06 03:44:12',0,'2018-03-06 03:44:12',0),(38,5,1,'2018-03-02 04:14:46',0,'2018-03-02 04:14:46',0),(39,5,1,'2018-03-02 04:15:26',0,'2018-03-02 04:15:26',0),(40,3,1,'2018-03-02 04:16:09',0,'2018-03-02 04:16:09',0),(41,1,1,'2018-03-06 07:16:07',0,'2018-03-06 07:16:07',0),(42,5,1,'2018-03-02 04:17:46',0,'2018-03-02 04:17:46',0),(43,5,1,'2018-03-02 04:18:11',0,'2018-03-02 04:18:11',0),(44,3,1,'2018-03-02 04:18:37',0,'2018-03-02 04:18:37',0),(45,5,1,'2018-03-02 04:19:03',0,'2018-03-02 04:19:03',0),(46,5,1,'2018-03-02 04:19:22',0,'2018-03-02 04:19:22',0),(47,3,1,'2018-03-02 04:19:44',0,'2018-03-02 04:19:44',0),(48,5,1,'2018-03-02 04:20:14',0,'2018-03-02 04:20:14',0),(49,5,1,'2018-03-02 04:20:39',0,'2018-03-02 04:20:39',0),(50,3,1,'2018-03-02 04:21:02',0,'2018-03-02 04:21:02',0),(51,5,1,'2018-03-02 04:21:22',0,'2018-03-02 04:21:22',0),(53,3,1,'2018-03-02 04:22:05',0,'2018-03-02 04:22:05',0),(54,1,1,'2018-03-05 08:57:52',0,'2018-03-05 08:57:52',0),(55,2,1,'2018-03-06 03:50:11',0,'2018-03-06 03:50:11',0),(56,4,1,'2018-03-06 03:50:48',0,'2018-03-06 03:50:48',0),(57,4,1,'2018-03-02 04:25:59',0,'2018-03-02 04:25:59',0),(58,3,1,'2018-03-05 08:32:24',0,'2018-03-05 08:32:24',0),(59,5,1,'2018-03-05 08:41:23',0,'2018-03-05 08:41:23',0),(60,1,1,'2018-03-05 09:12:10',0,'2018-03-05 09:12:10',0),(61,5,1,'2018-03-06 03:53:10',0,'2018-03-06 03:53:10',0),(62,5,1,'2018-03-06 04:02:08',0,'2018-03-06 04:02:08',0),(68,5,1,'2018-03-06 07:58:03',0,'2018-03-06 07:58:03',0),(70,5,1,'2018-03-06 09:24:12',0,'2018-03-06 09:24:12',0),(71,5,1,'2018-03-06 09:25:26',0,'2018-03-06 09:25:26',0),(72,1,1,'2018-03-06 09:31:28',0,'2018-03-06 09:31:28',0),(73,5,1,'2018-03-06 09:36:18',0,'2018-03-06 09:36:18',0),(74,3,1,'2018-03-06 09:37:42',0,'2018-03-06 09:37:42',0);
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
INSERT INTO `employee_role_hist` VALUES (56,4,1,'2018-03-02 04:25:23',0,'2018-03-02 04:25:23',0),(52,5,1,'2018-03-02 04:21:44',0,'2018-03-02 04:21:44',0),(59,5,1,'2018-03-02 04:40:36',0,'2018-03-02 04:40:36',0),(58,3,1,'2018-03-02 04:39:14',0,'2018-03-02 04:39:14',0),(59,5,1,'2018-03-05 08:31:16',0,'2018-03-05 08:31:16',0),(60,1,1,'2018-03-02 04:47:02',0,'2018-03-02 04:47:02',0),(60,1,1,'2018-03-05 08:46:38',0,'2018-03-05 08:46:38',0),(60,1,1,'2018-03-05 08:47:51',0,'2018-03-05 08:47:51',0),(60,1,1,'2018-03-05 08:48:22',0,'2018-03-05 08:48:22',0),(60,1,1,'2018-03-05 08:50:33',0,'2018-03-05 08:50:33',0),(60,1,1,'2018-03-05 08:50:50',0,'2018-03-05 08:50:50',0),(60,1,1,'2018-03-05 08:55:33',0,'2018-03-05 08:55:33',0),(60,1,1,'2018-03-05 08:56:18',0,'2018-03-05 08:56:18',0),(60,1,1,'2018-03-05 08:56:49',0,'2018-03-05 08:56:49',0),(54,1,1,'2018-03-02 04:22:37',0,'2018-03-02 04:22:37',0),(60,1,1,'2018-03-05 08:57:07',0,'2018-03-05 08:57:07',0),(61,5,1,'2018-03-05 09:17:37',0,'2018-03-05 09:17:37',0),(61,5,1,'2018-03-05 09:42:23',0,'2018-03-05 09:42:23',0),(61,5,1,'2018-03-05 09:52:02',0,'2018-03-05 09:52:02',0),(37,5,1,'2018-03-02 04:12:57',0,'2018-03-02 04:12:57',0),(37,5,1,'2018-03-06 01:53:20',0,'2018-03-06 01:53:20',0),(37,5,1,'2018-03-06 01:54:16',0,'2018-03-06 01:54:16',0),(37,5,1,'2018-03-06 01:54:49',0,'2018-03-06 01:54:49',0),(37,5,1,'2018-03-06 01:57:08',0,'2018-03-06 01:57:08',0),(55,2,1,'2018-03-02 04:24:36',0,'2018-03-02 04:24:36',0),(55,2,1,'2018-03-06 03:48:25',0,'2018-03-06 03:48:25',0),(55,2,1,'2018-03-06 03:48:45',0,'2018-03-06 03:48:45',0),(56,4,1,'2018-03-02 04:25:34',0,'2018-03-02 04:25:34',0),(56,4,1,'2018-03-06 03:48:59',0,'2018-03-06 03:48:59',0),(56,4,1,'2018-03-06 03:49:11',0,'2018-03-06 03:49:11',0),(55,2,1,'2018-03-06 03:48:51',0,'2018-03-06 03:48:51',0),(55,2,1,'2018-03-06 03:49:47',0,'2018-03-06 03:49:47',0),(56,4,1,'2018-03-06 03:49:29',0,'2018-03-06 03:49:29',0),(61,5,1,'2018-03-05 09:52:11',0,'2018-03-05 09:52:11',0),(62,5,1,'2018-03-06 03:56:47',0,'2018-03-06 03:56:47',0),(62,5,1,'2018-03-06 03:58:48',0,'2018-03-06 03:58:48',0),(41,1,1,'2018-03-02 04:16:47',0,'2018-03-02 04:16:47',0),(41,1,1,'2018-03-06 04:01:26',0,'2018-03-06 04:01:26',0),(62,5,1,'2018-03-06 03:59:39',0,'2018-03-06 03:59:39',0),(41,1,1,'2018-03-06 04:01:44',0,'2018-03-06 04:01:44',0),(63,3,1,'2018-03-06 04:18:53',0,'2018-03-06 04:18:53',0),(64,5,1,'2018-03-06 04:42:25',0,'2018-03-06 04:42:25',0),(65,5,1,'2018-03-06 04:48:27',0,'2018-03-06 04:48:27',0),(66,5,1,'2018-03-06 06:29:46',0,'2018-03-06 06:29:46',0),(67,4,1,'2018-03-06 06:32:10',0,'2018-03-06 06:32:10',0),(68,5,1,'2018-03-06 07:00:36',0,'2018-03-06 07:00:36',0),(68,5,1,'2018-03-06 07:12:03',0,'2018-03-06 07:12:03',0),(68,5,1,'2018-03-06 07:12:05',0,'2018-03-06 07:12:05',0),(68,5,1,'2018-03-06 07:12:27',0,'2018-03-06 07:12:27',0),(68,5,1,'2018-03-06 07:14:55',0,'2018-03-06 07:14:55',0),(41,1,1,'2018-03-06 04:02:49',0,'2018-03-06 04:02:49',0),(68,5,1,'2018-03-06 07:15:08',0,'2018-03-06 07:15:08',0),(69,5,1,'2018-03-06 08:43:11',0,'2018-03-06 08:43:11',0),(71,5,1,'2018-03-06 09:25:21',0,'2018-03-06 09:25:21',0);
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
INSERT INTO `position` VALUES (1,'employee',1,'2018-01-05 03:52:20',0,'2018-01-29 09:11:52',0),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(3,'project manager',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(5,'hr manager',1,'2018-03-05 08:44:19',0,'2018-03-05 08:44:19',0);
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
INSERT INTO `position_hist` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(2,'leader',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(3,'project manager',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(4,'hr',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(17,'hrrrrrrrr',0,'2018-01-22 06:28:20',0,'2018-01-22 06:28:20',0),(20,'aaaaaabbbbb',0,'2018-01-22 09:28:18',0,'2018-01-22 09:28:18',0),(19,'aaaaaa',0,'2018-01-22 09:27:50',0,'2018-01-22 09:27:50',0),(17,'hrrrrrrrrabdsbfb',0,'2018-01-22 06:28:20',0,'2018-01-22 06:29:15',0),(1,'emplyee',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(19,'aaaaaabbbbb',0,'2018-01-22 09:27:50',0,'2018-01-22 09:28:57',0),(18,'abc',0,'2018-01-22 09:13:41',0,'2018-01-22 09:13:41',0),(18,'cdf',0,'2018-01-22 09:13:41',0,'2018-02-02 04:12:49',0),(21,'abc',0,'2018-02-02 04:14:13',0,'2018-02-02 04:14:13',0),(18,'hr manager',1,'2018-01-22 09:13:41',0,'2018-03-02 04:23:47',0);
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
  `total_time` double DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2.5,'khám sức khỏe',5,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-07 02:26:08',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:47:08',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',1,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-06 04:39:18',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',18,'đau',1,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-06 04:39:18',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',1,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-06 03:07:50',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',13.5,'mệt',2,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:44:35',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',111.5,'bệnh',5,'commit code',1,41,1,'2018-03-02 07:01:15',0,'2018-03-07 03:39:57',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',5,'đau',5,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-07 03:44:05',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:47:08',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:47:08',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',1,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-07 03:48:19',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',10.5,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-07 02:26:08',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',5,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:47:08',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',1,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-07 03:49:07',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'ok',16,41,0,'2018-03-02 07:19:56',0,'2018-03-07 03:52:49',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',2.5,'bệnh',5,'',1,41,0,'2018-03-02 07:19:56',0,'2018-03-07 02:26:08',0),(47,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',5,'',2,40,0,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,0,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',3,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:48:53',0),(50,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2.5,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-07 02:26:08',0),(51,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',5,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(52,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(53,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',1.5,'bệnh',5,'',2,41,1,'2018-03-02 07:19:56',0,'2018-03-07 02:26:08',0),(54,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(55,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(56,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',3,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:54',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',5,'chi do',1,'',1,68,1,'2018-03-02 08:20:26',0,'2018-03-07 02:57:56',0),(58,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'bị đau',1,'',1,41,0,'2018-03-02 08:20:46',0,'2018-03-06 01:58:47',0),(59,37,'2018-03-01 08:00:00','2018-03-02 08:00:00',2,'test',3,'',1,37,1,'2018-03-06 01:57:39',0,'2018-03-06 08:56:07',0),(60,37,'2018-03-01 08:00:00','2018-03-16 08:00:00',2.5,'test',1,'',1,37,0,'2018-03-06 01:57:55',0,'2018-03-07 02:26:08',0),(61,37,'2018-02-26 08:00:00','2018-02-26 09:00:00',1,'di tham ong ba',1,'',1,40,0,'2018-03-06 04:39:49',0,'2018-03-06 04:39:55',0),(62,37,'2018-02-26 08:00:00','2018-02-26 09:00:00',1,'yyyyyyyyyy',1,'',1,40,0,'2018-03-06 05:53:26',0,'2018-03-06 05:53:33',0),(63,37,'2018-02-26 08:00:00','2018-03-26 08:00:00',1,'yuyuyu',1,'',1,68,0,'2018-03-06 08:02:31',0,'2018-03-06 08:02:43',0),(64,37,'2018-02-26 08:00:00','2018-02-26 11:00:00',3,'yyyyyyyyyy',1,'',1,68,0,'2018-03-06 08:03:33',0,'2018-03-06 08:03:40',0),(65,37,'2018-03-05 08:00:00','2018-03-28 11:00:00',3,'kkkkkk',4,'',1,68,0,'2018-03-06 08:05:29',0,'2018-03-06 08:06:04',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',12.5,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:59:59',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121ppppppp',1,'tai sao nghi?',1,68,0,'2018-03-06 08:50:01',0,'2018-03-07 02:40:18',0),(68,37,'2018-02-26 08:00:00','2018-02-26 10:00:00',2,'12121',1,'',1,68,0,'2018-03-07 01:11:19',0,'2018-03-07 01:11:30',0),(69,37,'2018-02-27 08:00:00','2018-02-27 09:30:00',1.5,'222222222',1,'',1,68,1,'2018-03-07 03:06:03',0,'2018-03-07 03:06:03',0),(70,37,'2018-02-28 08:00:00','2018-02-28 16:30:00',7.5,'138.5',5,'',1,68,1,'2018-03-07 03:06:51',0,'2018-03-07 03:06:51',0);
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
INSERT INTO `request_hist` VALUES (32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'',200,41,1,'2018-03-02 06:47:30',0,'2018-03-02 06:47:30',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 06:49:56',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 06:50:03',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,40,1,'2018-03-02 06:56:42',0,'2018-03-02 06:56:42',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 06:57:52',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',5,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:03:54',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',2,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:04:27',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,40,1,'2018-03-02 07:03:15',0,'2018-03-02 07:03:15',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',5,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:02:10',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:01:02',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',5,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:00:15',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:00:30',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:03:36',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:04:35',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:02:45',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:02:27',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',1,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 06:29:23',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',4,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 06:51:53',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',2,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 06:58:23',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',2,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:04:47',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',3,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:07:51',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',2,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:04:47',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',3,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:04:40',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:07:59',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',3,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:07:59',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:07:59',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',3,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:07:59',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',2,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:04:27',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:13:19',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:13:19',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:13:19',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:01:15',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',3,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:14:41',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:14:41',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:13:19',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',2,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:15:39',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:13:19',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',3,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:16:12',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:16:12',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:13:19',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:13:19',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',3,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:16:40',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',2,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:16:40',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',3,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:16:35',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',3,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:15:39',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:14:41',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:14:41',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:16:12',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:13:33',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',3,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:13:33',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:16:57',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:16:57',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:16:57',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:17:12',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:16:57',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:16:57',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:17:27',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:17:27',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:16:57',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:16:57',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:16:57',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:13:19',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',2,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:18:24',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',2,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:17:48',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',3,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:17:43',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',3,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:17:35',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:17:27',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:17:20',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:17:12',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:17:06',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:17:06',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:18:44',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(55,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(54,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(53,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(53,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:22:26',0),(50,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:18:44',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:18:44',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:24:32',0),(52,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',2,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:24:45',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',2,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:25:48',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',2,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:25:48',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:18:44',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:26:51',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:18:44',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:18:44',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:18:44',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',3,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:29:04',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',2,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:31:14',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:28:42',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:26:51',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:24:32',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',2,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:24:04',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:20:13',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',2,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:20:17',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',2,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:24:45',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',2,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:25:48',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',3,'',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:22:48',0),(50,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',3,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:22:48',0),(52,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:24:37',0),(53,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',2,'',2,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:22:26',0),(54,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',3,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:20:32',0),(55,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',2,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:20:28',0),(56,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',5,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(51,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',5,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(47,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',5,'',2,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:19:56',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',5,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:13:19',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:13:19',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',5,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:13:19',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:34:21',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:34:21',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:18:44',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',2,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:39:47',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:18:44',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',2,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:38:14',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:34:21',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',2,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:38:04',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:34:21',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:34:21',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:34:21',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:34:21',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',5,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:13:19',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(47,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',3,'',2,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:37:08',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',1,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:40:43',0),(47,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',1,'',2,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:40:43',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',1,'',1,41,1,'2018-03-02 07:01:15',0,'2018-03-02 07:40:43',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',1,'',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:40:43',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',1,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:40:43',0),(32,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'ok',16,41,1,'2018-03-02 06:47:30',0,'2018-03-02 07:40:43',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',1,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:40:43',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',1,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:40:43',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',1,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:40:43',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',1,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:40:43',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',1,'',1,41,0,'2018-03-02 07:01:15',0,'2018-03-02 07:41:14',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',1,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:40:43',0),(39,38,'2018-03-10 08:00:00','2018-03-10 09:00:00',1,'đau',1,'',1,41,1,'2018-03-02 07:02:27',0,'2018-03-02 07:40:43',0),(40,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',1,'',2,41,1,'2018-03-02 07:02:45',0,'2018-03-02 07:40:43',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',1,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:40:43',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',1,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:40:43',0),(43,39,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'ốm',1,'',1,40,1,'2018-03-02 07:03:54',0,'2018-03-02 07:40:43',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',1,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:40:43',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:40:43',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',1,'',1,41,0,'2018-03-02 07:19:56',0,'2018-03-02 07:40:59',0),(47,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',1,'',2,40,0,'2018-03-02 07:19:56',0,'2018-03-02 07:41:04',0),(48,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',1,'',16,41,0,'2018-03-02 07:19:56',0,'2018-03-02 07:45:21',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',3,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:36:30',0),(51,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',2,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:35:00',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',3,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:48:53',0),(49,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',3,'',1,40,1,'2018-03-02 07:19:56',0,'2018-03-02 07:48:53',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:47:08',0),(60,37,'2018-03-01 08:00:00','2018-03-16 08:00:00',1,'test',1,'',1,37,1,'2018-03-06 01:57:55',0,'2018-03-06 01:57:55',0),(58,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'bị đau',1,'',1,41,1,'2018-03-02 08:20:46',0,'2018-03-02 08:20:46',0),(35,37,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'ốm',5,'',16,41,1,'2018-03-02 07:00:30',0,'2018-03-02 07:47:08',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',2,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-02 07:49:08',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,0,'2018-03-02 07:01:15',0,'2018-03-02 07:47:08',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'đau',5,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-02 07:47:08',0),(33,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,1,'2018-03-02 06:56:42',0,'2018-03-02 07:47:08',0),(34,37,'2018-03-01 08:00:00','2018-03-01 10:00:00',18,'đau',5,'',2,40,1,'2018-03-02 07:00:15',0,'2018-03-06 03:30:49',0),(61,37,'2018-02-26 08:00:00','2018-02-26 09:00:00',1,'di tham ong ba',1,'',1,40,1,'2018-03-06 04:39:49',0,'2018-03-06 04:39:49',0),(62,37,'2018-02-26 08:00:00','2018-02-26 09:00:00',1,'yyyyyyyyyy',1,'',1,40,1,'2018-03-06 05:53:26',0,'2018-03-06 05:53:26',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'bị ốm',1,'',1,40,1,'2018-03-02 08:20:26',0,'2018-03-02 08:20:26',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'uuuuuuuuu',1,'',1,40,1,'2018-03-02 08:20:26',0,'2018-03-06 07:25:54',0),(63,37,'2018-02-26 08:00:00','2018-03-26 08:00:00',1,'yuyuyu',1,'',1,68,1,'2018-03-06 08:02:31',0,'2018-03-06 08:02:31',0),(64,37,'2018-02-26 08:00:00','2018-02-26 11:00:00',3,'yyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:03:33',0,'2018-03-06 08:03:33',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'uuuuuuuuu',1,'',1,41,1,'2018-03-02 08:20:26',0,'2018-03-06 07:26:05',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'uu',1,'',1,41,1,'2018-03-02 08:20:26',0,'2018-03-06 08:04:27',0),(65,37,'2018-03-05 08:00:00','2018-03-28 11:00:00',3,'kkkkkkkkkkkkk',1,'',1,68,1,'2018-03-06 08:05:29',0,'2018-03-06 08:05:29',0),(65,37,'2018-03-05 08:00:00','2018-03-28 11:00:00',3,'kkkkkk',5,'',1,68,1,'2018-03-06 08:05:29',0,'2018-03-06 08:05:38',0),(65,37,'2018-03-05 08:00:00','2018-03-28 11:00:00',3,'kkkkkk',4,'',1,68,1,'2018-03-06 08:05:29',0,'2018-03-06 08:05:57',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'uuuiuiui',1,'',1,41,1,'2018-03-02 08:20:26',0,'2018-03-06 08:05:16',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-06 08:26:06',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',1,'',1,41,1,'2018-03-06 08:26:06',0,'2018-03-06 08:26:45',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',1,'',1,40,1,'2018-03-06 08:26:06',0,'2018-03-06 08:27:18',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',1,'',1,69,1,'2018-03-06 08:26:06',0,'2018-03-06 08:43:24',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121',1,'',1,68,1,'2018-03-06 08:50:01',0,'2018-03-06 08:50:01',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121',1,'',1,69,1,'2018-03-06 08:50:01',0,'2018-03-06 08:50:27',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121pppppppppppppppp',1,'',1,68,1,'2018-03-06 08:50:01',0,'2018-03-06 08:51:30',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'chi do',1,'',1,41,1,'2018-03-02 08:20:26',0,'2018-03-06 08:06:56',0),(59,37,'2018-03-01 08:00:00','2018-03-02 08:00:00',2,'test',2,'',1,37,1,'2018-03-06 01:57:39',0,'2018-03-06 01:57:39',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121pppppppppppppppp',1,'',1,69,1,'2018-03-06 08:50:01',0,'2018-03-06 08:53:15',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121pppppppppppppppp',4,'',1,69,1,'2018-03-06 08:50:01',0,'2018-03-06 09:13:08',0),(68,37,'2018-02-26 08:00:00','2018-02-26 10:00:00',2,'12121',1,'',1,68,1,'2018-03-07 01:11:19',0,'2018-03-07 01:11:19',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121pppppppppppppppp',4,'tai sao nghi?',1,69,1,'2018-03-06 08:50:01',0,'2018-03-06 09:13:34',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121ppppppp',1,'tai sao nghi?',1,68,1,'2018-03-06 08:50:01',0,'2018-03-07 01:11:36',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',4,'',1,41,0,'2018-03-02 07:01:15',0,'2018-03-06 03:07:50',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',4,'commit code',1,41,0,'2018-03-02 07:01:15',0,'2018-03-07 01:26:45',0),(31,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 06:29:23',0,'2018-03-02 07:47:08',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',4,'commit code',1,41,1,'2018-03-02 07:01:15',0,'2018-03-07 01:28:23',0),(42,39,'2018-03-02 08:00:00','2018-03-02 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:03:36',0,'2018-03-02 07:47:08',0),(46,37,'2018-03-15 08:00:00','2018-03-16 08:00:00',8,'bệnh',5,'',1,41,0,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(50,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',2,'bệnh',5,'',1,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(53,38,'2018-03-16 08:00:00','2018-03-21 10:00:00',2,'bệnh',5,'',2,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:34:21',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',1,'chi do',1,'',1,40,1,'2018-03-02 08:20:26',0,'2018-03-06 08:54:54',0),(60,37,'2018-03-01 08:00:00','2018-03-16 08:00:00',1,'test',1,'',1,37,0,'2018-03-06 01:57:55',0,'2018-03-06 01:58:43',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',4,'bệnh',4,'commit code',1,41,1,'2018-03-02 07:01:15',0,'2018-03-07 02:26:08',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',12,'bệnh',4,'commit code',1,41,1,'2018-03-02 07:01:15',0,'2018-03-07 02:30:24',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121ppppppp',5,'tai sao nghi?',1,68,1,'2018-03-06 08:50:01',0,'2018-03-07 01:11:41',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',2,'',1,69,1,'2018-03-06 08:26:06',0,'2018-03-06 08:47:01',0),(67,37,'2018-02-27 08:00:00','2018-03-27 10:00:00',2,'121212121ppppppp',1,'tai sao nghi?',1,68,1,'2018-03-06 08:50:01',0,'2018-03-07 02:40:09',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',2,'yyyyyyyyyyyy',1,'',1,69,1,'2018-03-06 08:26:06',0,'2018-03-07 02:40:09',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',0,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:57:03',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',4,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:57:21',0),(57,37,'2018-03-01 08:00:00','2018-03-01 09:00:00',4,'chi do',1,'',1,40,1,'2018-03-02 08:20:26',0,'2018-03-07 02:26:08',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',4,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:57:49',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',8,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:58:25',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',8,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:58:32',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',16,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:58:55',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',8,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:59:36',0),(66,37,'2018-03-05 08:00:00','2018-03-05 10:00:00',12,'yyyyyyyyyyyy',1,'',1,68,1,'2018-03-06 08:26:06',0,'2018-03-07 02:59:50',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',4,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-06 03:07:50',0),(37,37,'2018-03-10 08:00:00','2018-03-10 10:00:00',112,'bệnh',4,'commit code',1,41,1,'2018-03-02 07:01:15',0,'2018-03-07 02:37:09',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:39:57',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'mệt',3,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:41:55',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',14,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:42:43',0),(38,38,'2018-03-03 08:00:00','2018-03-10 10:00:00',2,'đau',5,'',1,40,1,'2018-03-02 07:02:10',0,'2018-03-02 07:47:08',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',14,'mệt',3,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:43:18',0),(36,37,'2018-03-03 08:00:00','2018-03-03 09:00:00',14,'mệt',5,'',1,40,1,'2018-03-02 07:01:02',0,'2018-03-07 03:44:22',0),(41,39,'2018-03-02 08:00:00','2018-03-02 09:00:00',1,'đau',5,'',1,41,1,'2018-03-02 07:03:15',0,'2018-03-02 07:47:08',0),(44,40,'2018-03-01 08:00:00','2018-03-01 10:00:00',2,'khám sức khỏe',5,'',200,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',5,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-02 07:47:08',0),(45,40,'2018-03-03 08:00:00','2018-03-03 09:00:00',1,'khám bệnh',1,'ok',16,41,1,'2018-03-02 07:19:56',0,'2018-03-07 03:49:07',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (10,'Java 1',44,62,1,'2018-03-02 04:29:50',0,'2018-03-02 04:29:50',0),(11,'Java 2',47,62,1,'2018-03-02 04:30:25',0,'2018-03-02 04:30:25',0),(12,'PHP 1',50,63,1,'2018-03-02 04:30:44',0,'2018-03-02 04:30:44',0),(13,'PHP 2',53,63,1,'2018-03-02 04:30:57',0,'2018-03-02 04:30:57',0),(15,'intern',40,62,1,'2018-03-02 04:42:59',0,'2018-03-07 03:40:27',0),(16,'team Ruby 1',59,66,1,'2018-03-05 09:13:01',0,'2018-03-05 09:13:01',0),(17,'new team',71,62,1,'2018-03-06 09:25:53',0,'2018-03-06 09:39:00',0),(18,'new team 2',74,62,1,'2018-03-06 09:38:01',0,'2018-03-06 09:39:17',0);
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
INSERT INTO `team_employee` VALUES (10,42,1,'2018-03-02 04:29:50',0,'2018-03-02 04:29:50',0),(10,43,1,'2018-03-02 04:29:50',0,'2018-03-02 04:29:50',0),(11,45,1,'2018-03-02 04:30:25',0,'2018-03-02 04:30:25',0),(11,46,1,'2018-03-02 04:30:25',0,'2018-03-02 04:30:25',0),(12,48,1,'2018-03-02 04:30:44',0,'2018-03-02 04:30:44',0),(12,49,1,'2018-03-02 04:30:44',0,'2018-03-02 04:30:44',0),(13,51,1,'2018-03-02 04:30:57',0,'2018-03-02 04:30:57',0),(15,37,1,'2018-03-06 03:46:01',0,'2018-03-06 03:46:01',0),(15,38,1,'2018-03-02 04:42:59',0,'2018-03-02 04:42:59',0),(15,39,1,'2018-03-02 04:42:59',0,'2018-03-02 04:42:59',0),(16,58,1,'2018-03-05 09:13:01',0,'2018-03-05 09:13:01',0),(16,61,1,'2018-03-06 04:09:22',0,'2018-03-06 04:09:22',0),(17,70,1,'2018-03-06 09:26:29',0,'2018-03-06 09:26:29',0),(18,73,1,'2018-03-06 09:38:01',0,'2018-03-06 09:38:01',0);
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
INSERT INTO `team_employee_hist` VALUES (13,52,1,'2018-03-02 04:30:57',0,'2018-03-02 04:30:57',0),(14,59,1,'2018-03-02 04:40:54',0,'2018-03-02 04:40:54',0),(9,37,1,'2018-03-02 04:28:53',0,'2018-03-02 04:28:53',0),(9,38,1,'2018-03-02 04:28:53',0,'2018-03-02 04:28:53',0),(9,39,1,'2018-03-02 04:28:53',0,'2018-03-02 04:28:53',0),(13,60,1,'2018-03-05 08:48:06',0,'2018-03-05 08:48:06',0),(13,60,1,'2018-03-05 08:56:40',0,'2018-03-05 08:56:40',0),(15,37,1,'2018-03-02 04:42:59',0,'2018-03-02 04:42:59',0),(15,37,1,'2018-03-06 01:54:28',0,'2018-03-06 01:54:28',0),(10,62,1,'2018-03-06 03:58:34',0,'2018-03-06 03:58:34',0),(10,62,1,'2018-03-06 03:59:54',0,'2018-03-06 03:59:54',0),(17,70,1,'2018-03-06 09:25:53',0,'2018-03-06 09:25:53',0);
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
INSERT INTO `team_hist` VALUES (14,'Java 3',58,62,1,'2018-03-02 04:39:37',0,'2018-03-02 04:39:37',0),(9,'intern',40,62,1,'2018-03-02 04:28:53',0,'2018-03-02 04:28:53',0),(15,'intern',40,62,1,'2018-03-02 04:42:59',0,'2018-03-02 04:42:59',0),(15,'intern',37,62,1,'2018-03-02 04:42:59',0,'2018-03-06 01:53:37',0),(15,'intern',40,62,1,'2018-03-02 04:42:59',0,'2018-03-06 01:54:03',0),(15,'intern',37,62,1,'2018-03-02 04:42:59',0,'2018-03-06 01:54:59',0),(15,'intern',37,63,1,'2018-03-02 04:42:59',0,'2018-03-06 01:55:59',0),(15,'intern',40,63,1,'2018-03-02 04:42:59',0,'2018-03-06 01:56:53',0),(15,'intern',40,62,1,'2018-03-02 04:42:59',0,'2018-03-06 03:45:40',0),(17,'new team',71,67,1,'2018-03-06 09:25:53',0,'2018-03-06 09:25:53',0),(17,'new team',71,62,1,'2018-03-06 09:25:53',0,'2018-03-06 09:28:10',0),(17,'new team',71,68,1,'2018-03-06 09:25:53',0,'2018-03-06 09:35:26',0),(18,'new team 2',74,68,1,'2018-03-06 09:38:01',0,'2018-03-06 09:38:01',0),(15,'intern',68,62,1,'2018-03-02 04:42:59',0,'2018-03-06 07:58:14',0);
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

-- Dump completed on 2018-03-07 11:11:40
