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
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_off_type`
--

LOCK TABLES `day_off_type` WRITE;
/*!40000 ALTER TABLE `day_off_type` DISABLE KEYS */;
INSERT INTO `day_off_type` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(3,'Vợ sinh (sinh đôi và mổ)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(4,'Vợ sinh (sinh đôi trở lên)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(5,'Vợ sinh (sinh thường)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(6,'Vợ sinh (sinh mổ)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(7,'Sảy thai (thai từ 6 tháng trở lên)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(10,'Sảy thai (thai dưới 1 tháng)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(11,'Sau thai sản (sinh đôi trở lên)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(12,'Sau thai sản (sinh thường)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(13,'Sau thai sản (sinh mổ)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(14,'Người thân mất',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(15,'Nghỉ thai sản',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(17,'Nghỉ không lương',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(19,'Nghỉ dưỡng sức các trường hợp khác',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(20,'Nghỉ dưỡng sau phẫu thuật',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(21,'Kết hôn',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(22,'Khám thai',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(23,'Con ốm (con từ 3 đến 7 tuổi)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(24,'Con ốm (con dưới 3 tuổi)',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0),(25,'Con kết hôn',0,1,'2018-01-05 06:25:20',0,'2018-01-26 07:16:46',0);
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
INSERT INTO `day_off_type_hist` VALUES (1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 07:51:58',NULL),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(16,'Nghỉ phép thường',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:26:20',NULL),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(22,'Khám thai',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',NULL,'2018-01-05 06:25:57',NULL),(1,'Ốm đau (đã đóng bảo hiểm từ 15 đến dưới 30 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(2,'Ốm đau (đã đóng bảo hiểm dưới 15 năm)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(3,'Vợ sinh (sinh đôi và mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(4,'Vợ sinh (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(5,'Vợ sinh (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(6,'Vợ sinh (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(7,'Sảy thai (thai từ 6 tháng trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(8,'Sảy thai (thai từ 3 tháng đến dưới 6 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(9,'Sảy thai (thai từ 1 tháng đến dưới 3 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(10,'Sảy thai (thai dưới 1 tháng)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(11,'Sau thai sản (sinh đôi trở lên)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(12,'Sau thai sản (sinh thường)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(13,'Sau thai sản (sinh mổ)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(14,'Người thân mất',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(15,'Nghỉ thai sản',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(18,'Nghỉ dưỡng sức sau điều trị dài ngày',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(17,'Nghỉ không lương',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(19,'Nghỉ dưỡng sức các trường hợp khác',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(20,'Nghỉ dưỡng sau phẫu thuật',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(21,'Kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(22,'Khám thai',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(23,'Con ốm (con từ 3 đến 7 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(24,'Con ốm (con dưới 3 tuổi)',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0),(25,'Con kết hôn',1,1,'2018-01-05 06:25:20',0,'2018-01-10 07:29:53',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(2,'PHP',9,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(3,'Ruby',10,1,'2018-01-05 04:01:27',0,'2018-01-10 07:30:06',0),(4,'QC',8,1,'2018-01-05 04:02:59',0,'2018-01-10 07:30:06',0),(5,'iOS',11,1,'2018-01-05 04:04:16',0,'2018-01-10 07:30:06',0);
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
INSERT INTO `department_hist` VALUES (1,'Java',5,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(2,'PHP',9,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(3,'Ruby',10,1,'2018-01-05 04:01:27',NULL,'2018-01-05 04:01:27',NULL),(4,'QC',8,1,'2018-01-05 04:02:59',NULL,'2018-01-05 04:02:59',NULL),(5,'iOS',11,1,'2018-01-05 04:04:16',NULL,'2018-01-05 04:04:16',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 06:44:02',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 06:44:02',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 06:44:02',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 06:44:02',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 06:44:02',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 06:44:02',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 06:44:02',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 06:44:02',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 06:44:02',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',326599854,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 06:44:02',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 08:14:19',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,NULL,0,'2018-01-19 08:14:19',0),(29,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$kj36D50adw0Q83o5mgEDCerYy5pmi6loIMEnaT3i23rJV7oU6F0ba',32659123,'2010-01-01','2010-01-01',1,NULL,0,NULL,0),(30,'dactech133','male','1995-06-21',3,'cdactech@gmail.com','$2a$10$/2vIb8/9ejrVkXmBRLLwZOEZYAgiVIrNXrIPzxIWAiaEKn8Q7mVue',32659123,'2010-01-01','2010-01-01',1,'2018-01-22 06:42:18',0,'2018-01-22 06:42:51',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326512,'2010-01-22','2010-01-22',1,'2018-01-31 08:45:16',0,'2018-01-31 08:59:55',0);
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
INSERT INTO `employee_hist` VALUES (1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',NULL,'2018-01-05 04:23:55',NULL),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',NULL,'2018-01-05 03:57:37',NULL),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',NULL,'2018-01-05 03:57:37',NULL),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 03:57:37',NULL),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',NULL,'2018-01-05 04:01:01',NULL),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',NULL,'2018-01-05 03:59:50',NULL),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',NULL,'2018-01-05 04:01:18',NULL),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',NULL,'2018-01-05 04:04:08',NULL),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',NULL,'2018-01-10 07:17:45',NULL),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:27:42',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:27:42',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:27:42',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:27:42',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:27:42',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:27:42',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',NULL,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:27:42',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',NULL,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:27:42',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-10 07:31:47',0),(1,'Cao Hải Nhi','male','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:51',0),(1,'Cao Hải Nhi','','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:44:57',0),(22,'viba','male','1995-06-21',2,'thiendienban@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-11 07:17:57',0,'2018-01-11 07:17:57',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:22',0,'2018-01-11 07:18:22',0),(22,'vibon','male','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:28',0,'2018-01-11 07:18:28',0),(22,'vibon','','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-11 07:18:39',0,'2018-01-11 07:18:39',0),(22,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',1,'2018-01-16 06:50:41',0,'2018-01-16 06:50:41',0),(1,'Cao Hải Nhi','female','1995-06-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-11 04:45:01',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(4,'Do Phu Thien','male','1991-02-02',2,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-10 07:31:47',0),(6,'Le Ngoc Diep','female','1986-06-15',4,NULL,'',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-10 07:31:47',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,NULL,'',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-10 07:31:47',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,NULL,'',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-10 07:31:47',0),(10,'Dinh Van Trung','male','1989-05-12',3,NULL,'',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-10 07:31:47',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,NULL,'',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-10 07:31:47',0),(12,'Jimi hendrix','male','1985-04-12',2,NULL,'',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-10 07:31:47',0),(13,'slash','male','1985-04-12',2,NULL,'',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-11 02:10:39',0),(21,'viba','male','1995-06-21',2,'thiendienban@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'thiendienban@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 03:58:10',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 03:58:10',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 03:58:10',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 03:58:10',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 03:58:10',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 03:58:10',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 03:58:10',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 03:58:10',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 03:58:10',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 03:58:10',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 04:17:25',0,'2018-01-19 03:58:10',0),(1,'Cao Hải Nhi','female','1995-06-21',1,'caohainhi@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:53:28',0,'2018-01-19 04:17:25',0),(2,'Nguyen Binh Thien','male','1995-12-20',1,'nguyenbinhthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(3,'Pham Thi Minh Hien','female','1995-08-15',1,'phamthiminhhien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(4,'Do Phu Thien','male','1991-02-02',2,'dophuthien@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(5,'Nguyen Van Nhat','male','1984-01-01',3,'nguyenvannhat@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:55:21',0,'2018-01-19 04:17:25',0),(6,'Le Ngoc Diep','female','1986-06-15',4,'lengocdiep@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:56:23',0,'2018-01-19 04:17:25',0),(7,'Nguyen Thi Ha','female','1995-10-21',1,'nguyenthiha@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(8,'Tran Van Tu Anh','male','1981-03-21',3,'tranvantuanh@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:57:23',0,'2018-01-19 04:17:25',0),(9,'Phan Thi Ngoc','female','1991-02-02',3,'phamthingoc@gmail.com','',0,NULL,NULL,1,'2018-01-05 03:59:50',0,'2018-01-19 04:17:25',0),(10,'Dinh Van Trung','male','1989-05-12',3,'dinhvantrung@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:00:54',0,'2018-01-19 04:17:25',0),(11,'Kieu Minh Tuan','male','1985-04-12',3,'kieuminhtuan@gmail.com','',0,NULL,NULL,1,'2018-01-05 04:04:01',0,'2018-01-19 04:17:25',0),(12,'Jimi hendrix','male','1985-04-12',2,'jimihendirx@gmail.com','',0,NULL,NULL,1,'2018-01-10 07:17:45',0,'2018-01-19 04:17:25',0),(13,'slash','male','1985-04-12',2,'slash@gmail.com','',0,NULL,NULL,1,'2018-01-11 02:10:39',0,'2018-01-19 04:17:25',0),(21,'viba','male','1995-06-21',2,'viba@gmail.com','',326599854,'2010-01-01','2010-01-01',1,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:44:02',0,'2018-01-19 04:17:25',0),(23,'vibon','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:49:45',0,'2018-01-19 06:44:02',0),(23,'vibon1','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:50:44',0,'2018-01-19 06:49:45',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$vTNf2NsHXI0QBvOfjux8euoli5cf8835ic77Xac3ir.ubGnIJ0jMG',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 06:59:19',0,'2018-01-19 06:59:19',0),(24,'dactech','female','1995-06-21',3,'dactech@gmail.com','$2a$10$PbWfQ7NvoMmv1IhCVcNF0u2YqAjxvkyOIWPkkO40OqE2v7E/uhK92',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 07:33:42',0,'2018-01-19 07:33:42',0),(24,'dactech1','female','1995-06-21',3,'dactech@gmail.com','$2a$10$a7rJu.BfRNG/wbgQe0ipUet2d7cSZ6qS2m2Vo7z7Hk7ndVUrzqbF.',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 07:34:00',0,'2018-01-19 07:34:00',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$JUFpGPyNj1tJoaTBBAs1Cuii3db4xs52wOuNlUTlCXS97XAL4ndDC',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:03:41',0,'2018-01-19 08:03:41',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','$2a$10$6H8RRW8l9PykDGAUuKh/4uYLWHJ5kIOEKu1u5La8Oa0ULa1cLqzTi',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:05:10',0,'2018-01-19 08:05:10',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$t/etOx1HHg4n2hjqM1Rm8.oOTpC7mNC/eTUNFIStKpFU70UkVTUmG',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:10:43',0,'2018-01-19 08:10:43',0),(25,'dactech12','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(26,'dactech12','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:13:17',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:13:17',0,'2018-01-19 08:10:43',0),(22,'vibon1','female','1995-06-21',3,'vibon1@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:44:02',0),(23,'vibon2','female','1995-06-21',3,'vibon@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 06:50:44',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:14:19',0,'2018-01-19 08:13:17',0),(28,'99','female','1995-06-21',3,'new@gmail.com','$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:14:47',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$deM7FNMqtsCQm/OyWfaX4us7Y8pKMtqCrlFMN.5yj.mgRMX5wTppm',32659123,'2010-01-01','2010-01-01',0,'2018-01-19 08:15:10',0,'2018-01-19 08:14:19',0),(24,'dactech12','female','1995-06-21',3,'dactech@gmail.com','$2a$10$yqGC6ZphndjWck4svGjqW.6GiSNvFgsfxGZRjTwpjUtZatmDsu8Ly',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(25,'dactech123','female','1995-06-21',3,'dac@gmail.com','$2a$10$92FHykSTdQOZU7L6PegFzeiA5CiC9oDP8pTXDBavqiVTeQZjK2lSu',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(26,'dactech126','female','1995-06-21',3,'dacc@gmail.com','passpass',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(28,'dactech12','female','1995-06-21',3,'new@gmail.com','$2a$10$hJBTA0YragK440NcB/wS1OdSrn/nBb6O3KWe8pMe52FdYL5.N3kye',32659123,'2010-01-01','2010-01-01',1,'2018-01-19 08:15:34',0,'2018-01-19 08:14:19',0),(30,'dactech13','male','1995-06-21',3,'cdactech@gmail.com','$2a$10$KBDKNVvNlGW0EnC/Vu4vQuNLORhsBJW58IGROe1bpyGcfa8qmDEa6',32659123,'2010-01-01','2010-01-01',1,'2018-01-22 06:42:18',0,'2018-01-22 06:42:18',0),(32,'dactech133','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$0EyNbH54ie6VGTuTGuyVq.3RieFR/M2iUV0pQO2KJgrGQHQR3LvQC',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:45:16',0),(32,'2010-1-1','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:45:55',0),(32,'dactech133','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:46:37',0),(32,'2','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:47:36',0),(32,'1','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:47:51',0),(32,'0','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:48:03',0),(32,'0','female','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:49:54',0),(32,'0','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$s6RYrGNnveHgMYqzZTSVO.IGu3TVhjjwr3OVh.KsKIJKKPylCPkgG',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:50:00',0),(32,'2010-1-1','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$vfmOA74ozC5AKT0Dlr59BeSS/qnHg1kGkeYc.xx1BQ0WLePw666JC',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:50:15',0),(32,'2010-1-1','male','1995-06-21',3,'cdactech@gmail1.com','$2a$10$8vPjH.8xyzgSq.OFFBhw2enf4TGwkfGRfXXzd8pKuA.VrFezKS/R6',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:50:41',0),(32,'dactech133','female','1995-06-21',3,'cdactecch@gmail.com','$2a$10$gO12uiRl3x3R4dJTS0AjQuPdz4znDnYuv6gAepMSO0oXz5DFyRWE2',32659123,'2010-01-01','2010-01-01',1,'2018-01-31 08:45:16',0,'2018-01-31 08:54:10',0),(32,'dactech133','male','1995-06-22',2,'cdactecch11@gmail.com','$2a$10$A9dlyeaGT4fCGREjduYplOFZNTu/OCWRzg6dUnrU/w2jQKDKY1kKC',326591231,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:54:51',0),(32,'dactech133','male','1995-06-23',2,'cdactecch11@gmail.com','$2a$10$A9dlyeaGT4fCGREjduYplOFZNTu/OCWRzg6dUnrU/w2jQKDKY1kKC',326591231,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:55:31',0),(32,'dactech133','male','1995-06-23',1,'cdactecch11@gmail.com','$2a$10$A9dlyeaGT4fCGREjduYplOFZNTu/OCWRzg6dUnrU/w2jQKDKY1kKC',326591231,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:56:15',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$A9dlyeaGT4fCGREjduYplOFZNTu/OCWRzg6dUnrU/w2jQKDKY1kKC',326591231,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:56:34',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326591231,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:56:56',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326512,'2010-01-02','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:58:42',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326512,'2010-01-22','2010-01-02',1,'2018-01-31 08:45:16',0,'2018-01-31 08:59:05',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326512,'2010-01-22','2010-01-22',1,'2018-01-31 08:45:16',0,'2018-01-31 08:59:23',0),(32,'dactech133','male','1995-06-23',1,'cdactecch1111@gmail.com','$2a$10$Y0Pyu8GFJPaJBtv0fiPYfutAuFLIaXw/wGINYPM3w3RF7q1oFE0O.',326512,'2010-01-22','2010-01-22',0,'2018-01-31 08:45:16',0,'2018-01-31 08:59:46',0);
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
INSERT INTO `employee_off_status` VALUES (2017,4,441,44,1,NULL,0,NULL,0),(2018,1,20,20,1,'2018-01-11 08:34:51',0,'2018-01-11 08:34:51',0),(2018,2,30,20,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,3,70,50,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,4,441,44,1,'2018-01-16 02:53:02',0,'2018-01-22 07:09:27',0),(2018,5,222,33,0,'2018-01-16 02:53:02',0,'2018-01-22 07:11:11',0),(2018,6,123,44,1,'2018-01-31 09:51:22',0,'2018-01-31 09:52:47',0);
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
INSERT INTO `employee_off_status_hist` VALUES (2018,3,5,2,1,'2018-01-16 02:53:02',0,'2018-01-16 02:53:02',0),(2018,5,555,44,0,'2018-01-16 04:01:23',0,'2018-01-16 04:01:23',0),(2018,5,222,33,0,'2018-01-16 04:01:55',0,'2018-01-16 04:01:55',0),(2018,4,441,44,1,'2018-01-22 07:09:27',0,'2018-01-22 07:09:27',0),(2018,5,111,33,0,'2018-01-22 07:09:27',0,'2018-01-22 07:09:27',0),(2018,5,111,33,0,'2018-01-16 02:53:02',0,'2018-01-22 07:09:27',0),(2018,5,1111111,33,0,'2018-01-16 02:53:02',0,'2018-01-22 07:10:06',0),(2018,5,11111111,33,0,'2018-01-16 02:53:02',0,'2018-01-22 07:10:57',0),(2018,6,2223,33,0,'2018-01-31 09:51:22',0,'2018-01-31 09:51:22',0),(2018,6,123,33,0,'2018-01-31 09:51:22',0,'2018-01-31 09:52:10',0),(2018,6,123,44,0,'2018-01-31 09:51:22',0,'2018-01-31 09:52:30',0);
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
INSERT INTO `position` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(2,'leader',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(3,'project manager',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0),(4,'hr',1,'2018-01-05 03:52:20',0,'2018-01-10 07:30:41',0);
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
INSERT INTO `position_hist` VALUES (1,'emplyee',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(2,'leader',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(3,'project manager',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL),(4,'hr',1,'2018-01-05 03:52:20',NULL,'2018-01-05 03:52:44',NULL);
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
  PRIMARY KEY (`id`),
  KEY `fk_employee_id_idx` (`employee_id`),
  KEY `fk_employee_id_1` (`employee_id`),
  KEY `fk3_idx` (`day_off_type_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`day_off_type_id`) REFERENCES `day_off_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',2,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-25 08:57:28',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00','Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-25 08:57:28',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00','Nghỉ cho vui',2,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-25 08:53:21',0),(4,1,'2018-01-25 07:00:00','2018-01-25 09:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:47:01',0,'2018-01-25 08:47:01',0),(5,1,'2018-01-25 13:00:00','2018-01-25 15:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:47:36',0,'2018-01-25 08:47:36',0),(6,1,'2018-01-26 08:00:00','2018-01-26 12:00:00','Nghi cho vui',2,'',14,4,1,'2018-01-25 08:48:02',0,'2018-01-25 08:48:02',0),(7,1,'2018-01-26 14:00:00','2018-01-26 16:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:48:17',0,'2018-01-25 08:48:17',0),(8,1,'2018-01-26 16:00:00','2018-01-29 15:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:48:43',0,'2018-01-26 07:28:49',0),(9,2,'2018-01-24 11:00:00','2018-01-24 16:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:49:24',0,'2018-01-25 08:49:24',0),(10,2,'2018-01-25 13:00:00','2018-01-26 09:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:49:44',0,'2018-01-25 08:49:44',0),(11,2,'2018-01-26 11:00:00','2018-01-26 15:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:50:01',0,'2018-01-25 08:50:01',0),(12,2,'2018-01-27 08:00:00','2018-01-30 17:00:00','Nghi cho vui',2,'',18,4,1,'2018-01-25 08:50:30',0,'2018-01-26 07:28:49',0),(13,2,'2018-01-31 16:00:00','2018-02-02 17:00:00','Nghi cho vui',2,'',18,4,1,'2018-01-25 08:50:46',0,'2018-01-26 07:28:49',0),(14,3,'2018-01-24 16:00:00','2018-01-25 17:00:00','Nghi cho vui',2,'',11,4,1,'2018-01-25 08:51:00',0,'2018-01-25 08:51:00',0),(15,3,'2018-01-26 09:00:00','2018-01-27 15:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:51:20',0,'2018-01-25 08:51:20',0),(16,3,'2018-01-30 09:00:00','2018-02-03 15:00:00','Nghi cho vui',2,'',19,4,1,'2018-01-25 08:51:33',0,'2018-01-26 07:28:49',0),(19,4,'2018-01-30 09:00:00','2018-02-03 15:00:00','ok',2,NULL,16,5,1,'2018-01-31 07:09:31',0,'2018-01-31 07:10:55',0),(20,1,'2018-02-28 12:59:00','2018-02-09 12:58:00','OK',1,'',2,4,1,'2018-02-01 06:48:01',0,'2018-02-01 07:08:40',0),(21,1,'2018-11-30 12:58:00','2016-12-31 13:59:00','66',5,'',1,4,1,'2018-02-01 06:50:42',0,'2018-02-01 07:10:09',0),(22,1,'2017-11-30 12:59:00','2018-12-31 12:58:00','ouihjkl',5,'',1,4,1,'2018-02-01 06:52:15',0,'2018-02-01 06:52:15',0),(23,1,'2017-12-31 12:59:00','2018-12-31 12:59:00','ok',1,'',1,4,0,'2018-02-01 07:09:18',0,'2018-02-01 07:09:45',0);
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
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
	INSERT INTO request_hist values(OLD.id, OLD.employee_id, OLD.from_time, OLD.to_time, OLD.reason, OLD.status, OLD.response_message, OLD.day_off_type_id, OLD.recipient_id, OLD.valid_flag, OLD.insert_date, OLD.insert_operator, OLD.update_date, OLD.update_operator);
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
  `update_operator` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_hist`
