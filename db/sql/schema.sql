-- MySQL dump 10.13  Distrib 5.1.38, for apple-darwin10.0.0 (i386)
--
-- Host: localhost    Database: mapping
-- ------------------------------------------------------
-- Server version	5.1.38

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
-- Table structure for table `feeders`
--

DROP TABLE IF EXISTS `feeders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `substation_id` int(11) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeders`
--

LOCK TABLES `feeders` WRITE;
/*!40000 ALTER TABLE `feeders` DISABLE KEYS */;
INSERT INTO `feeders` VALUES (1,NULL,40.578065,-105.071905);
/*!40000 ALTER TABLE `feeders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeders_switches`
--

DROP TABLE IF EXISTS `feeders_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeders_switches` (
  `feeder_id` int(11) NOT NULL,
  `switch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeders_switches`
--

LOCK TABLES `feeders_switches` WRITE;
/*!40000 ALTER TABLE `feeders_switches` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeders_switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meters`
--

DROP TABLE IF EXISTS `meters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feeder_id` int(11) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meters`
--

LOCK TABLES `meters` WRITE;
/*!40000 ALTER TABLE `meters` DISABLE KEYS */;
INSERT INTO `meters` VALUES (1,NULL,40.578065,-105.071905);
/*!40000 ALTER TABLE `meters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meters_switches`
--

DROP TABLE IF EXISTS `meters_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meters_switches` (
  `meter_id` int(11) NOT NULL,
  `switch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meters_switches`
--

LOCK TABLES `meters_switches` WRITE;
/*!40000 ALTER TABLE `meters_switches` DISABLE KEYS */;
/*!40000 ALTER TABLE `meters_switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substations`
--

DROP TABLE IF EXISTS `substations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substations`
--

LOCK TABLES `substations` WRITE;
/*!40000 ALTER TABLE `substations` DISABLE KEYS */;
/*!40000 ALTER TABLE `substations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` double DEFAULT NULL,
  `long` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-09-27 13:20:26