--

LOCK TABLES `request_hist` WRITE;
/*!40000 ALTER TABLE `request_hist` DISABLE KEYS */;
INSERT INTO `request_hist` VALUES (1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',NULL,'2018-01-05 06:34:58',NULL),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',NULL,NULL,16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 03:03:56',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',0,'789',16,4,1,'2018-01-05 06:34:26',0,'2018-01-11 09:06:21',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-15 03:32:27',0),(3,3,'2017-12-11 07:00:00','2017-12-12 15:00:00','Nghỉ cho vui',1,'Không cho nghỉ',15,2,1,'2018-01-15 03:57:34',0,'2018-01-15 03:57:34',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00','Bận việc nước',2,'Ok',17,4,1,'2018-01-15 03:56:43',0,'2018-01-15 03:56:43',0),(1,1,'2017-12-12 08:00:00','2017-12-12 14:00:00','Bận việc nhà',1,'OK',16,4,1,'2018-01-05 06:34:26',0,'2018-01-25 08:53:21',0),(2,2,'2017-12-12 07:00:00','2017-12-13 07:00:00','Bận việc nước',2,'Ok',17,4,0,'2018-01-15 03:56:43',0,'2018-01-25 08:53:21',0),(8,1,'2018-01-27 10:00:00','2018-01-28 15:00:00','Nghi cho vui',2,'',16,4,1,'2018-01-25 08:48:43',0,'2018-01-25 08:48:43',0),(12,2,'2018-01-27 08:00:00','2018-01-27 17:00:00','Nghi cho vui',2,'',18,4,1,'2018-01-25 08:50:30',0,'2018-01-25 08:50:30',0),(13,2,'2018-01-28 16:00:00','2018-01-28 17:00:00','Nghi cho vui',2,'',18,4,1,'2018-01-25 08:50:46',0,'2018-01-25 08:50:46',0),(16,3,'2018-01-28 09:00:00','2018-01-28 15:00:00','Nghi cho vui',2,'',19,4,1,'2018-01-25 08:51:33',0,'2018-01-25 08:51:33',0),(19,4,'2018-01-17 22:59:00','2018-12-31 12:59:00','ok',2,NULL,1,5,1,'2018-01-31 07:09:31',0,'2018-01-31 07:09:31',0),(17,1,'2018-01-25 12:59:00','2018-02-02 12:59:00','nghỉ phép',5,'',1,4,1,'2018-01-31 03:36:37',0,'2018-01-31 03:36:37',0),(18,1,'2018-01-17 22:59:00','2018-12-31 12:59:00','vui',1,'',1,4,1,'2018-01-31 04:19:06',0,'2018-01-31 04:19:06',0),(19,4,'2018-01-30 09:00:00','2018-02-03 15:00:00','ok',2,NULL,1,5,1,'2018-01-31 07:09:31',0,'2018-01-31 07:10:38',0),(20,1,'2018-02-28 12:59:00','2018-02-09 12:58:00','yyyyyy',1,'',2,4,1,'2018-02-01 06:48:01',0,'2018-02-01 06:48:01',0),(20,1,'2018-02-28 12:59:00','2018-02-09 12:58:00','1111',1,'',2,4,1,'2018-02-01 06:48:01',0,'2018-02-01 07:08:34',0),(23,1,'2017-12-31 12:59:00','2018-12-31 12:59:00','ok',1,'',1,4,1,'2018-02-01 07:09:18',0,'2018-02-01 07:09:18',0),(21,1,'2018-11-30 12:58:00','2016-12-31 13:59:00','66',1,'',1,4,1,'2018-02-01 06:50:42',0,'2018-02-01 06:50:42',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',0,'2018-01-10 07:30:31',0),(6,'new team',12,1,1,'2018-01-05 06:36:21',0,'2018-01-22 02:44:18',0),(13,'aa',2,1,1,'2018-01-31 08:09:39',0,'2018-01-31 08:11:43',0);
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
INSERT INTO `team_employee` VALUES (1,1,1,'2018-01-05 06:36:42',0,'2018-01-11 03:04:12',0),(1,2,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0),(1,3,1,'2018-01-05 06:36:52',0,'2018-01-11 03:04:12',0),(1,4,1,'2018-01-31 06:43:32',0,'2018-01-31 06:43:32',0);
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
INSERT INTO `team_employee_hist` VALUES (1,1,1,'2018-01-05 06:36:42',NULL,'2018-01-05 06:36:42',NULL),(1,2,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL),(1,3,1,'2018-01-05 06:36:52',NULL,'2018-01-05 06:36:52',NULL);
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
INSERT INTO `team_hist` VALUES (1,'intern',4,1,1,'2018-01-05 06:36:21',NULL,'2018-01-05 06:36:21',NULL),(2,'new team',12,1,0,'2018-01-10 07:59:18',0,'2018-01-10 07:59:18',0),(3,'new team',12,1,0,'2018-01-10 08:03:34',0,'2018-01-10 08:03:34',0),(4,'new team',12,1,1,'2018-01-10 08:10:00',0,'2018-01-10 08:10:00',0),(5,'new team',12,1,1,'2018-01-10 08:12:31',0,'2018-01-10 08:12:31',0),(6,'new team',12,1,1,'2018-01-10 08:33:11',0,'2018-01-10 08:33:11',0),(6,'new team_update',12,2,1,'2018-01-10 08:33:31',0,'2018-01-10 08:33:31',0),(7,'new team2',12,2,1,'2018-01-10 08:34:34',0,'2018-01-10 08:34:34',0),(7,'new team2_update',12,3,1,'2018-01-11 02:10:50',0,'2018-01-11 02:10:50',0),(7,'new team2_update',13,3,1,'2018-01-16 06:51:42',0,'2018-01-11 02:10:50',0),(7,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-11 02:10:50',0),(8,'new te',12,3,0,'2018-01-16 06:52:10',0,'2018-01-16 06:52:10',0),(6,'new team',12,1,1,'2018-01-22 02:44:18',0,'2018-01-10 08:33:31',0),(9,'new te',31,3,0,'2018-01-22 02:46:25',0,'2018-01-22 02:46:25',0),(10,'new te',21,3,0,'2018-01-22 02:48:34',0,'2018-01-22 02:48:34',0),(10,'new te1',21,3,0,'2018-01-22 03:37:24',0,'2018-01-22 02:48:34',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(11,'team updatedccc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:04',0),(12,'team updasdsdsdc',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:42:20',0),(11,'team upd12312312312312dc',21,3,0,'2018-01-22 03:41:32',0,'2018-01-22 03:43:33',0),(12,'new new new',21,3,0,'2018-01-22 03:42:20',0,'2018-01-22 03:54:20',0),(10,'team updated',21,3,0,'2018-01-23 07:50:02',0,'2018-01-22 02:48:34',0),(10,'team updated',21,3,0,'2018-01-05 06:36:21',0,'2018-01-23 07:50:02',0),(10,'team updated',21,3,1,'2018-01-05 06:36:21',0,'2018-01-23 07:50:16',0),(10,'team updated',21,3,1,'2018-01-05 06:00:00',0,'2018-01-25 07:18:34',0),(13,'new new new',21,1,1,'2018-01-31 08:09:39',0,'2018-01-31 08:09:39',0),(13,'new new new',21,1,0,'2018-01-31 08:09:39',0,'2018-01-31 08:10:45',0),(13,'new new new',2,1,1,'2018-01-31 08:09:39',0,'2018-01-31 08:11:07',0);
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

-- Dump completed on 2018-02-01 15:29:05
